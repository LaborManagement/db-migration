-- Rename columns

ALTER TABLE payment_flow.worker_payments RENAME COLUMN amount TO basic_wages;


ALTER TABLE payment_flow.worker_payments RENAME COLUMN net_payable TO gross_wages;

-- Add new columns

ALTER TABLE payment_flow.worker_payments ADD COLUMN levy numeric(10, 2);


ALTER TABLE payment_flow.worker_payments ADD COLUMN net_wages_payable numeric(10, 2);


ALTER TABLE payment_flow.worker_payments ADD COLUMN status character varying(32) DEFAULT 'ACTIVE' NOT NULL;

-- Add status_id column (nullable for migration)

ALTER TABLE payment_flow.worker_payments ADD COLUMN status_id INTEGER;

-- (Optional) Drop old status column after migration

ALTER TABLE payment_flow.worker_payments
DROP COLUMN status;