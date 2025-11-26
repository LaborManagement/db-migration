-- Add new columns to clearing.bank_transaction

ALTER TABLE clearing.bank_transaction ADD COLUMN txn_type VARCHAR(50),
                                                          ADD COLUMN source_system VARCHAR(50),
                                                                                   ADD COLUMN source_txn_id VARCHAR(128),
                                                                                                            ADD COLUMN source_ref VARCHAR(128),
                                                                                                                                  ADD COLUMN claimed_by VARCHAR(100),
                                                                                                                                                        ADD COLUMN claimed_at TIMESTAMP,
                                                                                                                                                                            ADD COLUMN version INTEGER DEFAULT 1;

-- Add unique index for (source_system, source_txn_id)

CREATE UNIQUE INDEX IF NOT EXISTS ux_bank_transaction_source ON clearing.bank_transaction (source_system, source_txn_id);

-- Add new columns to clearing.payment_allocation

ALTER TABLE clearing.payment_allocation ADD COLUMN status VARCHAR(32),
                                                          ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                                                                                  ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                                                                                                                          ADD COLUMN version INTEGER DEFAULT 1,
                                                                                                                                                                             ADD COLUMN idempotency_key VARCHAR(128);

-- Optionally add constraints for status if you want enum-like behavior:
-- ALTER TABLE clearing.bank_transaction
--     ADD CONSTRAINT chk_bank_transaction_status CHECK (status IN ('NEW', 'ALLOCATED', 'CLAIMED', 'SETTLED', 'REVERSED'));
 -- ALTER TABLE clearing.payment_allocation
--     ADD CONSTRAINT chk_payment_allocation_status CHECK (status IN ('ALLOCATED', 'REVERSED', 'CANCELLED'));
 -- Note: allocated_amount and remaining_amount already exist in bank_transaction.
 -- End of migration
