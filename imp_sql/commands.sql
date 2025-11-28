
select *
from payment_flow.uploaded_files;


select *
from payment_flow.worker_uploaded_data
where file_id = 96;


select *
from payment_flow.worker_payment_receipts;


select *
from payment_flow.worker_payments;


select *
from payment_flow.employer_payment_receipts;


select *
from payment_flow.status_master;

--delete statements to clear data for re-running tests

delete
from payment_flow.worker_uploaded_data;


delete
from payment_flow.uploaded_files;


delete
from payment_flow.worker_payments;


delete
from payment_flow.employer_payment_receipts;


delete
from payment_flow.worker_payment_receipts;


commit;


select *
from clearing.accounting_event_type;


select *
from clearing.accounting_rule_header;


select *
from clearing.accounting_rule_line;


select *
from clearing.accounting_event;


select *
from clearing.bank_transaction;


select *
from clearing.voucher_header;


update clearing.voucher_header
set status_id = 3;


commit;


select *
from clearing.payment_allocation;


select *
from clearing.request_settlement;

--delete statements to clear data for re-running tests

delete
from clearing.voucher_header;


delete
from clearing.accounting_event;


delete
from clearing.payment_allocation;


delete
from clearing.request_settlement;


update clearing.bank_transaction
set allocated_amount = 0,
    remaining_amount = 114400.00;


commit;


select *
from reconciliation.statement_transaction;


select *
from reconciliation.van_transaction;


select *
from reconciliation.bank_account;


update reconciliation.statement_transaction
set is_mapped = false;


commit;


select *
from payment_flow.status_master
where status_type = 'worker_uploaded_data'
  and seq_no= 1;


select *
from reconciliation.vw_all_bank_transactions;


SELECT *
FROM information_schema.columns
WHERE table_schema = 'payment_flow'
  AND table_name = 'worker_payments';


select *
from clearing.status_master
where status_type = 'bank_transaction';


update clearing.status_master
set seq_no = 3
where status_type = 'bank_transaction'
  and status_code = 'SETTLED';


commit;


DELETE
from clearing.status_master
where status_type = 'bank_transaction'
  and status_code = 'AVAILABLE';


commit;


select status_type,
       status_code,
       seq_no
from clearing.status_master;


select status_type,
       status_code,
       seq_no
from payment_flow.status_master
where status_type = 'worker_payment_receipt';


update payment_flow.status_master
set seq_no = seq_no + 1
where status_type = 'worker_payment_receipt'
  and status_code in ('RECONCILED_BY_EMPLOYER',
                      'APPROVED_BY_BOARD',
                      'PROCESSED_BY_BOARD');


commit;


delete
from payment_flow.status_master
where status_type = 'worker_payment_request'
  and status_code in ('APPROVED_BY_EMPLOYER');


commit;


select *
from payment_flow.worker_master;


select *
from payment_flow.employer_master;


select *
from payment_flow.toli_master;


select *
from payment_flow.validation_rule;