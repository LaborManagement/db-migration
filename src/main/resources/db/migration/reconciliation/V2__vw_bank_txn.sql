drop view if exists reconciliation.vw_all_bank_transactions;


CREATE OR REPLACE VIEW reconciliation.vw_all_bank_transactions AS
SELECT 'MT940' type,
               st.statement_file_id::integer AS bank_account_id,
               st.bank_reference AS txn_ref,
               st.value_date AS txn_date,
               st.amount,
               st.dc AS dr_cr_flag,
               st.narrative AS description,
               st.is_mapped,
               st.created_at
FROM reconciliation.statement_transaction st
UNION ALL
SELECT 'VAN' AS type,
       vt.import_run_id::integer AS bank_account_id,
       vt.transaction_reference_number AS txn_ref,
       vt.value_date AS txn_date,
       vt.amount,
       'CR' AS dr_cr_flag, -- Or map logic as needed
 vt.payment_description_narration AS description,
 vt.is_mapped,
 vt.created_at
FROM reconciliation.van_transaction vt;

GRANT
SELECT ON reconciliation.vw_all_bank_transactions TO app_clearing;

GRANT USAGE ON SCHEMA reconciliation TO app_payment_flow;

GRANT SELECT ON reconciliation.vw_all_bank_transactions TO app_payment_flow;

GRANT SELECT, INSERT, UPDATE, DELETE ON reconciliation.statement_transaction TO app_payment_flow;
GRANT SELECT, INSERT, UPDATE, DELETE ON reconciliation.van_transaction TO app_payment_flow;