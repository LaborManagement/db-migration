-- Grant RLS context setter to clearing app role

GRANT EXECUTE ON FUNCTION auth.set_user_context(text) TO app_clearing;
