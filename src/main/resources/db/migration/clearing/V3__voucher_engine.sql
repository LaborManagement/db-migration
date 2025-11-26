-- Voucher and accounting rule engine (non-queued)

CREATE TABLE IF NOT EXISTS clearing.accounting_event_type (event_type_id SERIAL PRIMARY KEY,
                                                                                code VARCHAR(64) UNIQUE NOT NULL,
                                                                                                        description TEXT, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE IF NOT EXISTS clearing.accounting_rule_header (rule_header_id SERIAL PRIMARY KEY,
                                                                                  event_type_id INTEGER NOT NULL REFERENCES clearing.accounting_event_type(event_type_id),
                                                                                                                            name VARCHAR(128) NOT NULL,
                                                                                                                                              is_active BOOLEAN NOT NULL DEFAULT TRUE,
                                                                                                                                                                                 priority INTEGER NOT NULL DEFAULT 1,
                                                                                                                                                                                                                   created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE IF NOT EXISTS clearing.accounting_rule_line (rule_line_id SERIAL PRIMARY KEY,
                                                                              rule_header_id INTEGER NOT NULL REFERENCES clearing.accounting_rule_header(rule_header_id),
                                                                                                                         line_no INTEGER NOT NULL,
                                                                                                                                         dr_cr_flag CHAR(2) NOT NULL,
                                                                                                                                                            gl_source_type VARCHAR(64) NOT NULL,
                                                                                                                                                                                       amount_source VARCHAR(32) NOT NULL, -- EVENT_TOTAL | PER_ALLOCATION
 dimension_source VARCHAR(64),
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                        CONSTRAINT ck_rule_line_dr_cr CHECK (dr_cr_flag IN ('DR',
                                                                                                            'CR')), CONSTRAINT ck_amount_source CHECK (amount_source IN ('EVENT_TOTAL',
                                                                                                                                                                         'PER_ALLOCATION')));


CREATE TABLE IF NOT EXISTS clearing.accounting_event (event_id SERIAL PRIMARY KEY,
                                                                      event_type_id INTEGER NOT NULL REFERENCES clearing.accounting_event_type(event_type_id),
                                                                                                                request_id BIGINT NOT NULL,
                                                                                                                                  idempotency_key VARCHAR(128) NOT NULL,
                                                                                                                                                               payload JSONB,
                                                                                                                                                                       status VARCHAR(32) NOT NULL DEFAULT 'RECEIVED', -- RECEIVED | PROCESSED | FAILED
 error_message TEXT, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                           processed_at TIMESTAMP, UNIQUE (event_type_id,
                                                                                           request_id,
                                                                                           idempotency_key));


CREATE TABLE IF NOT EXISTS clearing.voucher_header (voucher_id SERIAL PRIMARY KEY,
                                                                      event_id INTEGER NOT NULL REFERENCES clearing.accounting_event(event_id),
                                                                                                           request_id BIGINT NOT NULL,
                                                                                                                             total_debit NUMERIC(18, 2) NOT NULL DEFAULT 0,
                                                                                                                                                                         total_credit NUMERIC(18, 2) NOT NULL DEFAULT 0,
                                                                                                                                                                                                                      status VARCHAR(32) NOT NULL DEFAULT 'CREATED', -- CREATED | POSTED
 posted_at TIMESTAMP, board_id BIGINT, employer_id BIGINT, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                                                                 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- CREATE TABLE IF NOT EXISTS clearing.voucher_line (
--     voucher_line_id SERIAL PRIMARY KEY,
--     voucher_id INTEGER NOT NULL REFERENCES clearing.voucher_header(voucher_id),
--     dr_cr_flag CHAR(2) NOT NULL, -- DR | CR
--     gl_source_type VARCHAR(64) NOT NULL,
--     amount NUMERIC(18,2) NOT NULL,
--     bank_txn_id BIGINT,
--     allocation_id BIGINT,
--     dimension_source VARCHAR(64),
--     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     CONSTRAINT ck_vl_dr_cr CHECK (dr_cr_flag IN ('DR','CR'))
-- );
 -- CREATE INDEX IF NOT EXISTS idx_voucher_header_request ON clearing.voucher_header(request_id);
-- CREATE INDEX IF NOT EXISTS idx_voucher_line_voucher ON clearing.voucher_line(voucher_id);
 -- Seed the core event type for settlement (idempotent)

INSERT INTO clearing.accounting_event_type (code, description)
VALUES ('EMP_REQ_SETTLED', 'Employee request fully allocated / settled') ON CONFLICT (code) DO NOTHING;

-- Grants
GRANT
SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA clearing TO app_clearing;

GRANT USAGE,
SELECT ON ALL SEQUENCES IN SCHEMA clearing TO app_clearing;