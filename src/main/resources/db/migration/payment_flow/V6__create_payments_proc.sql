DROP PROCEDURE IF EXISTS payment_flow.create_payments(bigint, OUT text);


CREATE OR REPLACE PROCEDURE payment_flow.create_payments(IN file_id_input bigint, OUT receipt_number_out text) LANGUAGE plpgsql AS $BODY$
DECLARE
    total_records int;
    total_amount numeric(15,2);
    new_receipt_number text;
    valid_row RECORD;
    employer_id_val bigint;
    toli_id_val bigint;
    board_id_val bigint;
    levy_val numeric(10,2);
    gross_wages_val numeric(10,2);
    net_wages_payable_val numeric(10,2);
BEGIN
    -- Summarize for receipt
    SELECT COUNT(*), COALESCE(SUM(amount),0)
      INTO total_records, total_amount
      FROM payment_flow.worker_uploaded_data
     WHERE file_id = file_id_input AND status_id = '1';

    -- Take employer_id, toli_id, board_id from uploaded_files table
    SELECT employer_id, toli_id, board_id
      INTO employer_id_val, toli_id_val, board_id_val
      FROM payment_flow.uploaded_files
     WHERE id = file_id_input;

    -- Generate receipt_number
    new_receipt_number := 'WR-' || file_id_input || '-' || EXTRACT(EPOCH FROM NOW());

    -- Insert worker_payment_receipts (status = 'CREATED'), ensure rls is considered
    INSERT INTO payment_flow.worker_payment_receipts (
        receipt_number, employer_id, toli_id, board_id, created_at,
        total_records, total_amount, status_id
    ) VALUES (
        new_receipt_number,
        employer_id_val,
        toli_id_val,
        board_id_val,
        NOW(),
        total_records,
        total_amount,
        '1'
    );

    -- Insert into worker_payments for each valid record (status = 'CREATED')
    FOR valid_row IN
        SELECT * FROM payment_flow.worker_uploaded_data
         WHERE file_id = file_id_input AND status_id = '1'
    LOOP
 -- Calculate new fields
    levy_val := ROUND(valid_row.amount * 0.30, 2);
    gross_wages_val := valid_row.amount + levy_val;
    net_wages_payable_val := gross_wages_val - COALESCE(valid_row.advance, 0);

    INSERT INTO payment_flow.worker_payments (
        worker_regno, toli_id, employer_id, board_id, year_month, total_days,
        basic_wages, advance, levy, gross_wages, net_wages_payable,
        payment_type, txn_ref, receipt_nmbr
    ) VALUES (
        valid_row.worker_regno, valid_row.toli_id, valid_row.employer_id, valid_row.board_id,
        valid_row.year_month, valid_row.total_days,
        valid_row.amount, valid_row.advance,
        levy_val, gross_wages_val, net_wages_payable_val,
        valid_row.payment_type, valid_row.txn_ref, new_receipt_number
    );
        -- Update receipt_nmbr in worker_uploaded_data
        UPDATE payment_flow.worker_uploaded_data
           SET request_nmbr = new_receipt_number
         WHERE file_id = file_id_input
           AND id = valid_row.id;
    END LOOP;

    receipt_number_out := new_receipt_number;
END;
$BODY$;


ALTER PROCEDURE payment_flow.create_payments(IN file_id_input bigint, OUT receipt_number_out text) OWNER TO root;

GRANT EXECUTE ON PROCEDURE payment_flow.create_payments(bigint, OUT text) TO app_payment_flow;