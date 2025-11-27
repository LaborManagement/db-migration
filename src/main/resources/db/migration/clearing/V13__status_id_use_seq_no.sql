-- Align status_id columns to use status_master.seq_no (not surrogate id)
UPDATE clearing.bank_transaction bt
SET status_id = sm.seq_no
FROM clearing.status_master sm
WHERE sm.id = bt.status_id
  AND sm.status_type = 'bank_transaction';

UPDATE clearing.payment_allocation pa
SET status_id = sm.seq_no
FROM clearing.status_master sm
WHERE sm.id = pa.status_id
  AND sm.status_type = 'payment_allocation';

UPDATE clearing.voucher_header vh
SET status_id = sm.seq_no
FROM clearing.status_master sm
WHERE sm.id = vh.status_id
  AND sm.status_type = 'voucher_header';

UPDATE clearing.accounting_event ae
SET status_id = sm.seq_no
FROM clearing.status_master sm
WHERE sm.id = ae.status_id
  AND sm.status_type = 'accounting_event';
