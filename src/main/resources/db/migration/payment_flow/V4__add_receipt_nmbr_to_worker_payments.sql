-- Add receipt_nmbr column to worker_payments and link to worker_payment_receipts
ALTER TABLE payment_flow.worker_payments
ADD COLUMN receipt_nmbr character varying(40);

ALTER TABLE payment_flow.worker_payments
ADD CONSTRAINT fk_worker_payments_receipt_nmbr
FOREIGN KEY (receipt_nmbr)
REFERENCES payment_flow.worker_payment_receipts(receipt_number);
