-- Create status_master table for workflow status tracing

CREATE TABLE IF NOT EXISTS payment_flow.status_master (id SERIAL PRIMARY KEY,
                                                                 status_type VARCHAR(64) NOT NULL, -- e.g. 'worker_uploaded_data', 'worker_payment_request', etc.
 status_code VARCHAR(64) NOT NULL, -- e.g. 'UPLOADED', 'SUBMITTED', 'APPROVED', etc.
 status_description VARCHAR(255), -- e.g. 'Submitted by Worker'
 is_active BOOLEAN DEFAULT TRUE NOT NULL,
                                created_at TIMESTAMP DEFAULT NOW() NOT NULL);

-- Unique constraint to avoid duplicate status per type

ALTER TABLE payment_flow.status_master ADD CONSTRAINT uq_status_type_code UNIQUE (status_type,
                                                                                  status_code);

-- Sample inserts for mapped statuses
 -- Add seq_no column to status_master

ALTER TABLE payment_flow.status_master ADD COLUMN seq_no integer;

-- Add unique constraint for (status_type, seq_no)

Alter table payment_flow.status_master
drop constraint if exists uq_status_type_seq_no;


ALTER TABLE payment_flow.status_master ADD CONSTRAINT uq_status_type_seq_no UNIQUE (status_type,
                                                                                    status_code,
                                                                                    seq_no);

-- Example insert (update seq_no as appropriate)
-- uploaded_files

INSERT INTO payment_flow.status_master (status_type, status_code, status_description, is_active, seq_no)
VALUES ('uploaded_files', 'UPLOADED', 'Status for uploaded files', true, 1),
       ('uploaded_files', 'VALIDATED', 'Status for uploaded files', true, 2),
       ('uploaded_files', 'REJECTED', 'Status for uploaded files', true, 3),
       ('uploaded_files', 'REQUEST_GENERATED', 'Status for uploaded files', true, 4) ON CONFLICT (status_type, status_code) DO NOTHING;

-- worker_uploaded_data

INSERT INTO payment_flow.status_master (status_type, status_code, status_description, seq_no)
VALUES ('worker_uploaded_data', 'UPLOADED', 'Uploaded', 1),
       ('worker_uploaded_data', 'SUBMITTED', 'Submitted', 2) ON CONFLICT (status_type, status_code) DO NOTHING;

-- worker_payment_request

INSERT INTO payment_flow.status_master (status_type, status_code, status_description, seq_no)
VALUES ('worker_payment_request', 'SUBMITTED', 'Submitted', 1),
       ('worker_payment_request', 'APPROVED_BY_EMPLOYER', 'Approved by Employer', 2),
       ('worker_payment_request', 'RECONCILED_BY_EMPLOYER', 'Reconciled by Employer', 3),
       ('worker_payment_request', 'APPROVED_BY_BOARD', 'Approved by Board', 4),
       ('worker_payment_request', 'PROCESSED_BY_BOARD', 'Processed by Board', 5) ON CONFLICT (status_type, status_code) DO NOTHING;

-- employer_payment_request

INSERT INTO payment_flow.status_master (status_type, status_code, status_description, seq_no)
VALUES ('employer_payment_request', 'PENDING', 'Pending', 1),
       ('employer_payment_request', 'APPROVED', 'Approved', 2),
       ('employer_payment_request', 'RECONCILED', 'Reconciled', 3),
       ('employer_payment_request', 'SUBMITTED', 'Submitted', 4),
       ('employer_payment_request', 'APPROVED_BY_BOARD', 'Approved by Board', 5),
       ('employer_payment_request', 'PROCESSED_BY_BOARD', 'Processed by Board', 6) ON CONFLICT (status_type, status_code) DO NOTHING;

-- board_receipts

INSERT INTO payment_flow.status_master (status_type, status_code, status_description, seq_no)
VALUES ('board_receipts', 'SUBMITTED_BY_WORKER', 'Submitted by Worker', 1),
       ('board_receipts', 'APPROVED_BY_EMPLOYER', 'Approved by Employer', 2),
       ('board_receipts', 'RECONCILED_BY_EMPLOYER', 'Reconciled by Employer', 3),
       ('board_receipts', 'PENDING_FOR_SUBMISSION', 'Pending for Submission', 4),
       ('board_receipts', 'PENDING_FOR_APPROVAL', 'Pending for Approval', 5),
       ('board_receipts', 'PROCESSED', 'Processed', 6) ON CONFLICT (status_type, status_code) DO NOTHING;