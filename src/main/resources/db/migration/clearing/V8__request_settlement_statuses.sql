-- Seed statuses for request_settlement

INSERT INTO clearing.status_master (status_type, status_code, status_description, seq_no)
VALUES
    ('request_settlement', 'ALLOCATED', 'Request partially allocated', 1),
    ('request_settlement', 'SETTLED', 'Request fully allocated/settled', 2)
ON CONFLICT (status_type, status_code) DO NOTHING;
