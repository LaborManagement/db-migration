
select * from payment_flow.uploaded_files;
select * from payment_flow.worker_uploaded_data;

select * from payment_flow.worker_payment_receipts;
select * from payment_flow.worker_payments;
select * from payment_flow.employer_payment_receipts;


delete from payment_flow.worker_uploaded_data;
delete from payment_flow.uploaded_files;
delete from payment_flow.worker_payments;
delete from payment_flow.employer_payment_receipts;
delete from payment_flow.worker_payment_receipts;
commit;

select * from clearing.accounting_event_type;
select * from clearing.accounting_event;
select * from clearing.accounting_rule_header;
select * from clearing.accounting_rule_line;

select * from clearing.bank_transaction;
select * from clearing.voucher_header;
select * from clearing.voucher_line;
select * from clearing.payment_allocation;

delete from clearing.voucher_line;
delete from clearing.voucher_header;
delete from clearing.accounting_event
where idempotency_key = 'REQ-9001';
commit;

select * from reconciliation.statement_transaction;
select * from reconciliation.van_transaction;
select * from reconciliation.vw_all_bank_transactions;


select * From payment_flow.validation_rule;