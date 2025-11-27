-- Correct bank_transaction statuses: only rows with remaining_amount = 0 are SETTLED (3)
-- If remaining_amount is NULL, treat as not settled; use allocation to choose ALLOCATED (2) vs CLAIMED (1)
UPDATE clearing.bank_transaction
SET status_id = CASE
        WHEN remaining_amount IS NOT NULL AND remaining_amount = 0 THEN 3  -- SETTLED
        WHEN COALESCE(allocated_amount, 0) > 0 THEN 2                      -- ALLOCATED
        ELSE 1                                                             -- CLAIMED
    END,
    is_settled = CASE WHEN remaining_amount IS NOT NULL AND remaining_amount = 0 THEN TRUE ELSE FALSE END;
