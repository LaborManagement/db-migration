-- Link request_settlement to voucher_header

ALTER TABLE clearing.request_settlement
    ADD COLUMN IF NOT EXISTS voucher_id BIGINT;

COMMENT ON COLUMN clearing.request_settlement.voucher_id IS 'Voucher header id created when request is fully settled';
