-- Allow payment-flow service to read bank accounts used in reconciliation view joins
GRANT SELECT ON reconciliation.bank_account TO app_payment_flow;

-- Ensure payment-flow can read the reconciliation bank transactions view
GRANT SELECT ON reconciliation.vw_all_bank_transactions TO app_payment_flow;
