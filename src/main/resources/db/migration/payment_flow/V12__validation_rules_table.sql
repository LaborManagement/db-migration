CREATE TABLE IF NOT EXISTS payment_flow.validation_rule (
    id BIGSERIAL PRIMARY KEY,
    rule_code VARCHAR(100) NOT NULL UNIQUE,
    field VARCHAR(100) NOT NULL,
    rule_type VARCHAR(50) NOT NULL,
    params JSONB,
    message TEXT NOT NULL,
    severity VARCHAR(20) NOT NULL DEFAULT 'ERROR',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_validation_rule_active_order
    ON payment_flow.validation_rule (is_active, sort_order, rule_code);

INSERT INTO payment_flow.validation_rule (rule_code, field, rule_type, params, message, sort_order)
VALUES
    ('WORKER_REG_REQUIRED', 'workerRegno', 'REQUIRED', NULL, 'worker_regno is NULL', 10),
    ('AMOUNT_NON_NEGATIVE', 'amount', 'NON_NEGATIVE', '{"min":0}', 'amount is negative', 20),
    ('WORKER_REG_EXISTS', 'workerRegno', 'EXISTS_IN_MASTER', '{"lookup":"worker_master"}', 'worker_regno not found in worker_master', 30),
    ('EMPLOYER_REG_REQUIRED', 'employerRegNo', 'NOT_EMPTY', NULL, 'employer_reg_no is NULL or empty', 40),
    ('EMPLOYER_REG_EXISTS', 'employerRegNo', 'EXISTS_IN_MASTER', '{"lookup":"employer_master"}', 'employer_reg_no not found in employer_master', 50),
    ('TOLI_REG_REQUIRED', 'toliRegNo', 'NOT_EMPTY', NULL, 'toli_reg_no is NULL or empty', 60),
    ('TOLI_REG_EXISTS', 'toliRegNo', 'EXISTS_IN_MASTER', '{"lookup":"toli_master"}', 'toli_reg_no not found in toli_master', 70),
    ('EMPLOYEE_NAME_REQUIRED', 'employeeName', 'NOT_EMPTY', NULL, 'employee_name is NULL or empty', 80),
    ('YEAR_MONTH_REGEX', 'month', 'REGEX', '{"regex":"^\\d{4}-\\d{2}$"}', 'year_month format invalid', 90),
    ('ADVANCE_NON_NEGATIVE', 'advance', 'NON_NEGATIVE', '{"min":0}', 'advance is negative', 100),
    ('NET_PAYABLE_NON_NEGATIVE', 'netPayable', 'NON_NEGATIVE', '{"min":0}', 'net_payable is negative', 110),
    ('TOTAL_DAYS_RANGE', 'totalDays', 'RANGE', '{"min":0,"max":31}', 'total_days out of range', 120),
    ('PAYMENT_TYPE_REQUIRED', 'paymentType', 'NOT_EMPTY', NULL, 'payment_type is NULL or empty', 130)
ON CONFLICT (rule_code) DO NOTHING;


GRANT INSERT ON payment_flow.validation_rule TO app_payment_flow;
GRANT SELECT ON payment_flow.validation_rule TO app_payment_flow;
GRANT UPDATE ON payment_flow.validation_rule TO app_payment_flow;
GRANT DELETE ON payment_flow.validation_rule TO app_payment_flow;
