-- Allow clearing app role to call auth RLS helpers

GRANT USAGE ON SCHEMA auth TO app_clearing;
GRANT EXECUTE ON FUNCTION auth.set_user_context(text) TO app_clearing;
GRANT EXECUTE ON FUNCTION auth.set_user_context(bigint) TO app_clearing;
