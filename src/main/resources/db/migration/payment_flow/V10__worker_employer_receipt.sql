-- 1. Add status_id column (nullable for migration)
ALTER TABLE payment_flow.worker_payment_receipts ADD COLUMN status_id INTEGER;
ALTER TABLE payment_flow.employer_payment_receipts ADD COLUMN status_id INTEGER;

-- 3. (Optional) Drop old status column after migration
ALTER TABLE payment_flow.worker_payment_receipts DROP COLUMN status;
ALTER TABLE payment_flow.employer_payment_receipts DROP COLUMN status;