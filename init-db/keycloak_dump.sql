--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: org; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO postgres;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
e187eec3-acd2-45cd-ba8b-0b3bfe498f50	\N	auth-cookie	a29ac0cc-6643-4c10-86aa-b45218f74a2a	23805b35-1f03-4c6a-8725-c99b9db7eec9	2	10	f	\N	\N
4824e646-a116-4bad-a4dc-0321843355bf	\N	auth-spnego	a29ac0cc-6643-4c10-86aa-b45218f74a2a	23805b35-1f03-4c6a-8725-c99b9db7eec9	3	20	f	\N	\N
9a72d2cf-0103-4ff0-9298-b3ee9e32c99d	\N	identity-provider-redirector	a29ac0cc-6643-4c10-86aa-b45218f74a2a	23805b35-1f03-4c6a-8725-c99b9db7eec9	2	25	f	\N	\N
b8850245-8116-484d-a85f-1545bbf50bed	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	23805b35-1f03-4c6a-8725-c99b9db7eec9	2	30	t	c73b1f42-6417-4193-a146-6dc895f1bbbb	\N
51d9a59f-b069-4917-90cd-b28ff057042c	\N	auth-username-password-form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	c73b1f42-6417-4193-a146-6dc895f1bbbb	0	10	f	\N	\N
fab0af6d-b182-4c3d-b7c0-7e21c3913023	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	c73b1f42-6417-4193-a146-6dc895f1bbbb	1	20	t	581c53f4-55b0-49df-87f8-7cecd4b3d6df	\N
2deff61f-bdb3-4472-8d81-fbe8e5ad479c	\N	conditional-user-configured	a29ac0cc-6643-4c10-86aa-b45218f74a2a	581c53f4-55b0-49df-87f8-7cecd4b3d6df	0	10	f	\N	\N
23c2a080-2b9b-4f8f-8e1a-915c50b6b8f7	\N	auth-otp-form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	581c53f4-55b0-49df-87f8-7cecd4b3d6df	0	20	f	\N	\N
e99a4713-e5c5-41ba-8e19-a74fab6bf254	\N	direct-grant-validate-username	a29ac0cc-6643-4c10-86aa-b45218f74a2a	863208ad-4346-4717-a16f-8487f899b497	0	10	f	\N	\N
9441add0-01cf-4120-b2fd-48b0957b1172	\N	direct-grant-validate-password	a29ac0cc-6643-4c10-86aa-b45218f74a2a	863208ad-4346-4717-a16f-8487f899b497	0	20	f	\N	\N
59d73fcd-159d-4dc2-bdf4-95828eb8cb3e	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	863208ad-4346-4717-a16f-8487f899b497	1	30	t	fc658ab5-cc46-4e27-9a26-1fa0b5041560	\N
c6d30525-df15-4aed-8023-a9ca3eca8901	\N	conditional-user-configured	a29ac0cc-6643-4c10-86aa-b45218f74a2a	fc658ab5-cc46-4e27-9a26-1fa0b5041560	0	10	f	\N	\N
94d8f466-3b29-4d14-8841-1abd0e269877	\N	direct-grant-validate-otp	a29ac0cc-6643-4c10-86aa-b45218f74a2a	fc658ab5-cc46-4e27-9a26-1fa0b5041560	0	20	f	\N	\N
8543b4e7-d2fb-4d56-9734-c976cbd3b56f	\N	registration-page-form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	1fa1501a-da4b-4e26-ab39-da0b1a11cf7c	0	10	t	923eece0-2253-4fbd-87ca-9c5087cb9a55	\N
2f5f11b8-3952-42bc-80f3-9974db2cb332	\N	registration-user-creation	a29ac0cc-6643-4c10-86aa-b45218f74a2a	923eece0-2253-4fbd-87ca-9c5087cb9a55	0	20	f	\N	\N
107e7eeb-5b43-4ebb-beb4-d0a277021206	\N	registration-password-action	a29ac0cc-6643-4c10-86aa-b45218f74a2a	923eece0-2253-4fbd-87ca-9c5087cb9a55	0	50	f	\N	\N
cfc37a74-c8bd-4e99-8cad-e16237a5ce2a	\N	registration-recaptcha-action	a29ac0cc-6643-4c10-86aa-b45218f74a2a	923eece0-2253-4fbd-87ca-9c5087cb9a55	3	60	f	\N	\N
cc874063-dca6-4f61-8928-ce6b1ad3f484	\N	registration-terms-and-conditions	a29ac0cc-6643-4c10-86aa-b45218f74a2a	923eece0-2253-4fbd-87ca-9c5087cb9a55	3	70	f	\N	\N
b309f8e4-fac2-477a-8014-8e6128176822	\N	reset-credentials-choose-user	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a36a687a-c623-4a1c-be7b-8d5670db045a	0	10	f	\N	\N
e070ee03-cd15-4526-86b3-bb19a8134e1f	\N	reset-credential-email	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a36a687a-c623-4a1c-be7b-8d5670db045a	0	20	f	\N	\N
15ace7d7-8438-4613-8810-50fdf384f38f	\N	reset-password	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a36a687a-c623-4a1c-be7b-8d5670db045a	0	30	f	\N	\N
2de22a7f-d223-403c-a918-fa5777e5ee09	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a36a687a-c623-4a1c-be7b-8d5670db045a	1	40	t	a5104e4a-9933-4138-8714-a5b591a77b53	\N
fb8b3265-edc2-4136-b82b-ebc36c8c13e8	\N	conditional-user-configured	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a5104e4a-9933-4138-8714-a5b591a77b53	0	10	f	\N	\N
987705ec-d252-419e-bfb8-1bde3627527e	\N	reset-otp	a29ac0cc-6643-4c10-86aa-b45218f74a2a	a5104e4a-9933-4138-8714-a5b591a77b53	0	20	f	\N	\N
78e73811-8faf-46e9-99e0-5f6ea1ad78bc	\N	client-secret	a29ac0cc-6643-4c10-86aa-b45218f74a2a	82d9a740-cc23-4ecd-9f67-f1184421a705	2	10	f	\N	\N
d452b041-d8a4-4cda-a900-84dc03d0a99b	\N	client-jwt	a29ac0cc-6643-4c10-86aa-b45218f74a2a	82d9a740-cc23-4ecd-9f67-f1184421a705	2	20	f	\N	\N
4165f92c-cbac-4fbd-8d2a-ac94b7b09672	\N	client-secret-jwt	a29ac0cc-6643-4c10-86aa-b45218f74a2a	82d9a740-cc23-4ecd-9f67-f1184421a705	2	30	f	\N	\N
cda294d1-655c-44bd-8fd5-7b0cebe89268	\N	client-x509	a29ac0cc-6643-4c10-86aa-b45218f74a2a	82d9a740-cc23-4ecd-9f67-f1184421a705	2	40	f	\N	\N
1d920cb3-24c4-482c-83ae-b043eaf6293b	\N	idp-review-profile	a29ac0cc-6643-4c10-86aa-b45218f74a2a	b112a87c-439f-415c-aef8-e9ebdc25f41c	0	10	f	\N	c977b3d0-5a24-4445-bc55-933e7690b3a0
6e40c040-69e4-4e46-bf67-3b065e6b2af4	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	b112a87c-439f-415c-aef8-e9ebdc25f41c	0	20	t	f7db1460-5ef1-4fee-826a-803719e3c516	\N
b1292390-c34a-4514-8fe7-56a32c008fdd	\N	idp-create-user-if-unique	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f7db1460-5ef1-4fee-826a-803719e3c516	2	10	f	\N	3bea99dc-3229-4cce-b0f9-a6234b06bd38
83f5a197-1f8d-487e-9d5f-cdc994f8f8ef	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f7db1460-5ef1-4fee-826a-803719e3c516	2	20	t	41b7727a-76d1-42ab-8817-490f1dbac127	\N
6b125cae-c8fd-42db-ab33-f33abda88b51	\N	idp-confirm-link	a29ac0cc-6643-4c10-86aa-b45218f74a2a	41b7727a-76d1-42ab-8817-490f1dbac127	0	10	f	\N	\N
dc9942b6-5ed9-41f6-8801-143a0e120e44	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	41b7727a-76d1-42ab-8817-490f1dbac127	0	20	t	3fbccc8a-8654-494b-9af7-4da3a56138b8	\N
852558e9-4e0e-4ad7-a91f-d7786fdeab61	\N	idp-email-verification	a29ac0cc-6643-4c10-86aa-b45218f74a2a	3fbccc8a-8654-494b-9af7-4da3a56138b8	2	10	f	\N	\N
d8906297-299a-4d34-a294-d902bf43ec54	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	3fbccc8a-8654-494b-9af7-4da3a56138b8	2	20	t	77462726-49d6-4541-a460-bb62f7828047	\N
97bf8248-2947-424f-bc36-72d2d0649a90	\N	idp-username-password-form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	77462726-49d6-4541-a460-bb62f7828047	0	10	f	\N	\N
b70bdce6-bf42-4612-8bef-f00670888963	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	77462726-49d6-4541-a460-bb62f7828047	1	20	t	2ac1b966-d491-46ef-9a7b-1075b2cf354c	\N
b89884e8-b2ba-419c-892a-8b344031f7fa	\N	conditional-user-configured	a29ac0cc-6643-4c10-86aa-b45218f74a2a	2ac1b966-d491-46ef-9a7b-1075b2cf354c	0	10	f	\N	\N
b4e22987-000c-43b3-920d-d02cd14a5dc0	\N	auth-otp-form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	2ac1b966-d491-46ef-9a7b-1075b2cf354c	0	20	f	\N	\N
216923c6-288a-437b-8fa7-0bfda870c984	\N	http-basic-authenticator	a29ac0cc-6643-4c10-86aa-b45218f74a2a	be882ff6-8a0b-4aec-ab4a-42db2945b619	0	10	f	\N	\N
51c2d57d-abc8-476f-a60e-bdb281cad448	\N	docker-http-basic-authenticator	a29ac0cc-6643-4c10-86aa-b45218f74a2a	decbf1fd-2fd6-4f38-a4a7-0170797c2853	0	10	f	\N	\N
2181d077-ac25-4c2c-a071-1c93a0ec3f89	\N	auth-cookie	979582be-1e58-424d-ace1-ad20c44dfb71	1c203ce2-17c2-426b-abd2-84a25dc16a4d	2	10	f	\N	\N
b02ce7bb-4069-4579-8623-d38a0a91ba36	\N	auth-spnego	979582be-1e58-424d-ace1-ad20c44dfb71	1c203ce2-17c2-426b-abd2-84a25dc16a4d	3	20	f	\N	\N
a211da21-9a26-4f8b-9e25-3a09e5e0630a	\N	identity-provider-redirector	979582be-1e58-424d-ace1-ad20c44dfb71	1c203ce2-17c2-426b-abd2-84a25dc16a4d	2	25	f	\N	\N
801e017e-2e5f-4b2b-86fe-9080d51ca8fa	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	1c203ce2-17c2-426b-abd2-84a25dc16a4d	2	30	t	87290c1e-9c7e-44e8-8136-3a6cc8f54d6d	\N
a04649fd-d2d1-4703-872d-d29ea2f6ff89	\N	auth-username-password-form	979582be-1e58-424d-ace1-ad20c44dfb71	87290c1e-9c7e-44e8-8136-3a6cc8f54d6d	0	10	f	\N	\N
b8aa7c3b-0219-4e90-b0f9-5aa5d7483dee	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	87290c1e-9c7e-44e8-8136-3a6cc8f54d6d	1	20	t	ccb90478-6466-4c64-9046-ca71b3181a52	\N
5a0d1a38-00db-47b1-84a0-ab9a98b020c2	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	ccb90478-6466-4c64-9046-ca71b3181a52	0	10	f	\N	\N
e5ae473b-b64f-42c7-ad8f-834684b525f1	\N	auth-otp-form	979582be-1e58-424d-ace1-ad20c44dfb71	ccb90478-6466-4c64-9046-ca71b3181a52	0	20	f	\N	\N
d97b05bb-7798-4866-9fbf-4a8031ea2227	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	1c203ce2-17c2-426b-abd2-84a25dc16a4d	2	26	t	9e6b5fb4-ae28-4901-b084-91b5a1866dca	\N
af88b328-4960-4385-987c-4ce56fa01a75	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	9e6b5fb4-ae28-4901-b084-91b5a1866dca	1	10	t	12c0821c-cdef-4fad-96d5-533ba2bb2626	\N
c9c28c14-ffb5-4a7a-9f6c-4302f4e870aa	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	12c0821c-cdef-4fad-96d5-533ba2bb2626	0	10	f	\N	\N
de4df9b9-4a2c-4c20-94c2-6ca30ed57880	\N	organization	979582be-1e58-424d-ace1-ad20c44dfb71	12c0821c-cdef-4fad-96d5-533ba2bb2626	2	20	f	\N	\N
8d3d92bd-ea76-4f4d-a1f2-1b049c757da5	\N	direct-grant-validate-username	979582be-1e58-424d-ace1-ad20c44dfb71	84f0a759-a459-4944-8ba0-2c9ab5c785ac	0	10	f	\N	\N
c83bfdac-d41c-4c2f-8a97-b1e8dc7d4d89	\N	direct-grant-validate-password	979582be-1e58-424d-ace1-ad20c44dfb71	84f0a759-a459-4944-8ba0-2c9ab5c785ac	0	20	f	\N	\N
7aa760ce-fe4b-4512-83cf-08c8de8dd2f5	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	84f0a759-a459-4944-8ba0-2c9ab5c785ac	1	30	t	29404b47-19ab-4872-ae06-0d895e362d23	\N
cc19d2b3-0fbc-484d-9a2a-6413cce625bc	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	29404b47-19ab-4872-ae06-0d895e362d23	0	10	f	\N	\N
4d112c32-0c52-48c8-b438-ccdd8a6b949b	\N	direct-grant-validate-otp	979582be-1e58-424d-ace1-ad20c44dfb71	29404b47-19ab-4872-ae06-0d895e362d23	0	20	f	\N	\N
383c5cab-3943-482a-8250-658eed9af6f2	\N	registration-page-form	979582be-1e58-424d-ace1-ad20c44dfb71	e432001b-5e19-4359-b035-630f4838174c	0	10	t	178ea7c6-a693-4f71-bd90-154951468fbe	\N
2ee2661b-de2a-4f76-bccf-c0eb3e314d83	\N	registration-user-creation	979582be-1e58-424d-ace1-ad20c44dfb71	178ea7c6-a693-4f71-bd90-154951468fbe	0	20	f	\N	\N
94c8958d-218b-4452-af9c-7422b61ab421	\N	registration-password-action	979582be-1e58-424d-ace1-ad20c44dfb71	178ea7c6-a693-4f71-bd90-154951468fbe	0	50	f	\N	\N
250c44a5-43b0-448c-b588-404a4defa4ca	\N	registration-recaptcha-action	979582be-1e58-424d-ace1-ad20c44dfb71	178ea7c6-a693-4f71-bd90-154951468fbe	3	60	f	\N	\N
c0237f38-b1c9-423d-850a-9be7c4bde571	\N	registration-terms-and-conditions	979582be-1e58-424d-ace1-ad20c44dfb71	178ea7c6-a693-4f71-bd90-154951468fbe	3	70	f	\N	\N
d83af948-f9ac-4a2e-b5f0-93fde4f93b45	\N	reset-credentials-choose-user	979582be-1e58-424d-ace1-ad20c44dfb71	0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	0	10	f	\N	\N
b5c6084a-3efc-4996-a799-53b7da655e28	\N	reset-credential-email	979582be-1e58-424d-ace1-ad20c44dfb71	0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	0	20	f	\N	\N
297d6ef4-cb2c-40e4-9f61-9ae98134a3c9	\N	reset-password	979582be-1e58-424d-ace1-ad20c44dfb71	0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	0	30	f	\N	\N
ef3283fc-75d9-4a11-90f0-739e9a6515fe	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	1	40	t	c7caf6eb-72eb-4ccd-b091-1099c511f255	\N
02ea5445-aed5-45af-b84e-fce92e6b1a60	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	c7caf6eb-72eb-4ccd-b091-1099c511f255	0	10	f	\N	\N
58df8f0c-7380-46ed-b0f6-ee4db54f1a46	\N	reset-otp	979582be-1e58-424d-ace1-ad20c44dfb71	c7caf6eb-72eb-4ccd-b091-1099c511f255	0	20	f	\N	\N
254cb5b1-3b06-4f04-9945-ba160ab486d5	\N	client-secret	979582be-1e58-424d-ace1-ad20c44dfb71	f760bacd-7bb2-499a-8eef-e4a7631def88	2	10	f	\N	\N
a4736a74-094e-45d0-b51d-9100e6a0776a	\N	client-jwt	979582be-1e58-424d-ace1-ad20c44dfb71	f760bacd-7bb2-499a-8eef-e4a7631def88	2	20	f	\N	\N
11693d96-31b5-468c-8d83-8b4ebf73ecba	\N	client-secret-jwt	979582be-1e58-424d-ace1-ad20c44dfb71	f760bacd-7bb2-499a-8eef-e4a7631def88	2	30	f	\N	\N
e17d0591-9007-4a57-8ed0-6efc6e7dcdc5	\N	client-x509	979582be-1e58-424d-ace1-ad20c44dfb71	f760bacd-7bb2-499a-8eef-e4a7631def88	2	40	f	\N	\N
116ea109-c278-4a29-8718-cc0be2d5209b	\N	idp-review-profile	979582be-1e58-424d-ace1-ad20c44dfb71	3353e7f2-3dde-409c-96d9-84e7e06a6a4e	0	10	f	\N	abb5e2df-ee67-4c44-95f4-6cd79add0e40
524e15a0-6e63-4dc7-b29d-f5f563999989	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	3353e7f2-3dde-409c-96d9-84e7e06a6a4e	0	20	t	1be76472-0668-406a-8bd2-2deca8bf1e42	\N
1bbfd649-c792-4499-b91f-42ab2b976a54	\N	idp-create-user-if-unique	979582be-1e58-424d-ace1-ad20c44dfb71	1be76472-0668-406a-8bd2-2deca8bf1e42	2	10	f	\N	44936e4a-09fe-4786-81bb-9f7a693688d8
8f4ae499-a8a9-4a05-bb79-1ac59104cb46	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	1be76472-0668-406a-8bd2-2deca8bf1e42	2	20	t	88e6bcc2-eebd-4a7f-a0fa-ba3d14ffc98b	\N
02a8857a-528b-4143-a599-6ace0d53ee3a	\N	idp-confirm-link	979582be-1e58-424d-ace1-ad20c44dfb71	88e6bcc2-eebd-4a7f-a0fa-ba3d14ffc98b	0	10	f	\N	\N
b7f1ac4a-501c-4abe-a83e-32ba1cbb202a	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	88e6bcc2-eebd-4a7f-a0fa-ba3d14ffc98b	0	20	t	1235d039-3cf1-480a-8ab3-8bd268bf1ee1	\N
4a57e278-d45b-4fe5-a0c7-c2b6415fe010	\N	idp-email-verification	979582be-1e58-424d-ace1-ad20c44dfb71	1235d039-3cf1-480a-8ab3-8bd268bf1ee1	2	10	f	\N	\N
3bdb30a8-3c47-4a9b-a116-c767c7e5a632	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	1235d039-3cf1-480a-8ab3-8bd268bf1ee1	2	20	t	b2637f99-7212-44df-a8e8-598835f71a3d	\N
edb4cbbd-60ef-40a5-89bc-6574a7eede8a	\N	idp-username-password-form	979582be-1e58-424d-ace1-ad20c44dfb71	b2637f99-7212-44df-a8e8-598835f71a3d	0	10	f	\N	\N
3e664612-d63f-4f9c-a7dc-72f9c7be966d	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	b2637f99-7212-44df-a8e8-598835f71a3d	1	20	t	1504bffd-24b6-4a14-b4a4-a459ebc87dd4	\N
f09922d8-0323-4ebe-a630-468634d997d6	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	1504bffd-24b6-4a14-b4a4-a459ebc87dd4	0	10	f	\N	\N
10edd4b8-19c6-4d5d-8553-f737683e689f	\N	auth-otp-form	979582be-1e58-424d-ace1-ad20c44dfb71	1504bffd-24b6-4a14-b4a4-a459ebc87dd4	0	20	f	\N	\N
bcd8ef9d-ffc3-47eb-bc13-3224d04c941a	\N	\N	979582be-1e58-424d-ace1-ad20c44dfb71	3353e7f2-3dde-409c-96d9-84e7e06a6a4e	1	50	t	7ba704ed-f29f-41e7-b6a2-beabd467d457	\N
05428973-0ff8-4661-afa1-0ea89e5ddb9a	\N	conditional-user-configured	979582be-1e58-424d-ace1-ad20c44dfb71	7ba704ed-f29f-41e7-b6a2-beabd467d457	0	10	f	\N	\N
61a9f2e0-9cd0-4ff3-8446-493a4889a96c	\N	idp-add-organization-member	979582be-1e58-424d-ace1-ad20c44dfb71	7ba704ed-f29f-41e7-b6a2-beabd467d457	0	20	f	\N	\N
7b40eb0c-25ae-4fe6-9752-d9bc5cf04d66	\N	http-basic-authenticator	979582be-1e58-424d-ace1-ad20c44dfb71	d55608e9-9949-4555-8192-876d8f15aee1	0	10	f	\N	\N
54c8214a-84a7-43c0-a167-1dc9bc6bac28	\N	docker-http-basic-authenticator	979582be-1e58-424d-ace1-ad20c44dfb71	c88f0458-454e-465b-b97b-bb7da2d50f8e	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
23805b35-1f03-4c6a-8725-c99b9db7eec9	browser	Browser based authentication	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
c73b1f42-6417-4193-a146-6dc895f1bbbb	forms	Username, password, otp and other auth forms.	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
581c53f4-55b0-49df-87f8-7cecd4b3d6df	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
863208ad-4346-4717-a16f-8487f899b497	direct grant	OpenID Connect Resource Owner Grant	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
fc658ab5-cc46-4e27-9a26-1fa0b5041560	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
1fa1501a-da4b-4e26-ab39-da0b1a11cf7c	registration	Registration flow	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
923eece0-2253-4fbd-87ca-9c5087cb9a55	registration form	Registration form	a29ac0cc-6643-4c10-86aa-b45218f74a2a	form-flow	f	t
a36a687a-c623-4a1c-be7b-8d5670db045a	reset credentials	Reset credentials for a user if they forgot their password or something	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
a5104e4a-9933-4138-8714-a5b591a77b53	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
82d9a740-cc23-4ecd-9f67-f1184421a705	clients	Base authentication for clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	client-flow	t	t
b112a87c-439f-415c-aef8-e9ebdc25f41c	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
f7db1460-5ef1-4fee-826a-803719e3c516	User creation or linking	Flow for the existing/non-existing user alternatives	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
41b7727a-76d1-42ab-8817-490f1dbac127	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
3fbccc8a-8654-494b-9af7-4da3a56138b8	Account verification options	Method with which to verity the existing account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
77462726-49d6-4541-a460-bb62f7828047	Verify Existing Account by Re-authentication	Reauthentication of existing account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
2ac1b966-d491-46ef-9a7b-1075b2cf354c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	f	t
be882ff6-8a0b-4aec-ab4a-42db2945b619	saml ecp	SAML ECP Profile Authentication Flow	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
decbf1fd-2fd6-4f38-a4a7-0170797c2853	docker auth	Used by Docker clients to authenticate against the IDP	a29ac0cc-6643-4c10-86aa-b45218f74a2a	basic-flow	t	t
1c203ce2-17c2-426b-abd2-84a25dc16a4d	browser	Browser based authentication	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
87290c1e-9c7e-44e8-8136-3a6cc8f54d6d	forms	Username, password, otp and other auth forms.	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
ccb90478-6466-4c64-9046-ca71b3181a52	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
9e6b5fb4-ae28-4901-b084-91b5a1866dca	Organization	\N	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
12c0821c-cdef-4fad-96d5-533ba2bb2626	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
84f0a759-a459-4944-8ba0-2c9ab5c785ac	direct grant	OpenID Connect Resource Owner Grant	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
29404b47-19ab-4872-ae06-0d895e362d23	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
e432001b-5e19-4359-b035-630f4838174c	registration	Registration flow	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
178ea7c6-a693-4f71-bd90-154951468fbe	registration form	Registration form	979582be-1e58-424d-ace1-ad20c44dfb71	form-flow	f	t
0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	reset credentials	Reset credentials for a user if they forgot their password or something	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
c7caf6eb-72eb-4ccd-b091-1099c511f255	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
f760bacd-7bb2-499a-8eef-e4a7631def88	clients	Base authentication for clients	979582be-1e58-424d-ace1-ad20c44dfb71	client-flow	t	t
3353e7f2-3dde-409c-96d9-84e7e06a6a4e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
1be76472-0668-406a-8bd2-2deca8bf1e42	User creation or linking	Flow for the existing/non-existing user alternatives	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
88e6bcc2-eebd-4a7f-a0fa-ba3d14ffc98b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
1235d039-3cf1-480a-8ab3-8bd268bf1ee1	Account verification options	Method with which to verity the existing account	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
b2637f99-7212-44df-a8e8-598835f71a3d	Verify Existing Account by Re-authentication	Reauthentication of existing account	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
1504bffd-24b6-4a14-b4a4-a459ebc87dd4	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
7ba704ed-f29f-41e7-b6a2-beabd467d457	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	f	t
d55608e9-9949-4555-8192-876d8f15aee1	saml ecp	SAML ECP Profile Authentication Flow	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
c88f0458-454e-465b-b97b-bb7da2d50f8e	docker auth	Used by Docker clients to authenticate against the IDP	979582be-1e58-424d-ace1-ad20c44dfb71	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
c977b3d0-5a24-4445-bc55-933e7690b3a0	review profile config	a29ac0cc-6643-4c10-86aa-b45218f74a2a
3bea99dc-3229-4cce-b0f9-a6234b06bd38	create unique user config	a29ac0cc-6643-4c10-86aa-b45218f74a2a
abb5e2df-ee67-4c44-95f4-6cd79add0e40	review profile config	979582be-1e58-424d-ace1-ad20c44dfb71
44936e4a-09fe-4786-81bb-9f7a693688d8	create unique user config	979582be-1e58-424d-ace1-ad20c44dfb71
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
3bea99dc-3229-4cce-b0f9-a6234b06bd38	false	require.password.update.after.registration
c977b3d0-5a24-4445-bc55-933e7690b3a0	missing	update.profile.on.first.login
44936e4a-09fe-4786-81bb-9f7a693688d8	false	require.password.update.after.registration
abb5e2df-ee67-4c44-95f4-6cd79add0e40	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
d489c56a-9d28-4ac0-bf37-a61810209943	t	f	master-realm	0	f	\N	\N	t	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5413cc4f-9a62-48bd-befd-738a7c4957de	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
eb5dca20-0317-41ff-8b1d-4908012b9246	t	f	broker	0	f	\N	\N	t	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
515ac3a5-fd27-41ec-8890-955306cefb34	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9cc4367d-096e-46db-881a-4103ef296533	t	t	admin-cli	0	t	\N	\N	f	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
dec212c2-1781-4a06-b380-896f4cce4da8	t	f	hackaton-realm	0	f	\N	\N	t	\N	f	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	0	f	f	hackaton Realm	f	client-secret	\N	\N	\N	t	f	f	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	f	realm-management	0	f	\N	\N	t	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
cb95ffcf-49dc-44df-a909-9452d782e304	t	f	account	0	t	\N	/realms/hackaton/account/	f	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	t	f	account-console	0	t	\N	/realms/hackaton/account/	f	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2811c445-a13c-400b-876d-dc6ef101a891	t	f	broker	0	f	\N	\N	t	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f727b726-7af6-4163-83db-9d39cc43b4cd	t	t	security-admin-console	0	t	\N	/admin/hackaton/console/	f	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	t	t	admin-cli	0	t	\N	\N	f	\N	f	979582be-1e58-424d-ace1-ad20c44dfb71	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	post.logout.redirect.uris	+
5413cc4f-9a62-48bd-befd-738a7c4957de	post.logout.redirect.uris	+
5413cc4f-9a62-48bd-befd-738a7c4957de	pkce.code.challenge.method	S256
515ac3a5-fd27-41ec-8890-955306cefb34	post.logout.redirect.uris	+
515ac3a5-fd27-41ec-8890-955306cefb34	pkce.code.challenge.method	S256
515ac3a5-fd27-41ec-8890-955306cefb34	client.use.lightweight.access.token.enabled	true
9cc4367d-096e-46db-881a-4103ef296533	client.use.lightweight.access.token.enabled	true
cb95ffcf-49dc-44df-a909-9452d782e304	post.logout.redirect.uris	+
16d8ef0c-9e42-4dac-a972-c279f301fef6	post.logout.redirect.uris	+
16d8ef0c-9e42-4dac-a972-c279f301fef6	pkce.code.challenge.method	S256
f727b726-7af6-4163-83db-9d39cc43b4cd	post.logout.redirect.uris	+
f727b726-7af6-4163-83db-9d39cc43b4cd	pkce.code.challenge.method	S256
f727b726-7af6-4163-83db-9d39cc43b4cd	client.use.lightweight.access.token.enabled	true
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	client.use.lightweight.access.token.enabled	true
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
084e4b23-3cad-463c-8dc0-1857b89938da	offline_access	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect built-in scope: offline_access	openid-connect
1337fa53-e68d-4c1b-8e18-259fdba42df7	role_list	a29ac0cc-6643-4c10-86aa-b45218f74a2a	SAML role list	saml
2cee5736-24bd-4f09-ae17-18b01303c0ef	saml_organization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	Organization Membership	saml
4b421f95-57cb-4c61-8ee0-888a0962d313	profile	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect built-in scope: profile	openid-connect
1deeb924-4f7e-4009-a9ed-e167cffcf0b7	email	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect built-in scope: email	openid-connect
50b223ea-77a0-483a-af02-44c701cb551a	address	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect built-in scope: address	openid-connect
dce50c6d-196e-4ffa-811e-aa83db38392a	phone	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect built-in scope: phone	openid-connect
764d4b76-11a8-40cf-ae4a-805b86065577	roles	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect scope for add user roles to the access token	openid-connect
9d039a28-b260-4d3d-b04a-f9dcf8ddd782	web-origins	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect scope for add allowed web origins to the access token	openid-connect
53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	microprofile-jwt	a29ac0cc-6643-4c10-86aa-b45218f74a2a	Microprofile - JWT built-in scope	openid-connect
4d115809-d1f0-4558-ae0a-1afab09e7678	acr	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
cf9af156-1727-4981-8b7a-6f81a7a05834	basic	a29ac0cc-6643-4c10-86aa-b45218f74a2a	OpenID Connect scope for add all basic claims to the token	openid-connect
57c81c09-7b61-4f2d-9227-700262fcb886	organization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	Additional claims about the organization a subject belongs to	openid-connect
a485e137-0e84-4994-8c18-edddc3fe15b7	offline_access	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect built-in scope: offline_access	openid-connect
7d60a538-53cc-4147-b195-98bea58cba5c	role_list	979582be-1e58-424d-ace1-ad20c44dfb71	SAML role list	saml
0b469eff-386c-4c87-b178-00d7a813ba0d	saml_organization	979582be-1e58-424d-ace1-ad20c44dfb71	Organization Membership	saml
7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	profile	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect built-in scope: profile	openid-connect
48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	email	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect built-in scope: email	openid-connect
f5efe9c6-32a2-4411-9bce-6ecb9207dcef	address	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect built-in scope: address	openid-connect
fce38c03-65b9-4946-8e81-a23b299eaa23	phone	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect built-in scope: phone	openid-connect
fd0064d0-633f-41c0-9a1d-572c66bd4eb9	roles	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect scope for add user roles to the access token	openid-connect
b4edbb49-48bf-46c4-9a96-863e85d49bf9	web-origins	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect scope for add allowed web origins to the access token	openid-connect
961c0040-4cc6-4bf1-bbb7-235be7a78b4a	microprofile-jwt	979582be-1e58-424d-ace1-ad20c44dfb71	Microprofile - JWT built-in scope	openid-connect
47bf5835-b93e-4d02-93d0-4099951dde5c	acr	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
6728c59d-a74b-4b70-bdbb-7f39ead6cdae	basic	979582be-1e58-424d-ace1-ad20c44dfb71	OpenID Connect scope for add all basic claims to the token	openid-connect
31795827-0a6b-4c5b-aa22-cb61ee0ef189	organization	979582be-1e58-424d-ace1-ad20c44dfb71	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
084e4b23-3cad-463c-8dc0-1857b89938da	true	display.on.consent.screen
084e4b23-3cad-463c-8dc0-1857b89938da	${offlineAccessScopeConsentText}	consent.screen.text
1337fa53-e68d-4c1b-8e18-259fdba42df7	true	display.on.consent.screen
1337fa53-e68d-4c1b-8e18-259fdba42df7	${samlRoleListScopeConsentText}	consent.screen.text
2cee5736-24bd-4f09-ae17-18b01303c0ef	false	display.on.consent.screen
4b421f95-57cb-4c61-8ee0-888a0962d313	true	display.on.consent.screen
4b421f95-57cb-4c61-8ee0-888a0962d313	${profileScopeConsentText}	consent.screen.text
4b421f95-57cb-4c61-8ee0-888a0962d313	true	include.in.token.scope
1deeb924-4f7e-4009-a9ed-e167cffcf0b7	true	display.on.consent.screen
1deeb924-4f7e-4009-a9ed-e167cffcf0b7	${emailScopeConsentText}	consent.screen.text
1deeb924-4f7e-4009-a9ed-e167cffcf0b7	true	include.in.token.scope
50b223ea-77a0-483a-af02-44c701cb551a	true	display.on.consent.screen
50b223ea-77a0-483a-af02-44c701cb551a	${addressScopeConsentText}	consent.screen.text
50b223ea-77a0-483a-af02-44c701cb551a	true	include.in.token.scope
dce50c6d-196e-4ffa-811e-aa83db38392a	true	display.on.consent.screen
dce50c6d-196e-4ffa-811e-aa83db38392a	${phoneScopeConsentText}	consent.screen.text
dce50c6d-196e-4ffa-811e-aa83db38392a	true	include.in.token.scope
764d4b76-11a8-40cf-ae4a-805b86065577	true	display.on.consent.screen
764d4b76-11a8-40cf-ae4a-805b86065577	${rolesScopeConsentText}	consent.screen.text
764d4b76-11a8-40cf-ae4a-805b86065577	false	include.in.token.scope
9d039a28-b260-4d3d-b04a-f9dcf8ddd782	false	display.on.consent.screen
9d039a28-b260-4d3d-b04a-f9dcf8ddd782		consent.screen.text
9d039a28-b260-4d3d-b04a-f9dcf8ddd782	false	include.in.token.scope
53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	false	display.on.consent.screen
53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	true	include.in.token.scope
4d115809-d1f0-4558-ae0a-1afab09e7678	false	display.on.consent.screen
4d115809-d1f0-4558-ae0a-1afab09e7678	false	include.in.token.scope
cf9af156-1727-4981-8b7a-6f81a7a05834	false	display.on.consent.screen
cf9af156-1727-4981-8b7a-6f81a7a05834	false	include.in.token.scope
57c81c09-7b61-4f2d-9227-700262fcb886	true	display.on.consent.screen
57c81c09-7b61-4f2d-9227-700262fcb886	${organizationScopeConsentText}	consent.screen.text
57c81c09-7b61-4f2d-9227-700262fcb886	true	include.in.token.scope
a485e137-0e84-4994-8c18-edddc3fe15b7	true	display.on.consent.screen
a485e137-0e84-4994-8c18-edddc3fe15b7	${offlineAccessScopeConsentText}	consent.screen.text
7d60a538-53cc-4147-b195-98bea58cba5c	true	display.on.consent.screen
7d60a538-53cc-4147-b195-98bea58cba5c	${samlRoleListScopeConsentText}	consent.screen.text
0b469eff-386c-4c87-b178-00d7a813ba0d	false	display.on.consent.screen
7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	true	display.on.consent.screen
7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	${profileScopeConsentText}	consent.screen.text
7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	true	include.in.token.scope
48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	true	display.on.consent.screen
48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	${emailScopeConsentText}	consent.screen.text
48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	true	include.in.token.scope
f5efe9c6-32a2-4411-9bce-6ecb9207dcef	true	display.on.consent.screen
f5efe9c6-32a2-4411-9bce-6ecb9207dcef	${addressScopeConsentText}	consent.screen.text
f5efe9c6-32a2-4411-9bce-6ecb9207dcef	true	include.in.token.scope
fce38c03-65b9-4946-8e81-a23b299eaa23	true	display.on.consent.screen
fce38c03-65b9-4946-8e81-a23b299eaa23	${phoneScopeConsentText}	consent.screen.text
fce38c03-65b9-4946-8e81-a23b299eaa23	true	include.in.token.scope
fd0064d0-633f-41c0-9a1d-572c66bd4eb9	true	display.on.consent.screen
fd0064d0-633f-41c0-9a1d-572c66bd4eb9	${rolesScopeConsentText}	consent.screen.text
fd0064d0-633f-41c0-9a1d-572c66bd4eb9	false	include.in.token.scope
b4edbb49-48bf-46c4-9a96-863e85d49bf9	false	display.on.consent.screen
b4edbb49-48bf-46c4-9a96-863e85d49bf9		consent.screen.text
b4edbb49-48bf-46c4-9a96-863e85d49bf9	false	include.in.token.scope
961c0040-4cc6-4bf1-bbb7-235be7a78b4a	false	display.on.consent.screen
961c0040-4cc6-4bf1-bbb7-235be7a78b4a	true	include.in.token.scope
47bf5835-b93e-4d02-93d0-4099951dde5c	false	display.on.consent.screen
47bf5835-b93e-4d02-93d0-4099951dde5c	false	include.in.token.scope
6728c59d-a74b-4b70-bdbb-7f39ead6cdae	false	display.on.consent.screen
6728c59d-a74b-4b70-bdbb-7f39ead6cdae	false	include.in.token.scope
31795827-0a6b-4c5b-aa22-cb61ee0ef189	true	display.on.consent.screen
31795827-0a6b-4c5b-aa22-cb61ee0ef189	${organizationScopeConsentText}	consent.screen.text
31795827-0a6b-4c5b-aa22-cb61ee0ef189	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	764d4b76-11a8-40cf-ae4a-805b86065577	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	4d115809-d1f0-4558-ae0a-1afab09e7678	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	4b421f95-57cb-4c61-8ee0-888a0962d313	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	cf9af156-1727-4981-8b7a-6f81a7a05834	t
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	084e4b23-3cad-463c-8dc0-1857b89938da	f
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	dce50c6d-196e-4ffa-811e-aa83db38392a	f
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	50b223ea-77a0-483a-af02-44c701cb551a	f
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	57c81c09-7b61-4f2d-9227-700262fcb886	f
5413cc4f-9a62-48bd-befd-738a7c4957de	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
5413cc4f-9a62-48bd-befd-738a7c4957de	764d4b76-11a8-40cf-ae4a-805b86065577	t
5413cc4f-9a62-48bd-befd-738a7c4957de	4d115809-d1f0-4558-ae0a-1afab09e7678	t
5413cc4f-9a62-48bd-befd-738a7c4957de	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
5413cc4f-9a62-48bd-befd-738a7c4957de	4b421f95-57cb-4c61-8ee0-888a0962d313	t
5413cc4f-9a62-48bd-befd-738a7c4957de	cf9af156-1727-4981-8b7a-6f81a7a05834	t
5413cc4f-9a62-48bd-befd-738a7c4957de	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
5413cc4f-9a62-48bd-befd-738a7c4957de	084e4b23-3cad-463c-8dc0-1857b89938da	f
5413cc4f-9a62-48bd-befd-738a7c4957de	dce50c6d-196e-4ffa-811e-aa83db38392a	f
5413cc4f-9a62-48bd-befd-738a7c4957de	50b223ea-77a0-483a-af02-44c701cb551a	f
5413cc4f-9a62-48bd-befd-738a7c4957de	57c81c09-7b61-4f2d-9227-700262fcb886	f
9cc4367d-096e-46db-881a-4103ef296533	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
9cc4367d-096e-46db-881a-4103ef296533	764d4b76-11a8-40cf-ae4a-805b86065577	t
9cc4367d-096e-46db-881a-4103ef296533	4d115809-d1f0-4558-ae0a-1afab09e7678	t
9cc4367d-096e-46db-881a-4103ef296533	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
9cc4367d-096e-46db-881a-4103ef296533	4b421f95-57cb-4c61-8ee0-888a0962d313	t
9cc4367d-096e-46db-881a-4103ef296533	cf9af156-1727-4981-8b7a-6f81a7a05834	t
9cc4367d-096e-46db-881a-4103ef296533	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
9cc4367d-096e-46db-881a-4103ef296533	084e4b23-3cad-463c-8dc0-1857b89938da	f
9cc4367d-096e-46db-881a-4103ef296533	dce50c6d-196e-4ffa-811e-aa83db38392a	f
9cc4367d-096e-46db-881a-4103ef296533	50b223ea-77a0-483a-af02-44c701cb551a	f
9cc4367d-096e-46db-881a-4103ef296533	57c81c09-7b61-4f2d-9227-700262fcb886	f
eb5dca20-0317-41ff-8b1d-4908012b9246	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
eb5dca20-0317-41ff-8b1d-4908012b9246	764d4b76-11a8-40cf-ae4a-805b86065577	t
eb5dca20-0317-41ff-8b1d-4908012b9246	4d115809-d1f0-4558-ae0a-1afab09e7678	t
eb5dca20-0317-41ff-8b1d-4908012b9246	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
eb5dca20-0317-41ff-8b1d-4908012b9246	4b421f95-57cb-4c61-8ee0-888a0962d313	t
eb5dca20-0317-41ff-8b1d-4908012b9246	cf9af156-1727-4981-8b7a-6f81a7a05834	t
eb5dca20-0317-41ff-8b1d-4908012b9246	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
eb5dca20-0317-41ff-8b1d-4908012b9246	084e4b23-3cad-463c-8dc0-1857b89938da	f
eb5dca20-0317-41ff-8b1d-4908012b9246	dce50c6d-196e-4ffa-811e-aa83db38392a	f
eb5dca20-0317-41ff-8b1d-4908012b9246	50b223ea-77a0-483a-af02-44c701cb551a	f
eb5dca20-0317-41ff-8b1d-4908012b9246	57c81c09-7b61-4f2d-9227-700262fcb886	f
d489c56a-9d28-4ac0-bf37-a61810209943	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
d489c56a-9d28-4ac0-bf37-a61810209943	764d4b76-11a8-40cf-ae4a-805b86065577	t
d489c56a-9d28-4ac0-bf37-a61810209943	4d115809-d1f0-4558-ae0a-1afab09e7678	t
d489c56a-9d28-4ac0-bf37-a61810209943	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
d489c56a-9d28-4ac0-bf37-a61810209943	4b421f95-57cb-4c61-8ee0-888a0962d313	t
d489c56a-9d28-4ac0-bf37-a61810209943	cf9af156-1727-4981-8b7a-6f81a7a05834	t
d489c56a-9d28-4ac0-bf37-a61810209943	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
d489c56a-9d28-4ac0-bf37-a61810209943	084e4b23-3cad-463c-8dc0-1857b89938da	f
d489c56a-9d28-4ac0-bf37-a61810209943	dce50c6d-196e-4ffa-811e-aa83db38392a	f
d489c56a-9d28-4ac0-bf37-a61810209943	50b223ea-77a0-483a-af02-44c701cb551a	f
d489c56a-9d28-4ac0-bf37-a61810209943	57c81c09-7b61-4f2d-9227-700262fcb886	f
515ac3a5-fd27-41ec-8890-955306cefb34	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
515ac3a5-fd27-41ec-8890-955306cefb34	764d4b76-11a8-40cf-ae4a-805b86065577	t
515ac3a5-fd27-41ec-8890-955306cefb34	4d115809-d1f0-4558-ae0a-1afab09e7678	t
515ac3a5-fd27-41ec-8890-955306cefb34	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
515ac3a5-fd27-41ec-8890-955306cefb34	4b421f95-57cb-4c61-8ee0-888a0962d313	t
515ac3a5-fd27-41ec-8890-955306cefb34	cf9af156-1727-4981-8b7a-6f81a7a05834	t
515ac3a5-fd27-41ec-8890-955306cefb34	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
515ac3a5-fd27-41ec-8890-955306cefb34	084e4b23-3cad-463c-8dc0-1857b89938da	f
515ac3a5-fd27-41ec-8890-955306cefb34	dce50c6d-196e-4ffa-811e-aa83db38392a	f
515ac3a5-fd27-41ec-8890-955306cefb34	50b223ea-77a0-483a-af02-44c701cb551a	f
515ac3a5-fd27-41ec-8890-955306cefb34	57c81c09-7b61-4f2d-9227-700262fcb886	f
cb95ffcf-49dc-44df-a909-9452d782e304	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
cb95ffcf-49dc-44df-a909-9452d782e304	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
cb95ffcf-49dc-44df-a909-9452d782e304	47bf5835-b93e-4d02-93d0-4099951dde5c	t
cb95ffcf-49dc-44df-a909-9452d782e304	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
cb95ffcf-49dc-44df-a909-9452d782e304	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
cb95ffcf-49dc-44df-a909-9452d782e304	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
cb95ffcf-49dc-44df-a909-9452d782e304	a485e137-0e84-4994-8c18-edddc3fe15b7	f
cb95ffcf-49dc-44df-a909-9452d782e304	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
cb95ffcf-49dc-44df-a909-9452d782e304	fce38c03-65b9-4946-8e81-a23b299eaa23	f
cb95ffcf-49dc-44df-a909-9452d782e304	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
cb95ffcf-49dc-44df-a909-9452d782e304	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	47bf5835-b93e-4d02-93d0-4099951dde5c	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
16d8ef0c-9e42-4dac-a972-c279f301fef6	a485e137-0e84-4994-8c18-edddc3fe15b7	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	fce38c03-65b9-4946-8e81-a23b299eaa23	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
16d8ef0c-9e42-4dac-a972-c279f301fef6	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	47bf5835-b93e-4d02-93d0-4099951dde5c	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	a485e137-0e84-4994-8c18-edddc3fe15b7	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	fce38c03-65b9-4946-8e81-a23b299eaa23	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
d0a3faf2-6bd7-4b7b-b7b3-547862de50c9	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
2811c445-a13c-400b-876d-dc6ef101a891	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
2811c445-a13c-400b-876d-dc6ef101a891	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
2811c445-a13c-400b-876d-dc6ef101a891	47bf5835-b93e-4d02-93d0-4099951dde5c	t
2811c445-a13c-400b-876d-dc6ef101a891	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
2811c445-a13c-400b-876d-dc6ef101a891	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
2811c445-a13c-400b-876d-dc6ef101a891	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
2811c445-a13c-400b-876d-dc6ef101a891	a485e137-0e84-4994-8c18-edddc3fe15b7	f
2811c445-a13c-400b-876d-dc6ef101a891	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
2811c445-a13c-400b-876d-dc6ef101a891	fce38c03-65b9-4946-8e81-a23b299eaa23	f
2811c445-a13c-400b-876d-dc6ef101a891	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
2811c445-a13c-400b-876d-dc6ef101a891	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	47bf5835-b93e-4d02-93d0-4099951dde5c	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	a485e137-0e84-4994-8c18-edddc3fe15b7	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	fce38c03-65b9-4946-8e81-a23b299eaa23	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
f727b726-7af6-4163-83db-9d39cc43b4cd	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
f727b726-7af6-4163-83db-9d39cc43b4cd	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
f727b726-7af6-4163-83db-9d39cc43b4cd	47bf5835-b93e-4d02-93d0-4099951dde5c	t
f727b726-7af6-4163-83db-9d39cc43b4cd	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
f727b726-7af6-4163-83db-9d39cc43b4cd	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
f727b726-7af6-4163-83db-9d39cc43b4cd	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
f727b726-7af6-4163-83db-9d39cc43b4cd	a485e137-0e84-4994-8c18-edddc3fe15b7	f
f727b726-7af6-4163-83db-9d39cc43b4cd	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
f727b726-7af6-4163-83db-9d39cc43b4cd	fce38c03-65b9-4946-8e81-a23b299eaa23	f
f727b726-7af6-4163-83db-9d39cc43b4cd	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
f727b726-7af6-4163-83db-9d39cc43b4cd	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
084e4b23-3cad-463c-8dc0-1857b89938da	4befdcf4-9ddf-4571-bf5c-0815836ae7f5
a485e137-0e84-4994-8c18-edddc3fe15b7	681cd140-0405-4f22-9e0e-c6ede555af7a
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
2ae63e53-b39c-4f5b-ac49-811b9f10fcc3	Trusted Hosts	a29ac0cc-6643-4c10-86aa-b45218f74a2a	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
2e3cbf93-03da-4bd6-9ae4-68dc91d29039	Consent Required	a29ac0cc-6643-4c10-86aa-b45218f74a2a	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
78fb4113-8ae5-41b8-bdef-c2cab672e177	Full Scope Disabled	a29ac0cc-6643-4c10-86aa-b45218f74a2a	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
3c32f4e0-df64-4af8-9bdc-11f3a162a4e6	Max Clients Limit	a29ac0cc-6643-4c10-86aa-b45218f74a2a	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
2e5d0596-a966-4399-9d37-f6dce56c4a91	Allowed Protocol Mapper Types	a29ac0cc-6643-4c10-86aa-b45218f74a2a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
010b7a21-8181-4ba9-bfca-693ca11372c8	Allowed Client Scopes	a29ac0cc-6643-4c10-86aa-b45218f74a2a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	anonymous
92028a6a-1d4d-41fa-9ae9-a95bbfa83989	Allowed Protocol Mapper Types	a29ac0cc-6643-4c10-86aa-b45218f74a2a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	authenticated
6b408a18-d532-4989-adfc-455f6eaabff1	Allowed Client Scopes	a29ac0cc-6643-4c10-86aa-b45218f74a2a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	authenticated
e501ed5c-cd03-45ce-9a06-299de95bde21	rsa-generated	a29ac0cc-6643-4c10-86aa-b45218f74a2a	rsa-generated	org.keycloak.keys.KeyProvider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N
c3f99225-9306-4ca1-85af-56f8da1f606d	rsa-enc-generated	a29ac0cc-6643-4c10-86aa-b45218f74a2a	rsa-enc-generated	org.keycloak.keys.KeyProvider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N
37aa5438-2146-413d-b536-612b6121f2f5	hmac-generated-hs512	a29ac0cc-6643-4c10-86aa-b45218f74a2a	hmac-generated	org.keycloak.keys.KeyProvider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N
ddbb9e41-20d5-4844-b6e0-8ef45f860a1c	aes-generated	a29ac0cc-6643-4c10-86aa-b45218f74a2a	aes-generated	org.keycloak.keys.KeyProvider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N
b10e9e3b-cce7-4ec2-b944-98be038a3264	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N
54ae2a89-bed5-4feb-bc7d-73b2453e4e41	rsa-generated	979582be-1e58-424d-ace1-ad20c44dfb71	rsa-generated	org.keycloak.keys.KeyProvider	979582be-1e58-424d-ace1-ad20c44dfb71	\N
bee9552c-2f45-4418-8332-0633d92576ef	rsa-enc-generated	979582be-1e58-424d-ace1-ad20c44dfb71	rsa-enc-generated	org.keycloak.keys.KeyProvider	979582be-1e58-424d-ace1-ad20c44dfb71	\N
b9790525-e34e-4187-b993-0c8c2fc3d76d	hmac-generated-hs512	979582be-1e58-424d-ace1-ad20c44dfb71	hmac-generated	org.keycloak.keys.KeyProvider	979582be-1e58-424d-ace1-ad20c44dfb71	\N
b414f0ae-915b-4271-852d-c07f6bfa7fbd	aes-generated	979582be-1e58-424d-ace1-ad20c44dfb71	aes-generated	org.keycloak.keys.KeyProvider	979582be-1e58-424d-ace1-ad20c44dfb71	\N
cca07399-791f-472f-a40e-4181c0b77afb	Trusted Hosts	979582be-1e58-424d-ace1-ad20c44dfb71	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
106f7beb-b3b4-4294-b1eb-adabfb729e55	Consent Required	979582be-1e58-424d-ace1-ad20c44dfb71	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
9c475ca9-c55c-4dc1-a00d-a58f4bac0350	Full Scope Disabled	979582be-1e58-424d-ace1-ad20c44dfb71	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
2065f3f9-1d81-4a0d-b9e1-9f2a65b1ec9e	Max Clients Limit	979582be-1e58-424d-ace1-ad20c44dfb71	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
0097941f-5f20-4070-be10-e8e45cd8947d	Allowed Protocol Mapper Types	979582be-1e58-424d-ace1-ad20c44dfb71	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
227c56db-ef78-4108-a5a9-477d471c5891	Allowed Client Scopes	979582be-1e58-424d-ace1-ad20c44dfb71	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	anonymous
dd5de03d-789e-4b10-8910-7185eb51aaa3	Allowed Protocol Mapper Types	979582be-1e58-424d-ace1-ad20c44dfb71	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	authenticated
b8b28a60-4400-4c9c-a4fc-30f4db0ebf44	Allowed Client Scopes	979582be-1e58-424d-ace1-ad20c44dfb71	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
e70b2987-335b-4c9d-8247-c98c1f4aca04	3c32f4e0-df64-4af8-9bdc-11f3a162a4e6	max-clients	200
e7f915ae-de27-4f63-b2a1-04470510ff42	010b7a21-8181-4ba9-bfca-693ca11372c8	allow-default-scopes	true
6fbe98d2-5419-4405-a3ee-e19bd1438c78	2ae63e53-b39c-4f5b-ac49-811b9f10fcc3	host-sending-registration-request-must-match	true
5785bd4d-4d13-4b8e-828a-d95099261e80	2ae63e53-b39c-4f5b-ac49-811b9f10fcc3	client-uris-must-match	true
bd17b98a-b526-44f0-b55c-3643918169ed	6b408a18-d532-4989-adfc-455f6eaabff1	allow-default-scopes	true
40a37954-a5ca-49b8-954d-3117a23b8490	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	saml-user-property-mapper
4676f775-5144-47ee-8c5e-30d1e53b1861	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
bb6cd54d-1e9b-4824-a9b6-5243271bbfc5	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b631698b-b387-4d4f-a510-f643cc40c19e	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	oidc-address-mapper
72804351-82a6-4c04-baed-1897cfdad364	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	oidc-full-name-mapper
1dbe5b89-904b-4f96-9639-49a7e1343ecc	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
bdfe8e2b-aa26-44d2-9694-db4868ff44d3	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	saml-user-attribute-mapper
2d7267c3-d6a2-4bde-aa8e-7bff123126b0	92028a6a-1d4d-41fa-9ae9-a95bbfa83989	allowed-protocol-mapper-types	saml-role-list-mapper
1ac1b05e-a4bb-41fb-b263-9eea842938b7	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	saml-user-property-mapper
24ab610c-7a82-4fef-b3a8-e93609301627	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2dd34a7f-636f-411c-b36e-a2560a86e94a	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	saml-user-attribute-mapper
342f14c0-bde6-4718-ad0e-ccdfb8238f36	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	oidc-address-mapper
15fcc988-6c85-4d2e-b93d-4de3e3f120d0	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	oidc-full-name-mapper
aa5f1991-c514-4a4a-90c5-07e05da7da5e	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
60e66df4-ae90-45a0-a322-6f024c0ed0df	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	saml-role-list-mapper
0147bc1e-77bc-4131-b21d-8c9c03503a33	2e5d0596-a966-4399-9d37-f6dce56c4a91	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
12036ffa-4c5d-4c6d-b2e1-6226bdd8144a	b10e9e3b-cce7-4ec2-b944-98be038a3264	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
138b1ae2-e16d-44ce-8bfe-67488cc2bf3e	c3f99225-9306-4ca1-85af-56f8da1f606d	keyUse	ENC
29a15698-f882-4329-a7a4-7715cd786767	c3f99225-9306-4ca1-85af-56f8da1f606d	privateKey	MIIEowIBAAKCAQEAhDLl72MMFtL5qKP8lieupCyeNXp2hVJYQgPZ7YKLk53ejQepmAKcONvg3PQRcQWjLgQOt6z3/V112jVOuu4PowjODXbtsvc5JKtL8gMeGkyUboJEwBvC3ZX/+5VUABDMg3SFrtKURithmwhG7cFPgKPhr8DRNJk6zDLnjoW99FPhXvGQgB9TKrwbMxEQOVaYyAr17ST+HpInUWhYPzt/UTfjPbaRUNFClky0GY+CzMcq25UpqpUv5LwpfICtW9oDOMs/FSFWeBjLr0RaUuv9d6Yb8fPfhYe59WogJmkaDdXCBfioQhdPA0OHg30Y4F3LCRYmYMD6Fo5hmmN2x7/3ewIDAQABAoIBACYujzO3b0fuUnZPOsZhmrLHQkCe6Ll0AZK7iwdq04Zkq+Eey/BgHJ/dfdJDWgBDSRCi0l9hgVS32DCYge9Cj9ieU+kWpuuwNNxu7yXsmZat9JcAX/v+aKdYShFvXU4RjAgRsQS/xFyJ7gx5dQb5dM1qR+ZbsfDXquBMeY2z+hulbiWP8rp0ZZLr+qemgTJLPOrQ7GDSNwI6IHjsnUDa2xj8nnNU8feKgks1DZOrq6pQ6ts7FexWyQeVe3XcGBJjt62F+aHY1ep4S3RSe/QM1bK+iV/TSTJUxJcpjWCjeCK8dRL9tvsFae2Qi9K6LXArp0QMwSimzOnnM5e94gvsNr0CgYEAuh/QDS3T5aTCRdMN0Xc3rMSljTthCInjcrh4CYUtXvW1TkbTAWz8pBaLj0G6Jws42ujWOLxBqAees21qGM48H/KgTGh8mrbpsqErRwLYdqxdE0Jq0mT31JegcrKVZ/SiprtbSmnn+z++FtpfR3BPUq2u6UeRYj8xsLbhxnNbhb8CgYEAtdRflIF5M4189AiUtD4FNXbrIW/U9kV12+Rzt3mdqBlaB397WCmAs4wQXDybxeI1uxFRp1hBNqTFgp5fpdMFXsVBlEgwqy7RcPFmTcdyc8OQ+6uOlSD34zQQAvc9luXRiT1/rHrd4EjQJsB5MdfNZcIMPFefaB31dTnM7ctz1UUCgYAP2CNy68LNGtB69zOG8Fop9/eL5VEmU+6r1m5JiS/KlKohhr/xsCB1q4Gn6VV6e2cUo5uQ6t2/+x4Uci0E/ZF6usHQn1h0JzwPu86eVeytdZDa0d2cGYJLc7jx6qfzWIz8Gpjz5b4c0llRQre3siTeifCI5VHIBk8plvfzV+CjqwKBgDe9JJenoPnWs6kzQDKImJwtGiMj3wqnfFuuCnMCCvxO2TRXNf5uqo9frlw4ECB3GbWAt6EvAr63f/xshDGXIJxOp63G+3ReY8HVnmDVdRZbqwQbMRgyBQtXGFlwZSbuyG7jtVGwUHfCmlxmwEAxQTuiYpHU4n7OQEJxN4rlxVppAoGBAJHILZaosd8aYhdd2WWd7Gl03fj+9LOAZ8LlE9tbgk5NFUodo8haL3DA3D/WtqVhOAlOSy03jbrNI+qOmufWRLxV+9GEdwoZQOqbx408YXdUOF9n9gcNjBdEmEdAE7Z2bkUVtqE6KsFwQnUqLjzu30aKAgEUCxgpZfijeQu+jF+Y
92fecd12-d12d-4da0-9f87-395ccbe79848	c3f99225-9306-4ca1-85af-56f8da1f606d	certificate	MIICmzCCAYMCBgGUtEn/pzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwMTI5MjI1NzE2WhcNMzUwMTI5MjI1ODU2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCEMuXvYwwW0vmoo/yWJ66kLJ41enaFUlhCA9ntgouTnd6NB6mYApw42+Dc9BFxBaMuBA63rPf9XXXaNU667g+jCM4Ndu2y9zkkq0vyAx4aTJRugkTAG8Ldlf/7lVQAEMyDdIWu0pRGK2GbCEbtwU+Ao+GvwNE0mTrMMueOhb30U+Fe8ZCAH1MqvBszERA5VpjICvXtJP4ekidRaFg/O39RN+M9tpFQ0UKWTLQZj4LMxyrblSmqlS/kvCl8gK1b2gM4yz8VIVZ4GMuvRFpS6/13phvx89+Fh7n1aiAmaRoN1cIF+KhCF08DQ4eDfRjgXcsJFiZgwPoWjmGaY3bHv/d7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHrQrV+LWL6b0QUjzdCywRoQYyb1fp0r99pXx99vhNL5T8vnObDGyAtHnGPrfP9uEyzg6fwtmHrrZ4Jw845PJn3Cqi2YSvPu+onus1rRSMtffSGCR3yihpylLdfbsFVfA8SW/ybcedW2sVbzRetzPhV0OUkaULqehm+gML0SLU07kjVVhsfUo97bGO1ZnmYTRUMCSnivGWusivGWR2uKbRwR733PpY6tjVYlK7EiYPPYNSOjuMzx62e74rABoDmv9OQn42UmnApD5SECBW2gOTtZDiao9DTkJHDvhiIua4WJ99kw+JezJGkN2mVqghYMBshdoUn21VxXoXzHjgrgTrY=
7fe8232f-abec-4ece-b294-e88fdb476605	c3f99225-9306-4ca1-85af-56f8da1f606d	priority	100
4e5a2903-13a3-4a77-843b-3fbe35521a7a	c3f99225-9306-4ca1-85af-56f8da1f606d	algorithm	RSA-OAEP
69c8f47c-3ce5-47fa-9a4a-696c4b23c25c	bee9552c-2f45-4418-8332-0633d92576ef	priority	100
2b5ae26b-b418-4317-a819-a5d9e02d91b6	bee9552c-2f45-4418-8332-0633d92576ef	algorithm	RSA-OAEP
cbfe422b-0e98-45bf-b2a7-ea775c7d3257	e501ed5c-cd03-45ce-9a06-299de95bde21	privateKey	MIIEowIBAAKCAQEAjykoV0c/UTcL/+cozpEctR8Lp3VzPGGJ0m3fxc3pRwuZRtYvykpHjz7DFrfyLmoUmmficqFfbnzfqWEWUHEpLhNeY8CAGVOOjjYgqBU19iWTRKyargiD8YZwqRSYMF25a7wvfeDJFsEuVeT5wEyiwOfQijIYbi/KXdSyMYNi24Be3Al0oFHH+K7bWXW7hMs7/ct2I5omoQbi4qTF0/MMtwtYcrcBk1AW5LJhwY8j6U7Vg30jXkBWrTD6ZS/FAQNSYFu8zt5gDclPFbYe74+iSiD/qOGzDsyZYjT9VS8jg5p5zL1VLeo71VvHTbF3uDuOUNfx76/fB0R06kiDSgUTFwIDAQABAoIBABZH+Zdb52bkgmGZwKglvaoS4uV1SjIjnCe8Ig/PNHdyPrDftSBu3yRUSFjI2FCRAhPmB0CADTJNDSJ3kdmDQz2AljhARa+raYyIsBx48KUWxAz0MD7V5HM60V3/bpBYhftWlq2oxqNb/bIwqQ5c3xfW/IYFtfewSHbCG9nI8SHoZTSCa/R0A3xEK6jf+y6ZAw+ET/yUwYdLtrviz/dDHcXJFtGhYLYygRYziItOHM1hIUr/t3db00LnQx719gdDPP3+1xrpvY0ArkrwJx+FhugbaY/ote7vN39TfWqTK/iIqoSMMHZA0YJhV5tyPTaTHTg0EpZkRNH4Zg0/q5r+DAECgYEAyDVy2uhYLuLJc5jEA9XkgZNoBCe5iO3z1xtb0kguGhmf5CUoIerPs63izdWil6Jq5a/YhrwSbXvwPrGxN9C872jc9detbjSQEvfn0LmjiH0yyIVK6k90EopbJlGSsO91OcMWwMDUClR139+IvXSaDaOfI6nhSq2Vl47w5+LuksECgYEAtw4AZvLOOukhPamDPAkmImiY3chbiyArY+7M+IN1tltj6OPwzDFbD0S/8riOlAUVw8BXpktbn7y8EHoK+a6JV325RzkG+Bq5QKTFnru6i+fHBULatBNYXYSmuL6GzKNJ6sY4OTVv8y4adaqMgDeTWj5bRUajh/Il7eFSkOUjk9cCgYEAuIDpM+vjOHIvjKRAH/jB+NfLh+jEBvijOp0v5X43Xj43J51GettWRhP9bAtxJ6S6NqnzNVek89i/8kb3NqTbORa+aqE0Ztdx3skvjR9HIcWfQ0PzYjOOmHeAwLN0KDLFKVIsab5KqqpjZsktzsriHaeoRMmNobCOp3lHcaukiQECgYB27q3sNU0wkU97lKsjUn5oVLUdQ5PWrKwEXZ7mx+Ku/GnJYm+M+3RCU1SzCp34JeWiLVHFRajd++3kdqay2md5ZMIAOFkC0boS+fs7ypTFWW3BSVJ3NSpweEMqPP+v7VeVJfxZjxKRWR7v3EM0+ubN9z2toNuW9AkYqRDP+1BGOQKBgHo9xdLdy87gcwoUyjyv97kZvr1hDdkfn0gDoUHdrw6w3UvgWlz8qHYAlK2r/2NngZT5DeoXr3tbC2DIpAce1rc7H2YS5wuuxYSTmaz0zgtmmAGjd31AhW+HRlkCO2wHbY3t5d+T1bQ2JOj/7mNWgfnmVYzPD09zA9bVf+aS1Knw
711e39d9-1c39-4b92-8d42-7131b2e0bac0	e501ed5c-cd03-45ce-9a06-299de95bde21	priority	100
c520b935-72a0-4ea7-b0e4-cd56733ff3ef	e501ed5c-cd03-45ce-9a06-299de95bde21	keyUse	SIG
c195a024-e85e-4290-9bfc-6621470d6e74	e501ed5c-cd03-45ce-9a06-299de95bde21	certificate	MIICmzCCAYMCBgGUtEn+nzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwMTI5MjI1NzE1WhcNMzUwMTI5MjI1ODU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCPKShXRz9RNwv/5yjOkRy1HwundXM8YYnSbd/FzelHC5lG1i/KSkePPsMWt/IuahSaZ+JyoV9ufN+pYRZQcSkuE15jwIAZU46ONiCoFTX2JZNErJquCIPxhnCpFJgwXblrvC994MkWwS5V5PnATKLA59CKMhhuL8pd1LIxg2LbgF7cCXSgUcf4rttZdbuEyzv9y3YjmiahBuLipMXT8wy3C1hytwGTUBbksmHBjyPpTtWDfSNeQFatMPplL8UBA1JgW7zO3mANyU8Vth7vj6JKIP+o4bMOzJliNP1VLyODmnnMvVUt6jvVW8dNsXe4O45Q1/Hvr98HRHTqSINKBRMXAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGTUWr58PwHE+T7t8Mn3589YYT+qoqw1ivFGW9qehDJyiyn2HMfHsL1rxq1zNi5Xq9rHHYXWhSmZ85Jpo5ZTUuj3k7Y1DcWs4tIqYi3ynbqSPi+TBr87lpfc19pbqh1ir7ZTVyWUN8l3N9VF4EsIhJXW/g4Wh8QtB0g3V4VQE6clBWJncrEscLbnjiBgRQWO2a8ngB7Rf6BAkq+vALQepz4KB3Mk40c7M25fAxn6sK9CJmzNAbxDFW/rU9crG+kfhOqgAzM76T5uXOKe9K0DeLebsOb24LSk25z3WVusCXiuZSxvZG8RIJUt+AGlG9ZlkZlqbM+oxXsfzxlXTsRcpkk=
8b2aa7dc-9e72-4453-ad58-9580d4cf3c1a	37aa5438-2146-413d-b536-612b6121f2f5	secret	PRsP9YrAxcYQkirFErXMDiSXIsemTY3c45D7hX6Gr4CjGH-uCTRKg7TXKYal_0qX3D1DJINcRQ6XTd1lWrUeaaSqV34rJUVl10NbRQ1uf9fG2rSX9e4RYP-BgSu3Ow-5VbVB9WQA4yMA771d6-eJWrR2HRETc5fG0YEHtujd8r4
bf5ff36b-bd9d-40d4-9cfb-4342bea9a808	37aa5438-2146-413d-b536-612b6121f2f5	priority	100
518b5640-6026-4119-ab96-79404ef2fa76	37aa5438-2146-413d-b536-612b6121f2f5	algorithm	HS512
f9d6b8bb-23ea-4690-9d0b-73b0ba8f6e5f	37aa5438-2146-413d-b536-612b6121f2f5	kid	f32a663a-6c9c-4dae-b890-e05d034da6c3
f5f7d667-c9d7-4ec3-adba-bd8119f2629a	ddbb9e41-20d5-4844-b6e0-8ef45f860a1c	priority	100
fd7a7457-bd67-4379-891f-ea527e49a1e0	ddbb9e41-20d5-4844-b6e0-8ef45f860a1c	kid	b4880a6f-bb53-4aa8-bb69-eb41f770ff47
21e09169-76f3-47d3-b24c-79164d1bdcaf	ddbb9e41-20d5-4844-b6e0-8ef45f860a1c	secret	8eCSxu14EhI3IswfO-UI_g
476c3e30-200d-4cb9-9adf-4b126dd07faa	b414f0ae-915b-4271-852d-c07f6bfa7fbd	priority	100
bd3f472e-15c6-474d-9c74-000faf4a1c05	b414f0ae-915b-4271-852d-c07f6bfa7fbd	kid	c4a75b4e-4c56-4539-ab45-8c43811e2ce7
6181cfb4-83fa-4e67-85e0-4904f4d7c8aa	b414f0ae-915b-4271-852d-c07f6bfa7fbd	secret	7tDYYjTmr7xzwu0Rc3e_YQ
05bafa64-4d06-4bd3-9b38-c3f7da19e008	54ae2a89-bed5-4feb-bc7d-73b2453e4e41	certificate	MIICnzCCAYcCBgGUtErvVDANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhoYWNrYXRvbjAeFw0yNTAxMjkyMjU4MTdaFw0zNTAxMjkyMjU5NTdaMBMxETAPBgNVBAMMCGhhY2thdG9uMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjmROqGom67b/iq6guqAXPGNlIr3S0hkLI8J4byJXK6LOxdhiAtv/4BJtiqZVw25Py9vfAfGIBpL938WU8guauFpgzh/TQZw+xqM7BF2vhQcVZ0wsG1T/9lFXLL565BhgXrN+EfYLz0WdLECN07M6Ni+zgn0BXw2Ip5FEmH0ssPQWqWsy9w4P9/F7NwflwkfPY083OYdI6CM4t5b5aq+xLtXUzg40BUVe7cvEoexYuaIFdOilGYhfTi3vq+zMlckjIQvyi3+vzK8hqeSoE+ZDQU4UdaaXHtaEwpGLGoeMKi2JTVUDvdyYzoZENKCl7TUA4WEoZOqdqFzko+rKEA9HPQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAcd+oKobGdUKs7wW0kVO8TxloKFAzsB3icIKSn+rRmxUj7Zsyg0Rjlw9D2PvtIUIj8/BeKOiVhHVqp9YbaOrQHTPv1SpVYu5nAx7GNlFlcLq/GNWvEyfj4eWXSayOHbT1HOB1+IOoGh8eWweQK/rJQYeXx7Bvynts6HJNpHISBOc0DoUq2ExY/rDn+mJy94bbtlk66ggLL5d0qrjssFhjC1vUaBaDDdJAP8Mde+hNSUdRZ4XE5aDMSKgIGuZqRKlbAoPGp6dLdbPS3CQKdE4NL/AF7YNAMVXdvkYsI7fNNxD2r1tQduKsQtDKLZA7xf2nqURXyC3148T00L7fpBWnE
e353b7ef-6e7c-4f70-ba69-ca1fa94ff8ca	54ae2a89-bed5-4feb-bc7d-73b2453e4e41	keyUse	SIG
03ea11b7-7b1e-4f65-9029-da388f24389d	54ae2a89-bed5-4feb-bc7d-73b2453e4e41	privateKey	MIIEogIBAAKCAQEAjmROqGom67b/iq6guqAXPGNlIr3S0hkLI8J4byJXK6LOxdhiAtv/4BJtiqZVw25Py9vfAfGIBpL938WU8guauFpgzh/TQZw+xqM7BF2vhQcVZ0wsG1T/9lFXLL565BhgXrN+EfYLz0WdLECN07M6Ni+zgn0BXw2Ip5FEmH0ssPQWqWsy9w4P9/F7NwflwkfPY083OYdI6CM4t5b5aq+xLtXUzg40BUVe7cvEoexYuaIFdOilGYhfTi3vq+zMlckjIQvyi3+vzK8hqeSoE+ZDQU4UdaaXHtaEwpGLGoeMKi2JTVUDvdyYzoZENKCl7TUA4WEoZOqdqFzko+rKEA9HPQIDAQABAoIBAApXmpyiEdUgO85+xrb/aT343y/nNzCM4pxUjpWjL3nVz6xwPhWElVYY/eKqmFiYmCGlBOfZ0J409M0ZHKt5myGFk6SXtwBRNlW2+z1NhlyEakd63B+ZFyVKJ6mHj+/7cvEgmt54RJ0nqoCRaMEQsmtHStkbthWJa1yhERPSpa7C1BL+WwWOvi1tWI5Doh+5OuAFiUxEWJKr6X3xppxcYQkMopJyktOJdAbMcV7e3OZyGjD0/PXRA0vCZdGjHeD7IuUVgvKz/IF3DUISNM/wesTKxOB529DcwULrMrfJYvN1kOUwaI386UONiaEKKKrKP8bM00fxosoC5RkpNH8pR0ECgYEAyA1lx+S6RCjbLnr+lBOis+R8mq3kHT5GFn9G7wHQljW2gPBgG/5HVh1GieLQrCxx4VmAOtcNWgfTrUx7GNoGLnE+FfFw0/vuDwWy9AOlfpzgdncI8hy9eKZCZtdzDUyJ+a1KRAYM2HMQ3/eRX3k/UtOQnWDLdlFpuM3vliUwzf0CgYEAtja/Rix/7/VQm5a+K9U2pnbdC7GO8t7MUquqD9mOSIG4aE/CPOWcZZlv9GOfrorwJxkAIUo7GvXsGn4e1rwfriDTFxTDDqG5dt0kBueVa8cXm8R3YcVFzvmi5J9cpbi43IpCCkbjOpR8UKLFJ4p1OdTdTpxLNt2HxSAbHz77AkECgYBslkEZ6IBmgNq/9wj6bVISXUJ5X0wDx4qZqYpiL1T+Q7eFc3RnnXUxPADO1Wu5GQLTdBZTWemoZbkzRuFGUwmp6dPuazh4CDZmtww0wUnyWMrJ4sDbUlhSBcTjN6z+mf4GpVY7aCFO195gA2xIK3MAzU+g7SpjVbuSEU4r7JH6LQKBgC2AsndluXVE/6I7HLZ5gjJD0KOQ7a+8761dbRSUMbHtow15jXoDpPDCRnDzR/cgfyRkW+H0VZo/+3wKLs1VIVwsmkpTRvqqbFRAmTSYNHo7t6uQfneN+gbb1E/fdBV2ccOxSxih5zDDz9+bJjzfmLKec72jziyfWb5ibCN7aNeBAoGAB9IpJt9v7DxTnapghSw3AQsXICL9h2vWCRXWddqCeE2kWoMBpRBNjdbtV8wyjVMZ7tAHhLeSdIn6dRQQXGAtEmOom51ziEBpGjBcYliyM7MDB1ff/8rd8c1fDJyo4hdaHdp8YU6kC1S/xsdscHodscGwMesZaZUku9uxowsmzLU=
afed360e-64d6-400a-ac95-069fc4c485cb	54ae2a89-bed5-4feb-bc7d-73b2453e4e41	priority	100
683ecae6-702f-422b-a86c-9d0323eee622	b9790525-e34e-4187-b993-0c8c2fc3d76d	kid	ff9550b9-13cc-416a-9ba7-ca761c4ef5a8
dd9430ec-de5e-4fe3-a1ad-afdc01adc4bc	b9790525-e34e-4187-b993-0c8c2fc3d76d	priority	100
04a31bc6-1e2b-4139-97d2-aa6afa2a63c9	b9790525-e34e-4187-b993-0c8c2fc3d76d	algorithm	HS512
f1f83dfa-7fbe-4f38-8229-6272d14a7741	b9790525-e34e-4187-b993-0c8c2fc3d76d	secret	ytDyUYL3yhRb5Ww2ojVc28PT1Xp2b1_KSpYmXaaT9-oJTdzBg4ugTnGsPlyWOlUviPmRx1aOrWiqP-zm7mtfcVXwWDkseLyIrDHfkpw4MkPJQMqAlQndTmkHnBXX-Z7A0Dgf9cbKP3FfE0SnigdkH6EVqgklpqIPNHZofj5ruqM
405a2133-7b1d-454d-bb7e-56f73a959243	bee9552c-2f45-4418-8332-0633d92576ef	certificate	MIICnzCCAYcCBgGUtErv9zANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhoYWNrYXRvbjAeFw0yNTAxMjkyMjU4MTdaFw0zNTAxMjkyMjU5NTdaMBMxETAPBgNVBAMMCGhhY2thdG9uMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiSrdSigU0iocGdCXpb+fjtRzD45BLqSybi3lrx5/Ua50Fh5ssowUXTFkI2PVTciaDkUa2ponV1Ow9kymK7MfEZVdHrUx+qK8aK5i7gmOwZgM1BKggiPSYDrYA5Xhx3RW1mVV9DaRgUjqsYSwDNl6LB2NbwhJ7yzyhqobm5saO7gYrwS6wnBjYm93Oj2LrDiK9MDnDJeB447naEcRhbb2ZQla0pDxHqbPPvKrQlBY0RChsQkn/8ja0mFIzoqnvcccnH0GpwUHyEFO1NMH43HVrs8AH3y3N+GG3GO4aVBgiJe2721ysxrCo7GQp91jJYEcnU35HJQP5Zi52cFUdexN4QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAiDJz49X+MnKMTmWoKuwSupG/SAqR6Vw6M90eKgsa9gU1DHtt+M4c7WPnVQfVvGrT0bYffQdCBvCjoXT0Vc4X8u2wvqov8Fl/w0Be4cR5e56/EJEpmU5hMyMCaargnCkzHE+Jt2tEk9DMBHx901Df2hTSeQYQxhPUfVFHrIWYCj7lfDXkBSCJffsQHN8VTAupdKzm1jIB268Fi9r2V3B439/Ps5ePPNEQtvwPIzmjo+84bQId5UWrBt/0UaSJKwML6XWN3BJwKCVzKSmW8sYuHeh/Wk3yL/e6oZ1pSaDtPCmAA2bLzudLxxxaWXTI5S2CB+8A1A4X5XpaI/h4XgEnE
a812a7df-0845-4898-8628-d8b2f730dfcf	bee9552c-2f45-4418-8332-0633d92576ef	keyUse	ENC
cb410230-40c7-4f98-bfd8-f4217ac54bb4	bee9552c-2f45-4418-8332-0633d92576ef	privateKey	MIIEowIBAAKCAQEAiSrdSigU0iocGdCXpb+fjtRzD45BLqSybi3lrx5/Ua50Fh5ssowUXTFkI2PVTciaDkUa2ponV1Ow9kymK7MfEZVdHrUx+qK8aK5i7gmOwZgM1BKggiPSYDrYA5Xhx3RW1mVV9DaRgUjqsYSwDNl6LB2NbwhJ7yzyhqobm5saO7gYrwS6wnBjYm93Oj2LrDiK9MDnDJeB447naEcRhbb2ZQla0pDxHqbPPvKrQlBY0RChsQkn/8ja0mFIzoqnvcccnH0GpwUHyEFO1NMH43HVrs8AH3y3N+GG3GO4aVBgiJe2721ysxrCo7GQp91jJYEcnU35HJQP5Zi52cFUdexN4QIDAQABAoIBAAjjBA9H5YFwRP3PK+QLNDU2wnWhi8uP1BebVaQw36LVIKRGOFihBri6+HfqgelWM9T02TaMgjwAKhjrAmEWa87h1HSm3KQWYwqNMc+mQt98EGi1BD0qQPkHFvO0hDo96VpemmEGIAs2RC5YIGfUtzugdodZDCE40kWzQ7KjK+HuhTH32gjV+uFXZdQyqGXrao6gKECVsDCYES+4rH/z/mtIFSXfMEL5KEzcd9Ldv7nCAkAzDjp97eYVy7tUPK/lEny/3WUhXnoSaIKvWQnACoRwUTo9x9yssV4TbYNPFZuI1xHSS2jAibQZj7b2YpCtP1UO+4SfEX8AHRlw+Xf+gIECgYEAvoMII+6j4xqWzMOkznrSmWTc7LkgwHmblQmLhjVjxs+l0Gm2uTTk/Buq/z0KbAuI78nGTFyJf6AQbaGjaAZyknO4e0mP7I6QjHZxNeMrInsIlywcI9Hgi/y3DkL07BdqYyfvbGl3FMDUfHGmLCkdJfdpU/q3zpP0LTp1sFvNfwkCgYEAuFGLuOlDDWep7eTm13IK37aOEayzHxc23LFXU1Mwb2qNHcQdQU8VMTE4raDaNSbbgBbvBram6hZ6tbn9EtnU8E4BytpWI9IOLULG4u/uqFIcpc/dX8LR8xwo5Bs6PS1hvrKMioFaN1BHFWLTZk+5sr2hFUyh4qgBJuBJLKpXNhkCgYEAoKApxOH4HArXCl4KHm1AE0UPYCfWjXH603XwxX9OWNnKnCYFgbIvPsC1M+5rUx2Gn2YoY0nCRHDYaRbXh2WoRAJ9kLU9O94X0dYrLZwTSkchvxPZxfm2sVCppsSdbFFxyZhqLaXeWQkcHrBTwvgHM3OewsepIets/JVFlSRR5sECgYAb7t/J6i/rPCaYkvQY+oODW9sz+oQ61f3OfGHLkvPoLrGsLShx2VZQ2jDIv3PSUk05oEAhOFUbbMSz/bfIv5JxyKCk6Wnci9zyJwiVI997StZkmpfmB1RiD4Zy611sIBCMIesCoo/Viij7qLp46uQtnmdnHvH5s5RZG+x7BGWrIQKBgGJIhs2ZobwzlfS8oUnk0Y4q2SKyz1T8FTIneChp99d0/S3SLcy5XjNspCDxX1sFDys3aGTf8xnMZWPePip5XdVNvrSStwL4mCTO8pxQZtE2Ma9wqjKffcDv9jkRhCedfZGpixzZ7ZuUsbJY2ilLhSeyg1gxch9IeAaJE5NIgErJ
033a4e9d-9660-4eb5-89f6-91e4c2d9ef08	b8b28a60-4400-4c9c-a4fc-30f4db0ebf44	allow-default-scopes	true
1751cef9-0f5c-47c0-947b-a6345d658d30	cca07399-791f-472f-a40e-4181c0b77afb	host-sending-registration-request-must-match	true
2fb0ad36-96f6-4071-9fc2-247cba78f30d	cca07399-791f-472f-a40e-4181c0b77afb	client-uris-must-match	true
2999419f-9add-43e5-90b0-d4cc04cd4f44	2065f3f9-1d81-4a0d-b9e1-9f2a65b1ec9e	max-clients	200
82924e21-803c-49a5-ade3-792eee15b88d	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
08534e94-9936-4920-aa07-f3b770e7892c	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	saml-user-property-mapper
2ae16b03-644c-49fb-a308-a388393a1b4c	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	oidc-address-mapper
0ff021b3-998d-4c51-ac05-bbd527c4d5ad	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	saml-role-list-mapper
9d821698-51eb-4ba9-af7f-9626c3fabb71	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ead8c756-b11a-4e9b-9f99-cedc917b78cf	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	saml-user-attribute-mapper
b988f5c9-1637-4444-b0cb-9ea826526bcc	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	oidc-full-name-mapper
72d1ae2c-80de-47d4-9333-195af9da0d49	dd5de03d-789e-4b10-8910-7185eb51aaa3	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
29944989-0a98-4e7e-a96d-538298a13e31	227c56db-ef78-4108-a5a9-477d471c5891	allow-default-scopes	true
5ce14fef-e150-4a32-ac5f-b2bf58edd534	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3367a3fe-1390-4063-86e4-5cb57b8b7a02	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4d0cb058-772a-4e7d-a741-a8319fdffea4	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	saml-user-attribute-mapper
823a7eb4-a962-44f4-b0b9-ae504cc862fb	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	saml-user-property-mapper
f49e42a9-400f-4bb0-8023-1bff0beeeb4f	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	saml-role-list-mapper
ae3dc07a-0022-4083-b32c-d907a53b5580	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a7b17e10-03fb-459a-9856-d3102a98c93c	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	oidc-full-name-mapper
82afefa4-0223-4d67-b5f2-59cc0c38f745	0097941f-5f20-4070-be10-e8e45cd8947d	allowed-protocol-mapper-types	oidc-address-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	93d49b52-6002-4cd0-a82b-ca198e943597
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	03a4f7ca-e879-4565-8f06-1c4f84dc67bf
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	9f2c4059-4085-4a44-bbc1-b9eff1a40887
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	8abfb2c7-70cd-491c-bc36-0f5aa89c01a0
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	65ac45c5-6460-47e4-ba0f-fc85d0d5e297
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	d71288ac-a410-4e0e-9449-56eff83337d4
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	ba4a1ae8-c8e0-4d95-a639-44225a2bc9cb
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	e4031167-3633-4a00-a27c-4958696d8ee1
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	f7133188-e383-403d-bfcd-b03ee480a40b
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	6c6b1360-d795-4289-914e-70f4f0210f4a
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	55f9c74f-24d4-46da-8c18-b51bcc3a04a8
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	32cc7597-d0c2-403a-b9fb-3c192d2328d2
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	e9c5fa84-8c90-48c5-9563-cbbd9d933a4a
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	f7d2e532-71db-40c6-9ae1-aeb053f25a81
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	b664a5de-d6c7-44bc-8e98-59edbdef4e44
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	a111c910-f848-4893-b18d-f3f357e0df86
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	aaba8d6c-96e0-4f78-be60-055c1a354985
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	6d387751-786b-42c0-885d-cb06eade2dc2
65ac45c5-6460-47e4-ba0f-fc85d0d5e297	a111c910-f848-4893-b18d-f3f357e0df86
8abfb2c7-70cd-491c-bc36-0f5aa89c01a0	b664a5de-d6c7-44bc-8e98-59edbdef4e44
8abfb2c7-70cd-491c-bc36-0f5aa89c01a0	6d387751-786b-42c0-885d-cb06eade2dc2
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	30b5cd8a-db30-4faa-885b-f889ec6e051b
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	91902a1f-a4da-4338-a160-33679cd93c77
91902a1f-a4da-4338-a160-33679cd93c77	2a08235e-6c31-4b65-ba07-600543cd729a
8e9bf446-e8de-4c2f-a364-fbbefa477b06	7179332d-78ed-48ae-a3ef-568ba11659cf
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	f447c3a4-f861-4603-888a-8f522a03c57e
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	4befdcf4-9ddf-4571-bf5c-0815836ae7f5
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	7d58cc98-be81-4737-ad87-8a1af587e417
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	76fa01e7-b0ec-4a36-90cf-5035449e7bf6
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	56261aa3-be27-4a8b-8ff2-0b28887b9f9c
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	8829a084-2db2-4925-9f96-8b99fb3d2be7
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	ca4ea9b4-57e1-48d0-8265-65104faf2f58
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	97766c5c-0c69-4829-80d3-685b0018d7ba
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	f46b015a-8962-423e-a033-39f5fcae1350
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	8b738d5b-f7d0-4f83-b4e4-a7bb54cffbf9
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	81e2bc35-14a5-4552-b94c-06d3e4fe9c57
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	603f6654-4288-46ee-9434-8d3b45eef399
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	97980c0d-2784-431f-addd-7188bcc5f952
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	0b257716-5cbd-4854-8d2c-1112840944f6
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	2b11cbe3-8a37-4b9c-a191-04c9c8ec5e56
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	5d2eddf3-0b4b-409f-b0d1-b2b82f71a453
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	6b7b9515-84da-48c4-8a5b-15d301ee441c
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	b0a4269a-0b64-4c98-86e1-203f10b6d173
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	85e37c8f-b4f3-4760-9f34-77f88ae5c71a
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	379549a9-99a4-453b-94d7-61d54e702ef9
8829a084-2db2-4925-9f96-8b99fb3d2be7	6b7b9515-84da-48c4-8a5b-15d301ee441c
8829a084-2db2-4925-9f96-8b99fb3d2be7	379549a9-99a4-453b-94d7-61d54e702ef9
ca4ea9b4-57e1-48d0-8265-65104faf2f58	b0a4269a-0b64-4c98-86e1-203f10b6d173
69335454-f37b-4b53-8911-4d41f33022d8	314afbc1-6852-40a2-98d5-90d3f67a5974
69335454-f37b-4b53-8911-4d41f33022d8	4183477b-5a5c-4a5f-8535-c476106dd40e
69335454-f37b-4b53-8911-4d41f33022d8	6df7d932-f3f5-4afc-ba0d-40f43ef6676d
69335454-f37b-4b53-8911-4d41f33022d8	dade3d0a-ce93-4818-8b9c-8aa6fb856d2f
69335454-f37b-4b53-8911-4d41f33022d8	11f5cda6-6618-487e-b949-1ab6ca27b47b
69335454-f37b-4b53-8911-4d41f33022d8	b24f39c7-4907-450e-b2a1-4f9457a1ae80
69335454-f37b-4b53-8911-4d41f33022d8	776c5f5e-384a-4e1f-9298-d5d4edcc098f
69335454-f37b-4b53-8911-4d41f33022d8	58fb2cfe-c88f-4b51-ada0-6ff1823dc33a
69335454-f37b-4b53-8911-4d41f33022d8	4247669f-9f95-43a2-9c26-d47c99eb710f
69335454-f37b-4b53-8911-4d41f33022d8	ead8ea26-e854-4296-bb7c-62909abc34a0
69335454-f37b-4b53-8911-4d41f33022d8	c41ad1ac-f7ed-4732-907f-0ae871d686f8
69335454-f37b-4b53-8911-4d41f33022d8	d66c39fe-cd04-4d46-bf5f-509a9213a9c1
69335454-f37b-4b53-8911-4d41f33022d8	f09fe052-2641-4ef0-89f6-3a5400fd8a84
69335454-f37b-4b53-8911-4d41f33022d8	8a32160d-d5b5-4f2c-a5ee-4483aee711dc
69335454-f37b-4b53-8911-4d41f33022d8	5b6c7978-24a7-4f25-bff7-ad94d364121a
69335454-f37b-4b53-8911-4d41f33022d8	49383893-3880-4577-b035-e32d753f2b63
69335454-f37b-4b53-8911-4d41f33022d8	fe9bbc4a-5e64-4d9e-9205-d54f58403ec5
6c43a0a9-08d3-4f46-88e7-5e70b9535060	643c6e8a-6de6-4594-a3df-3b849475ffe3
6df7d932-f3f5-4afc-ba0d-40f43ef6676d	8a32160d-d5b5-4f2c-a5ee-4483aee711dc
6df7d932-f3f5-4afc-ba0d-40f43ef6676d	fe9bbc4a-5e64-4d9e-9205-d54f58403ec5
dade3d0a-ce93-4818-8b9c-8aa6fb856d2f	5b6c7978-24a7-4f25-bff7-ad94d364121a
6c43a0a9-08d3-4f46-88e7-5e70b9535060	0bc0818a-89cb-40a9-813f-1371239ff699
0bc0818a-89cb-40a9-813f-1371239ff699	8c63f99d-b517-41a4-8ed9-8329e632f11e
18839c91-1a2a-46f8-a842-20f85e18e628	04a33d85-1d47-435e-b9e6-69995fdf27f3
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	694c7d12-87da-40d6-bb39-68834f9f3a0a
69335454-f37b-4b53-8911-4d41f33022d8	6b3cfe2a-b7e9-4a47-97a8-7baae6b7fbeb
6c43a0a9-08d3-4f46-88e7-5e70b9535060	681cd140-0405-4f22-9e0e-c6ede555af7a
6c43a0a9-08d3-4f46-88e7-5e70b9535060	e25ef5a4-d50d-4dd6-909d-e61295dfc586
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
146f6c61-fd3b-435f-a134-220177592011	\N	password	d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797	1738191536177	\N	{"value":"8yR1PIvpfqbE8jal/tnreJhK6znS5F4zS4RBM8LG8vo=","salt":"u3GAa0CRxGgRHmtS6ww1YQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-01-29 22:58:51.960138	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8191531720
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-01-29 22:58:51.968408	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8191531720
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-01-29 22:58:51.992514	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	8191531720
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-01-29 22:58:51.994681	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8191531720
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-01-29 22:58:52.05045	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8191531720
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-01-29 22:58:52.054198	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8191531720
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-01-29 22:58:52.106662	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8191531720
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-01-29 22:58:52.109947	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8191531720
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-01-29 22:58:52.113344	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	8191531720
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-01-29 22:58:52.164478	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	8191531720
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-01-29 22:58:52.190907	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8191531720
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-01-29 22:58:52.193104	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8191531720
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-01-29 22:58:52.20241	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8191531720
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-01-29 22:58:52.211273	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	8191531720
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-01-29 22:58:52.212197	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-01-29 22:58:52.213734	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	8191531720
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-01-29 22:58:52.215372	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	8191531720
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-01-29 22:58:52.237239	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	8191531720
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-01-29 22:58:52.260169	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8191531720
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-01-29 22:58:52.262757	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8191531720
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-01-29 22:58:52.264216	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8191531720
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-01-29 22:58:52.265475	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8191531720
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-01-29 22:58:52.306358	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	8191531720
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-01-29 22:58:52.30939	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8191531720
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-01-29 22:58:52.310072	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8191531720
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-01-29 22:58:52.504253	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	8191531720
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-01-29 22:58:52.53963	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	8191531720
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-01-29 22:58:52.541952	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8191531720
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-01-29 22:58:52.572025	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	8191531720
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-01-29 22:58:52.579332	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	8191531720
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-01-29 22:58:52.588263	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	8191531720
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-01-29 22:58:52.591216	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	8191531720
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-01-29 22:58:52.594368	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-01-29 22:58:52.595372	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8191531720
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-01-29 22:58:52.609752	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8191531720
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-01-29 22:58:52.612445	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	8191531720
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-01-29 22:58:52.614946	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8191531720
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-01-29 22:58:52.616766	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	8191531720
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-01-29 22:58:52.618324	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	8191531720
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-01-29 22:58:52.618913	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8191531720
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-01-29 22:58:52.619951	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8191531720
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-01-29 22:58:52.622768	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	8191531720
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-01-29 22:58:53.343956	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	8191531720
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-01-29 22:58:53.346079	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	8191531720
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-01-29 22:58:53.3477	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8191531720
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-01-29 22:58:53.349627	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	8191531720
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-01-29 22:58:53.350202	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8191531720
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-01-29 22:58:53.407734	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	8191531720
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-01-29 22:58:53.409519	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	8191531720
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-01-29 22:58:53.428061	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	8191531720
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-01-29 22:58:53.58511	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	8191531720
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-01-29 22:58:53.586683	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-01-29 22:58:53.587819	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	8191531720
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-01-29 22:58:53.588952	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	8191531720
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-01-29 22:58:53.591525	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	8191531720
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-01-29 22:58:53.594035	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	8191531720
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-01-29 22:58:53.616458	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	8191531720
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-01-29 22:58:53.797347	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	8191531720
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-01-29 22:58:53.808439	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	8191531720
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-01-29 22:58:53.81076	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8191531720
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-01-29 22:58:53.81387	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	8191531720
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-01-29 22:58:53.815834	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	8191531720
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-01-29 22:58:53.816942	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8191531720
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-01-29 22:58:53.818013	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8191531720
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-01-29 22:58:53.819315	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	8191531720
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-01-29 22:58:53.837877	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	8191531720
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-01-29 22:58:53.85431	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	8191531720
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-01-29 22:58:53.856287	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	8191531720
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-01-29 22:58:53.874022	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	8191531720
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-01-29 22:58:53.876052	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	8191531720
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-01-29 22:58:53.877449	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8191531720
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-01-29 22:58:53.879958	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8191531720
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-01-29 22:58:53.882784	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8191531720
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-01-29 22:58:53.883629	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8191531720
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-01-29 22:58:53.892853	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	8191531720
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-01-29 22:58:53.911022	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	8191531720
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-01-29 22:58:53.913051	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	8191531720
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-01-29 22:58:53.913723	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	8191531720
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-01-29 22:58:53.922669	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	8191531720
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-01-29 22:58:53.923412	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	8191531720
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-01-29 22:58:53.940691	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	8191531720
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-01-29 22:58:53.941416	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8191531720
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-01-29 22:58:53.943309	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8191531720
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-01-29 22:58:53.943793	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8191531720
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-01-29 22:58:53.959718	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8191531720
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-01-29 22:58:53.962322	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	8191531720
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-01-29 22:58:53.966459	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	8191531720
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-01-29 22:58:53.969862	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	8191531720
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:53.972257	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	8191531720
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:53.97556	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	8191531720
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:53.99148	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:53.996086	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	8191531720
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:53.996629	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8191531720
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:54.000486	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8191531720
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:54.001321	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	8191531720
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-01-29 22:58:54.003819	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	8191531720
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.048922	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.049659	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.055936	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.074161	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.074901	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.093595	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	8191531720
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-01-29 22:58:54.0959	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	8191531720
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-01-29 22:58:54.099425	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	8191531720
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-01-29 22:58:54.11912	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	8191531720
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-01-29 22:58:54.138249	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8191531720
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-01-29 22:58:54.159762	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	8191531720
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-01-29 22:58:54.162278	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	8191531720
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-01-29 22:58:54.181401	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8191531720
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-01-29 22:58:54.182449	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8191531720
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-01-29 22:58:54.185981	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-01-29 22:58:54.188314	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	8191531720
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-01-29 22:58:54.199085	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8191531720
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-01-29 22:58:54.200381	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	8191531720
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-01-29 22:58:54.202485	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	8191531720
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-01-29 22:58:54.203023	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	8191531720
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-01-29 22:58:54.205263	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	8191531720
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-01-29 22:58:54.206402	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8191531720
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-01-29 22:58:54.267683	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	8191531720
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-01-29 22:58:54.269799	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	8191531720
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-01-29 22:58:54.272152	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-01-29 22:58:54.288616	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-01-29 22:58:54.290852	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	8191531720
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-01-29 22:58:54.29154	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-01-29 22:58:54.29228	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.294455	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.311217	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.343275	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.373312	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.400968	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.428571	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.429551	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.451368	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8191531720
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.461669	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8191531720
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.468648	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8191531720
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.469508	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8191531720
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-01-29 22:58:54.509565	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	8191531720
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.513574	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	8191531720
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.517353	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	8191531720
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.537061	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8191531720
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.53977	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	8191531720
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.54296	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8191531720
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.561446	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8191531720
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.602257	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	8191531720
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.626251	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8191531720
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.634911	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	8191531720
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-01-29 22:58:54.636416	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	8191531720
26.0.6-34013	keycloak	META-INF/jpa-changelog-26.0.6.xml	2025-01-29 22:58:54.637608	148	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8191531720
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
a29ac0cc-6643-4c10-86aa-b45218f74a2a	084e4b23-3cad-463c-8dc0-1857b89938da	f
a29ac0cc-6643-4c10-86aa-b45218f74a2a	1337fa53-e68d-4c1b-8e18-259fdba42df7	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	2cee5736-24bd-4f09-ae17-18b01303c0ef	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	4b421f95-57cb-4c61-8ee0-888a0962d313	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	1deeb924-4f7e-4009-a9ed-e167cffcf0b7	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	50b223ea-77a0-483a-af02-44c701cb551a	f
a29ac0cc-6643-4c10-86aa-b45218f74a2a	dce50c6d-196e-4ffa-811e-aa83db38392a	f
a29ac0cc-6643-4c10-86aa-b45218f74a2a	764d4b76-11a8-40cf-ae4a-805b86065577	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d039a28-b260-4d3d-b04a-f9dcf8ddd782	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45	f
a29ac0cc-6643-4c10-86aa-b45218f74a2a	4d115809-d1f0-4558-ae0a-1afab09e7678	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	cf9af156-1727-4981-8b7a-6f81a7a05834	t
a29ac0cc-6643-4c10-86aa-b45218f74a2a	57c81c09-7b61-4f2d-9227-700262fcb886	f
979582be-1e58-424d-ace1-ad20c44dfb71	a485e137-0e84-4994-8c18-edddc3fe15b7	f
979582be-1e58-424d-ace1-ad20c44dfb71	7d60a538-53cc-4147-b195-98bea58cba5c	t
979582be-1e58-424d-ace1-ad20c44dfb71	0b469eff-386c-4c87-b178-00d7a813ba0d	t
979582be-1e58-424d-ace1-ad20c44dfb71	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9	t
979582be-1e58-424d-ace1-ad20c44dfb71	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e	t
979582be-1e58-424d-ace1-ad20c44dfb71	f5efe9c6-32a2-4411-9bce-6ecb9207dcef	f
979582be-1e58-424d-ace1-ad20c44dfb71	fce38c03-65b9-4946-8e81-a23b299eaa23	f
979582be-1e58-424d-ace1-ad20c44dfb71	fd0064d0-633f-41c0-9a1d-572c66bd4eb9	t
979582be-1e58-424d-ace1-ad20c44dfb71	b4edbb49-48bf-46c4-9a96-863e85d49bf9	t
979582be-1e58-424d-ace1-ad20c44dfb71	961c0040-4cc6-4bf1-bbb7-235be7a78b4a	f
979582be-1e58-424d-ace1-ad20c44dfb71	47bf5835-b93e-4d02-93d0-4099951dde5c	t
979582be-1e58-424d-ace1-ad20c44dfb71	6728c59d-a74b-4b70-bdbb-7f39ead6cdae	t
979582be-1e58-424d-ace1-ad20c44dfb71	31795827-0a6b-4c5b-aa22-cb61ee0ef189	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	${role_default-roles}	default-roles-master	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	\N
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	${role_admin}	admin	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	\N
93d49b52-6002-4cd0-a82b-ca198e943597	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	${role_create-realm}	create-realm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	\N
03a4f7ca-e879-4565-8f06-1c4f84dc67bf	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_create-client}	create-client	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
9f2c4059-4085-4a44-bbc1-b9eff1a40887	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-realm}	view-realm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
8abfb2c7-70cd-491c-bc36-0f5aa89c01a0	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-users}	view-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
65ac45c5-6460-47e4-ba0f-fc85d0d5e297	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-clients}	view-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
d71288ac-a410-4e0e-9449-56eff83337d4	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-events}	view-events	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
ba4a1ae8-c8e0-4d95-a639-44225a2bc9cb	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-identity-providers}	view-identity-providers	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
e4031167-3633-4a00-a27c-4958696d8ee1	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_view-authorization}	view-authorization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
f7133188-e383-403d-bfcd-b03ee480a40b	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-realm}	manage-realm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
6c6b1360-d795-4289-914e-70f4f0210f4a	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-users}	manage-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
55f9c74f-24d4-46da-8c18-b51bcc3a04a8	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-clients}	manage-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
32cc7597-d0c2-403a-b9fb-3c192d2328d2	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-events}	manage-events	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
e9c5fa84-8c90-48c5-9563-cbbd9d933a4a	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-identity-providers}	manage-identity-providers	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
f7d2e532-71db-40c6-9ae1-aeb053f25a81	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_manage-authorization}	manage-authorization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
b664a5de-d6c7-44bc-8e98-59edbdef4e44	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_query-users}	query-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
a111c910-f848-4893-b18d-f3f357e0df86	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_query-clients}	query-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
aaba8d6c-96e0-4f78-be60-055c1a354985	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_query-realms}	query-realms	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
6d387751-786b-42c0-885d-cb06eade2dc2	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_query-groups}	query-groups	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
30b5cd8a-db30-4faa-885b-f889ec6e051b	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_view-profile}	view-profile	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
91902a1f-a4da-4338-a160-33679cd93c77	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_manage-account}	manage-account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
2a08235e-6c31-4b65-ba07-600543cd729a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_manage-account-links}	manage-account-links	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
82ae720c-f109-420f-8037-3a7244c4822a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_view-applications}	view-applications	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
7179332d-78ed-48ae-a3ef-568ba11659cf	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_view-consent}	view-consent	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
8e9bf446-e8de-4c2f-a364-fbbefa477b06	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_manage-consent}	manage-consent	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
d4ffb7d5-0fcc-4821-b738-480b75b7534b	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_view-groups}	view-groups	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
88038438-c32b-4200-9c64-92648886f07a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	t	${role_delete-account}	delete-account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	9d26ef0a-e088-4432-8f9a-6f73bd9137c1	\N
6cb7184a-7eb6-445c-8351-5bb8bc4916ae	eb5dca20-0317-41ff-8b1d-4908012b9246	t	${role_read-token}	read-token	a29ac0cc-6643-4c10-86aa-b45218f74a2a	eb5dca20-0317-41ff-8b1d-4908012b9246	\N
f447c3a4-f861-4603-888a-8f522a03c57e	d489c56a-9d28-4ac0-bf37-a61810209943	t	${role_impersonation}	impersonation	a29ac0cc-6643-4c10-86aa-b45218f74a2a	d489c56a-9d28-4ac0-bf37-a61810209943	\N
4befdcf4-9ddf-4571-bf5c-0815836ae7f5	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	${role_offline-access}	offline_access	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	\N
7d58cc98-be81-4737-ad87-8a1af587e417	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	${role_uma_authorization}	uma_authorization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	\N	\N
6c43a0a9-08d3-4f46-88e7-5e70b9535060	979582be-1e58-424d-ace1-ad20c44dfb71	f	${role_default-roles}	default-roles-hackaton	979582be-1e58-424d-ace1-ad20c44dfb71	\N	\N
76fa01e7-b0ec-4a36-90cf-5035449e7bf6	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_create-client}	create-client	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
56261aa3-be27-4a8b-8ff2-0b28887b9f9c	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-realm}	view-realm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
8829a084-2db2-4925-9f96-8b99fb3d2be7	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-users}	view-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
ca4ea9b4-57e1-48d0-8265-65104faf2f58	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-clients}	view-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
97766c5c-0c69-4829-80d3-685b0018d7ba	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-events}	view-events	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
f46b015a-8962-423e-a033-39f5fcae1350	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-identity-providers}	view-identity-providers	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
8b738d5b-f7d0-4f83-b4e4-a7bb54cffbf9	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_view-authorization}	view-authorization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
81e2bc35-14a5-4552-b94c-06d3e4fe9c57	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-realm}	manage-realm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
603f6654-4288-46ee-9434-8d3b45eef399	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-users}	manage-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
97980c0d-2784-431f-addd-7188bcc5f952	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-clients}	manage-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
0b257716-5cbd-4854-8d2c-1112840944f6	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-events}	manage-events	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
2b11cbe3-8a37-4b9c-a191-04c9c8ec5e56	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-identity-providers}	manage-identity-providers	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
5d2eddf3-0b4b-409f-b0d1-b2b82f71a453	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_manage-authorization}	manage-authorization	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
6b7b9515-84da-48c4-8a5b-15d301ee441c	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_query-users}	query-users	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
b0a4269a-0b64-4c98-86e1-203f10b6d173	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_query-clients}	query-clients	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
85e37c8f-b4f3-4760-9f34-77f88ae5c71a	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_query-realms}	query-realms	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
379549a9-99a4-453b-94d7-61d54e702ef9	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_query-groups}	query-groups	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
69335454-f37b-4b53-8911-4d41f33022d8	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_realm-admin}	realm-admin	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
314afbc1-6852-40a2-98d5-90d3f67a5974	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_create-client}	create-client	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
4183477b-5a5c-4a5f-8535-c476106dd40e	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-realm}	view-realm	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
6df7d932-f3f5-4afc-ba0d-40f43ef6676d	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-users}	view-users	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
dade3d0a-ce93-4818-8b9c-8aa6fb856d2f	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-clients}	view-clients	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
11f5cda6-6618-487e-b949-1ab6ca27b47b	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-events}	view-events	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
b24f39c7-4907-450e-b2a1-4f9457a1ae80	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-identity-providers}	view-identity-providers	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
776c5f5e-384a-4e1f-9298-d5d4edcc098f	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_view-authorization}	view-authorization	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
58fb2cfe-c88f-4b51-ada0-6ff1823dc33a	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-realm}	manage-realm	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
4247669f-9f95-43a2-9c26-d47c99eb710f	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-users}	manage-users	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
ead8ea26-e854-4296-bb7c-62909abc34a0	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-clients}	manage-clients	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
c41ad1ac-f7ed-4732-907f-0ae871d686f8	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-events}	manage-events	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
d66c39fe-cd04-4d46-bf5f-509a9213a9c1	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-identity-providers}	manage-identity-providers	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
f09fe052-2641-4ef0-89f6-3a5400fd8a84	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_manage-authorization}	manage-authorization	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
8a32160d-d5b5-4f2c-a5ee-4483aee711dc	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_query-users}	query-users	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
5b6c7978-24a7-4f25-bff7-ad94d364121a	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_query-clients}	query-clients	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
49383893-3880-4577-b035-e32d753f2b63	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_query-realms}	query-realms	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
fe9bbc4a-5e64-4d9e-9205-d54f58403ec5	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_query-groups}	query-groups	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
643c6e8a-6de6-4594-a3df-3b849475ffe3	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_view-profile}	view-profile	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
0bc0818a-89cb-40a9-813f-1371239ff699	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_manage-account}	manage-account	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
8c63f99d-b517-41a4-8ed9-8329e632f11e	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_manage-account-links}	manage-account-links	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
961090e0-f366-4913-9a55-144f49b4f488	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_view-applications}	view-applications	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
04a33d85-1d47-435e-b9e6-69995fdf27f3	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_view-consent}	view-consent	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
18839c91-1a2a-46f8-a842-20f85e18e628	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_manage-consent}	manage-consent	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
4809a3c3-3e5d-42b5-8ed2-4b28c9bd3dad	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_view-groups}	view-groups	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
29cbf74c-4bf3-4c38-9a6b-af09500146f9	cb95ffcf-49dc-44df-a909-9452d782e304	t	${role_delete-account}	delete-account	979582be-1e58-424d-ace1-ad20c44dfb71	cb95ffcf-49dc-44df-a909-9452d782e304	\N
694c7d12-87da-40d6-bb39-68834f9f3a0a	dec212c2-1781-4a06-b380-896f4cce4da8	t	${role_impersonation}	impersonation	a29ac0cc-6643-4c10-86aa-b45218f74a2a	dec212c2-1781-4a06-b380-896f4cce4da8	\N
6b3cfe2a-b7e9-4a47-97a8-7baae6b7fbeb	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	t	${role_impersonation}	impersonation	979582be-1e58-424d-ace1-ad20c44dfb71	1ffc065d-1b8b-4e99-bd41-0fd96a84a39a	\N
34266daf-1f05-49c8-b964-4671261fcfd7	2811c445-a13c-400b-876d-dc6ef101a891	t	${role_read-token}	read-token	979582be-1e58-424d-ace1-ad20c44dfb71	2811c445-a13c-400b-876d-dc6ef101a891	\N
681cd140-0405-4f22-9e0e-c6ede555af7a	979582be-1e58-424d-ace1-ad20c44dfb71	f	${role_offline-access}	offline_access	979582be-1e58-424d-ace1-ad20c44dfb71	\N	\N
e25ef5a4-d50d-4dd6-909d-e61295dfc586	979582be-1e58-424d-ace1-ad20c44dfb71	f	${role_uma_authorization}	uma_authorization	979582be-1e58-424d-ace1-ad20c44dfb71	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
s0nox	26.0.7	1738191534
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
816fc091-4f4d-4aa4-8853-c45582a5c0e8	515ac3a5-fd27-41ec-8890-955306cefb34	0	1738191559	{"authMethod":"openid-connect","redirectUri":"http://localhost:8082/admin/master/console/","notes":{"clientId":"515ac3a5-fd27-41ec-8890-955306cefb34","iss":"http://localhost:8082/realms/master","startedAt":"1738191559","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"d0350c1c-6ddd-4e7d-8b76-60dc303f110c","response_mode":"query","scope":"openid","userSessionStartedAt":"1738191559","redirect_uri":"http://localhost:8082/admin/master/console/","state":"741684aa-bf3e-4d98-9a8c-961966919941","code_challenge":"RYI76eFvx5i_xWhGc-rDWLxO9zYbfRP9mwy4UR2PoQs"}}	local	local	0
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
816fc091-4f4d-4aa4-8853-c45582a5c0e8	d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797	a29ac0cc-6643-4c10-86aa-b45218f74a2a	1738191559	0	{"ipAddress":"172.18.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTguMC4xIiwib3MiOiJNYWMgT1MgWCIsIm9zVmVyc2lvbiI6IjEwLjE1LjciLCJicm93c2VyIjoiU2FmYXJpLzE3LjYiLCJkZXZpY2UiOiJNYWMiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1738191559","authenticators-completed":"{\\"51d9a59f-b069-4917-90cd-b28ff057042c\\":1738191559}"},"state":"LOGGED_IN"}	1738191559	\N	0
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
83b951c9-f011-4634-9ebd-ee9f2083a8e2	audience resolve	openid-connect	oidc-audience-resolve-mapper	5413cc4f-9a62-48bd-befd-738a7c4957de	\N
2477ea32-6d1a-46c2-ae00-6db7923b2867	locale	openid-connect	oidc-usermodel-attribute-mapper	515ac3a5-fd27-41ec-8890-955306cefb34	\N
2ea90d67-505f-41eb-9a15-150242646bde	role list	saml	saml-role-list-mapper	\N	1337fa53-e68d-4c1b-8e18-259fdba42df7
9ab2a454-5147-43e1-87e8-87e209119cc9	organization	saml	saml-organization-membership-mapper	\N	2cee5736-24bd-4f09-ae17-18b01303c0ef
b7d90e7f-9b57-4053-a780-f26c366cd16b	full name	openid-connect	oidc-full-name-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
dc3bc873-5daf-4afb-8df4-689675ca6132	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
fc5fba62-6fd5-4497-8a18-cdb302ebe844	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
b90b64a7-29a4-4556-9cdb-fe9f62671693	username	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
51736bcb-abd2-4cee-98fd-77e90d44b236	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
ed613666-4f33-4e45-a7fd-ff95bf332c64	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
68c428fb-3065-4861-b7d3-d33d5b6b1849	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
48f219ec-6074-455e-b05f-2f278b1431a0	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
97c5ead8-a117-4e16-bd6d-f109dd37ea87	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
b3366d98-1d2d-48d3-af89-d9a4096385fb	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4b421f95-57cb-4c61-8ee0-888a0962d313
96d72e6f-249e-4358-833c-b25d4093374d	email	openid-connect	oidc-usermodel-attribute-mapper	\N	1deeb924-4f7e-4009-a9ed-e167cffcf0b7
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	1deeb924-4f7e-4009-a9ed-e167cffcf0b7
c33e26bb-4e65-4329-95a0-332b9ceda307	address	openid-connect	oidc-address-mapper	\N	50b223ea-77a0-483a-af02-44c701cb551a
fd9242db-8b9c-403b-9ef2-56be1456844f	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	dce50c6d-196e-4ffa-811e-aa83db38392a
b57262ab-bd14-49bc-ba56-bb48a679fee5	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	dce50c6d-196e-4ffa-811e-aa83db38392a
4321d656-934b-4cdc-b30f-82a138970aba	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	764d4b76-11a8-40cf-ae4a-805b86065577
e39a2e2e-7fbd-4491-98c5-da62905c8e87	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	764d4b76-11a8-40cf-ae4a-805b86065577
b897d5d2-d7c5-4fd3-8f1c-fac7e5ac7c24	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	764d4b76-11a8-40cf-ae4a-805b86065577
a7cbf479-2a5a-4ee9-b18c-075575c2a602	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	9d039a28-b260-4d3d-b04a-f9dcf8ddd782
66eef5af-aa9f-4d7f-8571-a774aea25795	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45
cbb65582-ee71-480d-a3d4-eff576799ae8	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	53dddbdf-d49a-461d-8b9a-f51a0e8ffb45
7832b57b-d5b9-43f3-b03d-4bbb0967a65e	acr loa level	openid-connect	oidc-acr-mapper	\N	4d115809-d1f0-4558-ae0a-1afab09e7678
5b3244b5-f903-4ccf-bc7f-a026edb794c3	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	cf9af156-1727-4981-8b7a-6f81a7a05834
b2f950a6-cf72-4232-b2be-3af74938a852	sub	openid-connect	oidc-sub-mapper	\N	cf9af156-1727-4981-8b7a-6f81a7a05834
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	organization	openid-connect	oidc-organization-membership-mapper	\N	57c81c09-7b61-4f2d-9227-700262fcb886
155faab0-6d7c-4b6c-a968-2ef2230ccf2a	audience resolve	openid-connect	oidc-audience-resolve-mapper	16d8ef0c-9e42-4dac-a972-c279f301fef6	\N
4827db09-6e2d-4f1e-9755-325b7a16dbf6	role list	saml	saml-role-list-mapper	\N	7d60a538-53cc-4147-b195-98bea58cba5c
db643baa-46c3-4c9b-8f5d-eadd8f3c4890	organization	saml	saml-organization-membership-mapper	\N	0b469eff-386c-4c87-b178-00d7a813ba0d
f2e71d82-acb6-4ecd-802b-5013a6c35555	full name	openid-connect	oidc-full-name-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
1777f44f-c898-458d-9527-a771434b3e72	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
91a956ee-8f69-4dbf-a157-030609b665f7	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
7c149d9b-45d1-4f2c-b89b-beaa46f64926	username	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
7c535705-e34f-4bec-8a39-b92119dc8c8a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
0003146b-5cf2-497f-822d-691dbca6b8d0	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	website	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
9979916c-244c-4730-8a15-c1894f41f05c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
093315ed-8d44-4c37-a466-f06913802a3e	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
fb780e0d-2635-4a4e-bd86-a84db8d72349	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
88294949-6967-4225-ab07-c2a3c1ab6d35	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	7d50a3c7-07a8-4d92-ad1e-3fbe982b06c9
1d996b1a-c7eb-462f-ad74-56fa71fb1090	email	openid-connect	oidc-usermodel-attribute-mapper	\N	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e
dee68997-17e3-4250-9002-d94cfe082ee9	email verified	openid-connect	oidc-usermodel-property-mapper	\N	48bd2bfb-b07d-48d2-bbf9-5553afa66e9e
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	address	openid-connect	oidc-address-mapper	\N	f5efe9c6-32a2-4411-9bce-6ecb9207dcef
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	fce38c03-65b9-4946-8e81-a23b299eaa23
1abcd4a5-99d5-44af-aaa3-dda10d85c469	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	fce38c03-65b9-4946-8e81-a23b299eaa23
3f6d6994-2b6a-4de7-94c0-f142de49a566	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	fd0064d0-633f-41c0-9a1d-572c66bd4eb9
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	fd0064d0-633f-41c0-9a1d-572c66bd4eb9
a14c17a1-1041-4a4b-8b80-ba60452d320c	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	fd0064d0-633f-41c0-9a1d-572c66bd4eb9
55aa1f10-06ec-4ccb-8722-c9ef18e4279d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b4edbb49-48bf-46c4-9a96-863e85d49bf9
047ce223-d0bd-46fa-9329-72b02955b7cc	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	961c0040-4cc6-4bf1-bbb7-235be7a78b4a
50f541e1-1169-497f-8b1d-29296d01a921	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	961c0040-4cc6-4bf1-bbb7-235be7a78b4a
70a99361-c53b-4024-ad9b-02ca8420d062	acr loa level	openid-connect	oidc-acr-mapper	\N	47bf5835-b93e-4d02-93d0-4099951dde5c
923bb4f1-7f93-400b-a08d-b2e4364e8257	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	6728c59d-a74b-4b70-bdbb-7f39ead6cdae
8c77bb19-9298-4035-a290-98afb4623027	sub	openid-connect	oidc-sub-mapper	\N	6728c59d-a74b-4b70-bdbb-7f39ead6cdae
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	organization	openid-connect	oidc-organization-membership-mapper	\N	31795827-0a6b-4c5b-aa22-cb61ee0ef189
05f8f7ea-529e-4905-b1c2-ec8be73da991	locale	openid-connect	oidc-usermodel-attribute-mapper	f727b726-7af6-4163-83db-9d39cc43b4cd	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
2477ea32-6d1a-46c2-ae00-6db7923b2867	true	introspection.token.claim
2477ea32-6d1a-46c2-ae00-6db7923b2867	true	userinfo.token.claim
2477ea32-6d1a-46c2-ae00-6db7923b2867	locale	user.attribute
2477ea32-6d1a-46c2-ae00-6db7923b2867	true	id.token.claim
2477ea32-6d1a-46c2-ae00-6db7923b2867	true	access.token.claim
2477ea32-6d1a-46c2-ae00-6db7923b2867	locale	claim.name
2477ea32-6d1a-46c2-ae00-6db7923b2867	String	jsonType.label
2ea90d67-505f-41eb-9a15-150242646bde	false	single
2ea90d67-505f-41eb-9a15-150242646bde	Basic	attribute.nameformat
2ea90d67-505f-41eb-9a15-150242646bde	Role	attribute.name
48f219ec-6074-455e-b05f-2f278b1431a0	true	introspection.token.claim
48f219ec-6074-455e-b05f-2f278b1431a0	true	userinfo.token.claim
48f219ec-6074-455e-b05f-2f278b1431a0	zoneinfo	user.attribute
48f219ec-6074-455e-b05f-2f278b1431a0	true	id.token.claim
48f219ec-6074-455e-b05f-2f278b1431a0	true	access.token.claim
48f219ec-6074-455e-b05f-2f278b1431a0	zoneinfo	claim.name
48f219ec-6074-455e-b05f-2f278b1431a0	String	jsonType.label
51736bcb-abd2-4cee-98fd-77e90d44b236	true	introspection.token.claim
51736bcb-abd2-4cee-98fd-77e90d44b236	true	userinfo.token.claim
51736bcb-abd2-4cee-98fd-77e90d44b236	picture	user.attribute
51736bcb-abd2-4cee-98fd-77e90d44b236	true	id.token.claim
51736bcb-abd2-4cee-98fd-77e90d44b236	true	access.token.claim
51736bcb-abd2-4cee-98fd-77e90d44b236	picture	claim.name
51736bcb-abd2-4cee-98fd-77e90d44b236	String	jsonType.label
68c428fb-3065-4861-b7d3-d33d5b6b1849	true	introspection.token.claim
68c428fb-3065-4861-b7d3-d33d5b6b1849	true	userinfo.token.claim
68c428fb-3065-4861-b7d3-d33d5b6b1849	birthdate	user.attribute
68c428fb-3065-4861-b7d3-d33d5b6b1849	true	id.token.claim
68c428fb-3065-4861-b7d3-d33d5b6b1849	true	access.token.claim
68c428fb-3065-4861-b7d3-d33d5b6b1849	birthdate	claim.name
68c428fb-3065-4861-b7d3-d33d5b6b1849	String	jsonType.label
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	true	introspection.token.claim
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	true	userinfo.token.claim
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	lastName	user.attribute
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	true	id.token.claim
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	true	access.token.claim
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	family_name	claim.name
6eb94591-c9f2-4cd4-bed4-642ec1c05ca4	String	jsonType.label
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	true	introspection.token.claim
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	true	userinfo.token.claim
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	website	user.attribute
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	true	id.token.claim
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	true	access.token.claim
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	website	claim.name
7d7c13ac-4a21-4922-b7e3-cfad37ed1b20	String	jsonType.label
97c5ead8-a117-4e16-bd6d-f109dd37ea87	true	introspection.token.claim
97c5ead8-a117-4e16-bd6d-f109dd37ea87	true	userinfo.token.claim
97c5ead8-a117-4e16-bd6d-f109dd37ea87	locale	user.attribute
97c5ead8-a117-4e16-bd6d-f109dd37ea87	true	id.token.claim
97c5ead8-a117-4e16-bd6d-f109dd37ea87	true	access.token.claim
97c5ead8-a117-4e16-bd6d-f109dd37ea87	locale	claim.name
97c5ead8-a117-4e16-bd6d-f109dd37ea87	String	jsonType.label
b3366d98-1d2d-48d3-af89-d9a4096385fb	true	introspection.token.claim
b3366d98-1d2d-48d3-af89-d9a4096385fb	true	userinfo.token.claim
b3366d98-1d2d-48d3-af89-d9a4096385fb	updatedAt	user.attribute
b3366d98-1d2d-48d3-af89-d9a4096385fb	true	id.token.claim
b3366d98-1d2d-48d3-af89-d9a4096385fb	true	access.token.claim
b3366d98-1d2d-48d3-af89-d9a4096385fb	updated_at	claim.name
b3366d98-1d2d-48d3-af89-d9a4096385fb	long	jsonType.label
b7d90e7f-9b57-4053-a780-f26c366cd16b	true	introspection.token.claim
b7d90e7f-9b57-4053-a780-f26c366cd16b	true	userinfo.token.claim
b7d90e7f-9b57-4053-a780-f26c366cd16b	true	id.token.claim
b7d90e7f-9b57-4053-a780-f26c366cd16b	true	access.token.claim
b90b64a7-29a4-4556-9cdb-fe9f62671693	true	introspection.token.claim
b90b64a7-29a4-4556-9cdb-fe9f62671693	true	userinfo.token.claim
b90b64a7-29a4-4556-9cdb-fe9f62671693	username	user.attribute
b90b64a7-29a4-4556-9cdb-fe9f62671693	true	id.token.claim
b90b64a7-29a4-4556-9cdb-fe9f62671693	true	access.token.claim
b90b64a7-29a4-4556-9cdb-fe9f62671693	preferred_username	claim.name
b90b64a7-29a4-4556-9cdb-fe9f62671693	String	jsonType.label
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	true	introspection.token.claim
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	true	userinfo.token.claim
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	firstName	user.attribute
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	true	id.token.claim
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	true	access.token.claim
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	given_name	claim.name
ccc8ca0e-e683-4c1c-a1cc-0165cd7423af	String	jsonType.label
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	true	introspection.token.claim
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	true	userinfo.token.claim
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	profile	user.attribute
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	true	id.token.claim
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	true	access.token.claim
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	profile	claim.name
db027192-f82e-4d88-af6e-c3a0b8ebd9eb	String	jsonType.label
dc3bc873-5daf-4afb-8df4-689675ca6132	true	introspection.token.claim
dc3bc873-5daf-4afb-8df4-689675ca6132	true	userinfo.token.claim
dc3bc873-5daf-4afb-8df4-689675ca6132	middleName	user.attribute
dc3bc873-5daf-4afb-8df4-689675ca6132	true	id.token.claim
dc3bc873-5daf-4afb-8df4-689675ca6132	true	access.token.claim
dc3bc873-5daf-4afb-8df4-689675ca6132	middle_name	claim.name
dc3bc873-5daf-4afb-8df4-689675ca6132	String	jsonType.label
ed613666-4f33-4e45-a7fd-ff95bf332c64	true	introspection.token.claim
ed613666-4f33-4e45-a7fd-ff95bf332c64	true	userinfo.token.claim
ed613666-4f33-4e45-a7fd-ff95bf332c64	gender	user.attribute
ed613666-4f33-4e45-a7fd-ff95bf332c64	true	id.token.claim
ed613666-4f33-4e45-a7fd-ff95bf332c64	true	access.token.claim
ed613666-4f33-4e45-a7fd-ff95bf332c64	gender	claim.name
ed613666-4f33-4e45-a7fd-ff95bf332c64	String	jsonType.label
fc5fba62-6fd5-4497-8a18-cdb302ebe844	true	introspection.token.claim
fc5fba62-6fd5-4497-8a18-cdb302ebe844	true	userinfo.token.claim
fc5fba62-6fd5-4497-8a18-cdb302ebe844	nickname	user.attribute
fc5fba62-6fd5-4497-8a18-cdb302ebe844	true	id.token.claim
fc5fba62-6fd5-4497-8a18-cdb302ebe844	true	access.token.claim
fc5fba62-6fd5-4497-8a18-cdb302ebe844	nickname	claim.name
fc5fba62-6fd5-4497-8a18-cdb302ebe844	String	jsonType.label
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	true	introspection.token.claim
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	true	userinfo.token.claim
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	emailVerified	user.attribute
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	true	id.token.claim
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	true	access.token.claim
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	email_verified	claim.name
22607c7a-aa0b-4bc6-9d6f-7e3c159a477e	boolean	jsonType.label
96d72e6f-249e-4358-833c-b25d4093374d	true	introspection.token.claim
96d72e6f-249e-4358-833c-b25d4093374d	true	userinfo.token.claim
96d72e6f-249e-4358-833c-b25d4093374d	email	user.attribute
96d72e6f-249e-4358-833c-b25d4093374d	true	id.token.claim
96d72e6f-249e-4358-833c-b25d4093374d	true	access.token.claim
96d72e6f-249e-4358-833c-b25d4093374d	email	claim.name
96d72e6f-249e-4358-833c-b25d4093374d	String	jsonType.label
c33e26bb-4e65-4329-95a0-332b9ceda307	formatted	user.attribute.formatted
c33e26bb-4e65-4329-95a0-332b9ceda307	country	user.attribute.country
c33e26bb-4e65-4329-95a0-332b9ceda307	true	introspection.token.claim
c33e26bb-4e65-4329-95a0-332b9ceda307	postal_code	user.attribute.postal_code
c33e26bb-4e65-4329-95a0-332b9ceda307	true	userinfo.token.claim
c33e26bb-4e65-4329-95a0-332b9ceda307	street	user.attribute.street
c33e26bb-4e65-4329-95a0-332b9ceda307	true	id.token.claim
c33e26bb-4e65-4329-95a0-332b9ceda307	region	user.attribute.region
c33e26bb-4e65-4329-95a0-332b9ceda307	true	access.token.claim
c33e26bb-4e65-4329-95a0-332b9ceda307	locality	user.attribute.locality
b57262ab-bd14-49bc-ba56-bb48a679fee5	true	introspection.token.claim
b57262ab-bd14-49bc-ba56-bb48a679fee5	true	userinfo.token.claim
b57262ab-bd14-49bc-ba56-bb48a679fee5	phoneNumberVerified	user.attribute
b57262ab-bd14-49bc-ba56-bb48a679fee5	true	id.token.claim
b57262ab-bd14-49bc-ba56-bb48a679fee5	true	access.token.claim
b57262ab-bd14-49bc-ba56-bb48a679fee5	phone_number_verified	claim.name
b57262ab-bd14-49bc-ba56-bb48a679fee5	boolean	jsonType.label
fd9242db-8b9c-403b-9ef2-56be1456844f	true	introspection.token.claim
fd9242db-8b9c-403b-9ef2-56be1456844f	true	userinfo.token.claim
fd9242db-8b9c-403b-9ef2-56be1456844f	phoneNumber	user.attribute
fd9242db-8b9c-403b-9ef2-56be1456844f	true	id.token.claim
fd9242db-8b9c-403b-9ef2-56be1456844f	true	access.token.claim
fd9242db-8b9c-403b-9ef2-56be1456844f	phone_number	claim.name
fd9242db-8b9c-403b-9ef2-56be1456844f	String	jsonType.label
4321d656-934b-4cdc-b30f-82a138970aba	true	introspection.token.claim
4321d656-934b-4cdc-b30f-82a138970aba	true	multivalued
4321d656-934b-4cdc-b30f-82a138970aba	foo	user.attribute
4321d656-934b-4cdc-b30f-82a138970aba	true	access.token.claim
4321d656-934b-4cdc-b30f-82a138970aba	realm_access.roles	claim.name
4321d656-934b-4cdc-b30f-82a138970aba	String	jsonType.label
b897d5d2-d7c5-4fd3-8f1c-fac7e5ac7c24	true	introspection.token.claim
b897d5d2-d7c5-4fd3-8f1c-fac7e5ac7c24	true	access.token.claim
e39a2e2e-7fbd-4491-98c5-da62905c8e87	true	introspection.token.claim
e39a2e2e-7fbd-4491-98c5-da62905c8e87	true	multivalued
e39a2e2e-7fbd-4491-98c5-da62905c8e87	foo	user.attribute
e39a2e2e-7fbd-4491-98c5-da62905c8e87	true	access.token.claim
e39a2e2e-7fbd-4491-98c5-da62905c8e87	resource_access.${client_id}.roles	claim.name
e39a2e2e-7fbd-4491-98c5-da62905c8e87	String	jsonType.label
a7cbf479-2a5a-4ee9-b18c-075575c2a602	true	introspection.token.claim
a7cbf479-2a5a-4ee9-b18c-075575c2a602	true	access.token.claim
66eef5af-aa9f-4d7f-8571-a774aea25795	true	introspection.token.claim
66eef5af-aa9f-4d7f-8571-a774aea25795	true	userinfo.token.claim
66eef5af-aa9f-4d7f-8571-a774aea25795	username	user.attribute
66eef5af-aa9f-4d7f-8571-a774aea25795	true	id.token.claim
66eef5af-aa9f-4d7f-8571-a774aea25795	true	access.token.claim
66eef5af-aa9f-4d7f-8571-a774aea25795	upn	claim.name
66eef5af-aa9f-4d7f-8571-a774aea25795	String	jsonType.label
cbb65582-ee71-480d-a3d4-eff576799ae8	true	introspection.token.claim
cbb65582-ee71-480d-a3d4-eff576799ae8	true	multivalued
cbb65582-ee71-480d-a3d4-eff576799ae8	foo	user.attribute
cbb65582-ee71-480d-a3d4-eff576799ae8	true	id.token.claim
cbb65582-ee71-480d-a3d4-eff576799ae8	true	access.token.claim
cbb65582-ee71-480d-a3d4-eff576799ae8	groups	claim.name
cbb65582-ee71-480d-a3d4-eff576799ae8	String	jsonType.label
7832b57b-d5b9-43f3-b03d-4bbb0967a65e	true	introspection.token.claim
7832b57b-d5b9-43f3-b03d-4bbb0967a65e	true	id.token.claim
7832b57b-d5b9-43f3-b03d-4bbb0967a65e	true	access.token.claim
5b3244b5-f903-4ccf-bc7f-a026edb794c3	AUTH_TIME	user.session.note
5b3244b5-f903-4ccf-bc7f-a026edb794c3	true	introspection.token.claim
5b3244b5-f903-4ccf-bc7f-a026edb794c3	true	id.token.claim
5b3244b5-f903-4ccf-bc7f-a026edb794c3	true	access.token.claim
5b3244b5-f903-4ccf-bc7f-a026edb794c3	auth_time	claim.name
5b3244b5-f903-4ccf-bc7f-a026edb794c3	long	jsonType.label
b2f950a6-cf72-4232-b2be-3af74938a852	true	introspection.token.claim
b2f950a6-cf72-4232-b2be-3af74938a852	true	access.token.claim
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	true	introspection.token.claim
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	true	multivalued
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	true	id.token.claim
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	true	access.token.claim
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	organization	claim.name
c58ecb8c-789f-4dbf-97c1-a0f9c6864cbb	String	jsonType.label
4827db09-6e2d-4f1e-9755-325b7a16dbf6	false	single
4827db09-6e2d-4f1e-9755-325b7a16dbf6	Basic	attribute.nameformat
4827db09-6e2d-4f1e-9755-325b7a16dbf6	Role	attribute.name
0003146b-5cf2-497f-822d-691dbca6b8d0	true	introspection.token.claim
0003146b-5cf2-497f-822d-691dbca6b8d0	true	userinfo.token.claim
0003146b-5cf2-497f-822d-691dbca6b8d0	picture	user.attribute
0003146b-5cf2-497f-822d-691dbca6b8d0	true	id.token.claim
0003146b-5cf2-497f-822d-691dbca6b8d0	true	access.token.claim
0003146b-5cf2-497f-822d-691dbca6b8d0	picture	claim.name
0003146b-5cf2-497f-822d-691dbca6b8d0	String	jsonType.label
093315ed-8d44-4c37-a466-f06913802a3e	true	introspection.token.claim
093315ed-8d44-4c37-a466-f06913802a3e	true	userinfo.token.claim
093315ed-8d44-4c37-a466-f06913802a3e	birthdate	user.attribute
093315ed-8d44-4c37-a466-f06913802a3e	true	id.token.claim
093315ed-8d44-4c37-a466-f06913802a3e	true	access.token.claim
093315ed-8d44-4c37-a466-f06913802a3e	birthdate	claim.name
093315ed-8d44-4c37-a466-f06913802a3e	String	jsonType.label
1777f44f-c898-458d-9527-a771434b3e72	true	introspection.token.claim
1777f44f-c898-458d-9527-a771434b3e72	true	userinfo.token.claim
1777f44f-c898-458d-9527-a771434b3e72	lastName	user.attribute
1777f44f-c898-458d-9527-a771434b3e72	true	id.token.claim
1777f44f-c898-458d-9527-a771434b3e72	true	access.token.claim
1777f44f-c898-458d-9527-a771434b3e72	family_name	claim.name
1777f44f-c898-458d-9527-a771434b3e72	String	jsonType.label
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	true	introspection.token.claim
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	true	userinfo.token.claim
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	firstName	user.attribute
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	true	id.token.claim
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	true	access.token.claim
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	given_name	claim.name
5e87b2bb-07e6-4a13-91ce-8dab4fc0eeb8	String	jsonType.label
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	true	introspection.token.claim
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	true	userinfo.token.claim
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	locale	user.attribute
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	true	id.token.claim
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	true	access.token.claim
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	locale	claim.name
6ca356fd-7f8e-4001-9dc7-3dd9750c23d7	String	jsonType.label
7c149d9b-45d1-4f2c-b89b-beaa46f64926	true	introspection.token.claim
7c149d9b-45d1-4f2c-b89b-beaa46f64926	true	userinfo.token.claim
7c149d9b-45d1-4f2c-b89b-beaa46f64926	username	user.attribute
7c149d9b-45d1-4f2c-b89b-beaa46f64926	true	id.token.claim
7c149d9b-45d1-4f2c-b89b-beaa46f64926	true	access.token.claim
7c149d9b-45d1-4f2c-b89b-beaa46f64926	preferred_username	claim.name
7c149d9b-45d1-4f2c-b89b-beaa46f64926	String	jsonType.label
7c535705-e34f-4bec-8a39-b92119dc8c8a	true	introspection.token.claim
7c535705-e34f-4bec-8a39-b92119dc8c8a	true	userinfo.token.claim
7c535705-e34f-4bec-8a39-b92119dc8c8a	profile	user.attribute
7c535705-e34f-4bec-8a39-b92119dc8c8a	true	id.token.claim
7c535705-e34f-4bec-8a39-b92119dc8c8a	true	access.token.claim
7c535705-e34f-4bec-8a39-b92119dc8c8a	profile	claim.name
7c535705-e34f-4bec-8a39-b92119dc8c8a	String	jsonType.label
88294949-6967-4225-ab07-c2a3c1ab6d35	true	introspection.token.claim
88294949-6967-4225-ab07-c2a3c1ab6d35	true	userinfo.token.claim
88294949-6967-4225-ab07-c2a3c1ab6d35	updatedAt	user.attribute
88294949-6967-4225-ab07-c2a3c1ab6d35	true	id.token.claim
88294949-6967-4225-ab07-c2a3c1ab6d35	true	access.token.claim
88294949-6967-4225-ab07-c2a3c1ab6d35	updated_at	claim.name
88294949-6967-4225-ab07-c2a3c1ab6d35	long	jsonType.label
91a956ee-8f69-4dbf-a157-030609b665f7	true	introspection.token.claim
91a956ee-8f69-4dbf-a157-030609b665f7	true	userinfo.token.claim
91a956ee-8f69-4dbf-a157-030609b665f7	nickname	user.attribute
91a956ee-8f69-4dbf-a157-030609b665f7	true	id.token.claim
91a956ee-8f69-4dbf-a157-030609b665f7	true	access.token.claim
91a956ee-8f69-4dbf-a157-030609b665f7	nickname	claim.name
91a956ee-8f69-4dbf-a157-030609b665f7	String	jsonType.label
9979916c-244c-4730-8a15-c1894f41f05c	true	introspection.token.claim
9979916c-244c-4730-8a15-c1894f41f05c	true	userinfo.token.claim
9979916c-244c-4730-8a15-c1894f41f05c	gender	user.attribute
9979916c-244c-4730-8a15-c1894f41f05c	true	id.token.claim
9979916c-244c-4730-8a15-c1894f41f05c	true	access.token.claim
9979916c-244c-4730-8a15-c1894f41f05c	gender	claim.name
9979916c-244c-4730-8a15-c1894f41f05c	String	jsonType.label
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	true	introspection.token.claim
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	true	userinfo.token.claim
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	middleName	user.attribute
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	true	id.token.claim
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	true	access.token.claim
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	middle_name	claim.name
b63e8154-ea63-43f4-98d6-5c8481ab2ea1	String	jsonType.label
f2e71d82-acb6-4ecd-802b-5013a6c35555	true	introspection.token.claim
f2e71d82-acb6-4ecd-802b-5013a6c35555	true	userinfo.token.claim
f2e71d82-acb6-4ecd-802b-5013a6c35555	true	id.token.claim
f2e71d82-acb6-4ecd-802b-5013a6c35555	true	access.token.claim
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	true	introspection.token.claim
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	true	userinfo.token.claim
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	website	user.attribute
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	true	id.token.claim
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	true	access.token.claim
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	website	claim.name
f4362432-8dd1-4aed-ba76-61d2e0d8f2f2	String	jsonType.label
fb780e0d-2635-4a4e-bd86-a84db8d72349	true	introspection.token.claim
fb780e0d-2635-4a4e-bd86-a84db8d72349	true	userinfo.token.claim
fb780e0d-2635-4a4e-bd86-a84db8d72349	zoneinfo	user.attribute
fb780e0d-2635-4a4e-bd86-a84db8d72349	true	id.token.claim
fb780e0d-2635-4a4e-bd86-a84db8d72349	true	access.token.claim
fb780e0d-2635-4a4e-bd86-a84db8d72349	zoneinfo	claim.name
fb780e0d-2635-4a4e-bd86-a84db8d72349	String	jsonType.label
1d996b1a-c7eb-462f-ad74-56fa71fb1090	true	introspection.token.claim
1d996b1a-c7eb-462f-ad74-56fa71fb1090	true	userinfo.token.claim
1d996b1a-c7eb-462f-ad74-56fa71fb1090	email	user.attribute
1d996b1a-c7eb-462f-ad74-56fa71fb1090	true	id.token.claim
1d996b1a-c7eb-462f-ad74-56fa71fb1090	true	access.token.claim
1d996b1a-c7eb-462f-ad74-56fa71fb1090	email	claim.name
1d996b1a-c7eb-462f-ad74-56fa71fb1090	String	jsonType.label
dee68997-17e3-4250-9002-d94cfe082ee9	true	introspection.token.claim
dee68997-17e3-4250-9002-d94cfe082ee9	true	userinfo.token.claim
dee68997-17e3-4250-9002-d94cfe082ee9	emailVerified	user.attribute
dee68997-17e3-4250-9002-d94cfe082ee9	true	id.token.claim
dee68997-17e3-4250-9002-d94cfe082ee9	true	access.token.claim
dee68997-17e3-4250-9002-d94cfe082ee9	email_verified	claim.name
dee68997-17e3-4250-9002-d94cfe082ee9	boolean	jsonType.label
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	formatted	user.attribute.formatted
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	country	user.attribute.country
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	true	introspection.token.claim
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	postal_code	user.attribute.postal_code
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	true	userinfo.token.claim
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	street	user.attribute.street
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	true	id.token.claim
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	region	user.attribute.region
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	true	access.token.claim
c5ad5e21-bf58-44be-afa2-1e5cdbd6b96f	locality	user.attribute.locality
1abcd4a5-99d5-44af-aaa3-dda10d85c469	true	introspection.token.claim
1abcd4a5-99d5-44af-aaa3-dda10d85c469	true	userinfo.token.claim
1abcd4a5-99d5-44af-aaa3-dda10d85c469	phoneNumberVerified	user.attribute
1abcd4a5-99d5-44af-aaa3-dda10d85c469	true	id.token.claim
1abcd4a5-99d5-44af-aaa3-dda10d85c469	true	access.token.claim
1abcd4a5-99d5-44af-aaa3-dda10d85c469	phone_number_verified	claim.name
1abcd4a5-99d5-44af-aaa3-dda10d85c469	boolean	jsonType.label
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	true	introspection.token.claim
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	true	userinfo.token.claim
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	phoneNumber	user.attribute
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	true	id.token.claim
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	true	access.token.claim
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	phone_number	claim.name
c6a75c1d-8f45-42d5-a014-1b493ff7c21e	String	jsonType.label
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	true	introspection.token.claim
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	true	multivalued
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	foo	user.attribute
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	true	access.token.claim
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	resource_access.${client_id}.roles	claim.name
0a121cc2-90b4-4e76-94bc-fa4796ad76c2	String	jsonType.label
3f6d6994-2b6a-4de7-94c0-f142de49a566	true	introspection.token.claim
3f6d6994-2b6a-4de7-94c0-f142de49a566	true	multivalued
3f6d6994-2b6a-4de7-94c0-f142de49a566	foo	user.attribute
3f6d6994-2b6a-4de7-94c0-f142de49a566	true	access.token.claim
3f6d6994-2b6a-4de7-94c0-f142de49a566	realm_access.roles	claim.name
3f6d6994-2b6a-4de7-94c0-f142de49a566	String	jsonType.label
a14c17a1-1041-4a4b-8b80-ba60452d320c	true	introspection.token.claim
a14c17a1-1041-4a4b-8b80-ba60452d320c	true	access.token.claim
55aa1f10-06ec-4ccb-8722-c9ef18e4279d	true	introspection.token.claim
55aa1f10-06ec-4ccb-8722-c9ef18e4279d	true	access.token.claim
047ce223-d0bd-46fa-9329-72b02955b7cc	true	introspection.token.claim
047ce223-d0bd-46fa-9329-72b02955b7cc	true	userinfo.token.claim
047ce223-d0bd-46fa-9329-72b02955b7cc	username	user.attribute
047ce223-d0bd-46fa-9329-72b02955b7cc	true	id.token.claim
047ce223-d0bd-46fa-9329-72b02955b7cc	true	access.token.claim
047ce223-d0bd-46fa-9329-72b02955b7cc	upn	claim.name
047ce223-d0bd-46fa-9329-72b02955b7cc	String	jsonType.label
50f541e1-1169-497f-8b1d-29296d01a921	true	introspection.token.claim
50f541e1-1169-497f-8b1d-29296d01a921	true	multivalued
50f541e1-1169-497f-8b1d-29296d01a921	foo	user.attribute
50f541e1-1169-497f-8b1d-29296d01a921	true	id.token.claim
50f541e1-1169-497f-8b1d-29296d01a921	true	access.token.claim
50f541e1-1169-497f-8b1d-29296d01a921	groups	claim.name
50f541e1-1169-497f-8b1d-29296d01a921	String	jsonType.label
70a99361-c53b-4024-ad9b-02ca8420d062	true	introspection.token.claim
70a99361-c53b-4024-ad9b-02ca8420d062	true	id.token.claim
70a99361-c53b-4024-ad9b-02ca8420d062	true	access.token.claim
8c77bb19-9298-4035-a290-98afb4623027	true	introspection.token.claim
8c77bb19-9298-4035-a290-98afb4623027	true	access.token.claim
923bb4f1-7f93-400b-a08d-b2e4364e8257	AUTH_TIME	user.session.note
923bb4f1-7f93-400b-a08d-b2e4364e8257	true	introspection.token.claim
923bb4f1-7f93-400b-a08d-b2e4364e8257	true	id.token.claim
923bb4f1-7f93-400b-a08d-b2e4364e8257	true	access.token.claim
923bb4f1-7f93-400b-a08d-b2e4364e8257	auth_time	claim.name
923bb4f1-7f93-400b-a08d-b2e4364e8257	long	jsonType.label
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	true	introspection.token.claim
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	true	multivalued
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	true	id.token.claim
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	true	access.token.claim
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	organization	claim.name
5c769e9e-08b6-4b5e-b9cd-6afb17e33a6d	String	jsonType.label
05f8f7ea-529e-4905-b1c2-ec8be73da991	true	introspection.token.claim
05f8f7ea-529e-4905-b1c2-ec8be73da991	true	userinfo.token.claim
05f8f7ea-529e-4905-b1c2-ec8be73da991	locale	user.attribute
05f8f7ea-529e-4905-b1c2-ec8be73da991	true	id.token.claim
05f8f7ea-529e-4905-b1c2-ec8be73da991	true	access.token.claim
05f8f7ea-529e-4905-b1c2-ec8be73da991	locale	claim.name
05f8f7ea-529e-4905-b1c2-ec8be73da991	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
979582be-1e58-424d-ace1-ad20c44dfb71	60	300	300	\N	\N	\N	t	f	0	\N	hackaton	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	dec212c2-1781-4a06-b380-896f4cce4da8	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	1c203ce2-17c2-426b-abd2-84a25dc16a4d	e432001b-5e19-4359-b035-630f4838174c	84f0a759-a459-4944-8ba0-2c9ab5c785ac	0f7adf98-f1f4-485c-9c36-f8af9aa2ee90	f760bacd-7bb2-499a-8eef-e4a7631def88	2592000	f	900	t	f	c88f0458-454e-465b-b97b-bb7da2d50f8e	0	f	0	0	6c43a0a9-08d3-4f46-88e7-5e70b9535060
a29ac0cc-6643-4c10-86aa-b45218f74a2a	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	d489c56a-9d28-4ac0-bf37-a61810209943	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	23805b35-1f03-4c6a-8725-c99b9db7eec9	1fa1501a-da4b-4e26-ab39-da0b1a11cf7c	863208ad-4346-4717-a16f-8487f899b497	a36a687a-c623-4a1c-be7b-8d5670db045a	82d9a740-cc23-4ecd-9f67-f1184421a705	2592000	f	900	t	f	decbf1fd-2fd6-4f38-a4a7-0170797c2853	0	f	0	0	deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	a29ac0cc-6643-4c10-86aa-b45218f74a2a	
_browser_header.xContentTypeOptions	a29ac0cc-6643-4c10-86aa-b45218f74a2a	nosniff
_browser_header.referrerPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	no-referrer
_browser_header.xRobotsTag	a29ac0cc-6643-4c10-86aa-b45218f74a2a	none
_browser_header.xFrameOptions	a29ac0cc-6643-4c10-86aa-b45218f74a2a	SAMEORIGIN
_browser_header.contentSecurityPolicy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	a29ac0cc-6643-4c10-86aa-b45218f74a2a	1; mode=block
_browser_header.strictTransportSecurity	a29ac0cc-6643-4c10-86aa-b45218f74a2a	max-age=31536000; includeSubDomains
bruteForceProtected	a29ac0cc-6643-4c10-86aa-b45218f74a2a	false
permanentLockout	a29ac0cc-6643-4c10-86aa-b45218f74a2a	false
maxTemporaryLockouts	a29ac0cc-6643-4c10-86aa-b45218f74a2a	0
bruteForceStrategy	a29ac0cc-6643-4c10-86aa-b45218f74a2a	MULTIPLE
maxFailureWaitSeconds	a29ac0cc-6643-4c10-86aa-b45218f74a2a	900
minimumQuickLoginWaitSeconds	a29ac0cc-6643-4c10-86aa-b45218f74a2a	60
waitIncrementSeconds	a29ac0cc-6643-4c10-86aa-b45218f74a2a	60
quickLoginCheckMilliSeconds	a29ac0cc-6643-4c10-86aa-b45218f74a2a	1000
maxDeltaTimeSeconds	a29ac0cc-6643-4c10-86aa-b45218f74a2a	43200
failureFactor	a29ac0cc-6643-4c10-86aa-b45218f74a2a	30
realmReusableOtpCode	a29ac0cc-6643-4c10-86aa-b45218f74a2a	false
firstBrokerLoginFlowId	a29ac0cc-6643-4c10-86aa-b45218f74a2a	b112a87c-439f-415c-aef8-e9ebdc25f41c
displayName	a29ac0cc-6643-4c10-86aa-b45218f74a2a	Keycloak
displayNameHtml	a29ac0cc-6643-4c10-86aa-b45218f74a2a	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	a29ac0cc-6643-4c10-86aa-b45218f74a2a	RS256
offlineSessionMaxLifespanEnabled	a29ac0cc-6643-4c10-86aa-b45218f74a2a	false
offlineSessionMaxLifespan	a29ac0cc-6643-4c10-86aa-b45218f74a2a	5184000
_browser_header.contentSecurityPolicyReportOnly	979582be-1e58-424d-ace1-ad20c44dfb71	
_browser_header.xContentTypeOptions	979582be-1e58-424d-ace1-ad20c44dfb71	nosniff
_browser_header.referrerPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	no-referrer
_browser_header.xRobotsTag	979582be-1e58-424d-ace1-ad20c44dfb71	none
_browser_header.xFrameOptions	979582be-1e58-424d-ace1-ad20c44dfb71	SAMEORIGIN
_browser_header.contentSecurityPolicy	979582be-1e58-424d-ace1-ad20c44dfb71	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	979582be-1e58-424d-ace1-ad20c44dfb71	1; mode=block
_browser_header.strictTransportSecurity	979582be-1e58-424d-ace1-ad20c44dfb71	max-age=31536000; includeSubDomains
bruteForceProtected	979582be-1e58-424d-ace1-ad20c44dfb71	false
permanentLockout	979582be-1e58-424d-ace1-ad20c44dfb71	false
maxTemporaryLockouts	979582be-1e58-424d-ace1-ad20c44dfb71	0
bruteForceStrategy	979582be-1e58-424d-ace1-ad20c44dfb71	MULTIPLE
maxFailureWaitSeconds	979582be-1e58-424d-ace1-ad20c44dfb71	900
minimumQuickLoginWaitSeconds	979582be-1e58-424d-ace1-ad20c44dfb71	60
waitIncrementSeconds	979582be-1e58-424d-ace1-ad20c44dfb71	60
quickLoginCheckMilliSeconds	979582be-1e58-424d-ace1-ad20c44dfb71	1000
maxDeltaTimeSeconds	979582be-1e58-424d-ace1-ad20c44dfb71	43200
failureFactor	979582be-1e58-424d-ace1-ad20c44dfb71	30
realmReusableOtpCode	979582be-1e58-424d-ace1-ad20c44dfb71	false
defaultSignatureAlgorithm	979582be-1e58-424d-ace1-ad20c44dfb71	RS256
offlineSessionMaxLifespanEnabled	979582be-1e58-424d-ace1-ad20c44dfb71	false
offlineSessionMaxLifespan	979582be-1e58-424d-ace1-ad20c44dfb71	5184000
actionTokenGeneratedByAdminLifespan	979582be-1e58-424d-ace1-ad20c44dfb71	43200
actionTokenGeneratedByUserLifespan	979582be-1e58-424d-ace1-ad20c44dfb71	300
oauth2DeviceCodeLifespan	979582be-1e58-424d-ace1-ad20c44dfb71	600
oauth2DevicePollingInterval	979582be-1e58-424d-ace1-ad20c44dfb71	5
webAuthnPolicyRpEntityName	979582be-1e58-424d-ace1-ad20c44dfb71	keycloak
webAuthnPolicySignatureAlgorithms	979582be-1e58-424d-ace1-ad20c44dfb71	ES256,RS256
webAuthnPolicyRpId	979582be-1e58-424d-ace1-ad20c44dfb71	
webAuthnPolicyAttestationConveyancePreference	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyAuthenticatorAttachment	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyRequireResidentKey	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyUserVerificationRequirement	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyCreateTimeout	979582be-1e58-424d-ace1-ad20c44dfb71	0
webAuthnPolicyAvoidSameAuthenticatorRegister	979582be-1e58-424d-ace1-ad20c44dfb71	false
webAuthnPolicyRpEntityNamePasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	ES256,RS256
webAuthnPolicyRpIdPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	
webAuthnPolicyAttestationConveyancePreferencePasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyRequireResidentKeyPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	not specified
webAuthnPolicyCreateTimeoutPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	979582be-1e58-424d-ace1-ad20c44dfb71	false
cibaBackchannelTokenDeliveryMode	979582be-1e58-424d-ace1-ad20c44dfb71	poll
cibaExpiresIn	979582be-1e58-424d-ace1-ad20c44dfb71	120
cibaInterval	979582be-1e58-424d-ace1-ad20c44dfb71	5
cibaAuthRequestedUserHint	979582be-1e58-424d-ace1-ad20c44dfb71	login_hint
parRequestUriLifespan	979582be-1e58-424d-ace1-ad20c44dfb71	60
firstBrokerLoginFlowId	979582be-1e58-424d-ace1-ad20c44dfb71	3353e7f2-3dde-409c-96d9-84e7e06a6a4e
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
a29ac0cc-6643-4c10-86aa-b45218f74a2a	jboss-logging
979582be-1e58-424d-ace1-ad20c44dfb71	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	a29ac0cc-6643-4c10-86aa-b45218f74a2a
password	password	t	t	979582be-1e58-424d-ace1-ad20c44dfb71
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
9d26ef0a-e088-4432-8f9a-6f73bd9137c1	/realms/master/account/*
5413cc4f-9a62-48bd-befd-738a7c4957de	/realms/master/account/*
515ac3a5-fd27-41ec-8890-955306cefb34	/admin/master/console/*
cb95ffcf-49dc-44df-a909-9452d782e304	/realms/hackaton/account/*
16d8ef0c-9e42-4dac-a972-c279f301fef6	/realms/hackaton/account/*
f727b726-7af6-4163-83db-9d39cc43b4cd	/admin/hackaton/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
1c61eb5a-f689-40e6-84be-ab5f0f87d178	VERIFY_EMAIL	Verify Email	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	VERIFY_EMAIL	50
30e3ed65-2f0f-4db0-bf4c-273c89c1463b	UPDATE_PROFILE	Update Profile	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	UPDATE_PROFILE	40
3f714a9c-1e99-4d9e-9ce5-d938e39fb4d1	CONFIGURE_TOTP	Configure OTP	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	CONFIGURE_TOTP	10
82e5d5f2-a0c6-47cc-8070-1f1212c2b9ca	UPDATE_PASSWORD	Update Password	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	UPDATE_PASSWORD	30
f113eb30-0ce7-4726-88d5-b7032dbe5630	TERMS_AND_CONDITIONS	Terms and Conditions	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	f	TERMS_AND_CONDITIONS	20
4c6c4b07-8b4c-443f-9a5d-26d8ee054282	delete_account	Delete Account	a29ac0cc-6643-4c10-86aa-b45218f74a2a	f	f	delete_account	60
e55659c8-ca50-4cb4-acd3-e4b9b217eed7	delete_credential	Delete Credential	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	delete_credential	100
9059319b-9947-4394-b00f-d6536bd3b307	update_user_locale	Update User Locale	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	update_user_locale	1000
9e1a427e-3d5f-43e5-8525-384f8c4bc470	webauthn-register	Webauthn Register	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	webauthn-register	70
ec1ba075-0910-49b6-a941-00d5d943a973	webauthn-register-passwordless	Webauthn Register Passwordless	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	webauthn-register-passwordless	80
0a38e3f2-752d-43d4-ad49-4a1975799afe	VERIFY_PROFILE	Verify Profile	a29ac0cc-6643-4c10-86aa-b45218f74a2a	t	f	VERIFY_PROFILE	90
547e269b-2b6d-4c56-a5a5-71611b7acde3	VERIFY_EMAIL	Verify Email	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	VERIFY_EMAIL	50
0868eace-c368-4016-aa16-b1f93b075d79	UPDATE_PROFILE	Update Profile	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	UPDATE_PROFILE	40
c8073613-364b-4faf-b2f7-30edd909dced	CONFIGURE_TOTP	Configure OTP	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	CONFIGURE_TOTP	10
79db4569-a436-46ba-ab57-89880162e98f	UPDATE_PASSWORD	Update Password	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	UPDATE_PASSWORD	30
78321aca-c2f9-418d-b69c-80cbb560f9ee	TERMS_AND_CONDITIONS	Terms and Conditions	979582be-1e58-424d-ace1-ad20c44dfb71	f	f	TERMS_AND_CONDITIONS	20
b88308b0-4713-455d-844d-d1c319d0abaf	delete_account	Delete Account	979582be-1e58-424d-ace1-ad20c44dfb71	f	f	delete_account	60
6b3a3f5b-c939-46de-914c-dc9b77f73ca1	delete_credential	Delete Credential	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	delete_credential	100
0ca40ce0-f2f6-464b-86d3-1d5d93a5ade2	update_user_locale	Update User Locale	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	update_user_locale	1000
461a0714-c799-44e3-8847-ba4c1bd80583	webauthn-register	Webauthn Register	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	webauthn-register	70
42cedc32-22e2-4fe2-89d4-d6118423b38a	webauthn-register-passwordless	Webauthn Register Passwordless	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	webauthn-register-passwordless	80
e9df0300-f974-4016-b615-53cc1753e9fe	VERIFY_PROFILE	Verify Profile	979582be-1e58-424d-ace1-ad20c44dfb71	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
5413cc4f-9a62-48bd-befd-738a7c4957de	d4ffb7d5-0fcc-4821-b738-480b75b7534b
5413cc4f-9a62-48bd-befd-738a7c4957de	91902a1f-a4da-4338-a160-33679cd93c77
16d8ef0c-9e42-4dac-a972-c279f301fef6	4809a3c3-3e5d-42b5-8ed2-4b28c9bd3dad
16d8ef0c-9e42-4dac-a972-c279f301fef6	0bc0818a-89cb-40a9-813f-1371239ff699
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797	cab87dbc-f373-4ae6-820e-e3c10f539303	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797	\N	9718b4fd-45dd-4758-a160-74eade0e8fb1	f	t	\N	\N	\N	a29ac0cc-6643-4c10-86aa-b45218f74a2a	admin	1738191536094	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
deb45c29-b8eb-42f9-8f1a-e8a668fd5cc8	d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797
10ed5fed-8c9b-4423-a9eb-50d2452d5a2b	d55e2f01-8d2b-4a6d-bc2f-4e37f62e1797
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
515ac3a5-fd27-41ec-8890-955306cefb34	+
f727b726-7af6-4163-83db-9d39cc43b4cd	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

