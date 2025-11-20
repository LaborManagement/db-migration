-- Added user_type column to users table to categorize different types of users
ALTER TABLE auth.users
ADD COLUMN user_type text
    CHECK (user_type = ANY (ARRAY['EMPLOYEE', 'EMPLOYER', 'BOARD', 'ADMIN']));


-- Add the column as nullable, populate values, then make it NOT NULL before adding the new unique constraint
ALTER TABLE auth.user_tenant_acl
    ADD COLUMN toli_id character varying(64);

-- Populate existing rows with a default value (choose an appropriate value or generate unique ids)
UPDATE auth.user_tenant_acl
SET toli_id = '1'
WHERE toli_id IS NULL;

-- Make the column NOT NULL now that rows are populated
ALTER TABLE auth.user_tenant_acl
    ALTER COLUMN toli_id SET NOT NULL;

-- Replace the old unique constraint with the new one including toli_id
ALTER TABLE auth.user_tenant_acl
    DROP CONSTRAINT user_tenant_acl_user_id_board_id_employer_id_key,
    ADD CONSTRAINT user_tenant_acl_user_id_board_id_employer_id_toli_id_key UNIQUE (user_id, board_id, employer_id, toli_id);

ALTER TABLE auth.user_tenant_acl ALTER COLUMN toli_id TYPE BIGINT USING toli_id::bigint;