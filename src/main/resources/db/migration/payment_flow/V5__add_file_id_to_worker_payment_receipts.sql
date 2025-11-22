-- Drop the file_id column if it exists

ALTER TABLE payment_flow.worker_payment_receipts
DROP COLUMN IF EXISTS file_id;

-- Add request_nmbr to worker_uploaded_data and add the foreign key

ALTER TABLE payment_flow.worker_uploaded_data ADD COLUMN request_nmbr character varying(40);


ALTER TABLE payment_flow.worker_uploaded_data ADD CONSTRAINT fk_worker_uploaded_data_request_nmbr
FOREIGN KEY (request_nmbr) REFERENCES payment_flow.worker_payment_receipts(receipt_number);

--add status column in worker_payments

ALTER TABLE payment_flow. ADD COLUMN request_nmbr character varying(40);