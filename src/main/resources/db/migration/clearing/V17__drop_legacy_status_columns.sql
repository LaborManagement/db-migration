-- Remove legacy status text columns now that status_id is the source of truth

ALTER TABLE clearing.payment_allocation
    DROP COLUMN IF EXISTS status;

ALTER TABLE clearing.request_settlement
    DROP COLUMN IF EXISTS status;

ALTER TABLE clearing.voucher_header
    DROP COLUMN IF EXISTS status;
