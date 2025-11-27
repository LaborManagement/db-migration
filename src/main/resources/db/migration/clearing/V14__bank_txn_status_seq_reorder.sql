-- Reorder bank_transaction status seq_no values:
-- CLAIMED=1, ALLOCATED=2, SETTLED=3, AVAILABLE shifted to 0 to keep uniqueness.

WITH new_seq AS (
    SELECT id, status_code,
        CASE status_code
            WHEN 'AVAILABLE' THEN 0
            WHEN 'CLAIMED' THEN 1
            WHEN 'ALLOCATED' THEN 2
            WHEN 'SETTLED' THEN 3
            ELSE seq_no
        END AS new_seq_no
    FROM clearing.status_master
    WHERE status_type = 'bank_transaction'
)
-- Align existing bank_transaction rows first using status_code mapping
UPDATE clearing.bank_transaction bt
SET status_id = ns.new_seq_no
FROM new_seq ns
WHERE bt.status_id = (
    SELECT sm.seq_no FROM clearing.status_master sm WHERE sm.id = ns.id
)
AND ns.status_code IN ('AVAILABLE','CLAIMED','ALLOCATED','SETTLED');

-- Then update status_master seq_no to the new order
UPDATE clearing.status_master sm
SET seq_no = ns.new_seq_no
FROM new_seq ns
WHERE sm.id = ns.id;
