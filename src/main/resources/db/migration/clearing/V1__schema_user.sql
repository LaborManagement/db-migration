-- Create the user

CREATE USER app_clearing WITH PASSWORD 'root';

-- Create the schema

CREATE SCHEMA clearing
AUTHORIZATION app_clearing;

-- (Optional) Grant privileges if app_clearing did not own the schema
GRANT USAGE ON SCHEMA clearing TO app_clearing;
GRANT EXECUTE ON FUNCTION auth.set_user_context(text) TO app_clearing;