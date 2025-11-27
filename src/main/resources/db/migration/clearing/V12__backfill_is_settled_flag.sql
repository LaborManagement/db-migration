-- Backfill is_settled based on remaining_amount for existing rows
UPDATE clearing.bank_transaction
SET is_settled = TRUE
WHERE COALESCE(remaining_amount, 0) = 0;
