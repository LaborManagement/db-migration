-- Dummy clearing/reconciliation data for local testing.
-- Run with `psql -f db-migration/scripts/seed_clearing_dummy_data.sql`.

BEGIN;

-- Make sure the event types are present.
INSERT INTO clearing.accounting_event_type (code, description)
VALUES
    ('EMP_REQ_APPROVED', 'Employee request approved'),
    ('EMP_REQ_SETTLED', 'Employee request fully allocated / settled')
ON CONFLICT (code) DO NOTHING;

DO $$
DECLARE
    v_evt_settled    INTEGER;
    v_evt_approved   INTEGER;
    v_rule_header    INTEGER;
    v_event          INTEGER;
    v_voucher        INTEGER;
    v_bank_txn1      INTEGER;
    v_bank_txn2      INTEGER;
    v_allocation1    INTEGER;
    v_allocation2    INTEGER;
BEGIN
    SELECT event_type_id INTO v_evt_settled FROM clearing.accounting_event_type WHERE code = 'EMP_REQ_SETTLED';
    SELECT event_type_id INTO v_evt_approved FROM clearing.accounting_event_type WHERE code = 'EMP_REQ_APPROVED';

    -- Rule header + lines for EMP_REQ_SETTLED.
    SELECT rule_header_id INTO v_rule_header FROM clearing.accounting_rule_header WHERE name = 'EMP_REQ_SETTLED_RULE' LIMIT 1;
    IF v_rule_header IS NULL THEN
        INSERT INTO clearing.accounting_rule_header (event_type_id, name, is_active, priority)
        VALUES (v_evt_settled, 'EMP_REQ_SETTLED_RULE', TRUE, 1)
        RETURNING rule_header_id INTO v_rule_header;
    END IF;

    PERFORM 1 FROM clearing.accounting_rule_line WHERE rule_header_id = v_rule_header AND line_no = 1;
    IF NOT FOUND THEN
        INSERT INTO clearing.accounting_rule_line (rule_header_id, line_no, dr_cr_flag, gl_source_type, amount_source, dimension_source)
        VALUES (v_rule_header, 1, 'DR', 'EMPLOYEE_PAYABLE', 'EVENT_TOTAL', 'EMPLOYEE_FROM_EVENT');
    END IF;

    PERFORM 1 FROM clearing.accounting_rule_line WHERE rule_header_id = v_rule_header AND line_no = 2;
    IF NOT FOUND THEN
        INSERT INTO clearing.accounting_rule_line (rule_header_id, line_no, dr_cr_flag, gl_source_type, amount_source, dimension_source)
        VALUES (v_rule_header, 2, 'CR', 'BANK_CLEARING', 'PER_ALLOCATION', 'BANK_TXN_FROM_ALLOCATION');
    END IF;

    -- Bank transactions that will be allocated.
    SELECT bank_txn_id INTO v_bank_txn1 FROM reconciliation.bank_transaction WHERE txn_ref = 'MT940-202405-001';
    IF v_bank_txn1 IS NULL THEN
        INSERT INTO reconciliation.bank_transaction (bank_account_id, txn_ref, txn_date, amount, dr_cr_flag, description, allocated_amount, remaining_amount, status, board_id, employee_id)
        VALUES (1001, 'MT940-202405-001', DATE '2024-05-02', 150.00, 'CR', 'NACH credit for request 9001', 100.00, 50.00, 1, 10, 2001)
        RETURNING bank_txn_id INTO v_bank_txn1;
    END IF;

    SELECT bank_txn_id INTO v_bank_txn2 FROM reconciliation.bank_transaction WHERE txn_ref = 'MT940-202405-002';
    IF v_bank_txn2 IS NULL THEN
        INSERT INTO reconciliation.bank_transaction (bank_account_id, txn_ref, txn_date, amount, dr_cr_flag, description, allocated_amount, remaining_amount, status, board_id, employee_id)
        VALUES (1001, 'MT940-202405-002', DATE '2024-05-03', 50.00, 'CR', 'Top-up credit for request 9001', 40.00, 10.00, 1, 10, 2001)
        RETURNING bank_txn_id INTO v_bank_txn2;
    END IF;

    -- Payment allocations linking request 9001 to the bank transactions.
    SELECT allocation_id INTO v_allocation1 FROM reconciliation.payment_allocation WHERE request_id = 9001 AND bank_txn_id = v_bank_txn1;
    IF v_allocation1 IS NULL THEN
        INSERT INTO reconciliation.payment_allocation (request_id, bank_txn_id, allocated_amount, allocation_date, allocated_by, voucher_id, source_file_id)
        VALUES (9001, v_bank_txn1, 60.00, DATE '2024-05-04', 'ops.user', NULL, 501)
        RETURNING allocation_id INTO v_allocation1;
    END IF;

    SELECT allocation_id INTO v_allocation2 FROM reconciliation.payment_allocation WHERE request_id = 9001 AND bank_txn_id = v_bank_txn2;
    IF v_allocation2 IS NULL THEN
        INSERT INTO reconciliation.payment_allocation (request_id, bank_txn_id, allocated_amount, allocation_date, allocated_by, voucher_id, source_file_id)
        VALUES (9001, v_bank_txn2, 40.00, DATE '2024-05-04', 'ops.user', NULL, 501)
        RETURNING allocation_id INTO v_allocation2;
    END IF;

    -- Accounting event representing the settlement.
    SELECT event_id INTO v_event FROM clearing.accounting_event WHERE idempotency_key = 'REQ-9001-SETTLED-1';
    IF v_event IS NULL THEN
        INSERT INTO clearing.accounting_event (event_type_id, request_id, idempotency_key, payload, status, error_message, created_at, processed_at)
        VALUES (v_evt_settled, 9001, 'REQ-9001-SETTLED-1', '{"requestAmount":100.00,"currency":"INR","allocations":2}'::jsonb, 'PROCESSED', NULL, NOW(), NOW())
        RETURNING event_id INTO v_event;
    END IF;

    -- Voucher header for the event.
    SELECT voucher_id INTO v_voucher FROM clearing.voucher_header WHERE event_id = v_event;
    IF v_voucher IS NULL THEN
        INSERT INTO clearing.voucher_header (event_id, request_id, total_debit, total_credit, status, posted_at, board_id, employer_id)
        VALUES (v_event, 9001, 100.00, 100.00, 'POSTED', NOW(), 'BRD-100', 'EMP-9001')
        RETURNING voucher_id INTO v_voucher;
    END IF;

    -- Voucher lines: one DR for the payable, two CR lines per allocation/bank txn.
    PERFORM 1 FROM clearing.voucher_line WHERE voucher_id = v_voucher AND dr_cr_flag = 'DR' AND gl_source_type = 'EMPLOYEE_PAYABLE';
    IF NOT FOUND THEN
        INSERT INTO clearing.voucher_line (voucher_id, dr_cr_flag, gl_source_type, amount, dimension_source)
        VALUES (v_voucher, 'DR', 'EMPLOYEE_PAYABLE', 100.00, 'EMPLOYEE_FROM_EVENT');
    END IF;

    PERFORM 1 FROM clearing.voucher_line WHERE voucher_id = v_voucher AND allocation_id = v_allocation1;
    IF NOT FOUND THEN
        INSERT INTO clearing.voucher_line (voucher_id, dr_cr_flag, gl_source_type, amount, bank_txn_id, allocation_id, dimension_source)
        VALUES (v_voucher, 'CR', 'BANK_CLEARING', 60.00, v_bank_txn1, v_allocation1, 'BANK_TXN_FROM_ALLOCATION');
    END IF;

    PERFORM 1 FROM clearing.voucher_line WHERE voucher_id = v_voucher AND allocation_id = v_allocation2;
    IF NOT FOUND THEN
        INSERT INTO clearing.voucher_line (voucher_id, dr_cr_flag, gl_source_type, amount, bank_txn_id, allocation_id, dimension_source)
        VALUES (v_voucher, 'CR', 'BANK_CLEARING', 40.00, v_bank_txn2, v_allocation2, 'BANK_TXN_FROM_ALLOCATION');
    END IF;
END $$;

COMMIT;
