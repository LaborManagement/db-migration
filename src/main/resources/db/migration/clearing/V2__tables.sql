-- Table: clearing.clearing_status

drop table if exists clearing.clearing_status;


CREATE TABLE clearing.clearing_status (status_id SERIAL PRIMARY KEY,
                                                        status_type VARCHAR(50) NOT NULL,
                                                                                status_code VARCHAR(50) UNIQUE NOT NULL,
                                                                                                               description TEXT, sequence_no INTEGER NOT NULL -- for maintaining sequential flow
);

-- Table: clearing.payment_allocation

drop table if exists clearing.payment_allocation;


CREATE TABLE clearing.payment_allocation (allocation_id SERIAL PRIMARY KEY,
                                                               request_id INTEGER NOT NULL,
                                                                                  bank_txn_id INTEGER NOT NULL REFERENCES clearing.bank_transaction(bank_txn_id),
                                                                                                                          allocated_amount NUMERIC(18, 2) NOT NULL,
                                                                                                                                                          allocation_date DATE NOT NULL,
                                                                                                                                                                               allocated_by VARCHAR(100),
                                                                                                                                                                                            voucher_id INTEGER, source_file_id INTEGER);

-- Table: clearing.bank_transaction

drop table if exists clearing.bank_transaction CASCADE;


CREATE TABLE clearing.bank_transaction (bank_txn_id SERIAL PRIMARY KEY,
                                                           bank_account_id INTEGER NOT NULL,
                                                                                   txn_ref VARCHAR(100), -- or utr_number
 txn_date DATE NOT NULL,
               amount NUMERIC(18, 2) NOT NULL,
                                     dr_cr_flag CHAR(2) NOT NULL, -- e.g. 'DR'/'CR'
 description TEXT, allocated_amount NUMERIC(18, 2) DEFAULT 0,
                                                           remaining_amount NUMERIC(18, 2) DEFAULT 0,
                                                                                                   status INTEGER NOT NULL DEFAULT 1,
                                                                                                                                   board_id INTEGER, employee_id INTEGER, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                                                                                                                                                                                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

--include grants as necessary
GRANT
SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA clearing TO app_clearing;

GRANT USAGE,
SELECT ON ALL SEQUENCES IN SCHEMA clearing TO app_clearing;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA clearing TO app_clearing;