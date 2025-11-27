GRANT
SELECT ON audit.v_activity_summary TO app_auth;

GRANT
SELECT ON audit.v_activity_summary TO app_payment_flow;

GRANT
SELECT ON audit.v_activity_summary TO app_reconciliation;

GRANT
SELECT ON audit.v_entity_changes_today TO app_auth;

GRANT
SELECT ON audit.v_entity_changes_today TO app_payment_flow;

GRANT
SELECT ON audit.v_entity_changes_today TO app_reconciliation;

GRANT
INSERT ON audit.audit_event TO app_auth;

GRANT
SELECT ON audit.audit_event TO app_auth;

GRANT
INSERT ON audit.audit_event TO app_payment_flow;

GRANT
SELECT ON audit.audit_event TO app_payment_flow;

GRANT
INSERT ON audit.audit_event TO app_reconciliation;

GRANT
SELECT ON audit.audit_event TO app_reconciliation;

GRANT
INSERT ON audit.entity_audit_event TO app_auth;

GRANT
SELECT ON audit.entity_audit_event TO app_auth;

GRANT
INSERT ON audit.entity_audit_event TO app_payment_flow;

GRANT
SELECT ON audit.entity_audit_event TO app_payment_flow;

GRANT
INSERT ON audit.entity_audit_event TO app_reconciliation;

GRANT
SELECT ON audit.entity_audit_event TO app_reconciliation;

GRANT
SELECT ON audit.v_recent_events TO app_auth;

GRANT
SELECT ON audit.v_recent_events TO app_payment_flow;

GRANT
SELECT ON audit.v_recent_events TO app_reconciliation;

GRANT
INSERT ON auth.revoked_tokens TO app_auth;

GRANT
SELECT ON auth.revoked_tokens TO app_auth;

GRANT
UPDATE ON auth.revoked_tokens TO app_auth;

GRANT
DELETE ON auth.revoked_tokens TO app_auth;

GRANT
INSERT ON auth.endpoint_policies TO app_auth;

GRANT
SELECT ON auth.endpoint_policies TO app_auth;

GRANT
UPDATE ON auth.endpoint_policies TO app_auth;

GRANT
DELETE ON auth.endpoint_policies TO app_auth;

GRANT
INSERT ON auth.entity_audit_event TO app_auth;

GRANT
SELECT ON auth.entity_audit_event TO app_auth;

GRANT
UPDATE ON auth.entity_audit_event TO app_auth;

GRANT
DELETE ON auth.entity_audit_event TO app_auth;

GRANT
INSERT ON auth.notification_templates TO app_auth;

GRANT
SELECT ON auth.notification_templates TO app_auth;

GRANT
UPDATE ON auth.notification_templates TO app_auth;

GRANT
DELETE ON auth.notification_templates TO app_auth;

GRANT
INSERT ON auth.page_actions TO app_auth;

GRANT
SELECT ON auth.page_actions TO app_auth;

GRANT
UPDATE ON auth.page_actions TO app_auth;

GRANT
DELETE ON auth.page_actions TO app_auth;

GRANT
INSERT ON auth.ui_pages TO app_auth;

GRANT
SELECT ON auth.ui_pages TO app_auth;

GRANT
UPDATE ON auth.ui_pages TO app_auth;

GRANT
DELETE ON auth.ui_pages TO app_auth;

GRANT
INSERT ON auth.role_policies TO app_auth;

GRANT
SELECT ON auth.role_policies TO app_auth;

GRANT
UPDATE ON auth.role_policies TO app_auth;

GRANT
DELETE ON auth.role_policies TO app_auth;

GRANT
INSERT ON auth.roles TO app_auth;

GRANT
SELECT ON auth.roles TO app_auth;

GRANT
UPDATE ON auth.roles TO app_auth;

GRANT
DELETE ON auth.roles TO app_auth;

GRANT
INSERT ON auth.user_tenant_acl_audit TO app_auth;

GRANT
SELECT ON auth.user_tenant_acl_audit TO app_auth;

GRANT
UPDATE ON auth.user_tenant_acl_audit TO app_auth;

GRANT
DELETE ON auth.user_tenant_acl_audit TO app_auth;

GRANT
INSERT ON auth.user_sessions TO app_auth;

GRANT
SELECT ON auth.user_sessions TO app_auth;

GRANT
UPDATE ON auth.user_sessions TO app_auth;

GRANT
DELETE ON auth.user_sessions TO app_auth;

GRANT
INSERT ON auth.users TO app_auth;

GRANT
SELECT ON auth.users TO app_auth;

GRANT
UPDATE ON auth.users TO app_auth;

GRANT
DELETE ON auth.users TO app_auth;

GRANT
INSERT ON auth.endpoints TO app_auth;

GRANT
SELECT ON auth.endpoints TO app_auth;

GRANT
UPDATE ON auth.endpoints TO app_auth;

GRANT
DELETE ON auth.endpoints TO app_auth;

GRANT
INSERT ON auth.flyway_schema_history_auth TO app_auth;

GRANT
SELECT ON auth.flyway_schema_history_auth TO app_auth;

GRANT
UPDATE ON auth.flyway_schema_history_auth TO app_auth;

GRANT
DELETE ON auth.flyway_schema_history_auth TO app_auth;

GRANT
INSERT ON auth.policies TO app_auth;

GRANT
SELECT ON auth.policies TO app_auth;

GRANT
UPDATE ON auth.policies TO app_auth;

GRANT
DELETE ON auth.policies TO app_auth;

GRANT
INSERT ON auth.system_config TO app_auth;

GRANT
SELECT ON auth.system_config TO app_auth;

GRANT
UPDATE ON auth.system_config TO app_auth;

GRANT
DELETE ON auth.system_config TO app_auth;

GRANT
INSERT ON auth.user_roles TO app_auth;

GRANT
SELECT ON auth.user_roles TO app_auth;

GRANT
UPDATE ON auth.user_roles TO app_auth;

GRANT
DELETE ON auth.user_roles TO app_auth;

GRANT
INSERT ON auth.user_tenant_acl TO app_auth;

GRANT
SELECT ON auth.user_tenant_acl TO app_auth;

GRANT
UPDATE ON auth.user_tenant_acl TO app_auth;

GRANT
DELETE ON auth.user_tenant_acl TO app_auth;

GRANT
TRUNCATE ON auth.user_tenant_acl TO app_auth;

GRANT REFERENCES ON auth.user_tenant_acl TO app_auth;

GRANT TRIGGER ON auth.user_tenant_acl TO app_auth;

GRANT
SELECT ON auth.user_tenant_acl TO app_payment_flow;

GRANT
SELECT ON auth.user_tenant_acl TO app_reconciliation;

GRANT
INSERT ON reconciliation.flyway_schema_history_reconciliation TO app_reconciliation;

GRANT
SELECT ON reconciliation.flyway_schema_history_reconciliation TO app_reconciliation;

GRANT
UPDATE ON reconciliation.flyway_schema_history_reconciliation TO app_reconciliation;

GRANT
DELETE ON reconciliation.flyway_schema_history_reconciliation TO app_reconciliation;

GRANT
INSERT ON reconciliation.raw_statement_line TO app_reconciliation;

GRANT
SELECT ON reconciliation.raw_statement_line TO app_reconciliation;

GRANT
UPDATE ON reconciliation.raw_statement_line TO app_reconciliation;

GRANT
DELETE ON reconciliation.raw_statement_line TO app_reconciliation;

GRANT
INSERT ON reconciliation.bank_account TO app_reconciliation;

GRANT
SELECT ON reconciliation.bank_account TO app_reconciliation;

GRANT
UPDATE ON reconciliation.bank_account TO app_reconciliation;

GRANT
DELETE ON reconciliation.bank_account TO app_reconciliation;

GRANT
INSERT ON reconciliation.import_error TO app_reconciliation;

GRANT
SELECT ON reconciliation.import_error TO app_reconciliation;

GRANT
UPDATE ON reconciliation.import_error TO app_reconciliation;

GRANT
DELETE ON reconciliation.import_error TO app_reconciliation;

GRANT
INSERT ON reconciliation.statement_balance TO app_reconciliation;

GRANT
SELECT ON reconciliation.statement_balance TO app_reconciliation;

GRANT
UPDATE ON reconciliation.statement_balance TO app_reconciliation;

GRANT
DELETE ON reconciliation.statement_balance TO app_reconciliation;

GRANT
INSERT ON reconciliation.transaction_86_segment TO app_reconciliation;

GRANT
SELECT ON reconciliation.transaction_86_segment TO app_reconciliation;

GRANT
UPDATE ON reconciliation.transaction_86_segment TO app_reconciliation;

GRANT
DELETE ON reconciliation.transaction_86_segment TO app_reconciliation;

GRANT
INSERT ON reconciliation.statement_file TO app_reconciliation;

GRANT
SELECT ON reconciliation.statement_file TO app_reconciliation;

GRANT
UPDATE ON reconciliation.statement_file TO app_reconciliation;

GRANT
DELETE ON reconciliation.statement_file TO app_reconciliation;

GRANT
INSERT ON reconciliation.van_transaction TO app_reconciliation;

GRANT
SELECT ON reconciliation.van_transaction TO app_reconciliation;

GRANT
UPDATE ON reconciliation.van_transaction TO app_reconciliation;

GRANT
DELETE ON reconciliation.van_transaction TO app_reconciliation;

GRANT
INSERT ON reconciliation.uploaded_files TO app_reconciliation;

GRANT
SELECT ON reconciliation.uploaded_files TO app_reconciliation;

GRANT
UPDATE ON reconciliation.uploaded_files TO app_reconciliation;

GRANT
DELETE ON reconciliation.uploaded_files TO app_reconciliation;

GRANT
INSERT ON reconciliation.van_file TO app_reconciliation;

GRANT
SELECT ON reconciliation.van_file TO app_reconciliation;

GRANT
UPDATE ON reconciliation.van_file TO app_reconciliation;

GRANT
DELETE ON reconciliation.van_file TO app_reconciliation;

GRANT
INSERT ON reconciliation.file_processing_queue TO app_reconciliation;

GRANT
SELECT ON reconciliation.file_processing_queue TO app_reconciliation;

GRANT
UPDATE ON reconciliation.file_processing_queue TO app_reconciliation;

GRANT
DELETE ON reconciliation.file_processing_queue TO app_reconciliation;

GRANT
INSERT ON reconciliation.import_run TO app_reconciliation;

GRANT
SELECT ON reconciliation.import_run TO app_reconciliation;

GRANT
UPDATE ON reconciliation.import_run TO app_reconciliation;

GRANT
DELETE ON reconciliation.import_run TO app_reconciliation;

GRANT
INSERT ON reconciliation.statement_transaction TO app_reconciliation;

GRANT
SELECT ON reconciliation.statement_transaction TO app_reconciliation;

GRANT
UPDATE ON reconciliation.statement_transaction TO app_reconciliation;

GRANT
DELETE ON reconciliation.statement_transaction TO app_reconciliation;

GRANT
INSERT ON payment_flow.employer_toli_relation TO app_payment_flow;

GRANT
SELECT ON payment_flow.employer_toli_relation TO app_payment_flow;

GRANT
UPDATE ON payment_flow.employer_toli_relation TO app_payment_flow;

GRANT
DELETE ON payment_flow.employer_toli_relation TO app_payment_flow;

GRANT
INSERT ON payment_flow.flyway_schema_history_payment_flow TO app_payment_flow;

GRANT
SELECT ON payment_flow.flyway_schema_history_payment_flow TO app_payment_flow;

GRANT
UPDATE ON payment_flow.flyway_schema_history_payment_flow TO app_payment_flow;

GRANT
DELETE ON payment_flow.flyway_schema_history_payment_flow TO app_payment_flow;

GRANT
INSERT ON payment_flow.board_receipts TO app_payment_flow;

GRANT
SELECT ON payment_flow.board_receipts TO app_payment_flow;

GRANT
UPDATE ON payment_flow.board_receipts TO app_payment_flow;

GRANT
DELETE ON payment_flow.board_receipts TO app_payment_flow;

GRANT
INSERT ON payment_flow.uploaded_files TO app_payment_flow;

GRANT
SELECT ON payment_flow.uploaded_files TO app_payment_flow;

GRANT
UPDATE ON payment_flow.uploaded_files TO app_payment_flow;

GRANT
DELETE ON payment_flow.uploaded_files TO app_payment_flow;

GRANT
INSERT ON payment_flow.employer_master TO app_payment_flow;

GRANT
SELECT ON payment_flow.employer_master TO app_payment_flow;

GRANT
UPDATE ON payment_flow.employer_master TO app_payment_flow;

GRANT
DELETE ON payment_flow.employer_master TO app_payment_flow;

GRANT
INSERT ON payment_flow.attendance_data TO app_payment_flow;

GRANT
SELECT ON payment_flow.attendance_data TO app_payment_flow;

GRANT
UPDATE ON payment_flow.attendance_data TO app_payment_flow;

GRANT
DELETE ON payment_flow.attendance_data TO app_payment_flow;

GRANT
INSERT ON payment_flow.worker_payments TO app_payment_flow;

GRANT
SELECT ON payment_flow.worker_payments TO app_payment_flow;

GRANT
UPDATE ON payment_flow.worker_payments TO app_payment_flow;

GRANT
INSERT ON payment_flow.worker_master TO app_payment_flow;

GRANT
SELECT ON payment_flow.worker_master TO app_payment_flow;

GRANT
UPDATE ON payment_flow.worker_master TO app_payment_flow;

GRANT
DELETE ON payment_flow.worker_master TO app_payment_flow;

GRANT
INSERT ON payment_flow.worker_toli_relation TO app_payment_flow;

GRANT
SELECT ON payment_flow.worker_toli_relation TO app_payment_flow;

GRANT
UPDATE ON payment_flow.worker_toli_relation TO app_payment_flow;

GRANT
DELETE ON payment_flow.worker_toli_relation TO app_payment_flow;

GRANT
INSERT ON payment_flow.worker_payment_receipts TO app_payment_flow;

GRANT
SELECT ON payment_flow.worker_payment_receipts TO app_payment_flow;

GRANT
UPDATE ON payment_flow.worker_payment_receipts TO app_payment_flow;

GRANT
DELETE ON payment_flow.worker_payment_receipts TO app_payment_flow;

GRANT
INSERT ON payment_flow.board_master TO app_payment_flow;

GRANT
SELECT ON payment_flow.board_master TO app_payment_flow;

GRANT
UPDATE ON payment_flow.board_master TO app_payment_flow;

GRANT
DELETE ON payment_flow.board_master TO app_payment_flow;

GRANT
INSERT ON payment_flow.toli_master TO app_payment_flow;

GRANT
SELECT ON payment_flow.toli_master TO app_payment_flow;

GRANT
UPDATE ON payment_flow.toli_master TO app_payment_flow;

GRANT
DELETE ON payment_flow.toli_master TO app_payment_flow;

GRANT
INSERT ON payment_flow.worker_uploaded_data TO app_payment_flow;

GRANT
SELECT ON payment_flow.worker_uploaded_data TO app_payment_flow;

GRANT
UPDATE ON payment_flow.worker_uploaded_data TO app_payment_flow;

GRANT
DELETE ON payment_flow.worker_uploaded_data TO app_payment_flow;

GRANT
INSERT ON payment_flow.employer_payment_receipts TO app_payment_flow;

GRANT
SELECT ON payment_flow.employer_payment_receipts TO app_payment_flow;

GRANT
UPDATE ON payment_flow.employer_payment_receipts TO app_payment_flow;

GRANT
DELETE ON payment_flow.employer_payment_receipts TO app_payment_flow;

GRANT USAGE ON SCHEMA pg_catalog TO app_auth;

GRANT USAGE ON SCHEMA pg_catalog TO app_payment_flow;

GRANT USAGE ON SCHEMA pg_catalog TO app_reconciliation;

GRANT USAGE ON SCHEMA pg_catalog TO data_ops;

GRANT USAGE ON SCHEMA public TO app_auth;

GRANT USAGE ON SCHEMA public TO app_payment_flow;

GRANT USAGE ON SCHEMA public TO app_reconciliation;

GRANT USAGE ON SCHEMA public TO data_ops;

GRANT USAGE ON SCHEMA information_schema TO app_auth;

GRANT USAGE ON SCHEMA information_schema TO app_payment_flow;

GRANT USAGE ON SCHEMA information_schema TO app_reconciliation;

GRANT USAGE ON SCHEMA information_schema TO data_ops;

GRANT USAGE ON SCHEMA audit TO app_auth;

GRANT USAGE ON SCHEMA audit TO app_payment_flow;

GRANT USAGE ON SCHEMA audit TO app_reconciliation;

GRANT USAGE ON SCHEMA auth TO app_auth;

GRANT USAGE ON SCHEMA auth TO app_payment_flow;

GRANT USAGE ON SCHEMA auth TO app_reconciliation;

GRANT USAGE ON SCHEMA reconciliation TO app_reconciliation;

GRANT USAGE ON SCHEMA payment_flow TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.can_read_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_auth;

GRANT EXECUTE ON FUNCTION auth.can_read_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.can_read_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.can_write_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_auth;

GRANT EXECUTE ON FUNCTION auth.can_write_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.can_write_row(p_board_id bigint, p_employer_id bigint, p_toli_id bigint) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.get_user_context() TO app_auth;

GRANT EXECUTE ON FUNCTION auth.get_user_context() TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.get_user_context() TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.apply_std_rls_policy(p_schema text, p_table text, p_read boolean, p_write boolean, p_board_col text, p_employer_col text, p_toli_col text) TO app_auth;

GRANT EXECUTE ON FUNCTION auth.safe_endpoint_policy_link(p_endpoint_method text, p_endpoint_path text, p_policy_name text) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.safe_endpoint_policy_link(p_endpoint_method text, p_endpoint_path text, p_policy_name text) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.safe_policy_capability_link(p_policy_name text, p_capability_name text) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.safe_policy_capability_link(p_policy_name text, p_capability_name text) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id bigint) TO app_auth;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id text) TO app_auth;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id bigint) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id text) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id bigint) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.set_user_context(p_user_id text) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION auth.validate_rls_policies(p_schema_name text) TO app_payment_flow;

GRANT EXECUTE ON FUNCTION auth.validate_rls_policies(p_schema_name text) TO app_reconciliation;

GRANT EXECUTE ON FUNCTION payment_flow.get_status_code(p_id integer) TO app_payment_flow;

grant execute on procedure payment_flow.validate_uploaded_data(OUT validation_result json, IN file_id_input bigint, IN id_input bigint) to app_payment_flow;

GRANT EXECUTE ON PROCEDURE payment_flow.create_payments(bigint, OUT text) TO app_payment_flow;