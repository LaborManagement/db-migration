-- Create the database
CREATE DATABASE lbe;

-- Create the admin user
CREATE USER admin WITH ENCRYPTED PASSWORD '<pwd>';

-- Grant all privileges on the database to admin
GRANT ALL PRIVILEGES ON DATABASE lbe TO admin;

-- Drop lbe_user if exists (safe drop)
DO $$
BEGIN
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'lbe_user') THEN
      DROP ROLE lbe_user;
   END IF;
END$$;
