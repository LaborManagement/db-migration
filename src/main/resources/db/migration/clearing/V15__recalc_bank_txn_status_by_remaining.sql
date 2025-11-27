-- Recalculate bank_transaction status_id and is_settled based on remaining/allocated amounts
-- Seq numbers (status_master.seq_no) are: AVAILABLE=0, CLAIMED=1, ALLOCATED=2, SETTLED=3

UPDATE clearing.bank_transaction
SET status_id = CASE
        WHEN COALESCE(remaining_amount, 0) = 0 THEN 3       -- SETTLED
        WHEN COALESCE(allocated_amount, 0) > 0 THEN 2       -- ALLOCATED
        ELSE 1                                              -- CLAIMED (default after import)
    END,
    is_settled = CASE WHEN COALESCE(remaining_amount, 0) = 0 THEN TRUE ELSE FALSE END;
