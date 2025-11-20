
-- Create the database
DROP DATABASE IF EXISTS lbe;
CREATE DATABASE lbe;

-- Create the admin user
DROP USER IF EXISTS admin_lbe;
CREATE USER admin_lbe WITH ENCRYPTED PASSWORD 'root';

-- Grant all privileges on the database to admin
GRANT ALL PRIVILEGES ON DATABASE lbe TO admin_lbe;

-- Drop lbe_user if exists (safe drop)
DO $$
BEGIN
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'lbe_user') THEN
      DROP ROLE lbe_user;
   END IF;
END$$;

-- Ensure app roles exist (PostgreSQL 16+)
DO
$$
BEGIN
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'app_auth') THEN
		CREATE ROLE app_auth LOGIN PASSWORD 'root';
	END IF;
END
$$;

DO
$$
BEGIN
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'app_payment_flow') THEN
		CREATE ROLE app_payment_flow LOGIN PASSWORD 'root';
	END IF;
END
$$;

DO
$$
BEGIN
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'app_reconciliation') THEN
		CREATE ROLE app_reconciliation LOGIN PASSWORD 'root';
	END IF;
END
$$;
