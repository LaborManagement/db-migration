-- Reset clearing core tables to updated schema with standard RLS policies

-- Drop tables if they exist (order matters due to FKs)
DROP TABLE IF EXISTS clearing.payment_allocation CASCADE;
DROP TABLE IF EXISTS clearing.voucher_line CASCADE;
DROP TABLE IF EXISTS clearing.voucher_header CASCADE;
DROP TABLE IF EXISTS clearing.bank_transaction CASCADE;
DROP TABLE IF EXISTS clearing.accounting_event CASCADE;
DROP TABLE IF EXISTS clearing.clearing_status CASCADE;

-- Table: clearing.voucher_header
CREATE TABLE clearing.voucher_header (
    voucher_id     BIGSERIAL PRIMARY KEY,
    board_id       BIGINT NOT NULL,
    employer_id    BIGINT NOT NULL,
    toli_id        BIGINT,
    voucher_number VARCHAR(100) NOT NULL,
    voucher_date   DATE NOT NULL,
    total_amount   NUMERIC(18, 2) NOT NULL,
    status         VARCHAR(32),
    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: clearing.voucher_line
CREATE TABLE clearing.voucher_line (
    voucher_line_id BIGSERIAL PRIMARY KEY,
    voucher_id      BIGINT NOT NULL REFERENCES clearing.voucher_header(voucher_id),
    board_id        BIGINT NOT NULL,
    employer_id     BIGINT NOT NULL,
    toli_id         BIGINT,
    line_number     INTEGER NOT NULL,
    description     TEXT,
    amount          NUMERIC(18, 2) NOT NULL,
    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: clearing.bank_transaction
CREATE TABLE clearing.bank_transaction (
    bank_txn_id      BIGSERIAL PRIMARY KEY,
    bank_account_id  INTEGER NOT NULL,
    txn_ref          VARCHAR(100),
    txn_date         DATE NOT NULL,
    amount           NUMERIC(18, 2) NOT NULL,
    dr_cr_flag       CHAR(2) NOT NULL,
    description      TEXT,
    allocated_amount NUMERIC(18, 2) DEFAULT 0,
    remaining_amount NUMERIC(18, 2) DEFAULT 0,
    txn_type         VARCHAR(50),
    source_system    VARCHAR(50),
    source_txn_id    VARCHAR(128),
    source_ref       VARCHAR(128),
    claimed_by       VARCHAR(100),
    claimed_at       TIMESTAMP,
    status           VARCHAR(32),
    is_managed       BOOLEAN DEFAULT FALSE,
    version          INTEGER DEFAULT 1,
    board_id         INTEGER NOT NULL,
    employer_id      INTEGER NOT NULL,
    toli_id          INTEGER,
    created_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ux_bank_transaction_source UNIQUE (source_system, source_txn_id)
);

-- Table: clearing.payment_allocation
CREATE TABLE clearing.payment_allocation (
    allocation_id    BIGSERIAL PRIMARY KEY,
    request_id       INTEGER NOT NULL,
    bank_txn_id      BIGINT NOT NULL REFERENCES clearing.bank_transaction(bank_txn_id),
    board_id         INTEGER NOT NULL,
    employer_id      INTEGER NOT NULL,
    toli_id          INTEGER,
    allocated_amount NUMERIC(18, 2) NOT NULL,
    allocation_date  DATE NOT NULL,
    allocated_by     VARCHAR(100),
    voucher_id       BIGINT,
    source_file_id   INTEGER,
    status           VARCHAR(32),
    created_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    version          INTEGER DEFAULT 1,
    idempotency_key  VARCHAR(128)
);

-- Table: clearing.accounting_event
CREATE TABLE clearing.accounting_event (
    accounting_event_id BIGSERIAL PRIMARY KEY,
    event_type_id       INTEGER NOT NULL,
    request_id          INTEGER NOT NULL,
    board_id            INTEGER NOT NULL,
    employer_id         INTEGER NOT NULL,
    toli_id             INTEGER,
    event_date          DATE NOT NULL,
    amount              NUMERIC(18, 2) NOT NULL,
    status              VARCHAR(32),
    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: clearing.clearing_status (master table)
CREATE TABLE clearing.clearing_status (
    status_id   SERIAL PRIMARY KEY,
    status_type VARCHAR(50) NOT NULL,
    status_code VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    sequence_no INTEGER NOT NULL
);

-- Standard RLS policies (inline to avoid helper ownership constraints)
ALTER TABLE clearing.voucher_header ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.voucher_header FORCE ROW LEVEL SECURITY;
CREATE POLICY voucher_header_std_read ON clearing.voucher_header
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));
CREATE POLICY voucher_header_std_write ON clearing.voucher_header
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

ALTER TABLE clearing.voucher_line ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.voucher_line FORCE ROW LEVEL SECURITY;
CREATE POLICY voucher_line_std_read ON clearing.voucher_line
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));
CREATE POLICY voucher_line_std_write ON clearing.voucher_line
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

ALTER TABLE clearing.payment_allocation ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.payment_allocation FORCE ROW LEVEL SECURITY;
CREATE POLICY payment_allocation_std_read ON clearing.payment_allocation
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));
CREATE POLICY payment_allocation_std_write ON clearing.payment_allocation
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

ALTER TABLE clearing.bank_transaction ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.bank_transaction FORCE ROW LEVEL SECURITY;
CREATE POLICY bank_transaction_std_read ON clearing.bank_transaction
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));
CREATE POLICY bank_transaction_std_write ON clearing.bank_transaction
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

ALTER TABLE clearing.accounting_event ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.accounting_event FORCE ROW LEVEL SECURITY;
CREATE POLICY accounting_event_std_read ON clearing.accounting_event
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));
CREATE POLICY accounting_event_std_write ON clearing.accounting_event
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

-- Permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA clearing TO app_clearing;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA clearing TO app_clearing;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA clearing TO app_clearing;
