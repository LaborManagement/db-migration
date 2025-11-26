-- Recreate bank transaction view to expose source identifiers and filter out already mapped rows

DROP VIEW IF EXISTS reconciliation.vw_all_bank_transactions;

CREATE OR REPLACE VIEW reconciliation.vw_all_bank_transactions AS
SELECT
    'MT940' AS type,
    'RECON' AS source_system,
    st.id AS source_txn_id,
    st.statement_file_id::integer AS bank_account_id,
    st.bank_reference AS txn_ref,
    st.value_date AS txn_date,
    st.amount,
    st.dc AS dr_cr_flag,
    st.narrative AS description,
    st.is_mapped,
    st.created_at
FROM reconciliation.statement_transaction st
WHERE COALESCE(st.is_mapped, FALSE) = FALSE
UNION ALL
SELECT
    'VAN' AS type,
    'RECON' AS source_system,
    vt.id AS source_txn_id,
    vt.import_run_id::integer AS bank_account_id,
    vt.transaction_reference_number AS txn_ref,
    COALESCE(vt.value_date, vt.transaction_date) AS txn_date,
    vt.amount,
    'CR' AS dr_cr_flag,
    vt.payment_description_narration AS description,
    vt.is_mapped,
    vt.created_at
FROM reconciliation.van_transaction vt
WHERE COALESCE(vt.is_mapped, FALSE) = FALSE;

GRANT
SELECT ON reconciliation.vw_all_bank_transactions TO app_clearing;

GRANT USAGE ON SCHEMA reconciliation TO app_clearing;

GRANT SELECT ON reconciliation.vw_all_bank_transactions TO app_clearing;
