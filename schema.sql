--
-- PostgreSQL database dump
--

\restrict KhupiCfjLeP2xhdJ0I3VscKsJaEQ6HaoFKqi9vfSo5egFf5tVA6WVWc1WgjQPio

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: audit; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA audit;


--
-- Name: SCHEMA audit; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA audit IS 'Centralized audit logging for all services';


--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: payment_flow; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA payment_flow;


--
-- Name: reconciliation; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA reconciliation;


--
-- Name: can_read_row(uuid, uuid); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: FUNCTION can_read_row(p_board_id uuid, p_employer_id uuid); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.can_read_row(p_board_id uuid, p_employer_id uuid) IS 'Check if current user can read a row. Called by SELECT RLS policies. Returns false if no user context or no ACL match.';


--
-- Name: can_read_row(character varying, character varying); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: FUNCTION can_read_row(p_board_id character varying, p_employer_id character varying); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.can_read_row(p_board_id character varying, p_employer_id character varying) IS 'VARCHAR overload for can_read_row. Casts VARCHAR tenant keys to UUID and checks read permission.';


--
-- Name: can_write_row(uuid, uuid); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: FUNCTION can_write_row(p_board_id uuid, p_employer_id uuid); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.can_write_row(p_board_id uuid, p_employer_id uuid) IS 'Check if current user can write to a row. Called by INSERT/UPDATE/DELETE RLS policies. Returns false if no user context or no ACL match.';


--
-- Name: can_write_row(character varying, character varying); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: FUNCTION can_write_row(p_board_id character varying, p_employer_id character varying); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.can_write_row(p_board_id character varying, p_employer_id character varying) IS 'VARCHAR overload for can_write_row. Casts VARCHAR tenant keys to UUID and checks write permission.';


--
-- Name: get_user_context(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.get_user_context() RETURNS text
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
BEGIN
    RETURN current_setting('app.current_user_id', true);
EXCEPTION WHEN OTHERS THEN
    RETURN NULL;
END;
$$;


--
-- Name: FUNCTION get_user_context(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.get_user_context() IS 'Retrieve the current user ID from transaction-local context. Returns NULL if not set. Returns TEXT.';


--
-- Name: safe_endpoint_policy_link(text, text, text); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: safe_policy_capability_link(text, text); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: set_user_context(text); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.set_user_context(p_user_id text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Store user_id as text in config (works for any type)
    PERFORM set_config('app.current_user_id', p_user_id, false);
END;
$$;


--
-- Name: FUNCTION set_user_context(p_user_id text); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.set_user_context(p_user_id text) IS 'Set the current user ID in transaction-local context. Accepts TEXT/BIGINT user IDs.';


--
-- Name: user_accessible_tenants(); Type: FUNCTION; Schema: auth; Owner: -
--

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


--
-- Name: validate_rls_policies(text); Type: FUNCTION; Schema: auth; Owner: -
--

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

--
-- Name: audit_event; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.audit_event (
    id bigint NOT NULL,
    trace_id character varying(64) NOT NULL,
    action character varying(128) NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(128),
    service_name character varying(50) DEFAULT 'unknown'::character varying NOT NULL,
    source_schema character varying(50) NOT NULL,
    user_id character varying(128) NOT NULL,
    client_ip character varying(64),
    user_agent character varying(256),
    referer character varying(256),
    client_source character varying(64),
    requested_with character varying(64),
    outcome character varying(16) NOT NULL,
    details jsonb,
    prev_hash character varying(64) NOT NULL,
    hash character varying(64) NOT NULL,
    response_hash character varying(64),
    occurred_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: TABLE audit_event; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON TABLE audit.audit_event IS 'System-level audit events from all services';


--
-- Name: COLUMN audit_event.trace_id; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.audit_event.trace_id IS 'Distributed tracing ID for correlating events';


--
-- Name: COLUMN audit_event.service_name; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.audit_event.service_name IS 'Source service: auth-service, payment-service, worker-service';


--
-- Name: COLUMN audit_event.source_schema; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.audit_event.source_schema IS 'Database schema where event originated';


--
-- Name: audit_event_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

ALTER TABLE audit.audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME audit.audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: entity_audit_event; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.entity_audit_event (
    id bigint NOT NULL,
    audit_number character varying(64) NOT NULL,
    record_number character varying(128) NOT NULL,
    entity_type character varying(128) NOT NULL,
    entity_id character varying(128),
    operation character varying(64) NOT NULL,
    service_name character varying(50) DEFAULT 'unknown'::character varying NOT NULL,
    source_schema character varying(50) NOT NULL,
    source_table character varying(100),
    performed_by character varying(128),
    client_ip character varying(45),
    user_agent character varying(512),
    old_values jsonb,
    new_values jsonb,
    change_summary text,
    metadata jsonb,
    trace_id character varying(64),
    prev_hash character(64) NOT NULL,
    hash character(64) NOT NULL,
    occurred_at timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE entity_audit_event; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON TABLE audit.entity_audit_event IS 'Entity-level change tracking from all services';


--
-- Name: COLUMN entity_audit_event.service_name; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.entity_audit_event.service_name IS 'Source service: auth-service, payment-service, worker-service';


--
-- Name: COLUMN entity_audit_event.source_schema; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.entity_audit_event.source_schema IS 'Database schema where entity resides';


--
-- Name: COLUMN entity_audit_event.source_table; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON COLUMN audit.entity_audit_event.source_table IS 'Table name of the audited entity';


--
-- Name: entity_audit_event_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

ALTER TABLE audit.entity_audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME audit.entity_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: v_activity_summary; Type: VIEW; Schema: audit; Owner: -
--

CREATE VIEW audit.v_activity_summary AS
 SELECT date(occurred_at) AS date,
    service_name,
    source_schema,
    count(*) AS event_count,
    count(DISTINCT user_id) AS unique_users,
    count(DISTINCT trace_id) AS unique_traces
   FROM audit.audit_event
  WHERE (occurred_at > (now() - '30 days'::interval))
  GROUP BY (date(occurred_at)), service_name, source_schema
  ORDER BY (date(occurred_at)) DESC, service_name, source_schema;


--
-- Name: VIEW v_activity_summary; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON VIEW audit.v_activity_summary IS 'Daily activity summary for last 30 days';


--
-- Name: v_entity_changes_today; Type: VIEW; Schema: audit; Owner: -
--

CREATE VIEW audit.v_entity_changes_today AS
 SELECT id,
    occurred_at,
    service_name,
    source_schema,
    source_table,
    entity_type,
    entity_id,
    operation,
    performed_by,
    trace_id
   FROM audit.entity_audit_event
  WHERE (occurred_at >= CURRENT_DATE)
  ORDER BY occurred_at DESC;


--
-- Name: VIEW v_entity_changes_today; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON VIEW audit.v_entity_changes_today IS 'All entity changes since midnight';


--
-- Name: v_recent_events; Type: VIEW; Schema: audit; Owner: -
--

CREATE VIEW audit.v_recent_events AS
 SELECT id,
    occurred_at,
    service_name,
    source_schema,
    action,
    resource_type,
    resource_id,
    user_id,
    outcome,
    trace_id
   FROM audit.audit_event
  WHERE (occurred_at > (now() - '24:00:00'::interval))
  ORDER BY occurred_at DESC
 LIMIT 1000;


--
-- Name: VIEW v_recent_events; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON VIEW audit.v_recent_events IS 'Last 24 hours of audit events (max 1000)';


--
-- Name: audit_event; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_event (
    id bigint NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    trace_id character varying(64) NOT NULL,
    user_id character varying(128) NOT NULL,
    action character varying(128) NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(128),
    outcome character varying(16) NOT NULL,
    client_ip character varying(64),
    user_agent character varying(256),
    details jsonb,
    prev_hash character varying(64) NOT NULL,
    hash character varying(64) NOT NULL,
    response_hash character varying(64),
    referer character varying(256),
    client_source character varying(64),
    requested_with character varying(64)
);


--
-- Name: audit_event_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: audit_log; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log (
    id bigint NOT NULL,
    table_name character varying(64) NOT NULL,
    record_id bigint NOT NULL,
    operation_type text NOT NULL,
    old_values jsonb,
    new_values jsonb,
    changed_by character varying(64) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip_address character varying(45),
    user_agent text,
    CONSTRAINT audit_log_operation_type_enum_check CHECK ((operation_type = ANY (ARRAY['INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


--
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: authorization_audit; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: authorization_audit_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.authorization_audit ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.authorization_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: capabilities_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.capabilities_251103 (
    id bigint CONSTRAINT capabilities_id_not_null NOT NULL,
    name character varying(100) CONSTRAINT capabilities_name_not_null NOT NULL,
    description character varying(255) CONSTRAINT capabilities_description_not_null NOT NULL,
    module character varying(50) CONSTRAINT capabilities_module_not_null NOT NULL,
    action character varying(50) CONSTRAINT capabilities_action_not_null NOT NULL,
    resource character varying(100) CONSTRAINT capabilities_resource_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT capabilities_is_active_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT capabilities_created_at_not_null NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: capabilities_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.capabilities_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.capabilities_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: capabilities_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.capabilities_backup (
    id bigint,
    name character varying(100),
    description character varying(255),
    module character varying(50),
    action character varying(50),
    resource character varying(100),
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    backup_created_at timestamp without time zone
);


--
-- Name: endpoint_policies; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.endpoint_policies (
    id bigint NOT NULL,
    endpoint_id bigint NOT NULL,
    policy_id bigint NOT NULL
);


--
-- Name: endpoint_policies_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.endpoint_policies_251103 (
    id bigint CONSTRAINT endpoint_policies_id_not_null NOT NULL,
    endpoint_id bigint CONSTRAINT endpoint_policies_endpoint_id_not_null NOT NULL,
    policy_id bigint CONSTRAINT endpoint_policies_policy_id_not_null NOT NULL
);


--
-- Name: endpoint_policies_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.endpoint_policies_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoint_policies_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: endpoint_policies_251201; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.endpoint_policies_251201 (
    id bigint CONSTRAINT endpoint_policies_id_not_null NOT NULL,
    endpoint_id bigint CONSTRAINT endpoint_policies_endpoint_id_not_null NOT NULL,
    policy_id bigint CONSTRAINT endpoint_policies_policy_id_not_null NOT NULL
);


--
-- Name: endpoint_policies_251201_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.endpoint_policies_251201 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoint_policies_251201_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: endpoint_policies_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.endpoint_policies_backup (
    id bigint,
    endpoint_id bigint,
    policy_id bigint,
    backup_created_at timestamp without time zone
);


--
-- Name: endpoint_policies_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.endpoint_policies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoint_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: endpoints; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: endpoints_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.endpoints_251103 (
    id bigint CONSTRAINT endpoints_id_not_null NOT NULL,
    service character varying(64) CONSTRAINT endpoints_service_not_null NOT NULL,
    version character varying(64) CONSTRAINT endpoints_version_not_null NOT NULL,
    method character varying(8) CONSTRAINT endpoints_method_not_null NOT NULL,
    path character varying(256) CONSTRAINT endpoints_path_not_null NOT NULL,
    description text,
    is_active boolean DEFAULT true CONSTRAINT endpoints_is_active_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT endpoints_created_at_not_null NOT NULL,
    updated_at timestamp without time zone,
    ui_type character varying(32)
);


--
-- Name: endpoints_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.endpoints_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoints_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: endpoints_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.endpoints ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: entity_audit_event; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: entity_audit_event_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.entity_audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.entity_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notification_templates; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: notification_templates_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.notification_templates ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.notification_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: page_actions; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: page_actions_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.page_actions_251103 (
    id bigint CONSTRAINT page_actions_id_not_null NOT NULL,
    label character varying(128) CONSTRAINT page_actions_label_not_null NOT NULL,
    action character varying(64) CONSTRAINT page_actions_action_not_null NOT NULL,
    page_id bigint CONSTRAINT page_actions_page_id_not_null NOT NULL,
    display_order integer DEFAULT 0 CONSTRAINT page_actions_display_order_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT page_actions_is_active_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT page_actions_created_at_not_null NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT page_actions_updated_at_not_null NOT NULL,
    endpoint_id bigint,
    icon character varying(64),
    variant character varying(32) DEFAULT 'default'::character varying,
    capability_id bigint CONSTRAINT page_actions_capability_id_not_null NOT NULL
);


--
-- Name: page_actions_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.page_actions_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.page_actions_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: page_actions_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.page_actions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.page_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policies; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: COLUMN policies.expression_deprecated; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.policies.expression_deprecated IS 'DEPRECATED: Old JSON expression field. Migrated to role_policies table. Will be removed in v3.0.';


--
-- Name: COLUMN policies.policy_type; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.policies.policy_type IS 'Fine-grained policy categorization: PERMISSION, CONDITIONAL, ROW_LEVEL, TIME_BASED';


--
-- Name: COLUMN policies.conditions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.policies.conditions IS 'Optional ABAC conditions: tenant_id, time_range, ip_whitelist, etc.';


--
-- Name: policies_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policies_251103 (
    id bigint CONSTRAINT policies_id_not_null NOT NULL,
    name character varying(100) CONSTRAINT policies_name_not_null NOT NULL,
    description character varying(255) CONSTRAINT policies_description_not_null NOT NULL,
    type character varying(20) CONSTRAINT policies_type_not_null NOT NULL,
    expression jsonb CONSTRAINT policies_expression_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT policies_is_active_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT policies_created_at_not_null NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: policies_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.policies_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policies_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policies_251201; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policies_251201 (
    id bigint CONSTRAINT policies_id_not_null NOT NULL,
    name character varying(100) CONSTRAINT policies_name_not_null NOT NULL,
    description character varying(255) CONSTRAINT policies_description_not_null NOT NULL,
    type character varying(20) CONSTRAINT policies_type_not_null NOT NULL,
    expression jsonb CONSTRAINT policies_expression_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT policies_is_active_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT policies_created_at_not_null NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: policies_251201_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.policies_251201 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policies_251201_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policies_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policies_backup (
    id bigint,
    name character varying(100),
    description character varying(255),
    type character varying(20),
    expression jsonb,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    backup_created_at timestamp without time zone
);


--
-- Name: policies_backup_pre_migration; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policies_backup_pre_migration (
    id bigint,
    name character varying(100),
    description character varying(255),
    type character varying(20),
    expression_deprecated jsonb,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    policy_type character varying(50),
    conditions jsonb
);


--
-- Name: TABLE policies_backup_pre_migration; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.policies_backup_pre_migration IS 'Backup of policies table before role_policies migration. Created: 2025-11-03';


--
-- Name: policies_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.policies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policy_capabilities_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policy_capabilities_251103 (
    id bigint CONSTRAINT policy_capabilities_id_not_null NOT NULL,
    policy_id bigint CONSTRAINT policy_capabilities_policy_id_not_null NOT NULL,
    capability_id bigint CONSTRAINT policy_capabilities_capability_id_not_null NOT NULL
);


--
-- Name: policy_capabilities_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.policy_capabilities_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policy_capabilities_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policy_capabilities_251201; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policy_capabilities_251201 (
    id bigint CONSTRAINT policy_capabilities_id_not_null NOT NULL,
    policy_id bigint CONSTRAINT policy_capabilities_policy_id_not_null NOT NULL,
    capability_id bigint CONSTRAINT policy_capabilities_capability_id_not_null NOT NULL
);


--
-- Name: policy_capabilities_251201_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.policy_capabilities_251201 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.policy_capabilities_251201_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: policy_capabilities_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.policy_capabilities_backup (
    id bigint,
    policy_id bigint,
    capability_id bigint,
    backup_created_at timestamp without time zone
);


--
-- Name: revoked_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.revoked_tokens (
    id bigint NOT NULL,
    token_id character varying(100) NOT NULL,
    user_id bigint,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: revoked_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.revoked_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.revoked_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role_policies; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: TABLE role_policies; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.role_policies IS 'Junction table for Role-Policy many-to-many relationship. Replaces JSON expression-based policy assignment.';


--
-- Name: COLUMN role_policies.conditions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.role_policies.conditions IS 'Optional JSONB conditions for ABAC scenarios (tenant_id, time_range, etc.)';


--
-- Name: COLUMN role_policies.priority; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.role_policies.priority IS 'Policy precedence when conflicts arise (higher = higher priority)';


--
-- Name: role_policies_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.role_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.role_policies_id_seq OWNED BY auth.role_policies.id;


--
-- Name: roles; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: roles_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.roles_251103 (
    id bigint CONSTRAINT roles_id_not_null NOT NULL,
    name character varying(50) CONSTRAINT roles_name_not_null NOT NULL,
    description character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT roles_created_at_not_null NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT roles_updated_at_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT roles_is_active_not_null NOT NULL
);


--
-- Name: roles_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.roles_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.roles_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.roles_backup (
    id bigint,
    name character varying(50),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_active boolean,
    backup_created_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: system_config; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: system_config_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.system_config ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.system_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ui_pages; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: ui_pages_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.ui_pages_251103 (
    id bigint CONSTRAINT ui_pages_id_not_null NOT NULL,
    page_id character varying(100) CONSTRAINT ui_pages_page_id_not_null NOT NULL,
    label character varying(100) CONSTRAINT ui_pages_label_not_null NOT NULL,
    route character varying(255) CONSTRAINT ui_pages_route_not_null NOT NULL,
    icon character varying(100),
    module character varying(50) CONSTRAINT ui_pages_module_not_null NOT NULL,
    parent_id bigint,
    display_order integer DEFAULT 0 CONSTRAINT ui_pages_display_order_not_null NOT NULL,
    is_menu_item boolean DEFAULT true CONSTRAINT ui_pages_is_menu_item_not_null NOT NULL,
    is_active boolean DEFAULT true CONSTRAINT ui_pages_is_active_not_null NOT NULL,
    required_capability character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT ui_pages_created_at_not_null NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: ui_pages_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.ui_pages_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.ui_pages_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ui_pages_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.ui_pages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.ui_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_roles; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_roles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_roles_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_roles_251103 (
    id bigint CONSTRAINT user_roles_id_not_null NOT NULL,
    user_id bigint CONSTRAINT user_roles_user_id_not_null NOT NULL,
    role_id bigint CONSTRAINT user_roles_role_id_not_null NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT user_roles_assigned_at_not_null NOT NULL
);


--
-- Name: user_roles_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.user_roles_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.user_roles_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_roles_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_roles_backup (
    id bigint,
    user_id bigint,
    role_id bigint,
    assigned_at timestamp without time zone,
    backup_created_at timestamp without time zone
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.user_roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_sessions; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.user_sessions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.user_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_tenant_acl; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: user_tenant_acl_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.user_tenant_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_tenant_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.user_tenant_acl_id_seq OWNED BY auth.user_tenant_acl.id;


--
-- Name: user_tenant_acl_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_tenant_acl_251103 (
    id bigint DEFAULT nextval('auth.user_tenant_acl_id_seq'::regclass) CONSTRAINT user_tenant_acl_id_not_null NOT NULL,
    user_id bigint CONSTRAINT user_tenant_acl_user_id_not_null NOT NULL,
    board_id character varying(64) CONSTRAINT user_tenant_acl_board_id_not_null NOT NULL,
    employer_id character varying(64),
    can_read boolean DEFAULT true CONSTRAINT user_tenant_acl_can_read_not_null NOT NULL,
    can_write boolean DEFAULT false CONSTRAINT user_tenant_acl_can_write_not_null NOT NULL,
    created_at timestamp with time zone DEFAULT now() CONSTRAINT user_tenant_acl_created_at_not_null NOT NULL,
    updated_at timestamp with time zone DEFAULT now() CONSTRAINT user_tenant_acl_updated_at_not_null NOT NULL,
    CONSTRAINT check_read_or_write CHECK (((can_read = true) OR (can_write = true)))
);


--
-- Name: user_tenant_acl_audit; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: user_tenant_acl_audit_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.user_tenant_acl_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_tenant_acl_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.user_tenant_acl_audit_id_seq OWNED BY auth.user_tenant_acl_audit.id;


--
-- Name: user_tenant_acl_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_tenant_acl_backup (
    id bigint,
    user_id bigint,
    board_id character varying(64),
    employer_id character varying(64),
    can_read boolean,
    can_write boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    backup_created_at timestamp without time zone
);


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

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


--
-- Name: users_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users_251103 (
    id bigint CONSTRAINT users_id_not_null NOT NULL,
    username character varying(50) CONSTRAINT users_username_not_null NOT NULL,
    email character varying(255) CONSTRAINT users_email_not_null NOT NULL,
    password character varying(255) CONSTRAINT users_password_not_null NOT NULL,
    full_name character varying(255) CONSTRAINT users_full_name_not_null NOT NULL,
    role character varying(50) DEFAULT 'WORKER'::character varying CONSTRAINT users_role_not_null NOT NULL,
    is_enabled boolean DEFAULT true CONSTRAINT users_is_enabled_not_null NOT NULL,
    is_account_non_expired boolean DEFAULT true CONSTRAINT users_is_account_non_expired_not_null NOT NULL,
    is_account_non_locked boolean DEFAULT true CONSTRAINT users_is_account_non_locked_not_null NOT NULL,
    is_credentials_non_expired boolean DEFAULT true CONSTRAINT users_is_credentials_non_expired_not_null NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT users_created_at_not_null NOT NULL,
    updated_at timestamp without time zone,
    last_login timestamp without time zone,
    permission_version integer DEFAULT 1 CONSTRAINT users_permission_version_not_null NOT NULL
);


--
-- Name: users_251103_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.users_251103 ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.users_251103_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_backup; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users_backup (
    id bigint,
    username character varying(50),
    email character varying(255),
    password character varying(255),
    full_name character varying(255),
    role character varying(50),
    is_enabled boolean,
    is_account_non_expired boolean,
    is_account_non_locked boolean,
    is_credentials_non_expired boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    last_login timestamp without time zone,
    permission_version integer,
    backup_created_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

ALTER TABLE auth.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME auth.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_password_backup_251103; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users_password_backup_251103 (
    id bigint,
    username character varying(50),
    password character varying(255),
    updated_at timestamp without time zone
);


--
-- Name: audit_event; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.audit_event (
    id bigint NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    trace_id character varying(64) NOT NULL,
    user_id character varying(128) NOT NULL,
    action character varying(128) NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(128),
    outcome character varying(16) NOT NULL,
    client_ip character varying(64),
    user_agent character varying(256),
    details jsonb,
    prev_hash character varying(64) NOT NULL,
    hash character varying(64) NOT NULL,
    response_hash character varying(64),
    referer character varying(256),
    client_source character varying(64),
    requested_with character varying(64)
);


--
-- Name: audit_event_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: board_master; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.board_master (
    id bigint NOT NULL,
    board_id character varying(64) NOT NULL,
    board_name character varying(200) NOT NULL,
    board_code character varying(20) NOT NULL,
    state_name character varying(100) NOT NULL,
    district_name character varying(100),
    address text,
    contact_person character varying(100),
    contact_email character varying(100),
    contact_phone character varying(20),
    status character varying(32) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE ONLY payment_flow.board_master FORCE ROW LEVEL SECURITY;


--
-- Name: board_master_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.board_master ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.board_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: board_receipts; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.board_receipts (
    id bigint NOT NULL,
    board_id character varying(64) NOT NULL,
    board_reference character varying(64) NOT NULL,
    employer_reference character varying(64) NOT NULL,
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    amount numeric(15,2) NOT NULL,
    utr_number character varying(48) NOT NULL,
    status character varying(64) DEFAULT 'PENDING'::character varying NOT NULL,
    maker character varying(64) NOT NULL,
    checker character varying(64),
    receipt_date date NOT NULL
);

ALTER TABLE ONLY payment_flow.board_receipts FORCE ROW LEVEL SECURITY;


--
-- Name: board_receipts_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.board_receipts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.board_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employer_master; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.employer_master (
    id bigint NOT NULL,
    registration_number character varying(64) NOT NULL,
    establishment_name character varying(200) NOT NULL,
    address character varying(255),
    employer_name character varying(120),
    mobile_number character varying(15),
    email_id character varying(150),
    aadhar_number character(12),
    pan_number character varying(16),
    tan_number character varying(10),
    virtual_bank_account_number character varying(64),
    status character varying(32) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    board_id character varying(64) NOT NULL,
    aadhaar_number character varying(12),
    owner_name character varying(120),
    serial_no character varying(64)
);


--
-- Name: TABLE employer_master; Type: COMMENT; Schema: payment_flow; Owner: -
--

COMMENT ON TABLE payment_flow.employer_master IS 'Stores establishment, contact, and compliance details for employers.';


--
-- Name: employer_master_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

CREATE SEQUENCE payment_flow.employer_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employer_master_id_seq; Type: SEQUENCE OWNED BY; Schema: payment_flow; Owner: -
--

ALTER SEQUENCE payment_flow.employer_master_id_seq OWNED BY payment_flow.employer_master.id;


--
-- Name: employer_payment_receipts; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.employer_payment_receipts (
    id bigint NOT NULL,
    employer_receipt_number character varying(40) NOT NULL,
    worker_receipt_number character varying(40) NOT NULL,
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    transaction_reference character varying(50) NOT NULL,
    validated_by character varying(64) NOT NULL,
    validated_at timestamp without time zone NOT NULL,
    total_records integer NOT NULL,
    total_amount numeric(15,2) NOT NULL,
    status character varying(32) NOT NULL,
    board_id character varying(64) DEFAULT 'UNKNOWN'::character varying NOT NULL
);

ALTER TABLE ONLY payment_flow.employer_payment_receipts FORCE ROW LEVEL SECURITY;


--
-- Name: employer_payment_receipts_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.employer_payment_receipts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.employer_payment_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employer_toli_relation; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.employer_toli_relation (
    id bigint NOT NULL,
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    toli_name character varying(120) NOT NULL,
    toli_code character varying(20),
    location character varying(200),
    supervisor_name character varying(100),
    supervisor_contact character varying(15),
    status character varying(32) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    board_id character varying(64) DEFAULT 'UNKNOWN'::character varying NOT NULL
);

ALTER TABLE ONLY payment_flow.employer_toli_relation FORCE ROW LEVEL SECURITY;


--
-- Name: employer_toli_relation_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.employer_toli_relation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.employer_toli_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: entity_audit_event; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.entity_audit_event (
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


--
-- Name: entity_audit_event_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.entity_audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.entity_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: toli_details; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.toli_details (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    toli_id bigint NOT NULL,
    board_id character varying(64) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: toli_details_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

CREATE SEQUENCE payment_flow.toli_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: toli_details_id_seq; Type: SEQUENCE OWNED BY; Schema: payment_flow; Owner: -
--

ALTER SEQUENCE payment_flow.toli_details_id_seq OWNED BY payment_flow.toli_details.id;


--
-- Name: toli_master; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.toli_master (
    id bigint NOT NULL,
    registration_number character varying(64) NOT NULL,
    employer_name_marathi character varying(200) NOT NULL,
    address character varying(255),
    employer_name_english character varying(200),
    mobile_number character varying(15),
    email_id character varying(150),
    status character varying(32) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    board_id character varying(64) NOT NULL,
    employer_id character varying(64) NOT NULL
);


--
-- Name: TABLE toli_master; Type: COMMENT; Schema: payment_flow; Owner: -
--

COMMENT ON TABLE payment_flow.toli_master IS 'Captures employer (toli) level details for registration and communication.';


--
-- Name: toli_master_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

CREATE SEQUENCE payment_flow.toli_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: toli_master_id_seq; Type: SEQUENCE OWNED BY; Schema: payment_flow; Owner: -
--

ALTER SEQUENCE payment_flow.toli_master_id_seq OWNED BY payment_flow.toli_master.id;


--
-- Name: uploaded_files; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.uploaded_files (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    stored_path character varying(500) NOT NULL,
    file_hash character varying(64) NOT NULL,
    file_type character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    uploaded_by character varying(100),
    total_records integer DEFAULT 0 NOT NULL,
    success_count integer DEFAULT 0 NOT NULL,
    failure_count integer DEFAULT 0 NOT NULL,
    status character varying(50) NOT NULL,
    file_reference_number character varying(100),
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY payment_flow.uploaded_files FORCE ROW LEVEL SECURITY;


--
-- Name: uploaded_files_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.uploaded_files ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.uploaded_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: worker_master; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.worker_master (
    id bigint NOT NULL,
    worker_name_marathi character varying(120) NOT NULL,
    worker_name_english character varying(120),
    witness_name_1 character varying(120),
    witness_name_2 character varying(120),
    toli_number character varying(64),
    registration_number character varying(64) NOT NULL,
    pan_number character varying(16),
    nationality character varying(100),
    mother_name character varying(120),
    mobile_number character varying(15),
    mobile_number_1 character varying(15),
    marital_status character varying(30),
    ifsc_code character varying(11),
    branch_address character varying(255),
    bank_name character varying(120),
    age integer,
    address1 character varying(255),
    address2 character varying(255),
    account_number character varying(64),
    aadhar_number character(12) NOT NULL,
    status character varying(32) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    board_id character varying(64) NOT NULL
);


--
-- Name: TABLE worker_master; Type: COMMENT; Schema: payment_flow; Owner: -
--

COMMENT ON TABLE payment_flow.worker_master IS 'Holds demographic and banking details for registered workers.';


--
-- Name: worker_master_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

CREATE SEQUENCE payment_flow.worker_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: worker_master_id_seq; Type: SEQUENCE OWNED BY; Schema: payment_flow; Owner: -
--

ALTER SEQUENCE payment_flow.worker_master_id_seq OWNED BY payment_flow.worker_master.id;


--
-- Name: worker_payment_receipts; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.worker_payment_receipts (
    id bigint NOT NULL,
    receipt_number character varying(40) NOT NULL,
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    total_records integer NOT NULL,
    total_amount numeric(15,2) NOT NULL,
    status character varying(32) NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY payment_flow.worker_payment_receipts FORCE ROW LEVEL SECURITY;


--
-- Name: worker_payment_receipts_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_payment_receipts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.worker_payment_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: worker_payments; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.worker_payments (
    id bigint NOT NULL,
    worker_reference character varying(64) NOT NULL,
    registration_id character varying(64) NOT NULL,
    worker_name character varying(120) NOT NULL,
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    toli character varying(64) NOT NULL,
    aadhar character varying(16) NOT NULL,
    pan character varying(16) NOT NULL,
    bank_account character varying(34) NOT NULL,
    payment_amount numeric(15,2) NOT NULL,
    file_id character varying(20),
    uploaded_file_ref character varying(100),
    request_reference_number character varying(40) NOT NULL,
    status character varying(40) DEFAULT 'UPLOADED'::character varying NOT NULL,
    receipt_number character varying(40),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY payment_flow.worker_payments FORCE ROW LEVEL SECURITY;


--
-- Name: worker_payments_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_payments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.worker_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: worker_uploaded_data; Type: TABLE; Schema: payment_flow; Owner: -
--

CREATE TABLE payment_flow.worker_uploaded_data (
    id bigint NOT NULL,
    file_id character varying(100) NOT NULL,
    row_num integer NOT NULL,
    worker_id character varying(50),
    worker_name character varying(100),
    employer_id character varying(64) NOT NULL,
    toli_id character varying(64) NOT NULL,
    company_name character varying(100),
    department character varying(50),
    "position" character varying(50),
    work_date date,
    hours_worked numeric(5,2),
    hourly_rate numeric(10,2),
    payment_amount numeric(15,2),
    bank_account character varying(20),
    phone_number character varying(15),
    email character varying(100),
    address text,
    status character varying(32) NOT NULL,
    rejection_reason text,
    created_at timestamp without time zone NOT NULL,
    validated_at timestamp without time zone,
    processed_at timestamp without time zone,
    receipt_number character varying(40),
    board_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY payment_flow.worker_uploaded_data FORCE ROW LEVEL SECURITY;


--
-- Name: worker_uploaded_data_id_seq; Type: SEQUENCE; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_uploaded_data ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME payment_flow.worker_uploaded_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: audit_event; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.audit_event (
    id bigint NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    trace_id character varying(64) NOT NULL,
    user_id character varying(128) NOT NULL,
    action character varying(128) NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(128),
    outcome character varying(16) NOT NULL,
    client_ip character varying(64),
    user_agent character varying(256),
    details jsonb,
    prev_hash character varying(64) NOT NULL,
    hash character varying(64) NOT NULL,
    response_hash character varying(64),
    referer character varying(256),
    client_source character varying(64),
    requested_with character varying(64)
);


--
-- Name: audit_event_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_account; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.bank_account (
    id bigint NOT NULL,
    account_no character varying(64) NOT NULL,
    iban character varying(34),
    currency character(3) NOT NULL,
    bank_bic character varying(11),
    holder_name character varying(128),
    is_active boolean DEFAULT true NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY reconciliation.bank_account FORCE ROW LEVEL SECURITY;


--
-- Name: bank_account_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.bank_account ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.bank_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: entity_audit_event; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.entity_audit_event (
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


--
-- Name: entity_audit_event_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.entity_audit_event ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.entity_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: file_processing_queue; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.file_processing_queue (
    id bigint NOT NULL,
    file_id character varying(100) NOT NULL,
    uploaded_file_id bigint,
    processing_status text DEFAULT 'PENDING'::text,
    priority integer DEFAULT 5,
    retry_count integer DEFAULT 0,
    max_retries integer DEFAULT 3,
    error_message text,
    processing_started_at timestamp without time zone,
    processing_completed_at timestamp without time zone,
    processed_by character varying(64),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying,
    CONSTRAINT file_processing_queue_processing_status_enum_check CHECK ((processing_status = ANY (ARRAY['PENDING'::text, 'IN_PROGRESS'::text, 'COMPLETED'::text, 'FAILED'::text, 'CANCELLED'::text])))
);

ALTER TABLE ONLY reconciliation.file_processing_queue FORCE ROW LEVEL SECURITY;


--
-- Name: file_processing_queue_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.file_processing_queue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.file_processing_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: import_error; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.import_error (
    id bigint NOT NULL,
    import_run_id bigint NOT NULL,
    statement_file_id bigint,
    line_no integer,
    code character varying(64) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY reconciliation.import_error FORCE ROW LEVEL SECURITY;


--
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.import_error ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.import_error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: import_run; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.import_run (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    file_hash character(64) NOT NULL,
    file_size_bytes bigint NOT NULL,
    received_at timestamp without time zone NOT NULL,
    status text NOT NULL,
    error_message text,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying,
    CONSTRAINT import_run_status_enum_check CHECK ((status = ANY (ARRAY['NEW'::text, 'PARSED'::text, 'PARTIAL'::text, 'FAILED'::text, 'IMPORTED'::text, 'DUPLICATE'::text])))
);

ALTER TABLE ONLY reconciliation.import_run FORCE ROW LEVEL SECURITY;


--
-- Name: import_run_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.import_run ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.import_run_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: raw_statement_line; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.raw_statement_line (
    id bigint NOT NULL,
    statement_file_id bigint NOT NULL,
    line_no integer NOT NULL,
    tag character varying(8),
    raw_text text NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying
);

ALTER TABLE ONLY reconciliation.raw_statement_line FORCE ROW LEVEL SECURITY;


--
-- Name: raw_statement_line_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.raw_statement_line ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.raw_statement_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: statement_balance; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.statement_balance (
    id bigint NOT NULL,
    statement_file_id bigint NOT NULL,
    bal_type text NOT NULL,
    dc text NOT NULL,
    bal_date date NOT NULL,
    currency character(3) NOT NULL,
    amount numeric(19,2) NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying,
    CONSTRAINT statement_balance_bal_type_enum_check CHECK ((bal_type = ANY (ARRAY['OPENING'::text, 'CLOSING'::text, 'AVAILABLE'::text, 'FORWARD'::text]))),
    CONSTRAINT statement_balance_dc_enum_check CHECK ((dc = ANY (ARRAY['D'::text, 'C'::text])))
);

ALTER TABLE ONLY reconciliation.statement_balance FORCE ROW LEVEL SECURITY;


--
-- Name: statement_balance_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_balance ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.statement_balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: statement_file; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.statement_file (
    id bigint NOT NULL,
    import_run_id bigint NOT NULL,
    bank_account_id bigint NOT NULL,
    stmt_ref_20 character varying(35) NOT NULL,
    seq_28c character varying(35),
    statement_date date NOT NULL,
    opening_dc text NOT NULL,
    opening_amount numeric(19,2) NOT NULL,
    closing_dc text NOT NULL,
    closing_amount numeric(19,2) NOT NULL,
    currency character(3) NOT NULL,
    is_interim boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying,
    CONSTRAINT statement_file_closing_dc_enum_check CHECK ((closing_dc = ANY (ARRAY['D'::text, 'C'::text]))),
    CONSTRAINT statement_file_opening_dc_enum_check CHECK ((opening_dc = ANY (ARRAY['D'::text, 'C'::text])))
);

ALTER TABLE ONLY reconciliation.statement_file FORCE ROW LEVEL SECURITY;


--
-- Name: statement_file_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_file ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.statement_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: statement_transaction; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.statement_transaction (
    id bigint NOT NULL,
    statement_file_id bigint NOT NULL,
    line_no integer NOT NULL,
    value_date date NOT NULL,
    entry_date date,
    dc text NOT NULL,
    amount numeric(19,2) NOT NULL,
    signed_amount numeric(19,2) NOT NULL,
    currency character(3) NOT NULL,
    txn_type_code character varying(4),
    bank_reference character varying(35),
    customer_reference character varying(35),
    entry_reference character varying(16),
    narrative text,
    narrative_tokens jsonb,
    ext_idempotency_hash character(64) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    board_id character varying(64) DEFAULT NULL::character varying,
    employer_id character varying(64) DEFAULT NULL::character varying,
    CONSTRAINT statement_transaction_dc_enum_check CHECK ((dc = ANY (ARRAY['D'::text, 'C'::text])))
);

ALTER TABLE ONLY reconciliation.statement_transaction FORCE ROW LEVEL SECURITY;


--
-- Name: statement_transaction_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_transaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.statement_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: transaction_86_segment; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.transaction_86_segment (
    id bigint NOT NULL,
    statement_transaction_id bigint NOT NULL,
    seg_key character varying(32) NOT NULL,
    seg_value character varying(512),
    seg_seq integer NOT NULL
);


--
-- Name: transaction_86_segment_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.transaction_86_segment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.transaction_86_segment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uploaded_files; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.uploaded_files (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    stored_path character varying(500) NOT NULL,
    file_hash character varying(64) NOT NULL,
    file_type character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    uploaded_by character varying(100),
    total_records integer DEFAULT 0 NOT NULL,
    success_count integer DEFAULT 0 NOT NULL,
    failure_count integer DEFAULT 0 NOT NULL,
    status character varying(50) NOT NULL,
    file_reference_number character varying(100)
);


--
-- Name: uploaded_files_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.uploaded_files ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.uploaded_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: van_file; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.van_file (
    id bigint NOT NULL,
    import_run_id bigint NOT NULL,
    file_generation_date_time timestamp without time zone,
    file_sequence_number character varying(255),
    batch_id character varying(255),
    currency_code character(3),
    created_at timestamp without time zone NOT NULL
);


--
-- Name: van_file_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.van_file ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.van_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: van_transaction; Type: TABLE; Schema: reconciliation; Owner: -
--

CREATE TABLE reconciliation.van_transaction (
    id bigint NOT NULL,
    import_run_id bigint NOT NULL,
    main_account_number character varying(255) NOT NULL,
    virtual_account_number character varying(255) NOT NULL,
    transaction_reference_number character varying(255),
    bank_reference_trace_id character varying(255),
    remitter_name character varying(255),
    remitter_account_number character varying(255),
    remitter_ifsc_bank_name character varying(255),
    remitter_vpa character varying(255),
    transaction_date date NOT NULL,
    value_date date,
    amount numeric(19,2) NOT NULL,
    mode_channel character varying(255),
    payment_description_narration character varying(255),
    payment_status character varying(255),
    mapped_customer_id_code character varying(255),
    invoice_reference_id character varying(255),
    date_time_of_credit timestamp without time zone,
    branch_bank_code character varying(255),
    created_at timestamp without time zone NOT NULL
);


--
-- Name: van_transaction_id_seq; Type: SEQUENCE; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.van_transaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME reconciliation.van_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role_policies id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies ALTER COLUMN id SET DEFAULT nextval('auth.role_policies_id_seq'::regclass);


--
-- Name: user_tenant_acl id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl ALTER COLUMN id SET DEFAULT nextval('auth.user_tenant_acl_id_seq'::regclass);


--
-- Name: user_tenant_acl_audit id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl_audit ALTER COLUMN id SET DEFAULT nextval('auth.user_tenant_acl_audit_id_seq'::regclass);


--
-- Name: employer_master id; Type: DEFAULT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master ALTER COLUMN id SET DEFAULT nextval('payment_flow.employer_master_id_seq'::regclass);


--
-- Name: toli_details id; Type: DEFAULT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_details ALTER COLUMN id SET DEFAULT nextval('payment_flow.toli_details_id_seq'::regclass);


--
-- Name: toli_master id; Type: DEFAULT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_master ALTER COLUMN id SET DEFAULT nextval('payment_flow.toli_master_id_seq'::regclass);


--
-- Name: worker_master id; Type: DEFAULT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_master ALTER COLUMN id SET DEFAULT nextval('payment_flow.worker_master_id_seq'::regclass);


--
-- Name: audit_event audit_event_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.audit_event
    ADD CONSTRAINT audit_event_pkey PRIMARY KEY (id);


--
-- Name: entity_audit_event entity_audit_event_audit_number_key; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.entity_audit_event
    ADD CONSTRAINT entity_audit_event_audit_number_key UNIQUE (audit_number);


--
-- Name: entity_audit_event entity_audit_event_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.entity_audit_event
    ADD CONSTRAINT entity_audit_event_pkey PRIMARY KEY (id);


--
-- Name: audit_event audit_event_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_event
    ADD CONSTRAINT audit_event_pkey PRIMARY KEY (id);


--
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- Name: authorization_audit authorization_audit_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.authorization_audit
    ADD CONSTRAINT authorization_audit_pkey PRIMARY KEY (id);


--
-- Name: capabilities_251103 capabilities_251103_name_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.capabilities_251103
    ADD CONSTRAINT capabilities_251103_name_key UNIQUE (name);


--
-- Name: capabilities_251103 capabilities_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.capabilities_251103
    ADD CONSTRAINT capabilities_251103_pkey PRIMARY KEY (id);


--
-- Name: endpoint_policies_251103 endpoint_policies_251103_endpoint_id_policy_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies_251103
    ADD CONSTRAINT endpoint_policies_251103_endpoint_id_policy_id_key UNIQUE (endpoint_id, policy_id);


--
-- Name: endpoint_policies_251103 endpoint_policies_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies_251103
    ADD CONSTRAINT endpoint_policies_251103_pkey PRIMARY KEY (id);


--
-- Name: endpoint_policies_251201 endpoint_policies_251201_endpoint_id_policy_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies_251201
    ADD CONSTRAINT endpoint_policies_251201_endpoint_id_policy_id_key UNIQUE (endpoint_id, policy_id);


--
-- Name: endpoint_policies_251201 endpoint_policies_251201_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies_251201
    ADD CONSTRAINT endpoint_policies_251201_pkey PRIMARY KEY (id);


--
-- Name: endpoint_policies endpoint_policies_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT endpoint_policies_pkey PRIMARY KEY (id);


--
-- Name: endpoint_policies endpoint_policies_uk_endpoint_policy; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT endpoint_policies_uk_endpoint_policy UNIQUE (endpoint_id, policy_id);


--
-- Name: endpoints_251103 endpoints_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoints_251103
    ADD CONSTRAINT endpoints_251103_pkey PRIMARY KEY (id);


--
-- Name: endpoints_251103 endpoints_251103_service_version_method_path_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoints_251103
    ADD CONSTRAINT endpoints_251103_service_version_method_path_key UNIQUE (service, version, method, path);


--
-- Name: endpoints endpoints_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoints
    ADD CONSTRAINT endpoints_pkey PRIMARY KEY (id);


--
-- Name: endpoints endpoints_uk_service_version_method_path; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoints
    ADD CONSTRAINT endpoints_uk_service_version_method_path UNIQUE (service, version, method, path);


--
-- Name: entity_audit_event entity_audit_event_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.entity_audit_event
    ADD CONSTRAINT entity_audit_event_pkey PRIMARY KEY (id);


--
-- Name: entity_audit_event entity_audit_event_uq_entity_audit_event_audit_number; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.entity_audit_event
    ADD CONSTRAINT entity_audit_event_uq_entity_audit_event_audit_number UNIQUE (audit_number);


--
-- Name: notification_templates notification_templates_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.notification_templates
    ADD CONSTRAINT notification_templates_pkey PRIMARY KEY (id);


--
-- Name: notification_templates notification_templates_template_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.notification_templates
    ADD CONSTRAINT notification_templates_template_key UNIQUE (template_key);


--
-- Name: page_actions_251103 page_actions_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.page_actions_251103
    ADD CONSTRAINT page_actions_251103_pkey PRIMARY KEY (id);


--
-- Name: page_actions page_actions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT page_actions_pkey PRIMARY KEY (id);


--
-- Name: policies_251103 policies_251103_name_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies_251103
    ADD CONSTRAINT policies_251103_name_key UNIQUE (name);


--
-- Name: policies_251103 policies_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies_251103
    ADD CONSTRAINT policies_251103_pkey PRIMARY KEY (id);


--
-- Name: policies_251201 policies_251201_name_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies_251201
    ADD CONSTRAINT policies_251201_name_key UNIQUE (name);


--
-- Name: policies_251201 policies_251201_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies_251201
    ADD CONSTRAINT policies_251201_pkey PRIMARY KEY (id);


--
-- Name: policies policies_name; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies
    ADD CONSTRAINT policies_name UNIQUE (name);


--
-- Name: policies policies_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (id);


--
-- Name: policy_capabilities_251103 policy_capabilities_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policy_capabilities_251103
    ADD CONSTRAINT policy_capabilities_251103_pkey PRIMARY KEY (id);


--
-- Name: policy_capabilities_251103 policy_capabilities_251103_policy_id_capability_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policy_capabilities_251103
    ADD CONSTRAINT policy_capabilities_251103_policy_id_capability_id_key UNIQUE (policy_id, capability_id);


--
-- Name: policy_capabilities_251201 policy_capabilities_251201_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policy_capabilities_251201
    ADD CONSTRAINT policy_capabilities_251201_pkey PRIMARY KEY (id);


--
-- Name: policy_capabilities_251201 policy_capabilities_251201_policy_id_capability_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.policy_capabilities_251201
    ADD CONSTRAINT policy_capabilities_251201_policy_id_capability_id_key UNIQUE (policy_id, capability_id);


--
-- Name: revoked_tokens revoked_tokens_idx_revoked_token_token_id; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT revoked_tokens_idx_revoked_token_token_id UNIQUE (token_id);


--
-- Name: revoked_tokens revoked_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT revoked_tokens_pkey PRIMARY KEY (id);


--
-- Name: role_policies role_policies_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT role_policies_pkey PRIMARY KEY (id);


--
-- Name: roles_251103 roles_251103_name_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.roles_251103
    ADD CONSTRAINT roles_251103_name_key UNIQUE (name);


--
-- Name: roles_251103 roles_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.roles_251103
    ADD CONSTRAINT roles_251103_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.roles
    ADD CONSTRAINT roles_name UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: system_config system_config_config_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.system_config
    ADD CONSTRAINT system_config_config_key UNIQUE (config_key);


--
-- Name: system_config system_config_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.system_config
    ADD CONSTRAINT system_config_pkey PRIMARY KEY (id);


--
-- Name: ui_pages_251103 ui_pages_251103_page_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.ui_pages_251103
    ADD CONSTRAINT ui_pages_251103_page_id_key UNIQUE (page_id);


--
-- Name: ui_pages_251103 ui_pages_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.ui_pages_251103
    ADD CONSTRAINT ui_pages_251103_pkey PRIMARY KEY (id);


--
-- Name: ui_pages ui_pages_page_id; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT ui_pages_page_id UNIQUE (page_id);


--
-- Name: ui_pages ui_pages_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT ui_pages_pkey PRIMARY KEY (id);


--
-- Name: role_policies uk_role_policies_role_policy; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT uk_role_policies_role_policy UNIQUE (role_id, policy_id);


--
-- Name: user_roles_251103 user_roles_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles_251103
    ADD CONSTRAINT user_roles_251103_pkey PRIMARY KEY (id);


--
-- Name: user_roles_251103 user_roles_251103_user_id_role_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles_251103
    ADD CONSTRAINT user_roles_251103_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_unique_user_role; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT user_roles_unique_user_role UNIQUE (user_id, role_id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_session_id; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_session_id UNIQUE (session_id);


--
-- Name: user_tenant_acl_251103 user_tenant_acl_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl_251103
    ADD CONSTRAINT user_tenant_acl_251103_pkey PRIMARY KEY (id);


--
-- Name: user_tenant_acl_251103 user_tenant_acl_251103_user_id_board_id_employer_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl_251103
    ADD CONSTRAINT user_tenant_acl_251103_user_id_board_id_employer_id_key UNIQUE (user_id, board_id, employer_id);


--
-- Name: user_tenant_acl_audit user_tenant_acl_audit_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl_audit
    ADD CONSTRAINT user_tenant_acl_audit_pkey PRIMARY KEY (id);


--
-- Name: user_tenant_acl user_tenant_acl_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT user_tenant_acl_pkey PRIMARY KEY (id);


--
-- Name: user_tenant_acl user_tenant_acl_user_id_board_id_employer_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT user_tenant_acl_user_id_board_id_employer_id_key UNIQUE (user_id, board_id, employer_id);


--
-- Name: users_251103 users_251103_email_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users_251103
    ADD CONSTRAINT users_251103_email_key UNIQUE (email);


--
-- Name: users_251103 users_251103_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users_251103
    ADD CONSTRAINT users_251103_pkey PRIMARY KEY (id);


--
-- Name: users_251103 users_251103_username_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users_251103
    ADD CONSTRAINT users_251103_username_key UNIQUE (username);


--
-- Name: users users_email; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: audit_event audit_event_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.audit_event
    ADD CONSTRAINT audit_event_pkey PRIMARY KEY (id);


--
-- Name: board_master board_master_board_code; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.board_master
    ADD CONSTRAINT board_master_board_code UNIQUE (board_code);


--
-- Name: board_master board_master_board_id; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.board_master
    ADD CONSTRAINT board_master_board_id UNIQUE (board_id);


--
-- Name: board_master board_master_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.board_master
    ADD CONSTRAINT board_master_pkey PRIMARY KEY (id);


--
-- Name: board_receipts board_receipts_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.board_receipts
    ADD CONSTRAINT board_receipts_pkey PRIMARY KEY (id);


--
-- Name: employer_master employer_master_aadhaar_number_key; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_aadhaar_number_key UNIQUE (aadhaar_number);


--
-- Name: employer_master employer_master_aadhar_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_aadhar_number UNIQUE (aadhar_number);


--
-- Name: employer_master employer_master_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_pkey PRIMARY KEY (id);


--
-- Name: employer_master employer_master_registration_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_registration_number UNIQUE (registration_number);


--
-- Name: employer_master employer_master_serial_no_key; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_serial_no_key UNIQUE (serial_no);


--
-- Name: employer_master employer_master_virtual_bank_account; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_master
    ADD CONSTRAINT employer_master_virtual_bank_account UNIQUE (virtual_bank_account_number);


--
-- Name: employer_payment_receipts employer_payment_receipts_employer_receipt_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_payment_receipts
    ADD CONSTRAINT employer_payment_receipts_employer_receipt_number UNIQUE (employer_receipt_number);


--
-- Name: employer_payment_receipts employer_payment_receipts_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_payment_receipts
    ADD CONSTRAINT employer_payment_receipts_pkey PRIMARY KEY (id);


--
-- Name: employer_toli_relation employer_toli_relation_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_toli_relation
    ADD CONSTRAINT employer_toli_relation_pkey PRIMARY KEY (id);


--
-- Name: employer_toli_relation employer_toli_relation_uk_employer_toli; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.employer_toli_relation
    ADD CONSTRAINT employer_toli_relation_uk_employer_toli UNIQUE (employer_id, toli_id);


--
-- Name: entity_audit_event entity_audit_event_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.entity_audit_event
    ADD CONSTRAINT entity_audit_event_pkey PRIMARY KEY (id);


--
-- Name: entity_audit_event entity_audit_event_uq_entity_audit_event_audit_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.entity_audit_event
    ADD CONSTRAINT entity_audit_event_uq_entity_audit_event_audit_number UNIQUE (audit_number);


--
-- Name: toli_details toli_details_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_details
    ADD CONSTRAINT toli_details_pkey PRIMARY KEY (id);


--
-- Name: toli_master toli_master_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_master
    ADD CONSTRAINT toli_master_pkey PRIMARY KEY (id);


--
-- Name: toli_master toli_master_registration_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_master
    ADD CONSTRAINT toli_master_registration_number UNIQUE (registration_number);


--
-- Name: uploaded_files uploaded_files_file_reference_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.uploaded_files
    ADD CONSTRAINT uploaded_files_file_reference_number UNIQUE (file_reference_number);


--
-- Name: uploaded_files uploaded_files_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.uploaded_files
    ADD CONSTRAINT uploaded_files_pkey PRIMARY KEY (id);


--
-- Name: worker_master worker_master_aadhar_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_master
    ADD CONSTRAINT worker_master_aadhar_number UNIQUE (aadhar_number);


--
-- Name: worker_master worker_master_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_master
    ADD CONSTRAINT worker_master_pkey PRIMARY KEY (id);


--
-- Name: worker_master worker_master_registration_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_master
    ADD CONSTRAINT worker_master_registration_number UNIQUE (registration_number);


--
-- Name: worker_payment_receipts worker_payment_receipts_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_payment_receipts
    ADD CONSTRAINT worker_payment_receipts_pkey PRIMARY KEY (id);


--
-- Name: worker_payment_receipts worker_payment_receipts_receipt_number; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_payment_receipts
    ADD CONSTRAINT worker_payment_receipts_receipt_number UNIQUE (receipt_number);


--
-- Name: worker_payments worker_payments_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_payments
    ADD CONSTRAINT worker_payments_pkey PRIMARY KEY (id);


--
-- Name: worker_uploaded_data worker_uploaded_data_pkey; Type: CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.worker_uploaded_data
    ADD CONSTRAINT worker_uploaded_data_pkey PRIMARY KEY (id);


--
-- Name: audit_event audit_event_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.audit_event
    ADD CONSTRAINT audit_event_pkey PRIMARY KEY (id);


--
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (id);


--
-- Name: bank_account bank_account_uq_account; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.bank_account
    ADD CONSTRAINT bank_account_uq_account UNIQUE (account_no, currency);


--
-- Name: entity_audit_event entity_audit_event_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.entity_audit_event
    ADD CONSTRAINT entity_audit_event_pkey PRIMARY KEY (id);


--
-- Name: entity_audit_event entity_audit_event_uq_entity_audit_event_audit_number; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.entity_audit_event
    ADD CONSTRAINT entity_audit_event_uq_entity_audit_event_audit_number UNIQUE (audit_number);


--
-- Name: file_processing_queue file_processing_queue_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.file_processing_queue
    ADD CONSTRAINT file_processing_queue_pkey PRIMARY KEY (id);


--
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.import_error
    ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- Name: import_run import_run_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.import_run
    ADD CONSTRAINT import_run_pkey PRIMARY KEY (id);


--
-- Name: import_run import_run_uq_filehash; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.import_run
    ADD CONSTRAINT import_run_uq_filehash UNIQUE (file_hash);


--
-- Name: raw_statement_line raw_statement_line_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.raw_statement_line
    ADD CONSTRAINT raw_statement_line_pkey PRIMARY KEY (id);


--
-- Name: statement_balance statement_balance_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.statement_balance
    ADD CONSTRAINT statement_balance_pkey PRIMARY KEY (id);


--
-- Name: statement_file statement_file_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.statement_file
    ADD CONSTRAINT statement_file_pkey PRIMARY KEY (id);


--
-- Name: statement_file statement_file_uq_stmt; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.statement_file
    ADD CONSTRAINT statement_file_uq_stmt UNIQUE (bank_account_id, stmt_ref_20, seq_28c);


--
-- Name: statement_transaction statement_transaction_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.statement_transaction
    ADD CONSTRAINT statement_transaction_pkey PRIMARY KEY (id);


--
-- Name: statement_transaction statement_transaction_uq_txn_hash; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.statement_transaction
    ADD CONSTRAINT statement_transaction_uq_txn_hash UNIQUE (ext_idempotency_hash);


--
-- Name: transaction_86_segment transaction_86_segment_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.transaction_86_segment
    ADD CONSTRAINT transaction_86_segment_pkey PRIMARY KEY (id);


--
-- Name: uploaded_files uploaded_files_file_reference_number; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.uploaded_files
    ADD CONSTRAINT uploaded_files_file_reference_number UNIQUE (file_reference_number);


--
-- Name: uploaded_files uploaded_files_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.uploaded_files
    ADD CONSTRAINT uploaded_files_pkey PRIMARY KEY (id);


--
-- Name: van_file van_file_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.van_file
    ADD CONSTRAINT van_file_pkey PRIMARY KEY (id);


--
-- Name: van_transaction van_transaction_pkey; Type: CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.van_transaction
    ADD CONSTRAINT van_transaction_pkey PRIMARY KEY (id);


--
-- Name: idx_audit_event_action; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_action ON audit.audit_event USING btree (action);


--
-- Name: idx_audit_event_occurred_at; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_occurred_at ON audit.audit_event USING btree (occurred_at DESC);


--
-- Name: idx_audit_event_outcome; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_outcome ON audit.audit_event USING btree (outcome);


--
-- Name: idx_audit_event_resource; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_resource ON audit.audit_event USING btree (resource_type, resource_id);


--
-- Name: idx_audit_event_service; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_service ON audit.audit_event USING btree (service_name);


--
-- Name: idx_audit_event_source_schema; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_source_schema ON audit.audit_event USING btree (source_schema);


--
-- Name: idx_audit_event_trace_id; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_trace_id ON audit.audit_event USING btree (trace_id);


--
-- Name: idx_audit_event_user_id; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_audit_event_user_id ON audit.audit_event USING btree (user_id);


--
-- Name: idx_entity_audit_entity; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_entity ON audit.entity_audit_event USING btree (entity_type, entity_id);


--
-- Name: idx_entity_audit_occurred_at; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_occurred_at ON audit.entity_audit_event USING btree (occurred_at DESC);


--
-- Name: idx_entity_audit_operation; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_operation ON audit.entity_audit_event USING btree (operation);


--
-- Name: idx_entity_audit_performed_by; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_performed_by ON audit.entity_audit_event USING btree (performed_by);


--
-- Name: idx_entity_audit_record_number; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_record_number ON audit.entity_audit_event USING btree (record_number);


--
-- Name: idx_entity_audit_service; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_service ON audit.entity_audit_event USING btree (service_name);


--
-- Name: idx_entity_audit_source_schema; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_source_schema ON audit.entity_audit_event USING btree (source_schema);


--
-- Name: idx_entity_audit_source_table; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_source_table ON audit.entity_audit_event USING btree (source_table);


--
-- Name: idx_entity_audit_trace_id; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX idx_entity_audit_trace_id ON audit.entity_audit_event USING btree (trace_id);


--
-- Name: idx_acl_audit_changed_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_audit_changed_at ON auth.user_tenant_acl_audit USING btree (changed_at);


--
-- Name: idx_acl_audit_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_audit_user ON auth.user_tenant_acl_audit USING btree (user_id);


--
-- Name: idx_acl_tenant_keys; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_tenant_keys ON auth.user_tenant_acl USING btree (board_id, employer_id);


--
-- Name: idx_acl_updated_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_updated_at ON auth.user_tenant_acl USING btree (updated_at);


--
-- Name: idx_acl_user_id; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_user_id ON auth.user_tenant_acl USING btree (user_id);


--
-- Name: idx_acl_user_tenant; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_acl_user_tenant ON auth.user_tenant_acl USING btree (user_id, board_id, employer_id);


--
-- Name: idx_role_policies_active; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_role_policies_active ON auth.role_policies USING btree (is_active);


--
-- Name: idx_role_policies_policy_active; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_role_policies_policy_active ON auth.role_policies USING btree (policy_id, is_active);


--
-- Name: idx_role_policies_policy_id; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_role_policies_policy_id ON auth.role_policies USING btree (policy_id);


--
-- Name: idx_role_policies_role_active; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_role_policies_role_active ON auth.role_policies USING btree (role_id, is_active);


--
-- Name: idx_role_policies_role_id; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_role_policies_role_id ON auth.role_policies USING btree (role_id);


--
-- Name: user_tenant_acl_251103_board_id_employer_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_tenant_acl_251103_board_id_employer_id_idx ON auth.user_tenant_acl_251103 USING btree (board_id, employer_id);


--
-- Name: user_tenant_acl_251103_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_tenant_acl_251103_updated_at_idx ON auth.user_tenant_acl_251103 USING btree (updated_at);


--
-- Name: user_tenant_acl_251103_user_id_board_id_employer_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_tenant_acl_251103_user_id_board_id_employer_id_idx ON auth.user_tenant_acl_251103 USING btree (user_id, board_id, employer_id);


--
-- Name: user_tenant_acl_251103_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_tenant_acl_251103_user_id_idx ON auth.user_tenant_acl_251103 USING btree (user_id);


--
-- Name: idx_board_receipts_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_board_receipts_board_employer ON payment_flow.board_receipts USING btree (board_id, employer_id);


--
-- Name: idx_employer_payment_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_employer_payment_board_employer ON payment_flow.employer_payment_receipts USING btree (board_id, employer_id);


--
-- Name: idx_employer_toli_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_employer_toli_board_employer ON payment_flow.employer_toli_relation USING btree (board_id, employer_id);


--
-- Name: idx_uploaded_files_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_uploaded_files_board_employer ON payment_flow.uploaded_files USING btree (board_id, employer_id);


--
-- Name: idx_worker_payment_receipts_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_worker_payment_receipts_board_employer ON payment_flow.worker_payment_receipts USING btree (board_id, employer_id);


--
-- Name: idx_worker_payments_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_worker_payments_board_employer ON payment_flow.worker_payments USING btree (board_id, employer_id);


--
-- Name: idx_worker_uploaded_data_board_employer; Type: INDEX; Schema: payment_flow; Owner: -
--

CREATE INDEX idx_worker_uploaded_data_board_employer ON payment_flow.worker_uploaded_data USING btree (board_id, employer_id);


--
-- Name: idx_bank_account_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_bank_account_board_employer ON reconciliation.bank_account USING btree (board_id, employer_id);


--
-- Name: idx_file_processing_queue_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_file_processing_queue_board_employer ON reconciliation.file_processing_queue USING btree (board_id, employer_id);


--
-- Name: idx_import_error_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_import_error_board_employer ON reconciliation.import_error USING btree (board_id, employer_id);


--
-- Name: idx_import_run_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_import_run_board_employer ON reconciliation.import_run USING btree (board_id, employer_id);


--
-- Name: idx_raw_statement_line_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_raw_statement_line_board_employer ON reconciliation.raw_statement_line USING btree (board_id, employer_id);


--
-- Name: idx_statement_balance_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_statement_balance_board_employer ON reconciliation.statement_balance USING btree (board_id, employer_id);


--
-- Name: idx_statement_file_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_statement_file_board_employer ON reconciliation.statement_file USING btree (board_id, employer_id);


--
-- Name: idx_statement_transaction_board_employer; Type: INDEX; Schema: reconciliation; Owner: -
--

CREATE INDEX idx_statement_transaction_board_employer ON reconciliation.statement_transaction USING btree (board_id, employer_id);


--
-- Name: user_tenant_acl fk_acl_user; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_tenant_acl
    ADD CONSTRAINT fk_acl_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: endpoint_policies fk_endpoint_policies_endpoint; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT fk_endpoint_policies_endpoint FOREIGN KEY (endpoint_id) REFERENCES auth.endpoints(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: endpoint_policies fk_endpoint_policies_policy; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.endpoint_policies
    ADD CONSTRAINT fk_endpoint_policies_policy FOREIGN KEY (policy_id) REFERENCES auth.policies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: page_actions fk_page_actions_endpoint; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT fk_page_actions_endpoint FOREIGN KEY (endpoint_id) REFERENCES auth.endpoints(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: page_actions fk_page_actions_page; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.page_actions
    ADD CONSTRAINT fk_page_actions_page FOREIGN KEY (page_id) REFERENCES auth.ui_pages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: revoked_tokens fk_revoked_tokens_user; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.revoked_tokens
    ADD CONSTRAINT fk_revoked_tokens_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_policies fk_role_policies_assigned_by; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_assigned_by FOREIGN KEY (assigned_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: role_policies fk_role_policies_policy; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_policy FOREIGN KEY (policy_id) REFERENCES auth.policies(id) ON DELETE CASCADE;


--
-- Name: role_policies fk_role_policies_role; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.role_policies
    ADD CONSTRAINT fk_role_policies_role FOREIGN KEY (role_id) REFERENCES auth.roles(id) ON DELETE CASCADE;


--
-- Name: ui_pages fk_ui_pages_parent; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.ui_pages
    ADD CONSTRAINT fk_ui_pages_parent FOREIGN KEY (parent_id) REFERENCES auth.ui_pages(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_roles fk_user_roles_role; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES auth.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_roles fk_user_roles_user; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_roles
    ADD CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: toli_details toli_details_toli_id_fkey; Type: FK CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_details
    ADD CONSTRAINT toli_details_toli_id_fkey FOREIGN KEY (toli_id) REFERENCES payment_flow.toli_master(id);


--
-- Name: toli_details toli_details_worker_id_fkey; Type: FK CONSTRAINT; Schema: payment_flow; Owner: -
--

ALTER TABLE ONLY payment_flow.toli_details
    ADD CONSTRAINT toli_details_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES payment_flow.worker_master(id);


--
-- Name: van_file van_file_fk_van_file_import_run; Type: FK CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.van_file
    ADD CONSTRAINT van_file_fk_van_file_import_run FOREIGN KEY (import_run_id) REFERENCES reconciliation.import_run(id);


--
-- Name: van_transaction van_transaction_fk_van_transaction_import_run; Type: FK CONSTRAINT; Schema: reconciliation; Owner: -
--

ALTER TABLE ONLY reconciliation.van_transaction
    ADD CONSTRAINT van_transaction_fk_van_transaction_import_run FOREIGN KEY (import_run_id) REFERENCES reconciliation.import_run(id);


--
-- Name: board_master; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.board_master ENABLE ROW LEVEL SECURITY;

--
-- Name: board_master board_master_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY board_master_std_read ON payment_flow.board_master USING (((board_id)::text = current_setting('app.current_board_id'::text)));


--
-- Name: board_master board_master_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY board_master_std_write ON payment_flow.board_master USING (((board_id)::text = current_setting('app.current_board_id'::text)));


--
-- Name: board_receipts; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.board_receipts ENABLE ROW LEVEL SECURITY;

--
-- Name: board_receipts board_receipts_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY board_receipts_std_read ON payment_flow.board_receipts FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: board_receipts board_receipts_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY board_receipts_std_write ON payment_flow.board_receipts USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: employer_payment_receipts; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.employer_payment_receipts ENABLE ROW LEVEL SECURITY;

--
-- Name: employer_payment_receipts employer_payment_receipts_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY employer_payment_receipts_std_read ON payment_flow.employer_payment_receipts FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: employer_payment_receipts employer_payment_receipts_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY employer_payment_receipts_std_write ON payment_flow.employer_payment_receipts USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: employer_toli_relation; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.employer_toli_relation ENABLE ROW LEVEL SECURITY;

--
-- Name: employer_toli_relation employer_toli_relation_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY employer_toli_relation_std_read ON payment_flow.employer_toli_relation FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: employer_toli_relation employer_toli_relation_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY employer_toli_relation_std_write ON payment_flow.employer_toli_relation USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: uploaded_files; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.uploaded_files ENABLE ROW LEVEL SECURITY;

--
-- Name: uploaded_files uploaded_files_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY uploaded_files_std_read ON payment_flow.uploaded_files FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: uploaded_files uploaded_files_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY uploaded_files_std_write ON payment_flow.uploaded_files USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: worker_payment_receipts; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_payment_receipts ENABLE ROW LEVEL SECURITY;

--
-- Name: worker_payment_receipts worker_payment_receipts_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_payment_receipts_std_read ON payment_flow.worker_payment_receipts FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: worker_payment_receipts worker_payment_receipts_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_payment_receipts_std_write ON payment_flow.worker_payment_receipts USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: worker_payments; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_payments ENABLE ROW LEVEL SECURITY;

--
-- Name: worker_payments worker_payments_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_payments_std_read ON payment_flow.worker_payments FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: worker_payments worker_payments_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_payments_std_write ON payment_flow.worker_payments USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: worker_uploaded_data; Type: ROW SECURITY; Schema: payment_flow; Owner: -
--

ALTER TABLE payment_flow.worker_uploaded_data ENABLE ROW LEVEL SECURITY;

--
-- Name: worker_uploaded_data worker_uploaded_data_std_read; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_uploaded_data_std_read ON payment_flow.worker_uploaded_data FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: worker_uploaded_data worker_uploaded_data_std_write; Type: POLICY; Schema: payment_flow; Owner: -
--

CREATE POLICY worker_uploaded_data_std_write ON payment_flow.worker_uploaded_data USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: bank_account; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.bank_account ENABLE ROW LEVEL SECURITY;

--
-- Name: bank_account bank_account_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY bank_account_std_read ON reconciliation.bank_account FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: bank_account bank_account_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY bank_account_std_write ON reconciliation.bank_account USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: file_processing_queue; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.file_processing_queue ENABLE ROW LEVEL SECURITY;

--
-- Name: file_processing_queue file_processing_queue_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY file_processing_queue_std_read ON reconciliation.file_processing_queue FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: file_processing_queue file_processing_queue_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY file_processing_queue_std_write ON reconciliation.file_processing_queue USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: import_error; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.import_error ENABLE ROW LEVEL SECURITY;

--
-- Name: import_error import_error_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY import_error_std_read ON reconciliation.import_error FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: import_error import_error_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY import_error_std_write ON reconciliation.import_error USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: import_run; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.import_run ENABLE ROW LEVEL SECURITY;

--
-- Name: import_run import_run_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY import_run_std_read ON reconciliation.import_run FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: import_run import_run_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY import_run_std_write ON reconciliation.import_run USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: raw_statement_line; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.raw_statement_line ENABLE ROW LEVEL SECURITY;

--
-- Name: raw_statement_line raw_statement_line_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY raw_statement_line_std_read ON reconciliation.raw_statement_line FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: raw_statement_line raw_statement_line_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY raw_statement_line_std_write ON reconciliation.raw_statement_line USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: statement_balance; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_balance ENABLE ROW LEVEL SECURITY;

--
-- Name: statement_balance statement_balance_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_balance_std_read ON reconciliation.statement_balance FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: statement_balance statement_balance_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_balance_std_write ON reconciliation.statement_balance USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: statement_file; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_file ENABLE ROW LEVEL SECURITY;

--
-- Name: statement_file statement_file_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_file_std_read ON reconciliation.statement_file FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: statement_file statement_file_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_file_std_write ON reconciliation.statement_file USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- Name: statement_transaction; Type: ROW SECURITY; Schema: reconciliation; Owner: -
--

ALTER TABLE reconciliation.statement_transaction ENABLE ROW LEVEL SECURITY;

--
-- Name: statement_transaction statement_transaction_std_read; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_transaction_std_read ON reconciliation.statement_transaction FOR SELECT USING (auth.can_read_row(board_id, employer_id));


--
-- Name: statement_transaction statement_transaction_std_write; Type: POLICY; Schema: reconciliation; Owner: -
--

CREATE POLICY statement_transaction_std_write ON reconciliation.statement_transaction USING (auth.can_write_row(board_id, employer_id)) WITH CHECK (auth.can_write_row(board_id, employer_id));


--
-- PostgreSQL database dump complete
--

\unrestrict KhupiCfjLeP2xhdJ0I3VscKsJaEQ6HaoFKqi9vfSo5egFf5tVA6WVWc1WgjQPio

