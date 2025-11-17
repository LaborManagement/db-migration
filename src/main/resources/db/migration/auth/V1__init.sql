-- Flyway migration: Initial schema for auth
-- Extracted from schema.sql (excluding backup and *_DDMMYY/_YYMMDD objects and audit_* tables outside the audit schema).

CREATE SCHEMA IF NOT EXISTS auth;

CREATE FUNCTION auth.can_read_row(p_board_id uuid, p_employer_id uuid DEFAULT NULL::uuid) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    v_user_id UUID;
    v_has_access boolean;
BEGIN
    v_user_id := auth.get_user_context();
    
    -- If no user context is set, deny access
    IF v_user_id IS NULL THEN
        RETURN false;
    END IF;
    
    -- Check if user has a matching ACL entry with can_read = true
    SELECT EXISTS(
        SELECT 1 FROM auth.user_tenant_acl acl
        WHERE acl.user_id = v_user_id
          AND acl.board_id = p_board_id
          AND (acl.employer_id IS NULL OR acl.employer_id = p_employer_id)
          AND acl.can_read = true
    ) INTO v_has_access;
    
    RETURN COALESCE(v_has_access, false);
END;
$$;

COMMENT ON FUNCTION auth.can_read_row(p_board_id uuid, p_employer_id uuid) IS 'Check if current user can read a row. Called by SELECT RLS policies. Returns false if no user context or no ACL match.';

CREATE FUNCTION auth.can_read_row(p_board_id character varying, p_employer_id character varying DEFAULT NULL::character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    v_user_id TEXT;
    v_user_id_bigint BIGINT;
    v_has_access boolean;
BEGIN
    v_user_id := auth.get_user_context();
    
    IF v_user_id IS NULL THEN
        RETURN false;
    END IF;
    
    BEGIN
        v_user_id_bigint := v_user_id::BIGINT;
    EXCEPTION WHEN OTHERS THEN
        RETURN false;
    END;
    
    SELECT EXISTS(
        SELECT 1 FROM auth.user_tenant_acl acl
        WHERE acl.user_id = v_user_id_bigint
          AND acl.board_id = p_board_id
          AND (acl.employer_id IS NULL OR acl.employer_id = p_employer_id)
          AND acl.can_read = true
    ) INTO v_has_access;
    
    RETURN COALESCE(v_has_access, false);
END;
$$;

COMMENT ON FUNCTION auth.can_read_row(p_board_id character varying, p_employer_id character varying) IS 'VARCHAR overload for can_read_row. Casts VARCHAR tenant keys to UUID and checks read permission.';

CREATE FUNCTION auth.can_write_row(p_board_id uuid, p_employer_id uuid DEFAULT NULL::uuid) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    v_user_id UUID;
    v_has_access boolean;
BEGIN
    v_user_id := auth.get_user_context();
    
    -- If no user context is set, deny access
    IF v_user_id IS NULL THEN
        RETURN false;
    END IF;
    
    -- Check if user has a matching ACL entry with can_write = true
    SELECT EXISTS(
        SELECT 1 FROM auth.user_tenant_acl acl
        WHERE acl.user_id = v_user_id
          AND acl.board_id = p_board_id
          AND (acl.employer_id IS NULL OR acl.employer_id = p_employer_id)
          AND acl.can_write = true
    ) INTO v_has_access;
    
    RETURN COALESCE(v_has_access, false);
END;
$$;

COMMENT ON FUNCTION auth.can_write_row(p_board_id uuid, p_employer_id uuid) IS 'Check if current user can write to a row. Called by INSERT/UPDATE/DELETE RLS policies. Returns false if no user context or no ACL match.';

CREATE FUNCTION auth.can_write_row(p_board_id character varying, p_employer_id character varying DEFAULT NULL::character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    v_user_id TEXT;
    v_user_id_bigint BIGINT;
    v_has_access boolean;
BEGIN
    v_user_id := auth.get_user_context();
    
    IF v_user_id IS NULL THEN
        RETURN false;
    END IF;
    
    BEGIN
        v_user_id_bigint := v_user_id::BIGINT;
    EXCEPTION WHEN OTHERS THEN
        RETURN false;
    END;
    
    SELECT EXISTS(
        SELECT 1 FROM auth.user_tenant_acl acl
        WHERE acl.user_id = v_user_id_bigint
          AND acl.board_id = p_board_id
          AND (acl.employer_id IS NULL OR acl.employer_id = p_employer_id)
          AND acl.can_write = true
    ) INTO v_has_access;
    
    RETURN COALESCE(v_has_access, false);
END;
$$;

COMMENT ON FUNCTION auth.can_write_row(p_board_id character varying, p_employer_id character varying) IS 'VARCHAR overload for can_write_row. Casts VARCHAR tenant keys to UUID and checks write permission.';

CREATE FUNCTION auth.get_user_context() RETURNS text
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
BEGIN
    RETURN current_setting('app.current_user_id', true);
EXCEPTION WHEN OTHERS THEN
    RETURN NULL;
END;
$$;

COMMENT ON FUNCTION auth.get_user_context() IS 'Retrieve the current user ID from transaction-local context. Returns NULL if not set. Returns TEXT.';

CREATE FUNCTION auth.safe_endpoint_policy_link(p_endpoint_method text, p_endpoint_path text, p_policy_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_endpoint_id BIGINT;
  v_policy_id BIGINT;
BEGIN
  -- Get endpoint ID with validation
  SELECT id INTO v_endpoint_id FROM endpoints 
  WHERE path = p_endpoint_path AND method = p_endpoint_method AND is_active = true;
  
  IF v_endpoint_id IS NULL THEN
    RAISE EXCEPTION 'Endpoint "% %" not found or inactive', p_endpoint_method, p_endpoint_path;
  END IF;
  
  -- Get policy ID with validation
  SELECT id INTO v_policy_id FROM policies 
  WHERE name = p_policy_name AND is_active = true;
  
  IF v_policy_id IS NULL THEN
    RAISE EXCEPTION 'Policy "%" not found or inactive', p_policy_name;
  END IF;
  
  -- Insert link
  INSERT INTO endpoint_policies (endpoint_id, policy_id)
  VALUES (v_endpoint_id, v_policy_id)
  ON CONFLICT (endpoint_id, policy_id) DO NOTHING;
  
EXCEPTION WHEN OTHERS THEN
  RAISE EXCEPTION 'Error linking endpoint "% %" to policy "%": %', 
    p_endpoint_method, p_endpoint_path, p_policy_name, SQLERRM;
END;
$$;

CREATE FUNCTION auth.safe_policy_capability_link(p_policy_name text, p_capability_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_policy_id BIGINT;
  v_capability_id BIGINT;
BEGIN
  SELECT id INTO v_policy_id FROM policies 
  WHERE name = p_policy_name AND is_active = true;
  
  IF v_policy_id IS NULL THEN
    RAISE EXCEPTION 'Policy "%" not found or inactive', p_policy_name;
  END IF;
  
  SELECT id INTO v_capability_id FROM capabilities 
  WHERE name = p_capability_name AND is_active = true;
  
  IF v_capability_id IS NULL THEN
    RAISE NOTICE 'Capability "%" not found - skipping', p_capability_name;
    RETURN;
  END IF;
  
  INSERT INTO policy_capabilities (policy_id, capability_id)
  VALUES (v_policy_id, v_capability_id)
  ON CONFLICT (policy_id, capability_id) DO NOTHING;
END;
$$;

CREATE FUNCTION auth.set_user_context(p_user_id text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Store user_id as text in config (works for any type)
    PERFORM set_config('app.current_user_id', p_user_id, false);
END;
$$;

COMMENT ON FUNCTION auth.set_user_context(p_user_id text) IS 'Set the current user ID in transaction-local context. Accepts TEXT/BIGINT user IDs.';

CREATE FUNCTION auth.user_accessible_tenants() RETURNS TABLE(board_id character varying, employer_id character varying, can_read boolean, can_write boolean)
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    v_user_id TEXT;
    v_user_id_bigint BIGINT;
BEGIN
    v_user_id := auth.get_user_context();
    
    IF v_user_id IS NULL THEN
        RETURN;
    END IF;
    
    BEGIN
        v_user_id_bigint := v_user_id::BIGINT;
    EXCEPTION WHEN OTHERS THEN
        RETURN;
    END;
    
    RETURN QUERY
    SELECT 
        acl.board_id,
        acl.employer_id,
        acl.can_read,
        acl.can_write
    FROM auth.user_tenant_acl acl
    WHERE acl.user_id = v_user_id_bigint
    ORDER BY board_id, employer_id;
END;
$$;

CREATE FUNCTION auth.validate_rls_policies(p_schema_name text) RETURNS TABLE(table_name text, policy_count integer, has_read_policy boolean, has_write_policy boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        t.table_name,
        COUNT(p.policyname)::integer as policy_count,
        BOOL_OR(p.policyname LIKE '%_std_read') as has_read_policy,
        BOOL_OR(p.policyname LIKE '%_std_write') as has_write_policy
    FROM information_schema.tables t
    LEFT JOIN pg_policies p ON t.table_name = p.tablename AND t.table_schema = p.schemaname
    WHERE t.table_schema = p_schema_name
      AND t.table_type = 'BASE TABLE'
    GROUP BY t.table_name
    ORDER BY t.table_name;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE auth.authorization_audit (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    endpoint_key character varying(100),
    http_method character varying(10),
    request_path character varying(255),
    required_capability character varying(100),
    decision character varying(20) NOT NULL,
    reason character varying(500),
    ip_address character varying(45),
    user_agent character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE auth.authorization_audit ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.authorization_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.endpoint_policies (
    id bigint NOT NULL,
    endpoint_id bigint NOT NULL,
    policy_id bigint NOT NULL
);

ALTER TABLE auth.endpoint_policies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoint_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.endpoints (
    id bigint NOT NULL,
    service character varying(64) NOT NULL,
    version character varying(64) NOT NULL,
    method character varying(8) NOT NULL,
    path character varying(256) NOT NULL,
    description text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    ui_type character varying(32)
);

ALTER TABLE auth.endpoints ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.entity_audit_event (
    id bigint NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    audit_number character varying(64) NOT NULL,
    record_number character varying(128) NOT NULL,
    entity_type character varying(128) NOT NULL,
    entity_id character varying(128),
    operation character varying(64) NOT NULL,
    performed_by character varying(128),
    trace_id character varying(64),
    metadata jsonb,
    old_values jsonb,
    new_values jsonb,
    change_summary text,
    client_ip character varying(45),
    user_agent character varying(512),
    prev_hash character(64) NOT NULL,
    hash character(64) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE auth.entity_audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.entity_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.notification_templates (
    id bigint NOT NULL,
    template_key character varying(100) NOT NULL,
    template_name character varying(200) NOT NULL,
    template_type text NOT NULL,
    subject_template text,
    body_template text NOT NULL,
    is_active boolean DEFAULT true,
    created_by character varying(64) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_by character varying(64),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT notification_templates_template_type_enum_check CHECK ((template_type = ANY (ARRAY['EMAIL'::text, 'SMS'::text, 'SYSTEM'::text])))
);

ALTER TABLE auth.notification_templates ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.notification_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.page_actions (
    id bigint NOT NULL,
    label character varying(128) NOT NULL,
    action character varying(64) NOT NULL,
    page_id bigint NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    endpoint_id bigint,
    icon character varying(64),
    variant character varying(32) DEFAULT 'default'::character varying
);

ALTER TABLE auth.page_actions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.page_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.policies (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(20) NOT NULL,
    expression_deprecated jsonb,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    policy_type character varying(50) DEFAULT 'PERMISSION'::character varying,
    conditions jsonb
);

COMMENT ON COLUMN auth.policies.expression_deprecated IS 'DEPRECATED: Old JSON expression field. Migrated to role_policies table. Will be removed in v3.0.';

COMMENT ON COLUMN auth.policies.policy_type IS 'Fine-grained policy categorization: PERMISSION, CONDITIONAL, ROW_LEVEL, TIME_BASED';

COMMENT ON COLUMN auth.policies.conditions IS 'Optional ABAC conditions: tenant_id, time_range, ip_whitelist, etc.';

ALTER TABLE auth.policies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.revoked_tokens (
    id bigint NOT NULL,
    token_id character varying(100) NOT NULL,
    user_id bigint,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE auth.revoked_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.revoked_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.role_policies (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    policy_id bigint NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by bigint,
    is_active boolean DEFAULT true NOT NULL,
    conditions jsonb,
    priority integer
);

COMMENT ON TABLE auth.role_policies IS 'Junction table for Role-Policy many-to-many relationship. Replaces JSON expression-based policy assignment.';

COMMENT ON COLUMN auth.role_policies.conditions IS 'Optional JSONB conditions for ABAC scenarios (tenant_id, time_range, etc.)';

COMMENT ON COLUMN auth.role_policies.priority IS 'Policy precedence when conflicts arise (higher = higher priority)';

CREATE SEQUENCE auth.role_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE auth.role_policies_id_seq OWNED BY auth.role_policies.id;

CREATE TABLE auth.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);

ALTER TABLE auth.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.system_config (
    id bigint NOT NULL,
    config_key character varying(100) NOT NULL,
    config_value text NOT NULL,
    config_type text DEFAULT 'STRING'::text,
    description text,
    is_encrypted boolean DEFAULT false,
    is_active boolean DEFAULT true,
    created_by character varying(64) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_by character varying(64),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT system_config_config_type_enum_check CHECK ((config_type = ANY (ARRAY['STRING'::text, 'INTEGER'::text, 'DECIMAL'::text, 'BOOLEAN'::text, 'JSON'::text])))
);

ALTER TABLE auth.system_config ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.system_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.ui_pages (
    id bigint NOT NULL,
    page_id character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    route character varying(255) NOT NULL,
    icon character varying(100),
    module character varying(50) NOT NULL,
    parent_id bigint,
    display_order integer DEFAULT 0 NOT NULL,
    is_menu_item boolean DEFAULT true NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);

ALTER TABLE auth.ui_pages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.ui_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.user_roles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE auth.user_roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.user_sessions (
    id bigint NOT NULL,
    session_id character varying(128) NOT NULL,
    user_id character varying(64) NOT NULL,
    user_type text NOT NULL,
    ip_address character varying(45),
    user_agent text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_accessed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true,
    CONSTRAINT user_sessions_user_type_enum_check CHECK ((user_type = ANY (ARRAY['WORKER'::text, 'EMPLOYER'::text, 'BOARD'::text, 'ADMIN'::text])))
);

ALTER TABLE auth.user_sessions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.user_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE auth.user_tenant_acl (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    board_id character varying(64) NOT NULL,
    employer_id character varying(64),
    can_read boolean DEFAULT true NOT NULL,
    can_write boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT check_read_or_write CHECK (((can_read = true) OR (can_write = true)))
);

CREATE SEQUENCE auth.user_tenant_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE auth.user_tenant_acl_id_seq OWNED BY auth.user_tenant_acl.id;

CREATE TABLE auth.user_tenant_acl_audit (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    board_id character varying(64) NOT NULL,
    employer_id character varying(64),
    can_read boolean NOT NULL,
    can_write boolean NOT NULL,
    action character varying(10) NOT NULL,
    changed_at timestamp with time zone DEFAULT now() NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER
);

CREATE SEQUENCE auth.user_tenant_acl_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE auth.user_tenant_acl_audit_id_seq OWNED BY auth.user_tenant_acl_audit.id;

CREATE TABLE auth.users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    role character varying(50) DEFAULT 'WORKER'::character varying NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    is_account_non_expired boolean DEFAULT true NOT NULL,
    is_account_non_locked boolean DEFAULT true NOT NULL,
    is_credentials_non_expired boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    last_login timestamp without time zone,
    permission_version integer DEFAULT 1 NOT NULL
);

ALTER TABLE auth.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY auth.role_policies ALTER COLUMN id SET DEFAULT nextval('auth.role_policies_id_seq'::regclass);

ALTER TABLE ONLY auth.user_tenant_acl ALTER COLUMN id SET DEFAULT nextval('auth.user_tenant_acl_id_seq'::regclass);

ALTER TABLE ONLY auth.user_tenant_acl_audit ALTER COLUMN id SET DEFAULT nextval('auth.user_tenant_acl_audit_id_seq'::regclass);

ALTER TABLE ONLY auth.authorization_audit
    ADD CONSTRAINT authorization_audit_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT endpoint_policies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT endpoint_policies_uk_endpoint_policy UNIQUE (endpoint_id, policy_id);

ALTER TABLE ONLY auth.endpoints
    ADD CONSTRAINT endpoints_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.endpoints
    ADD CONSTRAINT endpoints_uk_service_version_method_path UNIQUE (service, version, method, path);

ALTER TABLE ONLY auth.entity_audit_event
    ADD CONSTRAINT entity_audit_event_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.entity_audit_event
    ADD CONSTRAINT entity_audit_event_uq_entity_audit_event_audit_number UNIQUE (audit_number);

ALTER TABLE ONLY auth.notification_templates
    ADD CONSTRAINT notification_templates_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.notification_templates
    ADD CONSTRAINT notification_templates_template_key UNIQUE (template_key);

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT page_actions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.policies
    ADD CONSTRAINT policies_name UNIQUE (name);

ALTER TABLE ONLY auth.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT revoked_tokens_idx_revoked_token_token_id UNIQUE (token_id);

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT revoked_tokens_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT role_policies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.roles
    ADD CONSTRAINT roles_name UNIQUE (name);

ALTER TABLE ONLY auth.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.system_config
    ADD CONSTRAINT system_config_config_key UNIQUE (config_key);

ALTER TABLE ONLY auth.system_config
    ADD CONSTRAINT system_config_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT ui_pages_page_id UNIQUE (page_id);

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT ui_pages_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT uk_role_policies_role_policy UNIQUE (role_id, policy_id);

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT user_roles_unique_user_role UNIQUE (user_id, role_id);

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_session_id UNIQUE (session_id);

ALTER TABLE ONLY auth.user_tenant_acl_audit
    ADD CONSTRAINT user_tenant_acl_audit_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT user_tenant_acl_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT user_tenant_acl_user_id_board_id_employer_id_key UNIQUE (user_id, board_id, employer_id);

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_email UNIQUE (email);

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_username UNIQUE (username);

CREATE INDEX idx_acl_audit_changed_at ON auth.user_tenant_acl_audit USING btree (changed_at);

CREATE INDEX idx_acl_audit_user ON auth.user_tenant_acl_audit USING btree (user_id);

CREATE INDEX idx_acl_tenant_keys ON auth.user_tenant_acl USING btree (board_id, employer_id);

CREATE INDEX idx_acl_updated_at ON auth.user_tenant_acl USING btree (updated_at);

CREATE INDEX idx_acl_user_id ON auth.user_tenant_acl USING btree (user_id);

CREATE INDEX idx_acl_user_tenant ON auth.user_tenant_acl USING btree (user_id, board_id, employer_id);

CREATE INDEX idx_role_policies_active ON auth.role_policies USING btree (is_active);

CREATE INDEX idx_role_policies_policy_active ON auth.role_policies USING btree (policy_id, is_active);

CREATE INDEX idx_role_policies_policy_id ON auth.role_policies USING btree (policy_id);

CREATE INDEX idx_role_policies_role_active ON auth.role_policies USING btree (role_id, is_active);

CREATE INDEX idx_role_policies_role_id ON auth.role_policies USING btree (role_id);

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT fk_acl_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT fk_endpoint_policies_endpoint FOREIGN KEY (endpoint_id) REFERENCES auth.endpoints(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT fk_endpoint_policies_policy FOREIGN KEY (policy_id) REFERENCES auth.policies(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT fk_page_actions_endpoint FOREIGN KEY (endpoint_id) REFERENCES auth.endpoints(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT fk_page_actions_page FOREIGN KEY (page_id) REFERENCES auth.ui_pages(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT fk_revoked_tokens_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_assigned_by FOREIGN KEY (assigned_by) REFERENCES auth.users(id) ON DELETE SET NULL;

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_policy FOREIGN KEY (policy_id) REFERENCES auth.policies(id) ON DELETE CASCADE;

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_role FOREIGN KEY (role_id) REFERENCES auth.roles(id) ON DELETE CASCADE;

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT fk_ui_pages_parent FOREIGN KEY (parent_id) REFERENCES auth.ui_pages(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES auth.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
