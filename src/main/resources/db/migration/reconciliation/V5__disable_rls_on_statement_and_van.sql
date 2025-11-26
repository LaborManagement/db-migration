-- Disable RLS on source transaction tables used by clearing claims

ALTER TABLE reconciliation.statement_transaction DISABLE ROW LEVEL SECURITY;
ALTER TABLE reconciliation.van_transaction DISABLE ROW LEVEL SECURITY;

-- Drop policies if present (no-op if they don't exist)
DROP POLICY IF EXISTS statement_transaction_std_read ON reconciliation.statement_transaction;
DROP POLICY IF EXISTS statement_transaction_std_write ON reconciliation.statement_transaction;
DROP POLICY IF EXISTS van_transaction_std_read ON reconciliation.van_transaction;
DROP POLICY IF EXISTS van_transaction_std_write ON reconciliation.van_transaction;
