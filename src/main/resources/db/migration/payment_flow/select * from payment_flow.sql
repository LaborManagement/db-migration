select * from payment_flow.uploaded_files;
select * from payment_flow.worker_uploaded_data;
select * from payment_flow.worker_payment_receipts;
select * from payment_flow.worker_payments;
select * from payment_flow.worker_master;

delete from payment_flow.worker_uploaded_data;
delete from payment_flow.uploaded_files;
delete from payment_flow.worker_payments;
delete from payment_flow.worker_payment_receipts;
commit;


SELECT * FROM payment_flow.worker_uploaded_data
         WHERE file_id = 66 AND status_id = '1';




