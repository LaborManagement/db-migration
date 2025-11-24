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

select * from payment_flow.status_master;

select column_name, data_type from information_schema.columns
where table_schema = 'payment_flow'
and table_name = 'employer_payment_receipts';




