-- Request-level settlement tracker to drive auto voucher creation

CREATE TABLE IF NOT EXISTS clearing.request_settlement (
    request_settlement_id BIGSERIAL PRIMARY KEY,
    request_id            BIGINT NOT NULL UNIQUE,
    board_id              BIGINT NOT NULL,
    employer_id           BIGINT NOT NULL,
    toli_id               BIGINT,
    total_amount          NUMERIC(18, 2) NOT NULL,
    allocated_amount      NUMERIC(18, 2) NOT NULL DEFAULT 0,
    remaining_amount      NUMERIC(18, 2) NOT NULL DEFAULT 0,
    status                VARCHAR(32),
    status_id             INTEGER,
    created_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE clearing.request_settlement IS 'Per-request totals for allocation/voucher auto-finalization';

-- RLS policies (inline)
ALTER TABLE clearing.request_settlement ENABLE ROW LEVEL SECURITY;
ALTER TABLE clearing.request_settlement FORCE ROW LEVEL SECURITY;

CREATE POLICY request_settlement_std_read ON clearing.request_settlement
    FOR SELECT USING (auth.can_read_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

CREATE POLICY request_settlement_std_write ON clearing.request_settlement
    USING (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint))
    WITH CHECK (auth.can_write_row(board_id::bigint, employer_id::bigint, toli_id::bigint));

-- Grants
GRANT SELECT, INSERT, UPDATE, DELETE ON clearing.request_settlement TO app_clearing;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA clearing TO app_clearing;
