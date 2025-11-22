DROP PROCEDURE IF EXISTS payment_flow.validate_uploaded_data(bigint, OUT json);

-- PL/pgSQL

CREATE OR REPLACE PROCEDURE payment_flow.validate_uploaded_data(IN file_id_input bigint, OUT validation_result json) LANGUAGE plpgsql AS $BODY$
DECLARE
    rec RECORD;
    total_records int := 0;
    valid_count int := 0;
    invalid_count int := 0;
    v_rejection_reason text;
BEGIN
    FOR rec IN
        SELECT * FROM payment_flow.worker_uploaded_data
        WHERE file_id = file_id_input
    LOOP
        SELECT string_agg(reason, '; ') INTO v_rejection_reason
        FROM (
            SELECT CASE WHEN rec.worker_regno IS NULL THEN 'worker_regno is NULL' END AS reason
            UNION ALL
            SELECT CASE WHEN rec.amount IS NOT NULL AND rec.amount < 0 THEN 'amount is negative' END
            UNION ALL
            SELECT CASE
                WHEN rec.worker_regno IS NOT NULL AND NOT EXISTS (
                    SELECT 1 FROM payment_flow.worker_master wm WHERE wm.registration_number = rec.worker_regno)
                THEN 'worker_regno not found in worker_master' END
            UNION ALL
            SELECT CASE WHEN rec.employer_reg_no IS NULL OR trim(rec.employer_reg_no) = '' THEN 'employer_reg_no is NULL or empty' END
            UNION ALL
            SELECT CASE
                WHEN rec.employer_reg_no IS NOT NULL AND NOT EXISTS (
                    SELECT 1 FROM payment_flow.employer_master em WHERE em.registration_number = rec.employer_reg_no)
                THEN 'employer_reg_no not found in employer_master' END
            UNION ALL
            SELECT CASE WHEN rec.toli_reg_no IS NULL OR trim(rec.toli_reg_no) = '' THEN 'toli_reg_no is NULL or empty' END
            UNION ALL
            SELECT CASE
                WHEN rec.toli_reg_no IS NOT NULL AND NOT EXISTS (
                    SELECT 1 FROM payment_flow.toli_master tm WHERE tm.registration_number = rec.toli_reg_no)
                THEN 'toli_reg_no not found in toli_master' END
            UNION ALL
            SELECT CASE WHEN rec.employee_name IS NULL OR trim(rec.employee_name) = '' THEN 'employee_name is NULL or empty' END
            UNION ALL
            SELECT CASE WHEN rec.year_month IS NOT NULL AND rec.year_month !~ '^\d{4}-\d{2}$' THEN 'year_month format invalid' END
            UNION ALL
            SELECT CASE WHEN rec.advance IS NOT NULL AND rec.advance < 0 THEN 'advance is negative' END
            UNION ALL
            SELECT CASE WHEN rec.net_payable IS NOT NULL AND rec.net_payable < 0 THEN 'net_payable is negative' END
            UNION ALL
            SELECT CASE WHEN rec.total_days IS NOT NULL AND (rec.total_days < 0 OR rec.total_days > 31) THEN 'total_days out of range' END
            UNION ALL
            SELECT CASE WHEN rec.payment_type IS NULL OR trim(rec.payment_type) = '' THEN 'payment_type is NULL or empty' END
        ) AS reasons
        WHERE reason IS NOT NULL;

        IF v_rejection_reason IS NULL THEN
            UPDATE payment_flow.worker_uploaded_data
            SET status_id = '1', rejection_reason = NULL, updated_at = NOW()
            WHERE id = rec.id;
            valid_count := valid_count + 1;
        ELSE
            UPDATE payment_flow.worker_uploaded_data
            SET status_id = '2', rejection_reason = v_rejection_reason, updated_at = NOW()
            WHERE id = rec.id;
            invalid_count := invalid_count + 1;
        END IF;
        total_records := total_records + 1;
    END LOOP;

    validation_result := json_build_object(
        'file_id', file_id_input,
        'total_records', total_records,
        'valid_count', valid_count,
        'invalid_count', invalid_count
    );
END;
$BODY$;

grant execute on procedure payment_flow.validate_uploaded_data(bigint, OUT json) to app_payment_flow;