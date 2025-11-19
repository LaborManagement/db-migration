-- Rename table toli_details to worker_toli_relation
ALTER TABLE payment_flow.toli_details
RENAME TO worker_toli_relation;

-- Drop column toli_code from employer_toli_relation
ALTER TABLE payment_flow.employer_toli_relation
DROP COLUMN toli_code;

-- Drop redundant employer_toli_relation table
DROP TABLE IF EXISTS payment_flow.employer_toli_relation;