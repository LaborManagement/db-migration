DROP PROCEDURE IF EXISTS payment_flow.validate_uploaded_data(bigint, OUT json);


CREATE OR REPLACE PROCEDURE payment_flow.validate_uploaded_data(file_id_input bigint, OUT validation_result json) LANGUAGE plpgsql AS $$
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
        v_rejection_reason := NULL;

        -- Null worker_regno
        IF rec.worker_regno IS NULL THEN
            v_rejection_reason := 'worker_regno is NULL';
        END IF;

        -- Negative amount
        IF v_rejection_reason IS NULL AND rec.amount IS NOT NULL AND rec.amount < 0 THEN
            v_rejection_reason := 'amount is negative';
        END IF;

        -- Missing worker in master
        IF v_rejection_reason IS NULL AND rec.worker_regno IS NOT NULL THEN
            IF NOT EXISTS (
                SELECT 1 FROM payment_flow.worker_master wm WHERE wm.registration_number = rec.worker_regno
            ) THEN
                v_rejection_reason := 'worker_regno not found in worker_master';
            END IF;
        END IF;

        -- Update and count
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

    -- Compose JSON result
    validation_result := json_build_object(
        'file_id', file_id_input,
        'total_records', total_records,
        'valid_count', valid_count,
        'invalid_count', invalid_count
    );
END;
$$;

grant execute on procedure payment_flow.validate_uploaded_data(bigint, OUT json) to app_payment_flow;