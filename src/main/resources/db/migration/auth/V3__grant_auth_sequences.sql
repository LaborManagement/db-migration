-- Ensure app_auth can use identity/sequence-backed inserts in auth schema
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA auth TO app_auth;
GRANT USAGE, SELECT ON SEQUENCE auth.role_policies_id_seq TO app_auth;
