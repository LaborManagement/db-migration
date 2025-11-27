-- Drop the deprecated is_managed flag; mapping is tracked in reconciliation with is_mapped
ALTER TABLE clearing.bank_transaction
    DROP COLUMN IF EXISTS is_managed;
