-- Create status_master table for workflow status tracing
CREATE TABLE IF NOT EXISTS payment_flow.status_master (
    id SERIAL PRIMARY KEY,
    status_type VARCHAR(64) NOT NULL,         -- e.g. 'worker_uploaded_data', 'worker_payment_request', etc.
    status_code VARCHAR(64) NOT NULL,         -- e.g. 'UPLOADED', 'SUBMITTED', 'APPROVED', etc.
    status_description VARCHAR(255),          -- e.g. 'Submitted by Worker'
    is_active BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

-- Unique constraint to avoid duplicate status per type
ALTER TABLE payment_flow.status_master
    ADD CONSTRAINT uq_status_type_code UNIQUE (status_type, status_code);

-- Sample inserts for mapped statuses

-- 1. worker_uploaded_data
INSERT INTO payment_flow.status_master (status_type, status_code, status_description) VALUES
('worker_uploaded_data', 'UPLOADED', 'Uploaded'),
('worker_uploaded_data', 'SUBMITTED', 'Submitted');

-- 2. worker_payment_request
INSERT INTO payment_flow.status_master (status_type, status_code, status_description) VALUES
('worker_payment_request', 'SUBMITTED', 'Submitted'),
('worker_payment_request', 'APPROVED_BY_EMPLOYER', 'Approved by Employer'),
('worker_payment_request', 'RECONCILED_BY_EMPLOYER', 'Reconciled by Employer'),
('worker_payment_request', 'APPROVED_BY_BOARD', 'Approved by Board'),
('worker_payment_request', 'PROCESSED_BY_BOARD', 'Processed by Board');

-- 3. employer_payment_request
INSERT INTO payment_flow.status_master (status_type, status_code, status_description) VALUES
('employer_payment_request', 'PENDING', 'Pending'),
('employer_payment_request', 'APPROVED', 'Approved'),
('employer_payment_request', 'RECONCILED', 'Reconciled'),
('employer_payment_request', 'SUBMITTED', 'Submitted'),
('employer_payment_request', 'APPROVED_BY_BOARD', 'Approved by Board'),
('employer_payment_request', 'PROCESSED_BY_BOARD', 'Processed by Board');

-- 4. board_receipts
INSERT INTO payment_flow.status_master (status_type, status_code, status_description) VALUES
('board_receipts', 'SUBMITTED_BY_WORKER', 'Submitted by Worker'),
('board_receipts', 'APPROVED_BY_EMPLOYER', 'Approved by Employer'),
('board_receipts', 'RECONCILED_BY_EMPLOYER', 'Reconciled by Employer'),
('board_receipts', 'PENDING_FOR_SUBMISSION', 'Pending for Submission'),
('board_receipts', 'PENDING_FOR_APPROVAL', 'Pending for Approval'),
('board_receipts', 'PROCESSED', 'Processed');