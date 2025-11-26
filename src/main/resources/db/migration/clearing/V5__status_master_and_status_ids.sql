-- Generic status master for clearing

CREATE TABLE IF NOT EXISTS clearing.status_master (
    id SERIAL PRIMARY KEY,
    status_type VARCHAR(64) NOT NULL,
    status_code VARCHAR(64) NOT NULL,
    status_description VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    seq_no INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_status_type_code UNIQUE (status_type, status_code),
    CONSTRAINT uq_status_type_seq UNIQUE (status_type, seq_no)
);

-- Seed statuses for clearing domains
INSERT INTO clearing.status_master (status_type, status_code, status_description, seq_no)
VALUES
    ('bank_transaction', 'AVAILABLE', 'Available for allocation', 1),
    ('bank_transaction', 'CLAIMED', 'Claimed into clearing', 2),
    ('bank_transaction', 'ALLOCATED', 'Partially or fully allocated', 3),
    ('bank_transaction', 'SETTLED', 'Fully settled', 4),

    ('payment_allocation', 'ALLOCATED', 'Allocation created', 1),
    ('payment_allocation', 'SETTLED', 'Allocation settled', 2),
    ('payment_allocation', 'REVERSED', 'Allocation reversed', 3),

    ('voucher_header', 'CREATED', 'Voucher created', 1),
    ('voucher_header', 'IN_PROGRESS', 'Voucher in progress', 2),
    ('voucher_header', 'POSTED', 'Voucher posted', 3),
    ('voucher_header', 'FAILED', 'Voucher failed', 4),

    ('accounting_event', 'RECEIVED', 'Event received', 1),
    ('accounting_event', 'PROCESSED', 'Event processed', 2),
    ('accounting_event', 'FAILED', 'Event failed', 3)
ON CONFLICT (status_type, status_code) DO NOTHING;

-- Add status_id columns to core tables
ALTER TABLE clearing.bank_transaction
    ADD COLUMN IF NOT EXISTS status_id INTEGER;

ALTER TABLE clearing.payment_allocation
    ADD COLUMN IF NOT EXISTS status_id INTEGER;

ALTER TABLE clearing.voucher_header
    ADD COLUMN IF NOT EXISTS status_id INTEGER;

ALTER TABLE clearing.accounting_event
    ADD COLUMN IF NOT EXISTS status_id INTEGER;
