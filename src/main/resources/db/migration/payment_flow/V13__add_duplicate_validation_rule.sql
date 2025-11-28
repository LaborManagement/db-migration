-- Flag duplicate worker entries within the same upload (by worker_regno + month)
INSERT INTO payment_flow.validation_rule (rule_code, field, rule_type, params, message, sort_order)
VALUES (
    'WORKER_UPLOAD_DUPLICATE',
    'workerRegno',
    'UNIQUE_IN_FILE',
    '{"fields":["workerRegno","month"]}',
    'Duplicate worker_regno with the same month found in uploaded file',
    5
)
ON CONFLICT (rule_code) DO NOTHING;
