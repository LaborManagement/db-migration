-- Grant schema usage
GRANT USAGE ON SCHEMA auth TO app_auth;
GRANT USAGE ON SCHEMA payment_flow TO app_payment_flow;
GRANT USAGE ON SCHEMA reconciliation TO app_reconciliation;
GRANT USAGE ON SCHEMA audit TO app_auth, app_payment_flow, app_reconciliation;

-- Grant all table privileges in each schema
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA auth TO app_auth;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA payment_flow TO app_payment_flow;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA reconciliation TO app_reconciliation;

-- Special privileges for app_auth
GRANT TRUNCATE, REFERENCES, TRIGGER ON auth.user_tenant_acl TO app_auth;

-- Cross-schema SELECT grants
GRANT SELECT ON auth.user_tenant_acl TO app_payment_flow, app_reconciliation;
GRANT SELECT ON audit.v_recent_events TO app_auth, app_payment_flow, app_reconciliation;
GRANT SELECT ON audit.v_entity_changes_today TO app_auth, app_payment_flow, app_reconciliation;
GRANT SELECT ON audit.v_activity_summary TO app_auth, app_payment_flow, app_reconciliation;
GRANT SELECT ON audit.entity_audit_event TO app_auth, app_payment_flow, app_reconciliation;
GRANT SELECT ON audit.audit_event TO app_auth, app_payment_flow, app_reconciliation;

-- Cross-schema INSERT for audit logs
GRANT INSERT ON audit.entity_audit_event TO app_auth, app_payment_flow, app_reconciliation;
GRANT INSERT ON audit.audit_event TO app_auth, app_payment_flow, app_reconciliation;

-- Grant EXECUTE on RLS and utility functions (adjust as needed)
GRANT EXECUTE ON FUNCTION auth.can_read_row(character varying, character varying) TO app_auth;
GRANT EXECUTE ON FUNCTION auth.can_write_row(character varying, character varying) TO app_auth;
GRANT EXECUTE ON FUNCTION auth.get_user_context() TO app_auth;
GRANT EXECUTE ON FUNCTION auth.set_user_context(text) TO app_auth;
GRANT EXECUTE ON FUNCTION auth.user_accessible_tenants() TO app_auth;
GRANT EXECUTE ON FUNCTION auth.apply_std_rls_policy(text, text, boolean, boolean, text, text) TO app_auth;
