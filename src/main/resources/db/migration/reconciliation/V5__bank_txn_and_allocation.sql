-- Move curated bank transactions and allocations into reconciliation schema

-- 1) Curated bank transaction table (selected rows from raw MT940/VAN)
CREATE TABLE IF NOT EXISTS reconciliation.bank_transaction (
    bank_txn_id SERIAL PRIMARY KEY,
    bank_account_id INTEGER NOT NULL,
    txn_ref VARCHAR(100),
    txn_date DATE NOT NULL,
    amount NUMERIC(18,2) NOT NULL,
    dr_cr_flag CHAR(2) NOT NULL,
    description TEXT,
    allocated_amount NUMERIC(18,2) DEFAULT 0,
    remaining_amount NUMERIC(18,2) DEFAULT 0,
    status INTEGER NOT NULL DEFAULT 1,
    board_id INTEGER,
    employee_id INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2) Payment allocation table (request ↔ bank txn)
CREATE TABLE IF NOT EXISTS reconciliation.payment_allocation (
    allocation_id SERIAL PRIMARY KEY,
    request_id INTEGER NOT NULL,
    bank_txn_id INTEGER NOT NULL REFERENCES reconciliation.bank_transaction(bank_txn_id),
    allocated_amount NUMERIC(18,2) NOT NULL,
    allocation_date DATE NOT NULL,
    allocated_by VARCHAR(100),
    voucher_id INTEGER,
    source_file_id INTEGER
);


-- 3) Replace clearing tables with compatibility views
DROP TABLE IF EXISTS clearing.payment_allocation;
DROP TABLE IF EXISTS clearing.bank_transaction;

CREATE OR REPLACE VIEW clearing.bank_transaction AS
SELECT * FROM reconciliation.bank_transaction;

CREATE OR REPLACE VIEW clearing.payment_allocation AS
SELECT * FROM reconciliation.payment_allocation;

-- 4) Curated view (keeps raw view untouched)
CREATE OR REPLACE VIEW reconciliation.vw_bank_txn_curated AS
SELECT
    bt.bank_txn_id,
    bt.bank_account_id,
    bt.txn_ref,
    bt.txn_date,
    bt.amount,
    bt.dr_cr_flag,
    bt.description,
    bt.allocated_amount,
    bt.remaining_amount,
    bt.status,
    bt.board_id,
    bt.employee_id,
    bt.created_at,
    bt.updated_at
FROM reconciliation.bank_transaction bt;

-- 5) Grants
GRANT SELECT, INSERT, UPDATE, DELETE ON reconciliation.bank_transaction TO app_clearing;
GRANT USAGE, SELECT ON SEQUENCE reconciliation.bank_transaction_bank_txn_id_seq TO app_clearing;

GRANT SELECT, INSERT, UPDATE, DELETE ON reconciliation.payment_allocation TO app_clearing;
GRANT USAGE, SELECT ON SEQUENCE reconciliation.payment_allocation_allocation_id_seq TO app_clearing;

GRANT SELECT ON reconciliation.vw_bank_txn_curated TO app_clearing;
GRANT SELECT ON reconciliation.vw_bank_txn_curated TO app_payment_flow;
