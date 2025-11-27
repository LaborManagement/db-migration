-- Track whether a bank transaction has been fully utilized/settled
ALTER TABLE clearing.bank_transaction
    ADD COLUMN IF NOT EXISTS is_settled BOOLEAN NOT NULL DEFAULT FALSE;

-- Backfill existing rows just in case default was not applied
UPDATE clearing.bank_transaction
SET is_settled = FALSE
WHERE is_settled IS NULL;
