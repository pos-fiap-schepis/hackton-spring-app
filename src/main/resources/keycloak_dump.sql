PGDMP  5                     }            keycloak    16.4    16.4 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    keycloak    DATABASE     s   CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE keycloak;
                postgres    false            �            1259    16385    admin_event_entity    TABLE     
  CREATE TABLE public.admin_event_entity (
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
 &   DROP TABLE public.admin_event_entity;
       public         heap    postgres    false            �            1259    16390    associated_policy    TABLE     �   CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);
 %   DROP TABLE public.associated_policy;
       public         heap    postgres    false            �            1259    16393    authentication_execution    TABLE     �  CREATE TABLE public.authentication_execution (
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
 ,   DROP TABLE public.authentication_execution;
       public         heap    postgres    false            �            1259    16397    authentication_flow    TABLE     t  CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.authentication_flow;
       public         heap    postgres    false            �            1259    16405    authenticator_config    TABLE     �   CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);
 (   DROP TABLE public.authenticator_config;
       public         heap    postgres    false            �            1259    16408    authenticator_config_entry    TABLE     �   CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 .   DROP TABLE public.authenticator_config_entry;
       public         heap    postgres    false            �            1259    16413    broker_link    TABLE     L  CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.broker_link;
       public         heap    postgres    false            �            1259    16418    client    TABLE     �  CREATE TABLE public.client (
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
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16436    client_attributes    TABLE     �   CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 %   DROP TABLE public.client_attributes;
       public         heap    postgres    false            �            1259    16441    client_auth_flow_bindings    TABLE     �   CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_auth_flow_bindings;
       public         heap    postgres    false            �            1259    16444    client_initial_access    TABLE     �   CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);
 )   DROP TABLE public.client_initial_access;
       public         heap    postgres    false            �            1259    16447    client_node_registrations    TABLE     �   CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_node_registrations;
       public         heap    postgres    false            �            1259    16450    client_scope    TABLE     �   CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);
     DROP TABLE public.client_scope;
       public         heap    postgres    false            �            1259    16455    client_scope_attributes    TABLE     �   CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);
 +   DROP TABLE public.client_scope_attributes;
       public         heap    postgres    false            �            1259    16460    client_scope_client    TABLE     �   CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.client_scope_client;
       public         heap    postgres    false            �            1259    16466    client_scope_role_mapping    TABLE     �   CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 -   DROP TABLE public.client_scope_role_mapping;
       public         heap    postgres    false            �            1259    16469 	   component    TABLE     )  CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);
    DROP TABLE public.component;
       public         heap    postgres    false            �            1259    16474    component_config    TABLE     �   CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 $   DROP TABLE public.component_config;
       public         heap    postgres    false            �            1259    16479    composite_role    TABLE     �   CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);
 "   DROP TABLE public.composite_role;
       public         heap    postgres    false            �            1259    16482 
   credential    TABLE     $  CREATE TABLE public.credential (
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
    DROP TABLE public.credential;
       public         heap    postgres    false            �            1259    16487    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
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
 %   DROP TABLE public.databasechangelog;
       public         heap    postgres    false            �            1259    16492    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    postgres    false            �            1259    16495    default_client_scope    TABLE     �   CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.default_client_scope;
       public         heap    postgres    false            �            1259    16499    event_entity    TABLE     �  CREATE TABLE public.event_entity (
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
     DROP TABLE public.event_entity;
       public         heap    postgres    false            �            1259    16504    fed_user_attribute    TABLE     ~  CREATE TABLE public.fed_user_attribute (
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
 &   DROP TABLE public.fed_user_attribute;
       public         heap    postgres    false            �            1259    16509    fed_user_consent    TABLE     �  CREATE TABLE public.fed_user_consent (
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
 $   DROP TABLE public.fed_user_consent;
       public         heap    postgres    false            �            1259    16514    fed_user_consent_cl_scope    TABLE     �   CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.fed_user_consent_cl_scope;
       public         heap    postgres    false            �            1259    16517    fed_user_credential    TABLE     �  CREATE TABLE public.fed_user_credential (
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
 '   DROP TABLE public.fed_user_credential;
       public         heap    postgres    false            �            1259    16522    fed_user_group_membership    TABLE     �   CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 -   DROP TABLE public.fed_user_group_membership;
       public         heap    postgres    false            �            1259    16525    fed_user_required_action    TABLE       CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 ,   DROP TABLE public.fed_user_required_action;
       public         heap    postgres    false            �            1259    16531    fed_user_role_mapping    TABLE     �   CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 )   DROP TABLE public.fed_user_role_mapping;
       public         heap    postgres    false            �            1259    16534    federated_identity    TABLE       CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);
 &   DROP TABLE public.federated_identity;
       public         heap    postgres    false            �            1259    16539    federated_user    TABLE     �   CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);
 "   DROP TABLE public.federated_user;
       public         heap    postgres    false            �            1259    16544    group_attribute    TABLE       CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);
 #   DROP TABLE public.group_attribute;
       public         heap    postgres    false            �            1259    16550    group_role_mapping    TABLE     �   CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 &   DROP TABLE public.group_role_mapping;
       public         heap    postgres    false            �            1259    16553    identity_provider    TABLE     �  CREATE TABLE public.identity_provider (
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
 %   DROP TABLE public.identity_provider;
       public         heap    postgres    false            �            1259    16565    identity_provider_config    TABLE     �   CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 ,   DROP TABLE public.identity_provider_config;
       public         heap    postgres    false            �            1259    16570    identity_provider_mapper    TABLE       CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 ,   DROP TABLE public.identity_provider_mapper;
       public         heap    postgres    false            �            1259    16575    idp_mapper_config    TABLE     �   CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.idp_mapper_config;
       public         heap    postgres    false            �            1259    16580    keycloak_group    TABLE     �   CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.keycloak_group;
       public         heap    postgres    false            �            1259    16584    keycloak_role    TABLE     b  CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);
 !   DROP TABLE public.keycloak_role;
       public         heap    postgres    false                        1259    16590    migration_model    TABLE     �   CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.migration_model;
       public         heap    postgres    false                       1259    16594    offline_client_session    TABLE     �  CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);
 *   DROP TABLE public.offline_client_session;
       public         heap    postgres    false                       1259    16602    offline_user_session    TABLE     �  CREATE TABLE public.offline_user_session (
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
 (   DROP TABLE public.offline_user_session;
       public         heap    postgres    false                       1259    16609    org    TABLE     f  CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);
    DROP TABLE public.org;
       public         heap    postgres    false                       1259    16614 
   org_domain    TABLE     �   CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);
    DROP TABLE public.org_domain;
       public         heap    postgres    false                       1259    16619    policy_config    TABLE     �   CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 !   DROP TABLE public.policy_config;
       public         heap    postgres    false                       1259    16624    protocol_mapper    TABLE     1  CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);
 #   DROP TABLE public.protocol_mapper;
       public         heap    postgres    false                       1259    16629    protocol_mapper_config    TABLE     �   CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.protocol_mapper_config;
       public         heap    postgres    false                       1259    16634    realm    TABLE     �	  CREATE TABLE public.realm (
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
    DROP TABLE public.realm;
       public         heap    postgres    false            	           1259    16667    realm_attribute    TABLE     �   CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);
 #   DROP TABLE public.realm_attribute;
       public         heap    postgres    false            
           1259    16672    realm_default_groups    TABLE     �   CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 (   DROP TABLE public.realm_default_groups;
       public         heap    postgres    false                       1259    16675    realm_enabled_event_types    TABLE     �   CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 -   DROP TABLE public.realm_enabled_event_types;
       public         heap    postgres    false                       1259    16678    realm_events_listeners    TABLE     �   CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 *   DROP TABLE public.realm_events_listeners;
       public         heap    postgres    false                       1259    16681    realm_localizations    TABLE     �   CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);
 '   DROP TABLE public.realm_localizations;
       public         heap    postgres    false                       1259    16686    realm_required_credential    TABLE       CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);
 -   DROP TABLE public.realm_required_credential;
       public         heap    postgres    false                       1259    16693    realm_smtp_config    TABLE     �   CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.realm_smtp_config;
       public         heap    postgres    false                       1259    16698    realm_supported_locales    TABLE     �   CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 +   DROP TABLE public.realm_supported_locales;
       public         heap    postgres    false                       1259    16701    redirect_uris    TABLE        CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.redirect_uris;
       public         heap    postgres    false                       1259    16704    required_action_config    TABLE     �   CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.required_action_config;
       public         heap    postgres    false                       1259    16709    required_action_provider    TABLE     \  CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);
 ,   DROP TABLE public.required_action_provider;
       public         heap    postgres    false                       1259    16716    resource_attribute    TABLE       CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);
 &   DROP TABLE public.resource_attribute;
       public         heap    postgres    false                       1259    16722    resource_policy    TABLE     �   CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
 #   DROP TABLE public.resource_policy;
       public         heap    postgres    false                       1259    16725    resource_scope    TABLE     �   CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 "   DROP TABLE public.resource_scope;
       public         heap    postgres    false                       1259    16728    resource_server    TABLE     �   CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);
 #   DROP TABLE public.resource_server;
       public         heap    postgres    false                       1259    16733    resource_server_perm_ticket    TABLE     �  CREATE TABLE public.resource_server_perm_ticket (
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
 /   DROP TABLE public.resource_server_perm_ticket;
       public         heap    postgres    false                       1259    16738    resource_server_policy    TABLE     _  CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);
 *   DROP TABLE public.resource_server_policy;
       public         heap    postgres    false                       1259    16743    resource_server_resource    TABLE     �  CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);
 ,   DROP TABLE public.resource_server_resource;
       public         heap    postgres    false                       1259    16749    resource_server_scope    TABLE       CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);
 )   DROP TABLE public.resource_server_scope;
       public         heap    postgres    false                       1259    16754    resource_uris    TABLE     �   CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.resource_uris;
       public         heap    postgres    false                       1259    16757    revoked_token    TABLE     j   CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);
 !   DROP TABLE public.revoked_token;
       public         heap    postgres    false                       1259    16760    role_attribute    TABLE     �   CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);
 "   DROP TABLE public.role_attribute;
       public         heap    postgres    false                       1259    16765    scope_mapping    TABLE     �   CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 !   DROP TABLE public.scope_mapping;
       public         heap    postgres    false                        1259    16768    scope_policy    TABLE     �   CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
     DROP TABLE public.scope_policy;
       public         heap    postgres    false            !           1259    16771    user_attribute    TABLE     U  CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);
 "   DROP TABLE public.user_attribute;
       public         heap    postgres    false            "           1259    16777    user_consent    TABLE     7  CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
     DROP TABLE public.user_consent;
       public         heap    postgres    false            #           1259    16782    user_consent_client_scope    TABLE     �   CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.user_consent_client_scope;
       public         heap    postgres    false            $           1259    16785    user_entity    TABLE     =  CREATE TABLE public.user_entity (
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
    DROP TABLE public.user_entity;
       public         heap    postgres    false            %           1259    16793    user_federation_config    TABLE     �   CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.user_federation_config;
       public         heap    postgres    false            &           1259    16798    user_federation_mapper    TABLE     $  CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 *   DROP TABLE public.user_federation_mapper;
       public         heap    postgres    false            '           1259    16803    user_federation_mapper_config    TABLE     �   CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 1   DROP TABLE public.user_federation_mapper_config;
       public         heap    postgres    false            (           1259    16808    user_federation_provider    TABLE     ;  CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);
 ,   DROP TABLE public.user_federation_provider;
       public         heap    postgres    false            )           1259    16813    user_group_membership    TABLE     �   CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);
 )   DROP TABLE public.user_group_membership;
       public         heap    postgres    false            *           1259    16816    user_required_action    TABLE     �   CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);
 (   DROP TABLE public.user_required_action;
       public         heap    postgres    false            +           1259    16820    user_role_mapping    TABLE     �   CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);
 %   DROP TABLE public.user_role_mapping;
       public         heap    postgres    false            ,           1259    16823    username_login_failure    TABLE       CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);
 *   DROP TABLE public.username_login_failure;
       public         heap    postgres    false            -           1259    16828    web_origins    TABLE     }   CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
    DROP TABLE public.web_origins;
       public         heap    postgres    false            O          0    16385    admin_event_entity 
   TABLE DATA           �   COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
    public          postgres    false    215   aj      P          0    16390    associated_policy 
   TABLE DATA           L   COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
    public          postgres    false    216   ~j      Q          0    16393    authentication_execution 
   TABLE DATA           �   COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
    public          postgres    false    217   �j      R          0    16397    authentication_flow 
   TABLE DATA           q   COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
    public          postgres    false    218   �z      S          0    16405    authenticator_config 
   TABLE DATA           C   COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
    public          postgres    false    219   ʁ      T          0    16408    authenticator_config_entry 
   TABLE DATA           S   COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
    public          postgres    false    220   ��      U          0    16413    broker_link 
   TABLE DATA           �   COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
    public          postgres    false    221   w�      V          0    16418    client 
   TABLE DATA           �  COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
    public          postgres    false    222   ��      W          0    16436    client_attributes 
   TABLE DATA           C   COPY public.client_attributes (client_id, name, value) FROM stdin;
    public          postgres    false    223   D�      X          0    16441    client_auth_flow_bindings 
   TABLE DATA           U   COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
    public          postgres    false    224   ��      Y          0    16444    client_initial_access 
   TABLE DATA           n   COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
    public          postgres    false    225   ��      Z          0    16447    client_node_registrations 
   TABLE DATA           K   COPY public.client_node_registrations (client_id, value, name) FROM stdin;
    public          postgres    false    226   ·      [          0    16450    client_scope 
   TABLE DATA           Q   COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
    public          postgres    false    227   �      \          0    16455    client_scope_attributes 
   TABLE DATA           H   COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
    public          postgres    false    228   ?�      ]          0    16460    client_scope_client 
   TABLE DATA           Q   COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
    public          postgres    false    229   �      ^          0    16466    client_scope_role_mapping 
   TABLE DATA           F   COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
    public          postgres    false    230   ۔      _          0    16469 	   component 
   TABLE DATA           h   COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
    public          postgres    false    231   [�      `          0    16474    component_config 
   TABLE DATA           I   COPY public.component_config (id, component_id, name, value) FROM stdin;
    public          postgres    false    232   ��      a          0    16479    composite_role 
   TABLE DATA           ?   COPY public.composite_role (composite, child_role) FROM stdin;
    public          postgres    false    233   @�      b          0    16482 
   credential 
   TABLE DATA              COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
    public          postgres    false    234   �      c          0    16487    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    235   L�      d          0    16492    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    236   Z�      e          0    16495    default_client_scope 
   TABLE DATA           Q   COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
    public          postgres    false    237   ��      f          0    16499    event_entity 
   TABLE DATA           �   COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
    public          postgres    false    238   (�      g          0    16504    fed_user_attribute 
   TABLE DATA           �   COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
    public          postgres    false    239   E�      h          0    16509    fed_user_consent 
   TABLE DATA           �   COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          postgres    false    240   b�      i          0    16514    fed_user_consent_cl_scope 
   TABLE DATA           N   COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
    public          postgres    false    241   �      j          0    16517    fed_user_credential 
   TABLE DATA           �   COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
    public          postgres    false    242   ��      k          0    16522    fed_user_group_membership 
   TABLE DATA           e   COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          postgres    false    243   ��      l          0    16525    fed_user_required_action 
   TABLE DATA           k   COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
    public          postgres    false    244   ��      m          0    16531    fed_user_role_mapping 
   TABLE DATA           `   COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          postgres    false    245   ��      n          0    16534    federated_identity 
   TABLE DATA           �   COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
    public          postgres    false    246   �      o          0    16539    federated_user 
   TABLE DATA           K   COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
    public          postgres    false    247   -�      p          0    16544    group_attribute 
   TABLE DATA           D   COPY public.group_attribute (id, name, value, group_id) FROM stdin;
    public          postgres    false    248   J�      q          0    16550    group_role_mapping 
   TABLE DATA           ?   COPY public.group_role_mapping (role_id, group_id) FROM stdin;
    public          postgres    false    249   g�      r          0    16553    identity_provider 
   TABLE DATA           $  COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
    public          postgres    false    250   ��      s          0    16565    identity_provider_config 
   TABLE DATA           U   COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
    public          postgres    false    251   ��      t          0    16570    identity_provider_mapper 
   TABLE DATA           b   COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
    public          postgres    false    252   ��      u          0    16575    idp_mapper_config 
   TABLE DATA           G   COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
    public          postgres    false    253   ��      v          0    16580    keycloak_group 
   TABLE DATA           P   COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
    public          postgres    false    254   ��      w          0    16584    keycloak_role 
   TABLE DATA           }   COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
    public          postgres    false    255   �      x          0    16590    migration_model 
   TABLE DATA           C   COPY public.migration_model (id, version, update_time) FROM stdin;
    public          postgres    false    256   }�      y          0    16594    offline_client_session 
   TABLE DATA           �   COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
    public          postgres    false    257   ��      z          0    16602    offline_user_session 
   TABLE DATA           �   COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
    public          postgres    false    258   _      {          0    16609    org 
   TABLE DATA           f   COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
    public          postgres    false    259   )      |          0    16614 
   org_domain 
   TABLE DATA           @   COPY public.org_domain (id, name, verified, org_id) FROM stdin;
    public          postgres    false    260   F      }          0    16619    policy_config 
   TABLE DATA           ?   COPY public.policy_config (policy_id, name, value) FROM stdin;
    public          postgres    false    261   c      ~          0    16624    protocol_mapper 
   TABLE DATA           o   COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
    public          postgres    false    262   �                0    16629    protocol_mapper_config 
   TABLE DATA           Q   COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
    public          postgres    false    263   +      �          0    16634    realm 
   TABLE DATA              COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
    public          postgres    false    264         �          0    16667    realm_attribute 
   TABLE DATA           @   COPY public.realm_attribute (name, realm_id, value) FROM stdin;
    public          postgres    false    265   &      �          0    16672    realm_default_groups 
   TABLE DATA           B   COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
    public          postgres    false    266   �!      �          0    16675    realm_enabled_event_types 
   TABLE DATA           D   COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
    public          postgres    false    267   �!      �          0    16678    realm_events_listeners 
   TABLE DATA           A   COPY public.realm_events_listeners (realm_id, value) FROM stdin;
    public          postgres    false    268   �!      �          0    16681    realm_localizations 
   TABLE DATA           F   COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
    public          postgres    false    269   @"      �          0    16686    realm_required_credential 
   TABLE DATA           ^   COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
    public          postgres    false    270   ]"      �          0    16693    realm_smtp_config 
   TABLE DATA           B   COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
    public          postgres    false    271   �"      �          0    16698    realm_supported_locales 
   TABLE DATA           B   COPY public.realm_supported_locales (realm_id, value) FROM stdin;
    public          postgres    false    272   �"      �          0    16701    redirect_uris 
   TABLE DATA           9   COPY public.redirect_uris (client_id, value) FROM stdin;
    public          postgres    false    273   #      �          0    16704    required_action_config 
   TABLE DATA           Q   COPY public.required_action_config (required_action_id, value, name) FROM stdin;
    public          postgres    false    274   �#      �          0    16709    required_action_provider 
   TABLE DATA           }   COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
    public          postgres    false    275   $      �          0    16716    resource_attribute 
   TABLE DATA           J   COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
    public          postgres    false    276   �'      �          0    16722    resource_policy 
   TABLE DATA           A   COPY public.resource_policy (resource_id, policy_id) FROM stdin;
    public          postgres    false    277   (      �          0    16725    resource_scope 
   TABLE DATA           ?   COPY public.resource_scope (resource_id, scope_id) FROM stdin;
    public          postgres    false    278   .(      �          0    16728    resource_server 
   TABLE DATA           k   COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
    public          postgres    false    279   K(      �          0    16733    resource_server_perm_ticket 
   TABLE DATA           �   COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
    public          postgres    false    280   h(      �          0    16738    resource_server_policy 
   TABLE DATA           �   COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
    public          postgres    false    281   �(      �          0    16743    resource_server_resource 
   TABLE DATA           �   COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
    public          postgres    false    282   �(      �          0    16749    resource_server_scope 
   TABLE DATA           e   COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
    public          postgres    false    283   �(      �          0    16754    resource_uris 
   TABLE DATA           ;   COPY public.resource_uris (resource_id, value) FROM stdin;
    public          postgres    false    284   �(      �          0    16757    revoked_token 
   TABLE DATA           3   COPY public.revoked_token (id, expire) FROM stdin;
    public          postgres    false    285   �(      �          0    16760    role_attribute 
   TABLE DATA           B   COPY public.role_attribute (id, role_id, name, value) FROM stdin;
    public          postgres    false    286   )      �          0    16765    scope_mapping 
   TABLE DATA           ;   COPY public.scope_mapping (client_id, role_id) FROM stdin;
    public          postgres    false    287   3)      �          0    16768    scope_policy 
   TABLE DATA           ;   COPY public.scope_policy (scope_id, policy_id) FROM stdin;
    public          postgres    false    288   �)      �          0    16771    user_attribute 
   TABLE DATA           {   COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
    public          postgres    false    289   *      �          0    16777    user_consent 
   TABLE DATA           �   COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          postgres    false    290   |*      �          0    16782    user_consent_client_scope 
   TABLE DATA           N   COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
    public          postgres    false    291   �*      �          0    16785    user_entity 
   TABLE DATA           �   COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
    public          postgres    false    292   �*      �          0    16793    user_federation_config 
   TABLE DATA           Z   COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
    public          postgres    false    293   B+      �          0    16798    user_federation_mapper 
   TABLE DATA           t   COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
    public          postgres    false    294   _+      �          0    16803    user_federation_mapper_config 
   TABLE DATA           _   COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
    public          postgres    false    295   |+      �          0    16808    user_federation_provider 
   TABLE DATA           �   COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
    public          postgres    false    296   �+      �          0    16813    user_group_membership 
   TABLE DATA           S   COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
    public          postgres    false    297   �+      �          0    16816    user_required_action 
   TABLE DATA           H   COPY public.user_required_action (user_id, required_action) FROM stdin;
    public          postgres    false    298   �+      �          0    16820    user_role_mapping 
   TABLE DATA           =   COPY public.user_role_mapping (role_id, user_id) FROM stdin;
    public          postgres    false    299   �+      �          0    16823    username_login_failure 
   TABLE DATA           �   COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
    public          postgres    false    300   a,      �          0    16828    web_origins 
   TABLE DATA           7   COPY public.web_origins (client_id, value) FROM stdin;
    public          postgres    false    301   ~,      y           2606    16832 &   username_login_failure CONSTRAINT_17-2 
   CONSTRAINT     v   ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);
 R   ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
       public            postgres    false    300    300            �           2606    16834    org_domain ORG_DOMAIN_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);
 F   ALTER TABLE ONLY public.org_domain DROP CONSTRAINT "ORG_DOMAIN_pkey";
       public            postgres    false    260    260            �           2606    16836    org ORG_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.org DROP CONSTRAINT "ORG_pkey";
       public            postgres    false    259            �           2606    16838 ,   keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2 
   CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);
 X   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
       public            postgres    false    255    255            o           2606    16840 )   client_auth_flow_bindings c_cli_flow_bind 
   CONSTRAINT     |   ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);
 S   ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
       public            postgres    false    224    224            ~           2606    16842 $   client_scope_client c_cli_scope_bind 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);
 N   ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
       public            postgres    false    229    229            q           2606    16844 .   client_initial_access cnstr_client_init_acc_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
       public            postgres    false    225                       2606    16846 ,   realm_default_groups con_group_id_def_groups 
   CONSTRAINT     k   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);
 V   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
       public            postgres    false    266            e           2606    16848 !   broker_link constr_broker_link_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);
 K   ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
       public            postgres    false    221    221            �           2606    16850 +   component_config constr_component_config_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
       public            postgres    false    232            �           2606    16852    component constr_component_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
       public            postgres    false    231            �           2606    16854 3   fed_user_required_action constr_fed_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);
 ]   ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
       public            postgres    false    244    244            �           2606    16856 *   fed_user_attribute constr_fed_user_attr_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
       public            postgres    false    239            �           2606    16858 +   fed_user_consent constr_fed_user_consent_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
       public            postgres    false    240            �           2606    16860 +   fed_user_credential constr_fed_user_cred_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
       public            postgres    false    242            �           2606    16862 /   fed_user_group_membership constr_fed_user_group 
   CONSTRAINT     |   ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);
 Y   ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
       public            postgres    false    243    243            �           2606    16864 *   fed_user_role_mapping constr_fed_user_role 
   CONSTRAINT     v   ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);
 T   ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
       public            postgres    false    245    245            �           2606    16866 $   federated_user constr_federated_user 
   CONSTRAINT     b   ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
       public            postgres    false    247                       2606    16868 0   realm_default_groups constr_realm_default_groups 
   CONSTRAINT     ~   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);
 Z   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
       public            postgres    false    266    266                       2606    16870 8   realm_enabled_event_types constr_realm_enabl_event_types 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);
 b   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
       public            postgres    false    267    267                       2606    16872 4   realm_events_listeners constr_realm_events_listeners 
   CONSTRAINT        ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);
 ^   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
       public            postgres    false    268    268                       2606    16874 6   realm_supported_locales constr_realm_supported_locales 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);
 `   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
       public            postgres    false    272    272            �           2606    16876    identity_provider constraint_2b 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);
 I   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
       public            postgres    false    250            l           2606    16878    client_attributes constraint_3c 
   CONSTRAINT     j   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);
 I   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
       public            postgres    false    223    223            �           2606    16880    event_entity constraint_4 
   CONSTRAINT     W   ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
       public            postgres    false    238            �           2606    16882     federated_identity constraint_40 
   CONSTRAINT     v   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);
 J   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
       public            postgres    false    246    246            �           2606    16884    realm constraint_4a 
   CONSTRAINT     Q   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
       public            postgres    false    264            m           2606    16886 &   user_federation_provider constraint_5c 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
       public            postgres    false    296            g           2606    16888    client constraint_7 
   CONSTRAINT     Q   ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
       public            postgres    false    222            F           2606    16890    scope_mapping constraint_81 
   CONSTRAINT     i   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);
 E   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
       public            postgres    false    287    287            t           2606    16892 '   client_node_registrations constraint_84 
   CONSTRAINT     r   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);
 Q   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
       public            postgres    false    226    226                        2606    16894    realm_attribute constraint_9 
   CONSTRAINT     f   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);
 F   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
       public            postgres    false    265    265                       2606    16896 '   realm_required_credential constraint_92 
   CONSTRAINT     q   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);
 Q   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
       public            postgres    false    270    270            �           2606    16898    keycloak_role constraint_a 
   CONSTRAINT     X   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
       public            postgres    false    255            S           2606    16900 0   admin_event_entity constraint_admin_event_entity 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
       public            postgres    false    215            c           2606    16902 1   authenticator_config_entry constraint_auth_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);
 [   ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
       public            postgres    false    220    220            Y           2606    16904 0   authentication_execution constraint_auth_exec_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
       public            postgres    false    217            ]           2606    16906 +   authentication_flow constraint_auth_flow_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
       public            postgres    false    218            `           2606    16908 '   authenticator_config constraint_auth_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
       public            postgres    false    219            v           2606    16910    user_role_mapping constraint_c 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);
 H   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
       public            postgres    false    299    299            �           2606    16912 (   composite_role constraint_composite_role 
   CONSTRAINT     y   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);
 R   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
       public            postgres    false    233    233            �           2606    16914 %   identity_provider_config constraint_d 
   CONSTRAINT     {   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);
 O   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
       public            postgres    false    251    251            �           2606    16916    policy_config constraint_dpc 
   CONSTRAINT     g   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);
 F   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
       public            postgres    false    261    261                       2606    16918    realm_smtp_config constraint_e 
   CONSTRAINT     h   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);
 H   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
       public            postgres    false    271    271            �           2606    16920    credential constraint_f 
   CONSTRAINT     U   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
       public            postgres    false    234            e           2606    16922 $   user_federation_config constraint_f9 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);
 N   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
       public            postgres    false    293    293            )           2606    16924 ,   resource_server_perm_ticket constraint_fapmt 
   CONSTRAINT     j   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
       public            postgres    false    280            4           2606    16926 )   resource_server_resource constraint_farsr 
   CONSTRAINT     g   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
       public            postgres    false    282            /           2606    16928 (   resource_server_policy constraint_farsrp 
   CONSTRAINT     f   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
       public            postgres    false    281            V           2606    16930 %   associated_policy constraint_farsrpap 
   CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);
 O   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
       public            postgres    false    216    216            !           2606    16932 "   resource_policy constraint_farsrpp 
   CONSTRAINT     t   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);
 L   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
       public            postgres    false    277    277            9           2606    16934 '   resource_server_scope constraint_farsrs 
   CONSTRAINT     e   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
       public            postgres    false    283            $           2606    16936 !   resource_scope constraint_farsrsp 
   CONSTRAINT     r   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);
 K   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
       public            postgres    false    278    278            I           2606    16938     scope_policy constraint_farsrsps 
   CONSTRAINT     o   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);
 J   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
       public            postgres    false    288    288            ]           2606    16940    user_entity constraint_fb 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
       public            postgres    false    292            k           2606    16942 9   user_federation_mapper_config constraint_fedmapper_cfg_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);
 c   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
       public            postgres    false    295    295            g           2606    16944 -   user_federation_mapper constraint_fedmapperpm 
   CONSTRAINT     k   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
       public            postgres    false    294            �           2606    16946 6   fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 `   ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
       public            postgres    false    241    241            Y           2606    16948 5   user_consent_client_scope constraint_grntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 _   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
       public            postgres    false    291    291            R           2606    16950 #   user_consent constraint_grntcsnt_pm 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
       public            postgres    false    290            �           2606    16952    keycloak_group constraint_group 
   CONSTRAINT     ]   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
       public            postgres    false    254            �           2606    16954 -   group_attribute constraint_group_attribute_pk 
   CONSTRAINT     k   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
       public            postgres    false    248            �           2606    16956 (   group_role_mapping constraint_group_role 
   CONSTRAINT     u   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);
 R   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
       public            postgres    false    249    249            �           2606    16958 (   identity_provider_mapper constraint_idpm 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
       public            postgres    false    252            �           2606    16960 '   idp_mapper_config constraint_idpmconfig 
   CONSTRAINT     v   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);
 Q   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
       public            postgres    false    253    253            �           2606    16962 !   migration_model constraint_migmod 
   CONSTRAINT     _   ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
       public            postgres    false    256            �           2606    16964 1   offline_client_session constraint_offl_cl_ses_pk3 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);
 [   ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
       public            postgres    false    257    257    257    257    257            �           2606    16966 /   offline_user_session constraint_offl_us_ses_pk2 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);
 Y   ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
       public            postgres    false    258    258            �           2606    16968    protocol_mapper constraint_pcm 
   CONSTRAINT     \   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
       public            postgres    false    262            �           2606    16970 *   protocol_mapper_config constraint_pmconfig 
   CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);
 T   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
       public            postgres    false    263    263                       2606    16972 &   redirect_uris constraint_redirect_uris 
   CONSTRAINT     r   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);
 P   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
       public            postgres    false    273    273                       2606    16974 0   required_action_config constraint_req_act_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);
 Z   ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
       public            postgres    false    274    274                       2606    16976 2   required_action_provider constraint_req_act_prv_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
       public            postgres    false    275            s           2606    16978 /   user_required_action constraint_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);
 Y   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
       public            postgres    false    298    298            >           2606    16980 '   resource_uris constraint_resour_uris_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);
 Q   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
       public            postgres    false    284    284            C           2606    16982 +   role_attribute constraint_role_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
       public            postgres    false    286            @           2606    16984    revoked_token constraint_rt 
   CONSTRAINT     Y   ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.revoked_token DROP CONSTRAINT constraint_rt;
       public            postgres    false    285            L           2606    16986 +   user_attribute constraint_user_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
       public            postgres    false    289            p           2606    16988 +   user_group_membership constraint_user_group 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);
 U   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
       public            postgres    false    297    297            {           2606    16990 "   web_origins constraint_web_origins 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);
 L   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
       public            postgres    false    301    301            �           2606    16992 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            postgres    false    236            |           2606    16994 '   client_scope_attributes pk_cl_tmpl_attr 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);
 Q   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
       public            postgres    false    228    228            w           2606    16996    client_scope pk_cli_template 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
       public            postgres    false    227            '           2606    16998 "   resource_server pk_resource_server 
   CONSTRAINT     `   ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
       public            postgres    false    279            �           2606    17000 +   client_scope_role_mapping pk_template_scope 
   CONSTRAINT     x   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);
 U   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
       public            postgres    false    230    230            �           2606    17002 )   default_client_scope r_def_cli_scope_bind 
   CONSTRAINT     w   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);
 S   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
       public            postgres    false    237    237                       2606    17004 ,   realm_localizations realm_localizations_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);
 V   ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
       public            postgres    false    269    269                       2606    17006    resource_attribute res_attr_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
       public            postgres    false    276            �           2606    17008    keycloak_group sibling_names 
   CONSTRAINT     o   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);
 F   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
       public            postgres    false    254    254    254            �           2606    17010 /   identity_provider uk_2daelwnibji49avxsrtuf6xj33 
   CONSTRAINT     ~   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);
 Y   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
       public            postgres    false    250    250            j           2606    17012 #   client uk_b71cjlbenv945rb6gcon438at 
   CONSTRAINT     m   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);
 M   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
       public            postgres    false    222    222            y           2606    17014    client_scope uk_cli_scope 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);
 C   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
       public            postgres    false    227    227            a           2606    17016 (   user_entity uk_dykn684sl8up1crfei6eckhd7 
   CONSTRAINT     y   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
       public            postgres    false    292    292            U           2606    17018     user_consent uk_external_consent 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);
 J   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_external_consent;
       public            postgres    false    290    290    290            7           2606    17020 4   resource_server_resource uk_frsr6t700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);
 ^   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
       public            postgres    false    282    282    282            -           2606    17022 7   resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);
 a   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
       public            postgres    false    280    280    280    280    280            2           2606    17024 2   resource_server_policy uk_frsrpt700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 \   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
       public            postgres    false    281    281            <           2606    17026 1   resource_server_scope uk_frsrst700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 [   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
       public            postgres    false    283    283            W           2606    17028    user_consent uk_local_consent 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_local_consent;
       public            postgres    false    290    290            �           2606    17030    org uk_org_alias 
   CONSTRAINT     V   ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);
 :   ALTER TABLE ONLY public.org DROP CONSTRAINT uk_org_alias;
       public            postgres    false    259    259            �           2606    17032    org uk_org_group 
   CONSTRAINT     O   ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);
 :   ALTER TABLE ONLY public.org DROP CONSTRAINT uk_org_group;
       public            postgres    false    259            �           2606    17034    org uk_org_name 
   CONSTRAINT     T   ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);
 9   ALTER TABLE ONLY public.org DROP CONSTRAINT uk_org_name;
       public            postgres    false    259    259            �           2606    17036 "   realm uk_orvsdmla56612eaefiq6wl5oi 
   CONSTRAINT     ]   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);
 L   ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
       public            postgres    false    264            c           2606    17038 (   user_entity uk_ru8tt6t700s9v50bu18ws5ha6 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
       public            postgres    false    292    292            �           1259    17039    fed_user_attr_long_values    INDEX     i   CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);
 -   DROP INDEX public.fed_user_attr_long_values;
       public            postgres    false    239    239            �           1259    17040 $   fed_user_attr_long_values_lower_case    INDEX        CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);
 8   DROP INDEX public.fed_user_attr_long_values_lower_case;
       public            postgres    false    239    239            T           1259    17041    idx_admin_event_time    INDEX     i   CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);
 (   DROP INDEX public.idx_admin_event_time;
       public            postgres    false    215    215            W           1259    17042    idx_assoc_pol_assoc_pol_id    INDEX     h   CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);
 .   DROP INDEX public.idx_assoc_pol_assoc_pol_id;
       public            postgres    false    216            a           1259    17043    idx_auth_config_realm    INDEX     Z   CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);
 )   DROP INDEX public.idx_auth_config_realm;
       public            postgres    false    219            Z           1259    17044    idx_auth_exec_flow    INDEX     Z   CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);
 &   DROP INDEX public.idx_auth_exec_flow;
       public            postgres    false    217            [           1259    17045    idx_auth_exec_realm_flow    INDEX     j   CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);
 ,   DROP INDEX public.idx_auth_exec_realm_flow;
       public            postgres    false    217    217            ^           1259    17046    idx_auth_flow_realm    INDEX     W   CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);
 '   DROP INDEX public.idx_auth_flow_realm;
       public            postgres    false    218                       1259    17047    idx_cl_clscope    INDEX     R   CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);
 "   DROP INDEX public.idx_cl_clscope;
       public            postgres    false    229            m           1259    17048    idx_client_att_by_name_value    INDEX     q   CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));
 0   DROP INDEX public.idx_client_att_by_name_value;
       public            postgres    false    223    223            h           1259    17049    idx_client_id    INDEX     E   CREATE INDEX idx_client_id ON public.client USING btree (client_id);
 !   DROP INDEX public.idx_client_id;
       public            postgres    false    222            r           1259    17050    idx_client_init_acc_realm    INDEX     _   CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);
 -   DROP INDEX public.idx_client_init_acc_realm;
       public            postgres    false    225            z           1259    17051    idx_clscope_attrs    INDEX     Y   CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);
 %   DROP INDEX public.idx_clscope_attrs;
       public            postgres    false    228            �           1259    17052    idx_clscope_cl    INDEX     S   CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);
 "   DROP INDEX public.idx_clscope_cl;
       public            postgres    false    229            �           1259    17053    idx_clscope_protmap    INDEX     Z   CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);
 '   DROP INDEX public.idx_clscope_protmap;
       public            postgres    false    262            �           1259    17054    idx_clscope_role    INDEX     Z   CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);
 $   DROP INDEX public.idx_clscope_role;
       public            postgres    false    230            �           1259    17055    idx_compo_config_compo    INDEX     [   CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);
 *   DROP INDEX public.idx_compo_config_compo;
       public            postgres    false    232            �           1259    17056    idx_component_provider_type    INDEX     Z   CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);
 /   DROP INDEX public.idx_component_provider_type;
       public            postgres    false    231            �           1259    17057    idx_component_realm    INDEX     M   CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);
 '   DROP INDEX public.idx_component_realm;
       public            postgres    false    231            �           1259    17058    idx_composite    INDEX     M   CREATE INDEX idx_composite ON public.composite_role USING btree (composite);
 !   DROP INDEX public.idx_composite;
       public            postgres    false    233            �           1259    17059    idx_composite_child    INDEX     T   CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);
 '   DROP INDEX public.idx_composite_child;
       public            postgres    false    233            �           1259    17060    idx_defcls_realm    INDEX     U   CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);
 $   DROP INDEX public.idx_defcls_realm;
       public            postgres    false    237            �           1259    17061    idx_defcls_scope    INDEX     U   CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);
 $   DROP INDEX public.idx_defcls_scope;
       public            postgres    false    237            �           1259    17062    idx_event_time    INDEX     W   CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);
 "   DROP INDEX public.idx_event_time;
       public            postgres    false    238    238            �           1259    17063    idx_fedidentity_feduser    INDEX     c   CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);
 +   DROP INDEX public.idx_fedidentity_feduser;
       public            postgres    false    246            �           1259    17064    idx_fedidentity_user    INDEX     V   CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);
 (   DROP INDEX public.idx_fedidentity_user;
       public            postgres    false    246            �           1259    17065    idx_fu_attribute    INDEX     b   CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);
 $   DROP INDEX public.idx_fu_attribute;
       public            postgres    false    239    239    239            �           1259    17066    idx_fu_cnsnt_ext    INDEX     }   CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);
 $   DROP INDEX public.idx_fu_cnsnt_ext;
       public            postgres    false    240    240    240            �           1259    17067    idx_fu_consent    INDEX     Y   CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);
 "   DROP INDEX public.idx_fu_consent;
       public            postgres    false    240    240            �           1259    17068    idx_fu_consent_ru    INDEX     [   CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);
 %   DROP INDEX public.idx_fu_consent_ru;
       public            postgres    false    240    240            �           1259    17069    idx_fu_credential    INDEX     Z   CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);
 %   DROP INDEX public.idx_fu_credential;
       public            postgres    false    242    242            �           1259    17070    idx_fu_credential_ru    INDEX     a   CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);
 (   DROP INDEX public.idx_fu_credential_ru;
       public            postgres    false    242    242            �           1259    17071    idx_fu_group_membership    INDEX     j   CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);
 +   DROP INDEX public.idx_fu_group_membership;
       public            postgres    false    243    243            �           1259    17072    idx_fu_group_membership_ru    INDEX     m   CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);
 .   DROP INDEX public.idx_fu_group_membership_ru;
       public            postgres    false    243    243            �           1259    17073    idx_fu_required_action    INDEX     o   CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);
 *   DROP INDEX public.idx_fu_required_action;
       public            postgres    false    244    244            �           1259    17074    idx_fu_required_action_ru    INDEX     k   CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);
 -   DROP INDEX public.idx_fu_required_action_ru;
       public            postgres    false    244    244            �           1259    17075    idx_fu_role_mapping    INDEX     a   CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);
 '   DROP INDEX public.idx_fu_role_mapping;
       public            postgres    false    245    245            �           1259    17076    idx_fu_role_mapping_ru    INDEX     e   CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);
 *   DROP INDEX public.idx_fu_role_mapping_ru;
       public            postgres    false    245    245            �           1259    17077    idx_group_att_by_name_value    INDEX     z   CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));
 /   DROP INDEX public.idx_group_att_by_name_value;
       public            postgres    false    248    248            �           1259    17078    idx_group_attr_group    INDEX     T   CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);
 (   DROP INDEX public.idx_group_attr_group;
       public            postgres    false    248            �           1259    17079    idx_group_role_mapp_group    INDEX     \   CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);
 -   DROP INDEX public.idx_group_role_mapp_group;
       public            postgres    false    249            �           1259    17080    idx_id_prov_mapp_realm    INDEX     _   CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);
 *   DROP INDEX public.idx_id_prov_mapp_realm;
       public            postgres    false    252            �           1259    17081    idx_ident_prov_realm    INDEX     V   CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);
 (   DROP INDEX public.idx_ident_prov_realm;
       public            postgres    false    250            �           1259    17082    idx_idp_for_login    INDEX     �   CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);
 %   DROP INDEX public.idx_idp_for_login;
       public            postgres    false    250    250    250    250    250            �           1259    17083    idx_idp_realm_org    INDEX     d   CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);
 %   DROP INDEX public.idx_idp_realm_org;
       public            postgres    false    250    250            �           1259    17084    idx_keycloak_role_client    INDEX     T   CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);
 ,   DROP INDEX public.idx_keycloak_role_client;
       public            postgres    false    255            �           1259    17085    idx_keycloak_role_realm    INDEX     R   CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);
 +   DROP INDEX public.idx_keycloak_role_realm;
       public            postgres    false    255            �           1259    17086 $   idx_offline_uss_by_broker_session_id    INDEX     |   CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);
 8   DROP INDEX public.idx_offline_uss_by_broker_session_id;
       public            postgres    false    258    258            �           1259    17087 '   idx_offline_uss_by_last_session_refresh    INDEX     �   CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);
 ;   DROP INDEX public.idx_offline_uss_by_last_session_refresh;
       public            postgres    false    258    258    258            �           1259    17088    idx_offline_uss_by_user    INDEX     s   CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);
 +   DROP INDEX public.idx_offline_uss_by_user;
       public            postgres    false    258    258    258            �           1259    17089    idx_org_domain_org_id    INDEX     N   CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);
 )   DROP INDEX public.idx_org_domain_org_id;
       public            postgres    false    260            *           1259    17090    idx_perm_ticket_owner    INDEX     ^   CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);
 )   DROP INDEX public.idx_perm_ticket_owner;
       public            postgres    false    280            +           1259    17091    idx_perm_ticket_requester    INDEX     f   CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);
 -   DROP INDEX public.idx_perm_ticket_requester;
       public            postgres    false    280            �           1259    17092    idx_protocol_mapper_client    INDEX     [   CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);
 .   DROP INDEX public.idx_protocol_mapper_client;
       public            postgres    false    262                       1259    17093    idx_realm_attr_realm    INDEX     T   CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);
 (   DROP INDEX public.idx_realm_attr_realm;
       public            postgres    false    265            u           1259    17094    idx_realm_clscope    INDEX     N   CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);
 %   DROP INDEX public.idx_realm_clscope;
       public            postgres    false    227                       1259    17095    idx_realm_def_grp_realm    INDEX     \   CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);
 +   DROP INDEX public.idx_realm_def_grp_realm;
       public            postgres    false    266                       1259    17096    idx_realm_evt_list_realm    INDEX     _   CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);
 ,   DROP INDEX public.idx_realm_evt_list_realm;
       public            postgres    false    268            	           1259    17097    idx_realm_evt_types_realm    INDEX     c   CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);
 -   DROP INDEX public.idx_realm_evt_types_realm;
       public            postgres    false    267            �           1259    17098    idx_realm_master_adm_cli    INDEX     Y   CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);
 ,   DROP INDEX public.idx_realm_master_adm_cli;
       public            postgres    false    264                       1259    17099    idx_realm_supp_local_realm    INDEX     b   CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);
 .   DROP INDEX public.idx_realm_supp_local_realm;
       public            postgres    false    272                       1259    17100    idx_redir_uri_client    INDEX     S   CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);
 (   DROP INDEX public.idx_redir_uri_client;
       public            postgres    false    273                       1259    17101    idx_req_act_prov_realm    INDEX     _   CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);
 *   DROP INDEX public.idx_req_act_prov_realm;
       public            postgres    false    275            "           1259    17102    idx_res_policy_policy    INDEX     V   CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);
 )   DROP INDEX public.idx_res_policy_policy;
       public            postgres    false    277            %           1259    17103    idx_res_scope_scope    INDEX     R   CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);
 '   DROP INDEX public.idx_res_scope_scope;
       public            postgres    false    278            0           1259    17104    idx_res_serv_pol_res_serv    INDEX     j   CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_serv_pol_res_serv;
       public            postgres    false    281            5           1259    17105    idx_res_srv_res_res_srv    INDEX     j   CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);
 +   DROP INDEX public.idx_res_srv_res_res_srv;
       public            postgres    false    282            :           1259    17106    idx_res_srv_scope_res_srv    INDEX     i   CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_srv_scope_res_srv;
       public            postgres    false    283            A           1259    17107    idx_rev_token_on_expire    INDEX     S   CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);
 +   DROP INDEX public.idx_rev_token_on_expire;
       public            postgres    false    285            D           1259    17108    idx_role_attribute    INDEX     P   CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);
 &   DROP INDEX public.idx_role_attribute;
       public            postgres    false    286            �           1259    17109    idx_role_clscope    INDEX     Y   CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);
 $   DROP INDEX public.idx_role_clscope;
       public            postgres    false    230            G           1259    17110    idx_scope_mapping_role    INDEX     S   CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);
 *   DROP INDEX public.idx_scope_mapping_role;
       public            postgres    false    287            J           1259    17111    idx_scope_policy_policy    INDEX     U   CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);
 +   DROP INDEX public.idx_scope_policy_policy;
       public            postgres    false    288            �           1259    17112    idx_update_time    INDEX     R   CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);
 #   DROP INDEX public.idx_update_time;
       public            postgres    false    256            Z           1259    17113    idx_usconsent_clscope    INDEX     f   CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);
 )   DROP INDEX public.idx_usconsent_clscope;
       public            postgres    false    291            [           1259    17114    idx_usconsent_scope_id    INDEX     `   CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);
 *   DROP INDEX public.idx_usconsent_scope_id;
       public            postgres    false    291            M           1259    17115    idx_user_attribute    INDEX     P   CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);
 &   DROP INDEX public.idx_user_attribute;
       public            postgres    false    289            N           1259    17116    idx_user_attribute_name    INDEX     Y   CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);
 +   DROP INDEX public.idx_user_attribute_name;
       public            postgres    false    289    289            S           1259    17117    idx_user_consent    INDEX     L   CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);
 $   DROP INDEX public.idx_user_consent;
       public            postgres    false    290            �           1259    17118    idx_user_credential    INDEX     M   CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);
 '   DROP INDEX public.idx_user_credential;
       public            postgres    false    234            ^           1259    17119    idx_user_email    INDEX     G   CREATE INDEX idx_user_email ON public.user_entity USING btree (email);
 "   DROP INDEX public.idx_user_email;
       public            postgres    false    292            q           1259    17120    idx_user_group_mapping    INDEX     [   CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);
 *   DROP INDEX public.idx_user_group_mapping;
       public            postgres    false    297            t           1259    17121    idx_user_reqactions    INDEX     W   CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);
 '   DROP INDEX public.idx_user_reqactions;
       public            postgres    false    298            w           1259    17122    idx_user_role_mapping    INDEX     V   CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);
 )   DROP INDEX public.idx_user_role_mapping;
       public            postgres    false    299            _           1259    17123    idx_user_service_account    INDEX     q   CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);
 ,   DROP INDEX public.idx_user_service_account;
       public            postgres    false    292    292            h           1259    17124    idx_usr_fed_map_fed_prv    INDEX     l   CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);
 +   DROP INDEX public.idx_usr_fed_map_fed_prv;
       public            postgres    false    294            i           1259    17125    idx_usr_fed_map_realm    INDEX     \   CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_map_realm;
       public            postgres    false    294            n           1259    17126    idx_usr_fed_prv_realm    INDEX     ^   CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_prv_realm;
       public            postgres    false    296            |           1259    17127    idx_web_orig_client    INDEX     P   CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);
 '   DROP INDEX public.idx_web_orig_client;
       public            postgres    false    301            O           1259    17128    user_attr_long_values    INDEX     a   CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);
 )   DROP INDEX public.user_attr_long_values;
       public            postgres    false    289    289            P           1259    17129     user_attr_long_values_lower_case    INDEX     w   CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);
 4   DROP INDEX public.user_attr_long_values_lower_case;
       public            postgres    false    289    289            �           2606    17130 $   identity_provider fk2b4ebc52ae5c3b34    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 N   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
       public          postgres    false    264    250    3835            �           2606    17135 $   client_attributes fk3c47c64beacca966    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);
 N   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
       public          postgres    false    3687    223    222            �           2606    17140 %   federated_identity fk404288b92ef007a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 O   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
       public          postgres    false    292    3933    246            �           2606    17145 ,   client_node_registrations fk4129723ba992f594    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);
 V   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
       public          postgres    false    3687    222    226            �           2606    17150 *   redirect_uris fk_1burs8pb4ouj97h5wuppahv9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
       public          postgres    false    3687    222    273            �           2606    17155 5   user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 _   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
       public          postgres    false    296    3835    264            �           2606    17160 6   realm_required_credential fk_5hg65lybevavkqfki3kponh9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
       public          postgres    false    264    270    3835            �           2606    17165 /   resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 Y   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
       public          postgres    false    3892    282    276            �           2606    17170 +   user_attribute fk_5hrm2vlf9ql5fu043kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
       public          postgres    false    292    3933    289            �           2606    17175 1   user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 [   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
       public          postgres    false    298    292    3933            �           2606    17180 *   keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);
 T   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
       public          postgres    false    255    264    3835            �           2606    17185 .   realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
       public          postgres    false    271    264    3835            �           2606    17190 ,   realm_attribute fk_8shxd6l3e9atqukacxgpffptw    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 V   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
       public          postgres    false    264    265    3835            �           2606    17195 +   composite_role fk_a63wvekftu8jo1pnj81e7mce2    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
       public          postgres    false    255    233    3802                       2606    17200 *   authentication_execution fk_auth_exec_flow    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);
 T   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
       public          postgres    false    217    218    3677            �           2606    17205 +   authentication_execution fk_auth_exec_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
       public          postgres    false    3835    264    217            �           2606    17210 &   authentication_flow fk_auth_flow_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
       public          postgres    false    264    3835    218            �           2606    17215 "   authenticator_config fk_auth_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 L   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
       public          postgres    false    264    219    3835            �           2606    17220 .   user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 X   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
       public          postgres    false    299    3933    292            �           2606    17225 .   client_scope_attributes fk_cl_scope_attr_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
       public          postgres    false    228    3703    227            �           2606    17230 .   client_scope_role_mapping fk_cl_scope_rm_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
       public          postgres    false    230    3703    227            �           2606    17235 #   protocol_mapper fk_cli_scope_mapper    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);
 M   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
       public          postgres    false    227    262    3703            �           2606    17240 .   client_initial_access fk_client_init_acc_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
       public          postgres    false    3835    264    225            �           2606    17245 $   component_config fk_component_config    FK CONSTRAINT     �   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);
 N   ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
       public          postgres    false    232    3718    231            �           2606    17250    component fk_component_realm    FK CONSTRAINT     |   ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 F   ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
       public          postgres    false    231    264    3835            �           2606    17255 (   realm_default_groups fk_def_groups_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 R   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
       public          postgres    false    266    264    3835            �           2606    17260 .   user_federation_mapper_config fk_fedmapper_cfg    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);
 X   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
       public          postgres    false    294    3943    295            �           2606    17265 ,   user_federation_mapper fk_fedmapperpm_fedprv    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);
 V   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
       public          postgres    false    3949    294    296            �           2606    17270 +   user_federation_mapper fk_fedmapperpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
       public          postgres    false    264    3835    294            }           2606    17275 .   associated_policy fk_frsr5s213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
       public          postgres    false    281    3887    216            �           2606    17280 )   scope_policy fk_frsrasp13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
       public          postgres    false    288    281    3887            �           2606    17285 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
       public          postgres    false    280    3879    279            �           2606    17290 5   resource_server_resource fk_frsrho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 _   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
       public          postgres    false    282    279    3879            �           2606    17295 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
       public          postgres    false    3892    282    280            �           2606    17300 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
       public          postgres    false    280    3897    283            ~           2606    17305 .   associated_policy fk_frsrpas14xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
       public          postgres    false    3887    281    216            �           2606    17310 )   scope_policy fk_frsrpass3xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
       public          postgres    false    283    3897    288            �           2606    17315 8   resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
       public          postgres    false    3887    280    281            �           2606    17320 3   resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 ]   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
       public          postgres    false    279    3879    281            �           2606    17325 +   resource_scope fk_frsrpos13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
       public          postgres    false    278    3892    282            �           2606    17330 ,   resource_policy fk_frsrpos53xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
       public          postgres    false    282    277    3892            �           2606    17335 ,   resource_policy fk_frsrpp213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
       public          postgres    false    281    3887    277            �           2606    17340 +   resource_scope fk_frsrps213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
       public          postgres    false    3897    283    278            �           2606    17345 2   resource_server_scope fk_frsrso213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 \   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
       public          postgres    false    3879    283    279            �           2606    17350 +   composite_role fk_gr7thllb9lu8q4vqa4524jjy8    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
       public          postgres    false    233    255    3802            �           2606    17355 .   user_consent_client_scope fk_grntcsnt_clsc_usc    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);
 X   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
       public          postgres    false    290    291    3922            �           2606    17360    user_consent fk_grntcsnt_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
       public          postgres    false    3933    290    292            �           2606    17365 (   group_attribute fk_group_attribute_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 R   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
       public          postgres    false    254    248    3796            �           2606    17370 &   group_role_mapping fk_group_role_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 P   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
       public          postgres    false    3796    254    249            �           2606    17375 6   realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
       public          postgres    false    267    264    3835            �           2606    17380 3   realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 ]   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
       public          postgres    false    264    3835    268            �           2606    17385 &   identity_provider_mapper fk_idpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
       public          postgres    false    252    264    3835            �           2606    17390    idp_mapper_config fk_idpmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);
 I   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
       public          postgres    false    3791    253    252            �           2606    17395 (   web_origins fk_lojpho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);
 R   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
       public          postgres    false    3687    222    301            �           2606    17400 *   scope_mapping fk_ouse064plmlr732lxjcn1q5f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
       public          postgres    false    222    287    3687            �           2606    17405    protocol_mapper fk_pcm_realm    FK CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);
 F   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
       public          postgres    false    222    3687    262            �           2606    17410 '   credential fk_pfyr0glasqyl0dei3kl69r6v0    FK CONSTRAINT     �   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 Q   ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
       public          postgres    false    292    234    3933            �           2606    17415 "   protocol_mapper_config fk_pmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);
 L   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
       public          postgres    false    262    263    3829            �           2606    17420 -   default_client_scope fk_r_def_cli_scope_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 W   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
       public          postgres    false    3835    264    237            �           2606    17425 )   required_action_provider fk_req_act_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 S   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
       public          postgres    false    3835    264    275            �           2606    17430 %   resource_uris fk_resource_server_uris    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 O   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
       public          postgres    false    3892    284    282            �           2606    17435 #   role_attribute fk_role_attribute_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);
 M   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
       public          postgres    false    3802    286    255            �           2606    17440 2   realm_supported_locales fk_supported_locales_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 \   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
       public          postgres    false    264    3835    272            �           2606    17445 3   user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);
 ]   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
       public          postgres    false    3949    296    293            �           2606    17450 (   user_group_membership fk_user_group_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 R   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
       public          postgres    false    3933    292    297            �           2606    17455 !   policy_config fkdc34197cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 K   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
       public          postgres    false    261    281    3887            �           2606    17460 +   identity_provider_config fkdc4897cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);
 U   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
       public          postgres    false    250    251    3782            O      x������ � �      P      x������ � �      Q      x��[�v\��|����x'�������-y$99g�~
��ۗe���/)ڗj(T�j�#93�\�t�$�K����*�������xz��A�8v~WkN.��Uf'��@�e�|�"����]T�Q�ōޥO����x�ݲ�����L1k��q�e��8��|�SsJ��z����Q?<�J���P:�8�X��c-�z��$�vMwN��a��������?�ͳ{��������a���sqt��2�De�Pr�r��ӥ7E�����hI�����ˡ#oV��A�� �cK��K_N|�.w\ܽ�V$Ĳ4��x[�//��ȟ�}旗����[Oϟ��o��Y�X<�
,���#�6�k�H=$�5��B,�^�
�Q�������E�3K�u��8u��)xqn�Ѥ��(i�[?�7������#<��}\� 	��o�_L#�'�tAe�����2�zU�跕}z�|�Zn�9+S�s�)^����e,s�K�KO%�><����?>L~շ��CG5EOज��xk�:W@���{�U�9�$&�!z���H|/MBh����.���;�]鳥���ʁg#���"�� �]S[F֨�X�1î�z�X�@��J��s?�L����
X_����N:��7��-@�,kuI"n��rp�ez��Sk?_\�M���+��$ks3.�,���2��!3I�ǥ�������-lH�zE����xT��,�
=[RǷ^��Xm���z�#z�PF,�Jk�t�/}�Ĳ@�Aȥ^��Q�z%�{�S"�1��p��Y����oṈh�M���Ǫ����ؚ�(����~�e<n���ck��s�pq!:(B5�e(�-6d$~������znP˾&7#y���HnhE�LP=������ǏӽU��M�w��|_��-����?�U��)�J�kν���!����?=��Z�8N�+�*I�}����\��a�7�
I6��_A�Q�	�)��a���O���΋���6x=��͗�.~͕(�3T�5�M4�L�L�����>�@X��Zӂ��k���p��ظ�5#�zµ᠆��"�nMJ:���X�S뱸�:�(Ne�:h��t�&�貉�I���3�]� �25��Jl����Mk�YV5Җ�g-�T��q/*����h$'���I�^����K"�hԖR��U�C���#��r�C'n�J7�3;�����I>��!f����_�Er�jY=7��WF��h�giP��� /�rs@g��XD(��j) �К��P��+��wA��J>#�٣�*p1�!J�	�sR�ؓ�,�g4�?�/3����އ<���=�M�����
���Y5A^5X�,G����2Jq� m�{I��f?<>e�h:(P�}��\�#�|]mb<��jS�KPW@.�:���}j(�4J�GO��c%*8k�r�TNqx�����P^�.������?_6û�,�(�n����1l��x:#z�tOi�A�٬��ϲ�@G�fUI�5���x�泵���*�#G�6֯0Q�!����e O��SL:'�R�s`")�-�� �?����!�Bq���D����*ȅ��UH[�W��&�#fiɀFD@kA9��`n����@Z�����R=!�Wte�ty4�֨����o1;ď�S��ø�la�lp�`��b�(�	�e��f�QHh��"����\k��0��
�[��Ը��G��&�b&`�xR�˙�p��9}�������m�-<y'̓��0Gӑё�r�{(-"���m�-_��"�P:���=��X�4T�^��\��q�i���JN��ɣa�$)Ck���D�m�Lw�|s�{��A��	Oa2H���6�&�3�CE��EB��d�y1���5?�����
 �/hS�ev%��SyAq?���S�Z8�]@�2H%�8K�����B� �n� ���V�������M�8=.K@� $�!4�z��U߸7L�@fh�x,��ݸw�E���Ko�?'����E�O�������4���q�j=f�� �*�y�e����AX����:>!��*C��1�v�r;(��!@e��>�6hP������<�r�r�0��^��.*dE- L*Ó��6�!��-{��b�#�e ����L\�5Vɳ�#~>�ב�`x�o���9�mW�����	�o��tIZ��F�c�f�y���૖)M�k·��+�!-�\�M�<jƪAnA*�K<8��������[�uA�$ԉ�W��~��Pa�ᓊ>�� sL���\)D�
�s�-���鄴���Z�c	��%��P���{�R�ն�a���-�d�2 ���@��|��"�z�K�r"ر�--u���,�`�zo8m{x%��}����0�N��$Eb����a�d�%6�r����BF7Ͽ�{�ti�vA�r��E�:�uup��
�`�>=�Ǉ�=���a��	����e:�f]��vՏ&���㖷I����0����:�( ��RF��ߨ�Aɤ΀d
G�P�g Ai�6�<q�/&}�Dw��֭�y�Mk�I�dgh���Ue������g����Y����yD���<���c�>#T��:j@�g�'����r�~������):?l�A��C�cN�*=��>�%��uMX�2pq�&KɜI,�Uxe�yF��~b�>��B�9Ebs�����SqPa�>�M�B#T'l �n�HY���)���%z�^�X+�9�qL�@>��4TK���o�ev�\D�`4|��̐��\_�1�^�n����^N�n��l҇���\�졙!��|Fk��ylL�n�r��cjfy��M�Q�he�md�Z������ ��fM�Jfr��N:G��b���B�[=�˽O:~6���Wc�M�*,ۘ.��t0����..�BG�K� �w|�֡�����R 7~���]}o�?�!���fS&�˴�����郞kb�h�&� ��ӊ�Sr �l�kG�BYWy�-_'}���B�F���d�F��>J�9a�Q���?C���rBt;��c�}k��w�t�Bs��_"o�:vǪN���8����nZ�@γ��!��f(]���6,�P=���&H_'}[`�H�0 4(H+#;}�P�5p$}��˰S�NO��e�e� ���ʾ��g`l�vK$�c� &�(��T�;�� ���jI��wa�9��zm�ҭ�|C���;0¨���|��I�-���(#�܈p���n�d`^4�}�٤oQJ%i��Hs"<>�^��A�1���U���'kEd��8��ٺ�����K�
[�j��u0�O��*5u��~]mb<�:�n�3��V�6�2+���4[A`ZjF\[�J`)��Xņ6Q:r�4����o�Y��y/K�H����IUG@��Ӭ�WB]��ʬ�᳐"���9�A1':��}��x��T>��U�ȕ�>a��f�k�Nr�LT��K41�ѹ r����rj��O��L��o&.`���o&����.Ep�@1�x���&�SJ�rM��wt[HCbIG��_��ϨU���N+z�G���l-އ�y�&}��X.�D�c؞	w����~Ea��F���t4q;����X���6-+R���+�((_D���)�z,D����a��J�Ұ4��Jo��Ov}��\�]�Z��ެ�6{@]�����&�k��Do��]�P੗e�TS�ޝ�s�2��iw��Wb�d�kr�Dm��Z#�)�nR�6�p;�.����١�Óg1kU��(h�[���V�u���`�d��I�����85�>!٩�<A�=��8d�����wM����q�E�R+G'�2sm��c��K�ԛm%-;�����Ե�)�6;�[�.ֲ�+*l瀔G�泝��3Q�^��E
%��wV�'�$�t��&���	B,�Ƽvl��hA"e@��zT�O��[�f)p���ls�b���A�NZL�|��%�]�l�����kͅ9��BIƭ!x�l?/�*zt�������%�������� $��    �      R   	  x��X�v��\C_�����XJ���Ď:�ʛ�/�C���0_�j)S�}B!���0��꺯�Q:���	�MvăW��S,�ך��������,ѡFW�Y��1�2��@*R9s�L�&)xpD<�dhސ�O����|=,��${�d3�;#=72jN�8�J�6��7�yq~��]ԧ���y_��y�d4�?������}6�06�lu3��$�������5�tq�}����穌��co��nx��a��J]��b�*��!l_�u5�� ���O�:���
7�I:�69Bh�
v�;�Ӵo/���e?��'�0_�3@^O8�_�5["ٲ��'w$UyI9��d��։��ɺ�7� �I+$�B&u܎S��"I�27��}=����ɽ�~����(�*�RϴT�l�x�V�M�d�G����`�~�Q�������#<��!�y�>�P��$a,a�C]Xݝa����;k�]�z8F��:���~��T�u���.g�t��.�R�j�O�xF� ���d����OV��̼:��W��Re��4/��Ox�gN^���7'�^��8[��zKP%�7��)GC�9ϛ���;��f�����R}��� ��`�R2�"60h3���VcM%+ی�C����ݟ#���t����`�׉Q���e�zD���Xn��~~�dG��մ<e�gc>�Er��ݍ�9J��t��Vo�n���� _���6�������^ƪ��n�#=��������%w���e���M���.��N��O�e|_��`d�^���+�������ɒ(K凿b��*{u���[^n�_�њ�e���}��~@zK�1,�MV/h�}wu;Eq��r��$z�N�[�9�����U#5���&�P�)��a��~lw)>_��6��>1�#�c��}%�ݏ��\�0�7Nyt{�y�X#9��Iɩ�
����� �t���L����d��e�*dD���b"���FѮ��6�ܴ5yx�iI~6�Tk�LT�����ȍ*IEc��q@��X͗�O������{��ۈD�1�����Rsj��Z�w� !C�酏>��R�|~+${�(=�/��n{�گ�U�S��:�؛��6a�Y	���8@�K��(�8R�d�Ȕ�i��*U.��&S8��.JdcJK^>�r?�,+���ܘ��*���YݻI�.��-��`��#����L^&-�$����9V�lK�"U���%O" �L�dp�24�ݟ�4��˯ߴ�TY��Z�i���˭։TJ�)�G����I���0�q�[ʸ ��H�t�`� o#�/��D��9�=d,��w,[��G�d<�ؙ�0)DP8.
�g�N���c��`5�|B&�	5hL�i�L�P�:�-|I*��bw,y^��Қh!�BK�Q��Q��XD�TZ����&@�ƌ��H�j��+:�-te���j�^��d(�$0����xR6��'9�-iּТ�{tj����;0a�i�£ˣ <t,Z[]}S\���$b��.b,V�B%���9�M5��:�pψnV��W�+ X�Q_رlj�3ΕWxEh8�8�QC�H�Z�!}�e�\ն���6� P�k$��*��c��]�#�DAb� �fcڢ#_��lb�b��.�Mr�&�Kf��5��K1�cق�'���Z)��'G��
Un�/��[�/���=�\��@�P)����E�Hu��X�D���h�����Nû���S���ئ�B�/�����S��M�RŊ�0c[����ɓ'�U��S      S   �   x���KN�@D��)|�F3==������0	\_ �jQ�zzƽk�U���*��
\J��I����=~���:����z���"�b�Z�d9�h"�T1��IP֢!�nP�Y��� ij�e,v��b�_���_q��!�5�'D�~����$h��==r��u���A,2�c:|j�+�$�xPFV�]�Y�����x}Y��tp�      T   �   x����n�  �ɿ�`��^l0RR�j�{���<�hƉ2Q�ඍ sV[	8l�).-������Gj.���G1������ۼ߭�k���7D� �{ �4���.?m�v�˿���CM?Mmc���{;WDrA��RU���/�9�PJ�@�
�!���|E�D�R�⻁�f]�?�@id      U      x������ � �      V   �  x��U�n�0�����j��7�С@� ��xl��r!+C��K�vQĩ�B ˃t�~xǏ�%d���XA�6��2
��Ű��-���l����2���.�`[�!8���� ;ot�ё��r\x���uªެ�`/��pĝ��ںlʂTE *5��H	B�6�6����y���dBYMZ�����uu�~���O��x�u��Q���A��#�ә��Gz�>�^����g~�Ӗ�U@
\����&����"�������������Q����t���.�P%�MF��T��ݽ�o�����φ�kOl�C-f+)��ު�R�u�xX4��~=�*�uw֓���%Ǐs��e�u��X�Bk�͝��� �B�ͭ��[Y���vr{d٬O'���	�B��M��m؀�I��R�M�Cu��
����=�n��:�]Rm�Y_@��	"��4�Z0Prd���Il����n8�}2Y@�oyg\bѭ�F�s��_���$W�蛇ڎiai�P!`۞��ܥ�=m�Y�`�m9�CI��`@q-gqs��X��Uj�&g�����$��j7
8��q��@�vaj�)����38�:ik41G R-q��d[ a�S,e�����Ӕ�Y;��y��(�����K�Yr����L�_��9&�?����r��K��\      W   @  x���In�0E��U

������Cԍ��A�_�H r���>IBV���
1b�j� [�.4c���n�[��z��U�|U���z�/S�32Gj9@�]��	��p�TD� xgu��X��,z9�������5�<�95Ɩ�$��2�J(%���:��)�xF
^�zw7u��xڿ�g�Ƭ����]/N/�/*��zӉ��E�SV�Y���m�=��	�q*wJflIx/�<��Ԡ������9�q�&���P��Ϧ�� �C��Pz	J�<�d���	�z��n�������7�fr��N�t��b�9�&��8��M��g:      X      x������ � �      Y      x������ � �      Z      x������ � �      [   D  x����n#U�ם��%,
����6 F,@b�4��S'���ڎ����eLf���ζ������W6%H ��36�3��l��J��4��w�,�Y��]E6̐R��(	(DgK�����ӏ��<F��v��q�˝|?�����?<}e���I�o (b�X{#��<��N�����2A��y��x<3����vw�X$f���{���b��=�g#���e��y��2_h���[�%Y�7���Ł���F��I#$�/(�45���֥O;���X�F7�.�g�`�Ti 6e�<�-N�MT<D:�9�!g4�G�n���X�-�ںU�=�:��X����֤^�P�@,��/�j軛e�(#�Hgr
-PN`-�w-ȠBL��L�1?��9q�z��z�`���z��xX�Í�ݨ����\Zm�Wt�%MS�Ȩ�^��Z���`Y��i�B �v�i�F�^�4zUC�Cu����S�B2RzW��������ÅC���S#�?���Y^ϵ�fm,�V�vu-Ƣ	5;���S.�[���ེ3&~�;*� Fޡ��J�Uf�o�l|�?���Z��e��p���z��=��~�mr<�b5N���*�iY,���tb��T��1.��TJ^?�ߴ6��ݓ���p��<ڈ���ޟ�Yv�|}T{�C�b}-5���(��-J�]lԑz���k,��h� �l�p�S�_G�ܒQ��^�6d ����ca��ψz����j(�*��/I��r�'0�e,���Q/3�sD�-������l��a�޾�Tm�����ߟ j(�u��u�(�Q�c���)I�G�n��E����^9�wx䨵P����^u��5O�B�'��Y|a�!E��
!閣��'W��~x$�&y����P5���Z���VT"��8%jA��G�~���!*iDA�)���Vգ�D����GD�z�_HԚ�7`�U�[-j��|$ɘ�?Q/��z�f�J�T��iM7��5���Z�mMt����[[5eW8V�������r��-qCy$�&9���ޞ�ӱ���G$���+`��t[���Q�)Q������_��      \   �  x���;�k5��ߑv"�=.-P�x����(ɕ����D�B���9�V������ä�B��] �Ȁ�<�J�ZD�o��W}������>\���oz�n|U=��
c���q:��f��~�˻�����u�������~����9�42{T�rB=u�n������ϗ��t����V�5�<\����mr>��N����G���Gː+��+�ԩD쮕 �Ǚ�%���~���I�̭�:���U�p�7/����v^T��dS�{�NS���<ͷn���~<-Բ�[�QQ;��$��pR��<S�~�/K����\�;e]׆1a͎��o�Vf��B��"��ƖV�\΋e��j�V-I��w��aM���2aq%�:-�%��q�鱸[K�o�c�W[���DrFMx��T�����>��H��E2@R�vhx${V�NqJyj`	�Qy$�>�M��|䌶��kZK��_�l������ꡆ
��M[��@߭�3�4��dkO*�g3R��}A�cU�B	�	�L��
�����~>�����yq�-��p�f���U� �%@� �VC��<?����:U�����#3$�*���!i���3O�
�3Q�Q*Mǀ����OpEpNjG�;��g��zd[��z�t�Yi�@�p�;\`�u�um$	4�F`� ��h4�9G�h�i�[a�u�Um�Y�6.C	�+e�Pe˷[K��κ�-c��E(��5q*�mmZ�)�����V/E�uU[��9�J�ú�n`�ۉ�k�RH�%ߩ��KQg���DI�(ٚ �p2B��)Q1��oU=>K��x��[Y��k�,�Um���B�������<��@>�R��E�ԢEi��A��/ɵֲQ;�Qg�!�Ԁ��@��.�T��/��ƥ�t��x�!#��2Z|p�<﷙�N������8m�%�g�κ�w�v���+�1      ]   �  x����q%9ϒ/��N�p�`��~���T?� �$ �I��0�1���l<��^��x�}ǟx�]���ׯ�ܦ�c7����/�����Vo�՛�8�P���-�F�k��j�UN�uh5'�`��!���+�������4l�&���Vк����9���׵J�ϫվ��ݢ�{��1f�N����~�bU�z�V|����Ј��PG.�U��X��)�Ui�O���xo���+�r�J��G��m�,���p��L�:�ְ۱�M����!�ks�|V�fհR�wZWr��<m�����!�U+f�=�V}��-,/�]�!���^c4�j�y���gӋ�R��w��1�.^���!Ă!t��Cl]�!Ă!t��C�b12��9��֏��ogi��C�/y�9�{���=DX�",z�u�{���=DX�",z��P��B,��]�왂��E�=�U�-F��3�Q�:�X�!Ă�u1�:�X�!Ă!t���b,��)�wm�� �����^�6[1��^�=�X�!Ă!t���9�X�!Ă!t��C,F�c�y(ֹ��ηE�*Ãy�9�}���y���<DXt",:�u�y���<DXt",:��P�pB,��^^?�;g�EJ�t}�KM_���O�i���f/���%�Y���~�i�̫}D�o|K�-U���2N���[��U��]笾�j�������Q�t�x��ܺ)��f��B��>�l�c~��HK�u�z'�Z�zR۠�U[{ڭ�St"Q�*W�.�ͽz��"�7-�Q%��GY��z�N[	�Qg���]����,�5��}�w���W�1��}�]}=ioU���o;dku)P/
�갘)��*1}�,�f^�
=���_uIŔlK�c����M[�
j+в^T��n)�u��c����θ/l�[��3�X]�L�_��רC�b,�bA�:�X�!Ă��C��B,�bA��
�͗L[�?=T�}e��5���!Ă1s��C�B,�bA�X��!�b!t��CI��.�ڌ�h5�,]���M��Y<R�:�X�!Ă!t��C�b12��9�X�!Ģ���B����+���(��;��(S�6����r�{9¢�a�^��h/GX��C1�^�`/GX��#,��멯�����Xlپ�������P��CB,�c1�:�X�!Ă!t���b,�bA�:����߿���      ^   p   x���!�s���(�2e�?��"���	$NB�<��n����y���ؙ�Ÿmr6�yj���nŲ@�
�[����̐.�����J %���abV���^g��1���'#      _   P  x��W�nG=S_�(����8$ǹ�R]]-�8�R��O����$�@� 8���׵�r$�K�P}a�*c�lm-ݚ���7�A���a<�r��0C���ȑ*gsOH���\݋���'���@�V��o�,�7k��r�{:���j7l�|�zs����w��l�v��]7�ϵ�7�-B!A��q�����Ͱ����~��K�g��R��K�0��+Z�!�@[3�&�1՘�ؔ?�l6�_y�����Hu3�8ɼ6��u�G�����`m�d�#��xK��G�������0��5}�#�����L(���K��|�K��T���f�C���~8<l�oi������NfV#U��
��W�r��55���g��¤�3A,�I�99�_����L�G$p��݆�r��3.S$��Vi��|��S�%���Õ��Y/�]Ċ&��Ђw�
�u7!�(D�w��}Z���7�"�E#n"�R�hԛ8�؏����$2�ʩ�	B}W?ɝ�����~��\��8�x��!�bύl�&�{ò��������Q@��YT��oP������������o,����g�T�|n��"h����:#B�:޲t=GC�$�w|*�4�Vk����,	P�A-�p�U���]D�n��&����nn����כ�b:�r��M����v= �#�2U�k�R�rj�|u����A�TBvU�JȀN�4�X�S�0b�5=��k��p�f�f���Kf�]�D�[q!E���l�)��>�&h��������Ĳ9���[�v�h�ͲpV���-vCڄ��8������z�	�zm�h��sJo���d�DS�0�����-+qJ�냥l��gZ����W*dM�N5髒zW�	Z�KM�@M�H_�fy���L��1VV�A 6�/�Q����]6>�G��Yv�x);�31t%Je'�N
K����Š��"�,e��<�Rv&>cT@:���IF爎ɢ,�傩�U�g�٩���u�Cl�'�ܚ���9�)5L�C.�D���|4�L����\F�A.�]��'�>��Aj�D�_S�O���봑j����!�K�7[5R;�k��	菫���?ז�s      `      x���Y����.��֯�ȸoޔ�iG��ml�0`|�
	�Φ1`c\����W�63+��SkG�q朞��1�F�}�Uy,BM� �1'%�p�(�\�DH%� ^� ��9�*'�T� &	')@�""�*_*��[A��"��W��P��UNJ�a	/I*/|�J�^ొD��M�$� ��q
	�����n�ȚI��6p}Ҵ��2t�UI1�9Y 'I��!@)G&� -Q�/"�
�2���	��D�Y��)$I����YӴ&E�q͊~��P45�����f���BC��ܷ�j2&�$" &�F��4�(���@5�����jܣ+�_���P1d�bYT��)�>�		@f3R�E��!A�DN��IY��*!����XQ�P�,qHf�� f�+3ŀ ��X� ��<�NA��Mg!ED�ue�S����}Pµ]34Isc��-��a�t֣��=z�?��.ӟ��UIUU�dAb��!��r�'�4E�4�ڏUC�C���1пȁ������,X$�ֱ�ɢDU`�$�@�_�+����װȔ����x�EH�OH������_�VE����"RD��^�0b-T�� �<���>n7�F�_@ �ʘ�/�%6 )T8� ��T �I��z�s$�
ע���r��uHJ5*�hE���@�#X���.����E����&�#
bA�	e°$�~�Y����]s�ܭ��{~��g!�$�?3gY
��"M!а�E�2�e6F*�J �q#@e~J*+����D	aE�NE�?�)�q���gu�H�ObQ$HHM9()3��01f�:<�
%�c�+O ��
,9��u�%zDx�%	I�&-���/ҁ �5�SMf�H���S�(��9"O�����Br*@(p	+xH̽�D�x��2A*A2����F@ᩢ��U
yVV�p�(rJʋl`(�I�Ü�W������>��\,���@���Y�w�"l,�H��< Q��
�"�\D��j7���B
0�N�jMD�0���rFy�1���qM��c�gr�ō�{��i�}����j���?������~��O�g�}��O����v?�����/����=ѭ �@���t�u6�OUQ��G���D�鏢,��m�c��������C�@���?ϴ�_���+H��M�dj?���=��R}��>���?!����n~�_���b��u������	���?����?��z�
��P����������w��E���i�����~��6>LҞ�����F7��*��[�?Ї=�uͣ�UHq�M?�"�Z��O��o��o�>���+{H�k����ƼH��hʾ74���������� �����K��0��S�)��iI"��/	Hwe���d|Q�Q��J�$�
��/W:1�,v�W"AfP�K�H "�>*�X�䄨���5�v�l��鋻^/�qm���ԏ=���*��rp����1��h͉�έ�����.j�u�2�呶��M��gG/9F������P�2�?ҡ˽u�C�L��vp�̥���f���	.��Lݰ���n�^1�՘��dyȶ���,o��*o˩�&�py����13�iۍ�}-��œ�	������<>��ypJ�F^�[���į��v��(����3���"�X{��/�eD���x�'$J�����1�a�d��,r6��h�99���� KK��^\Ů�,9����R瀎kK?��0;��|���GP_���W�c�&U��_�j1�;/]��قNs#�7s���e��{f��`��>-3�(4KX�`v���c��^u:��p����s��$����H^�g^���Q��L�X&�p�fܧ���0\��Y���":h]�_.N7��*;m�þ;�+�ߍkem�}XH|�Z]�-�����e�ݕ������h:Ґ�s�26堈��c���<�Ώ����"����&xm���̒�[�x���ұ�[�9�L��;�E��׵+3@�=�]ǛY����h��$���wǟй��<���ˤ�%3��3NW|ң���)���{I|���yw��^�+W���6;�r��p���7:1��Ȃ�����͒n^�~�v�����g��Ц0�]|(��R{��_��X�&�@���^ʮ��^�%-wgܭ�y �� μ� *r7n� P��J��x�&��k��Zz����i��r�wy�C�����z�aY�2%��8S��o�}<���g�8	��(��ސ]��.��=,i�:ȩv�dxA�������٭C���J[6-�SGU0S:��7�?�޶M�w�Wo�]Z�J*TL�F~0�糗$��_�ʣ������xx0��i �DLV��I����w�~k��|˘a���;v�ŉ���C{m\���L���,����,
7Z7�:���hm��fV�[��^���ì]�|����;�R�qo`��Fia`�#}PO�S@�Tɭ�y�y�[�f���f�ue�Ļ��xĮ�M�q8������ǴR�!\������U��u<=����V���浓��+l[�Y��^;��DCqN�ED]�x��3������p��U�-��4Z�`���G�=���m�O<(q�[����F��
gp� cs9���%�Z|&�~	k�%�� �jA�z�5��B����Xw�|? ��z��W�^Ң��Ǭ\��PLiB�c?z�(L?�PNLU�I��U����"-V�>�Ȭަ�Ǯid�`X������zϯ�
�����n�{�F�[��hY�e��;�r^�v���2��Zv˵�{/��s���k{+��o#����+ӿ��5�q��t]Z֨�o���p�g<����f>EE�:I�5Z���a=d��Teg(U���$ά˗�܇�+�;��|>�]�(j6+MWڑ�8���z矓���i�=��I_i��s���;Yd=��[m�6x����V�q�`٩s�����lI���ۂ{�{��rؖk�y6�^�e6���f.�����9^J�q_S�o~u����Ӽi�V�b�J�[��EZ����l}e.�6�48[�j-�B����d��mss�k�Q�V��9�7�⒍�&*����s������36�msY��dǠ�cu������؅3'r���M�i��c<a!m���������=�=�V�>���Х�XL�LIǡ���"mFM����B����1k�G/t��i�LLE�N7���_�����|�	%�؇����}�C~\Q��i^�2��}'��k�y�T�j/\�*>y�k�u�\E����[썞
�������V]����}�p�/E����FcUO�?֒T��Z�ϒU$f��p�
�@�t���3/�$E��lCߛ�u'V�=�c��s��(��ss~�e�e�.���jJ5�)�0M>t�2�%�jZJ��*
/7�l�b��<�U�2!8��wNB��i#� �Ȳ(0�}͢[�i6��x������-�Ԅ��s��mRP�,�(��E��r�S
YG	'�{��[N@�x EYUh��2�Xf�C��<,A�&0�-Hy�@+���oȜ0* �"�x�м$���Z�r��FNT�W�P�(�.!�t��"fBºń����r�6!�0�8�YҼ�E2x�ӂ�}X�6|�WZo|\�!~N��.ߪ���ɩ���XZ�/S\��{��{�:��>S_��}Y���XD'o;�.+,-��wϏݥ(#u|���,��#�'y\LŸO�E��q1ߞ�?��%���7K۞mU�#5w{u��Zn���~��8�I�WA�dg���V*�2�]��Fԝ,��ϗ�q��ˇ���Jn�%�Y��
������m��%.O0��2�[���CU��	/��z�]�R�yj��\�ς��q�g�eV:�ju���_z��_��ڤ�:�v6����� ���r-.MO�����u��,����oQ����YǨ̺7^������]Ke�U��qk�y:D��ؼ�;<���~��J��:^)}�+X�5�n.'�Ds���k�U�t6)}�-N�)c�ݳxωe'��rX�O������]!_�|     �S_� 3b`&����zw��͋e�G�Q<o�>w ���~�΋���]׾�|��Cy�'t�O�h/WogK�����nf�o�x��I|01�&�˅���k�����׀�k�X�U*�A��ݡW@�&QqS6w��}|~��n��ASS�2a�3��?.�i�;UY��4�ír���i����=�����7O p�~�}d�}�V�ܿ��MRGy�<������_��~���TY�Z��"I��H����;a���?�ok�-ޟk]���A8jƹ��V'ma7�R6!�����w��=-����6�.>�~�p��{��(},�O�S�$D��e���2�T���M�K���+L~&Jk�ug�ro������yi�v���ʅ�,�}�?�Υ6����y�b}xm_����.�Ws�# xϜ��e /�_���u�G��������>:;~k9�m�����{[^�����F���j�`s߂���ǵ8~�k������To۾j�	���C�m����V���1_՛��������HNh/=T�ٌ��MbE䋻��˫��Ɵ��:��e�7`�#]���a�TCn�ץ|m��S�`�����84�G�k|���L0V�##v_�!��f��S9=�z�<;!�ȕ9^f5�M�QA�̢�[�۱~ۊ�\����$[�9w`��h�[=�B��6'��x�b�T�7�Ά��W%��G3ۻ]ͽ8�8�Lf'�;���.�Һ
�����[�8Lg����U
 ���|19�H"�
��;�c���]��V=Y�12���H��q��k@V�IS�
�w5���/���PF���#2�$�(8�ӄSQ�T�(,�_���t���9�~�t?�t�~~����Ϲ<���7	��������1�/��f��m%�R�_��л�0g�0��e���>�ݬ���1񯏅 ��Z����f�<���e��6���>���l��l<�[�4!��k4�r(j��ut�[7����Y�2���RM�3+�I*u����{?��*Pn<��u�'m��)��0�N���}e�thOCd����hp���C6Y�����wS��C�>Ke�]f����{s+vVΧ�Uյ��A)�a��]��^����~vP�=�t�׻���J:�hQ'k��^�N꠹5�5ǧٽ��B�\�"�������m7�{G�^w�+��v���ܯ.��i�r
%���`%Q/�{\���w�P�NF���6eN��{.�z9�S���p)-�u�9G�L�r�8|B)<.��fD�:�}��,��;F{iuf�^���>{�Α�oik �*��r��j��BsS�w:~Y�h�0�V�k����vU�$?��-�[ޢ�����_E���ћ��q�_��J�֛`���
^n����Y�:���u;�z/i�����1�T�p��"�2��?�r4�HI
}*B�4����Y$���)��ُ������IG�/�?���_I|��rѝ]����V'V�%�R��$�\���d�5SO�m�n�������z�xG�|"�-�����m��&�;��G
ӕ��gH%/>pF�?�~������4���
D��&�<���DNW|���GI�N��S�%�� �pS��I��DLD�}����eAò"��vt₡©P�%ʞG��}����ؾ,�_SH�ả�"NR>I��Sf�BK*���� _R "E��%�c1©�&?�<`�+	��L�E�l�#�Y?�3��KEE��!��8�'��i��a��F5K5�GB�6J��TIf����%�BN�B�H�,�T�H���5��K��#�9�)�Hc��Q�SU�l T���I(�������c�OJذ�DL�~_�vu����!H�|����`���W��@Ϛ�?k��"HRV�Q!�g$1�)�š��)��-.a��<$ſ�� ��H9AN>[3$U�8��S�JL.^��f?K$��X��v֚>>�h��0�a�DL��U4�Ń�x�g)���bşA
�K�D�D�^M�l1u�b���N}���1;�g|�����ߓ|f��[0N �=$0���P�eir�~F&�,l[������_a���H��-�gh�&�8��=�_pA��Ѯ����:]���;�/��NgH� v��w�����kq�F��u�U��␓|0Y�u�˾K]ߛ�Q�?����S�����JQ�+�㮟��m��ϯ�Z�Hxڜ�����Ї�\26Cq���(&�L�t�6Z-
���6{����2�^wW5��3?&���p�����8�"yv�v�E;o>"������;�y�<��V^.*����1�G�G� �Ku7���b^���ӕ��>{9�9xgo!U�碡����K�/n+F�Ox�go��\���9`�|o��N�f1�X�@
Bg{@��]9����Bܜ��z�)~7��nk��S�KѢ����|_�Y�e��>�:�%�3ǟ1���Y�m���^#�����l���7@���~=���꥟2�+o#���sX�R�t�/���-�1�wG�tx
~���_*��-q���.z.���hĸ����I���0[�U��h�����cz~��s��^�7��^��>�����W<�zVm&(a<ܮ��el	�ʾ_�)<d �"�������"�2�\��W����ް�V�¨>��<n�B�9s}��;���y�����v/K��H��8X[碫�T��w�L Hډ�5m��^|�@X�)���gW��s�� !EPJS-A���ExV�������-s�!GдTd��k��3x������0����7*��窝�	��&�^����4�wo&t���J��[y��<Z��8����Zqe�n�>����.���\M��U���hx�[$���.�Mt%
0f��n7Je���G��d�����1=�.�}5��p�Cm�0���H5ÙEc���e��g���/�ൈ6�N9�W�~��n�n����I�R��L���燳��O�BV�M-u���}��K`k��Gڟ���!��J����.��ϝp�#ZM	;D��v�mvY�5}c�޵��Z����Ӆ�k�+�Yb��f�PE?����I^-k�RG�x+#1ck5��0Vu���zIa���3uq�O�jVN��-SV��χ5F����}g�N�Z>A�������`�̐���g<���;��<��:�r[�<oE0�ӟ�%�{�k���c%��b[cb���6�np�-X�Y�Kh17�(�\nO�ڧ]�����QW�s��%*tc��i�:Y�}%���"-9W��$\��U!o`��B��4��ܷ�l��Fj�=9�S�rv�h�|�oUկ�f���uqQ�F���s8�
��9��g~�^��r���N��J�	���������::'b\N������r�K��z�i]�a�1����6Ro����Fr*w�{V�ҊU�˽ �L_�-p�w0�T�-C���ԩ[q>3b���5�=��b��U۹�Y���������*�����Q��sc���j��͓,��k4�����g`�:��ñ����{��x���ɏwv����t7�0���$���*r�mYo8Û�VΖ&�X��)��\`s��eya�p�n�T�שFm��#`0��6������!w�.�kԸF����!�Ʃ݋:�v�P��k�x��y��j�T��.F�*�$�����!��\���$k35RN�MZ-��)��WO��nد�����.������v����RJ��S�1�\yq(�2�+0M�D��w%��W4@De�EF>�UHS����Q���U�ˢ�Q��������-�U��)�e��$�M�
b�1F�x��0F*#�+!P<M8B?�{)e<O@�C)Ix�!�p�}]��&����a>�802�ȐJD!�A~�?A���_qa!� a������/h"���D��s2�~W�&'�`MA�)���bS���N¹��[���3B'�5�y���N��?ܦh�š�^�}Qq?p�J��4	�cd]{�L�β�k;J���9�w�v�ɩ�ڵq>sU�,�	��2]�~]d�j+��]o�}}�ٗ&-� k	  �qw�J��D�b��f0�^�e�@��-��3�{6��S���;�Y�M�"�ų���%Ɇs�'\�[�����e.�}3����))�u��6u(�Gx���ꦋKHlV�f����r�f�~�d�`l��8���ź|�_���*���,(�}���8���c�Q����\�=ګY܍�2�FW�K��b]��6Ԑ$�F���1/��[�e�����vǛ���k=�J�W������$Ij�_�c`OVv�-;�zM��v��
��
���P�Կ:��c�r/�: ��9�K��e��I��1��-��̭���c��j��wO	GŅ<�f=�Y X�0�\)Q�C���N<���HL�i���ć�t����7Omy���R��TV�͢�9w'�D��j����� �+�\�~A^�R1?��_�!Håݭ��,�[j���onҴ?�;-<鏖lߕP�Qі����C/��a�8��~We3�$|\9�:c���7��u�s��fܚ�{�W�������
&gN��"�>���Y麈���8��E��Z�EӘi��Kg�ܢ�<��ق1&�	"RI���'j5ȢV5�hXd�͓4I�/��n�r�%��}&�?/�iN�ƥ�(�(���{��������.fLei0%���;��vvtvV �u��� ��8�	�[o�_����N��E.<��	�Y9�ۼ��j!M�ۯ����}�&��8@m�*������^>�|n5P	[ZU��Z�Eϔ��*��##�X�B����n���~�'�Y������ܡFɶ3�-3^�3����y5���9u��]��TkS��o�l�J�pR�ఝ��4Q����G��3:ֺ�xcpj�N}J'���c-�l�K���K�b1n�� ��䧋3�6���,[�̘���RJ�{�v��wݱ�>%�s�F�·c��eX��ٍ_U��t�΍�}��X�U�^���&U�#F���Z�%�Wu�K���Q�[���6���Y1��uux� �xJ�xuK�
R{U9�lR��;x��9�B�|��������y�o��V��J ��h�@��~%"p��@pG,�wvr$�@��Bꐅv>ƙ��F�*%�(��b�m!��Fk��;�����}�N�dNΚ�i����^9�B��n�,�N0�e�.י�wb��\�g��al�m{��?��l����%[���M�ڕ�/���iT�m���u��hWok3^fx�<����d���&�kӳ�y���Q��xu��ҙ'q�\ƓM���py��؇f��>���k��w�it�&vg��gf�`OǞ�k:��M����'�S�cu�o�b�L_��x����YsT��ӕ�\����V���/1���Z?�����,�|�0v���맼yM[�DuR����p���kզ�!x�%]&Ezl�5�ͦ��EQ�w������Ӗ{ٻ�f/�XE����V�uދ���[�kMP_�X���vz'myZ���[������L����i��̫��huJ�W�^�=�|&�����0:Re��Z�:^���"8��m�&��W/7)I/��x�/���x����}:eB�Jr��:�,��:[t��< H��pPQ>���i0U8(�Z/HS^��Y����>�T��"Ii�>��)N%�wNTYHh
9>��Q����8�$�(�F �%I�~�]T?�N���x)��H���XUQ��7�jS��\g��F�
��"'21��RV�����;�A�JL?+K����<G�$᥄H��"���A �/�H�y@Hu��&2�@?�d� ��/s�02�B��NAƚF�"�Fa5H?[�g���TA�و
!�?|��dF٠�1���E�qF^�R���Sֱ��9~�pD�q{�c��9�5�3� @�~���.4���(`���>k�������#��&����~M��
���?��R�9�"*	H��¿�~9 -Qe�Â�Y~���.���
*V�$��.��S:����BH7K��`>arP���,*8�q>�w�?�2@��~V�Y4 F�?[�RHX@K����;oc�l#};�G��T��W�	'�-4$ 
�/"�KY!����>�"3ϑT&�*$��d9�·�X�a)1��x�gk6Ne�2-�����^�ɩ��2��$�t���h,˓�a�@QH)'������0�E%NN�����"^���cjs3^�8U?����`i��)E?������J��\�5(��>f��ʬ�$���"�CE��R	RI����O��1�	��G�V�p���WYQ@^EϋL^��Ă�@vQX�5��y��DR��~���go�5�,�ҳ�L H~���A��XT"�cF ��٭�Y��H������z�E����ׯ�/mdZ      a   �  x��Xˑ��
[O��_~ �\���W߉����q�<�$���R7��1�I��!i9XF���g�����F�ơ���:O���/���\+6][N,*dՔzpg�:��k7A�fB����t�V��O�1'ۧΈE�E{:1�Z�����no�Tv����6�u��nE&�R�x�S�>�v��H�]rf'QTgsΕ��l�}_���H�B[���� <�[��m����Ή�7�`�@���5����V���ѝ�Hm&�B�O���5L�1'=}�ٹPs���,�6:��H"屸hp2����nt����o{�4G��FP�_u��C3��sX�ǎ{Hm��fg@��N�s��'�鱺Z9��A�'�P�};�{���qvG���T��	��<y�/?"s���ol��:�t�%լ)�,��H�lC>��a��v�&}Oa7y�SN[K:-S<�Ȱ��xӻ��{Y��^���O����{P�p:v�G���1�V�J���َDڦ<����_��b�o`
ؚ�H޽��L���9�vG[�����Z��Gc7S.i�N|�-��DKxF����ΝbV$��rĜ�T��ڼZ���r�D���}�������R���@|S�m�Oh���;Px�#��b�̂r.H]IP�.6u�U�i�X�;b�i�E;m�A'Jp�*��v�w��/t �$o�>5����?n��о7v�`|�A�5�Ƞ-�ǣ�����#��8�\Ɏ��g�s���w�a�'��P����@���Z��+ʋ�ZNR�Lk`�u^y���. �+��lP��%`�)�^�Κ��ʮ�6B|�$��9�Qu�#�1�:h
ȄO<�(ts�>{�8֣T�?!g��\τ�����9�rkђ�x~ԑ���뀜C��Q��@Y�+I���Kg�އq�+{��8P�s� +����wjf7���@������{a�0����2;~�[������� E���l(Kܻ�6�7r���/�؛��v|�}=�dr�
CM�y�罀���.�J��G'SȾ�	���)�=��j��/��֧�HO9�P�[�B&��\����;b&�����Psln}��s�{��@扅\f��"q���(ɖO���c!$��I��p�0L�}W�96�Z��4�"%��̶).LL�}�g{k�Qo�z���VRퟧ[�c:���n���E:����9
��vH�����E�����z�1�y�t> ������:��A�ť���#��)�i���(��� �n~x���0C�-]���"�����k�d�tnN�|Cup��E
�;;.�Z��[@Z_��jEjZ��'h9�}��߿�sb���Z�>�G�T`nX�AC���5�R�[�����ǽ�����:^��1�����3Q (/�5x�/\t�gASp�}�W8����f�s��O\8���G�	� ��~L�_0��X�x�4 �bm�Hc1�7�*��Hq�P�aҼ���g�O�c켤�"��y��K���^H�qv/}j'pX|����0���,�s���<���Y�������Mp�&^��W����l/�� �a	��^���vu�_Á1��3�#`��Sķ�T�X��z`OW�A�>5o���t�ԫ`6ПG�:���Ϻ��
���6������=�ȴٹ��x?}?��yEd�z��rq�3 �A-��0��}�d���������?WϘ�      b   $  x�u��n�0D��gxMh����E[���Dê*,��TΣ�	Ŀ�fߕ5G3���B�%�F	Iu$�$�10�N���=hE��N2M�1D\b7TF��Q��+` #&��$~~F�0{���3X.�V�l��07���s�BO�*}LN�$�{�s>434B�0֭�d~+���w�gO�]��>?f�!�,m���,E'*eUף��rq��/_p4uu�7]i��YE�75��qݿ�:��~!��f�*U5��g�{b���>n�T��x�:�1ʔ}u�h㎃8\��0��(t�      c      x��}{s���ߓO������ԭ�,Q6cIT(�޽u�Txڌ%Q���8��4f(� �E���[g��Db0���h �-��g��z�q�������3������ŗ���"���᭛�����`tv�_��3���~	��/�����\>@x@�O����?s�V��*p1�yxx9��"b��,��Dp,cXE���[���^����3s��������`:�]�.O�W�����/?�?px2�Mۿ��^\@��Z��kl:>=_����V���8:8�h���ۢ�ﳂ�%�-N���
k�)��	�Nhޒ�k�R)N&�&g 8E���b��A�c��5�3@n��?�$���w��l9��k�&����/�F�1#=�\)�p�Gf�f��ᡓY�j\^'=�r0�NF�`�J�<���Q4�`���o�~t1�����׏7�U�~b*���b�M�	��*&�d�RR%��!��Nc���bn��%��귒��ě��t����_����7Uˤ��_:�'�Jzw?������t�(|��_%�
���	�5!�:ObV� �Pb?�ԙ����t|8>�:�Nz6�:���7����^2���}�İV�X���Q˝�JGDX�;��FK�
�MP�C\X���zO��I��0�D
�:���&kJ�ȭu1%>RE��i&5u�G�����U�:;�遗�FG���:ߋ���Q�����B��"o���V�FDoB�T�(���h���EH�C������>}ڼ0�S�X�W'���;iF�[�QY8�:j����w����/?m�E��-��X@�f:c�.�J(V\S��7��'�Q[#���=�«dG�M��]c�NG�Jȶ�k��h.��Ø���c��C;����,~.��.��ˋn���#Ɲ%Sg�ۥC1b΂� 3�(%��b-&�1�=g�"���N�t�v�H>c��Y�+M��y����!���B`�%S4�?�$�_������n~d�X�k��D�g!�@�̃b3%D�LRR�l�b-B/ɛNN7��򫧬�RuM�sG������sxj�.x��bvc�?��?�������n��������yxQz���#Yʷ��-�>�D��WM�������s�d��1�D�""�6gRo�2�7��$�J
�=n��)�B��3Ą�.JwF��-�b~�[��Ki��Թ��><i�FG7fF�86�����v�S6�JR�,��{�V!KZ!��Tp�}�E��{��1L���m�Hu��� !�V	>��<�vFaj��*4�ß���������_���t(���dD��9��Ԭ�{��tx�n8��0j|{i�����S�	յpn2����V ��J�T�l�d��u�8-�QP ���HA��<xR�zjhiMNO���'�,_k�#�����p|�"�d.��g��ׇϦ��s�w���Ѫy��}�K6�#�n	�\�W�"�{�ĜZ2�@��X��
���y�y�~�d��*}'�Ǔ����*}�k2�Q��*c]�N=#�j��(�h�Ux���!��#���?r[��^,�I^�,���*���B��)���d�uԣ�A)�I�� ��A3'���of�����}ޓs�~�1�x�0�9,Y���[!����Q�`�4�	��j��7�@lD���J� �3�},n�~��3�~����d�)�Q@o6	ly�����p������8-�7�{��fr+�0B I� ��2JR��B)-F�P����N���c�U#8b�ӂ���:�]B�� ���'�I	h�y%<ZB�ѭ��i�~.���U\0<=��YG��zr���Ս>�lcOK���U�m��p�5����������P��� �,�a�B�E�(������`�v�B&�_N�'�*��/q|0�x�����쟏!s�Yw��.�t*�����w�X}��Dk߽h�*��+$�v������İ�`O��1kR�F�[��4"
,F�:��u>��^uAR��Z5W|��(�>-HY�T�QQ�#�d8%��	�ՠz�&�@����c�D��G�d�D�[&mI֭�k-��h��b���t�Iˋ�H��JFSJ
�EG�Q�����G��GD!2*�ヴ�uv�Z��]��O@��]ᧃ��a���a��Պ���zy�k�%���)i]9�J0��>s�f�!!�0R"Cʙ�MÜr�@�����W�3oZzkK���y�O.���#�i�d�Z9%�ks\�SôY�L0��h��Lj�w�2" �	 '�l�w�u��*ҺZ�5�B4��d�J�����,:�:�a�)�8�y�����ꭳ�����37�a0_w��7׷f1���ˌ.e��J�q��`Q��G�p�F!�B<?^NF穴d��~�TtYZ||2��Ʒ�^62'[�P���v�=�2Q=|�������@Z��<Om{	�0��
G�L��3�s���ڤ��g|� ܘ������n�x(��o��������-��J�a�/���H�� 7�
�������7�5���S@�_�ǻA�>53��͂$�sR���G�Do�A������Wg��,ʗ`:��
�����X%���9K�1�^���T)i����n+��k{�@[#Z���fq��ɴ���9΢��z������D ��ٿ:�&�}��5�C��IS����2��"�(�h1�C�w�񷦻���-?���F�=<�܏��o����'B!.�+�Zs\�|Q���#K���k	v�)B��~ץUVHKt]��w�^B����-�����<���m܇����l_)�$ +2�GJ�$�Z��+�j�`�K1��>�;��􇾥�j.
��ZmS�G�*£2�2ƢQ���lU�R�@��?�9k�W�z�r��Qv�Z��i�U�@�G�X^7����;�\ �������.@DT'��`�G���q���~��pi.,~Xz�m9���Y<��˵�u>��@Pw�����,XTPa�Р��8��PԂ1#�aY�	�i��w�����J^r����6�?�� ��[�Tߢ-2	KarS�p@��E���Eڎ^��]�W%����l�6bT/-�[Ǒc�`�xC�S�Q�;��O���G����C�/�w�{[w/J��a��ߣ�}k�R���yb9��K�!�����s�N�����j��*����1�=�]Κ�҆����3#����,��f� ⯃���p;�1��O�Ï�"n�lY��Vp0JaǄ��Pm��R� �+��r4=<qsn�#
	\�,�� VU���%�y/�㄃W��Pʽ-�����8��ؼ���o����"�m��+�j74bي�h/�.)�8Ae��2��6-��&���"+1kY2?�|YyS�o,�4���k�X[%k��jr�K'ϫ/�IAm�[6o� �V�,�FXK��!Za��V��'&�������s:i��([����.x0�Hh��y��:* )E%uF��k����\����曹���K*-��,ƀ�*"��D�G��Tb"Ll�2�JD��+��&b-	+�����<�,�l����c����>��j0��(mJ)�w������N����u���e~��.��g0ˏӃw'����!�� B�AG+��6'a�jfx4��B�L��}O�=[)!j_�	,W�r�O�T��v8E��KRU�1"VRףR�o/?_~:�b|6}q�a��T]?O�K��v�u��y���j�����ɉs��q�%���J>k\�Ygm����4��bG<�m#B��R^=*�ˢ߬���cJ�-�fկ��:�������F�Uܵ�1������=��5�Dv
L�B��� ķ-�z~�QZiE����k�@/�2|��	­!62E��`U���]�'�W�����t����ik���k�i�Nm�'�c��χ?��g�����am#�t�}���G�%����B���`�!�2*:�6N�h�w�    �sk�!���Z����70�b��(���'��]q������b��H�*Y�,�a�P
�&R�K�ƀ��!�@� �tM����bk������θ�]��6���R��oW����z���#Ӛ��S�����"�w��� �a��p��۲$ ��)�Ć��kF3�u�t�rL�ߌ7_g�yw����%),4#��B#15` (�ԪȵrZ����|������֫���r~�J2K�*/��c[�ֶ*��B�)�EL�Xc�0Db͓��1�@�"���^E����[�����)��b��5rJy�"a����XWsvN�d߆,��egh�A�
:Yh�a�1�9+U�{����Ρ&���5��yz����i��i��=Uk��&�Xg��s��.�����ۅ��g:�J�3��EiA:yԎy!����9����%aWf5ϖ��儺��r���<�NW�U�1�!�y�]��&[�f�D� ɽg���e��F&4�"��(r�2&����"��=&W���>	0����u2b*C��F)�upl�����C�">�:���˓���Z��`N>t�еd���}�<h!G3O*�=�T6����Y��$)�8)��>�)�)�����/�<f\��ղ�������W'�����AL�U��ts�\�4Rw�#0[�d��崵�@O�
����lMU�kaL2�D���AZ��
M��.�� -�}b�V�TI�2��2 ����a`�b�}�V4i�U!3�j��x����c�U*$S�*lC��ھ����~[�+�K��F9|b��e}{�*�>("-��b�Dȓ��4"
��Ք�@eMB���t���>[�"��ʀ
�+�^���ȉ(�9�N��w@q*Z����$�������~خ�ⴐY@ <u� FE'�[�	BJ�� (�z|����l�osZeGۣG�����k�<NF��<�y��J��˯W�z��y0_�7	�&%�qB_R�+v�`%\����2�K�qHQ��c�q����ϏR�z���Z�+�u���~?���k��w������8.dC�����fAQC-�"Y�@}��O6�XƬ�H�0x���q�X:���6��>�N�$0�������4��C+� ���)�~�����I�����k�n�Js�fc%�'�<I�~�opX`K��~��*2BDE2/k��an�bY��. �"�9�Tl�q�]ܬ���*�y�W�F��
�����ܒo��*�����2J�d3�!�}��0)T�iI��X��<B��s���\�*�J�����n	���t���rx1}U�}d�S�2(���a���o��\ͺ�J�G���;��Ǡ��H,(D'�	��Ƨ��L�my�:A�tx5M�V�׽�δ�;He�Z	O�e)�O#I���� ��88h/O���s�H�O��-(�
'vf�H*_U����A�f#�
����9�Fv���I}I�>yPg�vg�ԴPY`�{�GY3�ïaDs-�*T�H���{b(r���0鄏�n��W����s�����Y�	O���B̫�K�N%��{�ɔ� ܥ2���Y�����H (��1�������<��`���|�]�G�j�{�ǿ}�!9D����O���|�Ym3%�
��Zda���H�dD�Gİ��(.���YD�V�ݨ����X~�t�^�,
����|~$?����و~@���߆�_T9��3�s��솉u}3��;s=��y��o�4�]^Z	�٢H��X�u�#�"���T!�ac�C������d�Wn[�&Z���W��b~��n�lTKޢP�b�Q�[�Tq�E鐻hy:#�˶]���ied<%�v'�sQ�l�AH�(a�GsM�5X���G	�����v�CK�iֲ]����P��L��L:���c���i*�сkV�!�D��G��0]\�O�0�ݎ��뒖�I��d��xm�G^3�Λ��y��tӘ�m_�ĹZ\Y��]Z�Tz]UJ�?��}�G�?j�AwA�}]WJ�5�>��YJ��̮�c� ��0(:��i���:j��]��s*�W�ۼ�����]<���EY�g�v{ދ�ٓ�1
H#έ�[fiP�)��Ĺ�sE��k���xg�)�b�Nb
�Mgg�*�%��#�#��V��3��1կ����s]�7{�+�bz�;�.��{�q�޴�g����TЮ��R��h�)�E^|,}�uie�Z$����ۦ�V
��S����+��?��\K����V����l����������.0���m�*�;�4D�:���V	������?m0��m�1�mV���vdR�s�y��Ʊ�m���.=�z��"����N�h���wH�3�f�p$B�X)�%Ԙ�ʷ�����ȹ�q�d-�`�=1���\Sp:K�3k 6
X$��8#g8>�UYr�qX��}��|y@߮,�\`�K�� ���v锣1��N��|~��K.<��������*O��Q��߂B����^��<�+h���8��b`�u�Ǉ>��nh��`��U)��}2�RFj�6�pj��O$s]���T'vll0��V� 3Qr���\��a`�	;��8����,�O�(v>�ш�dq*�[R���f3�]t^=�2d�H�]ꥑ��Zmג��Z�u�V
e�o�dU��j�:k����<�9Vb��̳�`�2��a=��L����ΐ�*��\��H��`����+�dKFIby��+��I:�#r�u�Si�tt8L�˥2��Õ�I���00����q�i����b! �*��4ʐ7I��{����wǰo�|}���g�w����!V�4?}
���6�3M$��'�"$1�� . l��GDj�_�b��O�oԅuٹ��QY;�R��v���� 83�n�β�i!&���2^��r.]x
oq|6��J�`[ ��摃3)��<F������2�4Xpa���my���B���o}:i'�����դ�Fq�q���	�X�5���h��5V��)�NVp�@�i��xI��G �-���"ę�*�l�}Á%Y��y��'��)�����L��W�j��zE1�g�S���44�m�\��%�V��S�n��Ok�8ݯ�g��w��X�F
 V~S4�2(�,'�/B
���E�%��~����]�j���k�Cm[�v2~?:ܭ��x��qz.Uֶt؛�=�|��=)�x����P�G0Ii��!�PR�I��]�ۜ!��Ɲ���*a��ޚ����eVw$O*�"!r�vU�1�mK謼E�����Ĵ��"g��i=�y��Xe�39����|���0���f#�'^Z�yp��`�$bƣ��ls�]�m�#~ ��k�x�5�W�����8栭��ۨ�&�����A����}�o�h��5m<�ϴ�m/�K���l�_��Yp$���(jA�("C����3�l���*�e��g0x"��&C�ǹ4 �u)숌q�Nk]}:`����}u�g>�� ��}/��BM�d/l���:��`���.�h�x��[�����G� �V�x	��VZ���K���Zů��Y�-B���I0����A�;ʠg,X��<�]�VJ���$O�*�����-v!
K9�Q�%�;����2 �����u��3�a��T��A�¨rA/:@�۸ȧ�j!w��6
0�Ȃ�߳�>q`+%m�9��w����3H��&�^�n��d����'�3���o���r�n���Fsk=�K����n�s�����/s������,�@@��U� [!�VX1��;R��K���4=� A�9ck^,�?��W|	~�a4:���W�2�A8Bt�<�1x�R!���Il��lY���}��.� [���:� )M��}�>�(�� ;�f�++H{��1��Q"����\�L������`!��QE��!�T� 4�ep�
!��þ*>Z�����(.10"�yr�A�������r0�&��NFlU��-�����?�w']s�H�6�Y��
3EX��#���|� �  ������>����vQR�o�/8��|�׺)���tc��.�@Q��!j�.�������/��L7`yA͖˹S\k�jF� sH0��+�a��x�����t�b��76��7���h|z0j������
h����W	��*�r�9"U��Bm��Fj����橜?�@�~�.��OxMgß���Y}]��M��i��Q���-�f�������_(�Fh)�!�K��3��Hs06���j�, {��k��=	�[�������w���w�3�+����\�L(ڹ	fI2��A`��wc�Xp�^���Qh���?p���Y�'��Z�p2:����=ߗ��M���QRN�_�� h��W(Db\`Qi��j��p6��]���]�]?xs���y�����']��6*ӅN�e!��q���(@Z��������i�\�N��uc�C �1�	7B����Մj)��|� � .pE��S��b��0��'[iЫ��Ƌ�:eihץ3/m7�m����ޜT�3���R���[�v��꒳�	��҂���)���*�&0�a<����A�@��j
?���t�vj�J'ܑ�)���<���$�;N����l��"_%q�������
�����u,Xθ���N�bf=pB;��;�q~o+Ǒ���>j�����z��8�@��m���6�?::_�����.���r���YW/[pJ��T��o��}X*��vyB�ӵ�;K���e��iI��6	C3�s�~R�Zfbsn����=I�[�kSL�dW*
W����*_m*Xr"��v����]�i�ؕ��c�ޡ��OX:�$�rԅ`x�ePϙ��\����~A���RI{�//޺�L/ۏXM����3
Y�;%����A�g����c��D:
�,a���8����h����8���s7b@Y��װE˰�Hqn~ukV ��\rm�kj#��p�;�!�v�[����?��O�)Q�      d      x�3�L��".C8'F��� RKY      e   �  x��U�d9;w�m��\���D�����o��<�$KؖZ�8�(� 9f�הb�e�!t��%�� �0e��*Jڧ���5�l#�#�r�;��J7ZY���kŽ���"o�
v'7/Ƹ��ENk�n��Cg6�ۓ"6��ĉ�X3�u]Ԕ��/�	w��������0� 4�����{>{�q���0�4�*��`:
�z��CI��4i�Q�=5��.g���Y��@�%�����U�Q��,��/�yς$���L�j�ƕ��~�H9疾��ռ���8����ˇ�W�Z��~�b �Η��)��W��Y#��h^�S����Qy�uV���֨�[�_���Ӣ�;�r� �r�#�w"C�ӁU%��>޶1��ܝ�G,�3��[Mb�ٕR�k[�mGk|�NGo���
�a���&�F�bq�a��YM]}޹����8��X$���;��;Gr�{)콱cq����U���8��~����¹����ף�%�ٮ}�tzu�l�/�k��ct���{�U��Eڼ�O������;5%��:A��M����%m�^��4�A]�h��k��ΰp�ecq�W��^ݹ�ػ0{�*�d��g�}���%������p�-����iϙ��o��j��m���DW�ߣ[S�5����~��%�p      f      x������ � �      g      x������ � �      h      x������ � �      i      x������ � �      j      x������ � �      k      x������ � �      l      x������ � �      m      x������ � �      n      x������ � �      o      x������ � �      p      x������ � �      q      x������ � �      r      x������ � �      s      x������ � �      t      x������ � �      u      x������ � �      v      x������ � �      w   X  x��[�n�|��#�xi��?�/X`A6�a%ˑ�6��{������$�O��]]�C�5��l�Q��x��[)<GV���Wu�Pr��;.�9�i<+��.����{{se?���՝[��\������n����?��!xy�p���k�ُ��Gn��D�����?.��"i��]�>���]�؝� lB)K�	Eo�ݙ����?.^�� �Ѭ�n[G�d�E_\P�LCK��b��Ҝ�Ȏ0��3U�J��,���+`zui=�A��ykWgT��=g\G�z���D(�U�;��vi�~��??6�>{����H����8?sk������n??¾��\�%7E�gW�xGհ��O7���#[�C��O�G�B5D榮�!��H\.N)�AG��o/�?���Ќ�����K�,2���T�~9����w����7���o�� #�B(ե�0Y� �XY��Hl�,�}�����������ǵ�z��e�R
��c2��C2w�̈=�g�}�n�/�|�rtrk�!!�GE4Qdq�@F���?6N�5�G�y9:z�S��t�9*���v=������Ǡ?s����ST�(�nx�+h0����#��#���C��''.���i�)0�H.�i�C�$舃a�}��xD�)����Ypͺ�i�by/="����z��J�IZ�F�� �� ,�e�ѡ��ho������)�_��B*�zױ$�7�L����!��9�jx2��cǝ�U�g��笡�L���{���0:��ĵ��*���pC�!�}�6,��F`��������d"�=���FOk�1�wD�)���怺�p6�Hd9Oi�̚@Y!U_��̼��G��8�}ӧ-���&�(��ĮLJ���G�֝П�E���2\����sL�\�u�Ex��lm�������]]~���׋xx�ܥplV�W7����p2�l��H��q�d_)�O��.���D�˗�]D�7$��JrÖ%�06�A�%��#�P �w�/G'�I�D��j�F�D*�f�6�
:J��_�υ?h�^G�kǌ���zM���^3��'�|18y��L@�).އžK,��e��7�]��z=>~�^Ss�z�u:'���޹+I(�.��-�� 1&r���k��C���	�u���_B��߷���IKiU8�7g�	%�g����:;����'���������zK�ȡ12�t�+b}b�=��	^g�ٽ���~#���8��a����dUY��u�\��f�j��V�\����yiĢs�6p��1[u٪�S��_�8�n.X�̀���,/2P���&ll�����7����e6 �{����xE%�P�$V��7�!¼������zb,\�$�9h>����Vc��Z�s��,lܑX3:�#���e����F�F�̘��S��#(#�SOApt������G`mo����I'��u<pI�,9x���vG`�����Z�.��"�jDr��>x�Y����jo��>��@����)�$3Om@"G�����K-�e��X���d�Z�=�B\M9����[�,vM�j�1Gׅ_��Fsu������C��R2�0�C��P$�C��|f3��;��F��4�ꇋ�Ii��1��Cj���1��ko����k�e�˵��Q]!2y!�]kOho{���AjQu-Hp�T�M������bD��MP��2��dn�g�r:����[ӺC���w�X\<�HxF�j�w6�7�Q,�|�ÎҒ�\ 0"x*���{pB#xk���BQ-p�dZ�ͳ���C����=�$������"�;������	%��J��F��X�w��kE��V���p�)�_���/y����D\����!�1���Ẁ�k�x���`����Yk�!�:����j�k�(ז��N��u[����i��\nyY�<��:E��A�v����:v����z��NM]�k�_?)�P-�쿺�Sa�6,ߜ� a8��
Roev�e�y��n�T�!̬��zX��jK��m�v�����֩�{��z�*߲���+S(��9��=n����Bgsi�N� �%���<Ȇ�>D?v[�.#�:87Ak�R�_�4�ʜ�c�R۹�︭sI3�t��u�&-��Xܠ�"����;��u*tk�������-
�q���Q�4�_�cп�N���Mݬ�YE@VO��5��e�	�u[�)�dE��tMY��Ֆ�b�!5э���m���	e�'�K6���ť���bƵ���m����
T��i=��[6sD��Ya�Υ|�m�K�(�U*�H�.��5׳�����^*���:�L%qZ'���$��P�����V/��7�ֹ�oһ�g[.w��������|2͇����Д�7W�캐kiL�:�P�sZ��.�EQ�e��#\C���̸7-y�t�f�M�v�qS����;p��t!��������c7��g-i��u�u=e�OgXC�b%����w�ݜ��Eo.�����I˫N���� �ѱ�s�	9�5��\^�9�(�c�:e���nN���l$��E8h�G)��������ݜ
��')��@XQt�	^ ���	v��οu��T��3+ᒾ��q_�kC���;���~p��T�EH��q]]e?�H�
�	�x��;��'�_��O0��^M���U'����5+��n{��n��b)��VM�ep͒��ܻQ/"����k!�6z�q�
T)
�>4����ց�M�7}��s:y���c���W�lXι�u�lי���q��b��QEG^�1�a�W+!JS3���6������\��      x   %   x�+6�˯�42�3�3�447�0�4456����� h��      y   �  x���Q��0ǟ����&m�&}D9P<w9��d'S[h��ɞ��ݝ�(ȁ�������L��p+��g�9ɌQ��)��&SB9��b�/k&YάR׀ݾ��D]a�R6{��1�1���M8�A�g������Bכe�t�ҡ)�1��Sc�)�a.&.Ic� �Ƽy�apNW����t��E��8�g?���-	��D�ߝ]��h�M�R�G
�x�#[;'�\�LLPz�j�w��Wl�_�ٕJ_��a}��Jq�����=3�Z3�=T����'ô�7��#.��i�8F\v#��^n�i��?�AcJ�c-�6�ؾ��Io�� �ZX���V�=�m�j���OjhO��{`����O��ݾ�^���Y�l���9描م���/�7��O���      z   �  x�M�]��0���g�ښ��@M�b�0
�I��RZ�!���o��d������}��-ǐj�C*���l()cL"�Y9c�h����̄�f�hH��j�(�r������CmH%F�s��e{ڥ����9f�[Ⱥ��y��j[0�%�� �>�n�n_�Ʃu,r(��Q�θ'U�*S�X���V�AۉS�L����i��_�훿F�6��|Ӥ�a#����$<H;.�E�܂s<۝��
�K�=�0I��n���r�A�o�jq���;+'(�KT�8*e��BVܖdqʺ���*]�Mt���L����jݤd������*Aˤ\��e}1Z�����&W���$9菗���|6�΂�b�!��:v�]}j��9�'p�l �9�k�!�Cʱ9�f<�i���(�&6��� �'�ΐ�t<�߶A��I,��z��N2��      {      x������ � �      |      x������ � �      }      x������ � �      ~   �
  x��Ymnc��m�"ЃDI������)QS�9q��)�տ�L�N�i뉛 @웫s%�|��lRӐ�bJ�p.A�fp�E�g�N}�'~��ϗ�g?\��4ø<<�x9\Ns��/
�]���џ��<FYA�)�����Z��F�ڦ~��H�5�L�gR �cįք�Q�v8_������?�_�����<�������ZÚ�BI>B��Ԛ#_��W��[���}�t�!�H�������w�����Y��o?��,��~_��)綴���g(#Y�z�*k���E���j*@�=�޼�%%C��O�p�U_N������p���O�?���@ý�́
v��(���B�S�yD_GkS�7��U@�@��ǰ�Gf3����|�������m��~�v�BiI���3��=b�Fa�9�#�I���@��YP���|���rXz:��׫���_�c�чF�g��Y���!&�c�BY����?|(�9���r�SQ�P2sa;�p�^p�t�?͉
�Hk�e�[y�J���tǴ��{)�����G�0��E[ �J� �31qK,������H-	���C��]�l��(A��ǧ�:}?+]��&���{����=H��lU�Q���i��>}�6�HY�� B�yc���g2���ݞO/��'ꟙAdMꥂ��h����'���A�>
u�%d��q�3���Ɩz����^~��qQ��$1���3<�,ZԺ����ï�?=��G��6��D?$(J���&�4R��kB�{��j��(�)=�I������%L.�,vx}�G1����v�g#g�pD���G0�8`�<�����@��C#	Ǽn���ß%nc����#*a4
V
��r:t��� U|Ap�ٟN������ ���E2rvb��I`�4t���9���	���m�廯֭ш�+�7*��8�",��4�֤�5���� \�ssX���T�`���O艻����qsx�%�
P���Srlz�ƞ��ELjh���C(�ˬt�&��O@�=�w#�!��[=s�5��B�W�)wiQMO����mc�},�x����H�2�5)i����Y�&V����=��CF��n���I5L8����g�����|��]P�=+���2]`��`�����
mP�-�\��ViH+RbW���y6|])G����38{wy:}:=�E�|�.�v�WXdƽ���h���"�,�c�9g�tdv_�SU`?'2A�-Ae[QW�M*����Z3ְ��,��]��S�>�7z_�J=3lJ'�O�Zz�A3Ҁ�UzG��������]Ez���T�Y��lelv���)W?�x�;_����ۤ�+����R� ̙V܂�w�Րt)��x�~��	f!U�� (8�ľ3p5���_Ncx����_����SKt%PAj;K��d�WO
v�=��/*��5�,!��D�V��W:<��7���]o���P�U�!��l⹗�\P���Z���0$�#RJh/�6����� ��1պg���c�0B;Ąrġ��F�g���`{���у 9���,�tjHط�Y�u'�L[����v�&G�����j˞5X���n��H�@��M�f/� j�*��W�K|�,"ZaH�
�cSb. �b�M{��q��'@����@�F�P#�PU�{�,\5�V�L� ����\:Y�!��Z[�	atX�R;꣢>�~��Ų7�qq�
D�.r�D:HB��Vֈpa��Y�U0���T���yaA�L���5rM7�"��!I�B�P�,_�AS�� �E1��-���@���L4D��;�:~E�h���|�,�J5�k��*-������R������Y�Ub�9FG�=��m�Ē�e�3�0��
�*�	��CaxLa� ��T�|�,⺪ؑ"�d��Z�{BV�H]�*��:�?���(�,S���Y�4FU�"#�65�M����Z���@�ᤵ8�O����s�[fW�ࡹ����M�,&����y�,�*���G'0�Q���?]����Y�u"6Eؒ��|.j9xiK�R���w��ݐ-�^lo�8C[ �0��� ~�����|ݠ��a�	��<vBĹyq�QuV�l�p�Z#/���� 6�����U}9\)\��	DB����`��e�:V$��.VAK�D)�TB2�結-��:�X�s�	�S�p@|�i�/�D K��(�1������-�isjO�G���"�B�O)���3�����a%l�#�U�[gkƈ���~��ۋ�4j��l���<5Q�P��D� dqF���gWA�TF��)�-ge�z��q,�f�8n�E\��VմR��(�4B4�oOq���fVg��]��a�!+��8+�9:�K��f��"�W�=Ml :��4�;g�x�X�~Bl[`�(W�[�c����8��m��1l		�SJ�Y�UZT���
�2�T@Ip����L�?�h���&y��5KFa�("5�	v<���	�*y������a��w���Y7��D��cIk�x�V� ��c��h͐T��w&����_�w]ȓH�Ԯ�E\�^!U<ľ��7+��Xn�B��7f95��!�2�*�Ww�'���-PW_�5T����(�R{�ő��jV�f�84]x΄��'�pMY�(�ʘ{�������lx�         �  x��\�n$��]w��!��Xڀ�{�{��d�=u]�J�1Ɔ�ݑ�AI�f7 @%���y�d#R��؋5Pp�(])���ll5)�/��k�r8]/��ޮ����z�G?=�c9<}5b�ח~9��y~<�r�N�P��ˡ�^�ĕ�Sri������x8�'�ؿ��N߾����������Xj?~5�d�!�W~�ӽB.ڃ��8\�ؿ�r|�_^~�2��ˡ}��v����S���>��ÿ�4�νAPс�C](�01U��.jkB�9�	%���|��㔚Џ;E3SjN�ͤ�I�u���
���z���R�޹jl�rJ��:%�?���r��O�ǝ�����$��>�ԜI��U��KAC�h�E_C���-���O"x=\�?b��951 ܩ�qjR�W"�W�f糆��b3:���gz�M�VܦWb�+	�X^����Y%׏;EsVI��<�??.�3K��͊����+F��Ɛ��Bm쨫�ܪ��Y"�?{}9�?V�q�fƫ)�7>�p�O96�&(ZGp]��VpI�1����I�c�	��S2cӌ��D0ޥjm�h4H�&-�e���S9��G�rI���$��>/�=���Ѩ��NՌQ3����,�xf���U�r����I�0�eC��s�V�%�N w������n�-�+��G0!�������%�yb��	��S�޻�|�_.4I;U%���ZK��=$K�n�8�J�0:c���L��z&��Å��&�;U3����?��]H%��faU&�l`$��a��d��US�����"�`���/�q�߫'��N͌US�o|�V|j��-x,�B2Jv��S�B栭��I���$�?��{�&F�;esV�E�=V",oWG�aܰ�Dv�i����+}dZ�L+��]"��~�~�hՄz�)��jF��K"��hp�` ��\���N@�U�מܦKr�%�th�ࢋ	��S4�Ӝ��D���tTl�@��\m�`@	iӞB��f�C��W=$��Tǿz:�?���ʹ�X��O�
�-�H��|>�r�;M�_6.�~g}�dm�j<R�cmt�y ���$������N��1�\��)���[�M�dm_�N�ɐ}Q@gͭc�*~�^c��M��~ �i�W2��,�|,���$��k9>�3~\Sn~4���B$����G�?��!8�K�Fw�㥿:qi.�����׻����_��&�R���4W�Ѕ�Z]*!�ѻ�L��|�/�?�x>�?�>�~Y[�'��;�s� b���7�� bY�f�R�L��S�B�À�k����gr>�o,���C���� K����Z0�г�1,�=�ե:Cf[5 ��m�Q�Z6��O����r|�D������j\_��r|z�}�y��/�X9���G-�-����b������C���\6�M�8*.����)J�ʷԷ5r�[�E(�m�����_ί��5�w�n�C?]��{�E���%�:\�`�/�S�U�*z}3%��#9W��_��y��H��GM�st��c��_�|�[_;\�Џ;E�k�ϧw5o	f%>�5x��N �B�蠏�#������9nQ�yD'�N�\�)��_��=�"�J7B�h��
�k� wX���"PkU9�����r=Q�窇��R/hj�9Y�	}int�~��_����������"Yԟ�K+��`�M΁;�{�^^�?>^�O�DH�xkF��h#p���k[Ft٦���:/���z��+�����96Z}��-���!�\B����q�����|�VN��e��	x%vN&"=}�R���{���Xt ���W����W��~�RV�P���	+/�!��5�VBM��I%�`�~|��tB>���̫)�7SJ���rv�}GH�(�n6Bq!�P�I�b7�9���J:1 ܩ�sjN�W$1ʬ���������K��冶��u^��z%����N�ǝ��D��VRv����2�A+eJ=��T�n�l/Ս�z��a���綾�W�T&�;Us��7���+MڭX����:8�(���"�v����yL!��U	��'�P�;%si���LU[ɇ�vs�)��AM�m텖�\6����9��l	|�8aB?�͵gK����(�<��G�[ZF]�R�j6Z����^9Ǌg�J�ׄ���I��e���$��>�d���3�H���P���(i�Ԁv�N���$���jO w�f�����W[����K����6B��@�#(���5?�_~s�M�ZSф~�)��{��|�� ����c�:40�5pѪ��C�)���P�m:%������&�	��S2�ӄ�[�$��"Y�=i`��N9a�d:�D��Eo��9�. 	|��ub�S6W������Eؕ�Jӣ�d��Ja~o�J+S�+mKh�ӿ͊������%�N W�w6g%4KV:B-1@�h��4��L����%�'��N�{o�r��2AkL�~L����C��$�<Fc��Ζs�>I�k�`B?��5%��)	p�@sUh�Srm�P~Z�U��yH-���$p�}tB<�T̝���ޞ�IP+���w���
�R0�6�J��ͧI����"�ژ=1ܩ�{5E��m��W��/��P�O�(�2��}Ê��0DM����_	�fuR�!m���~%�ϛ~�7�c�T ���W|i��* o6�Rt��9��$��4S, M�o.l.(r~ї�M�C����-@����_���J�MS�<a���#6�7��r�)��?i�����=Ab�Lӯ�Re.���m �Q�C�tvu�!u1
B�L]��""�c&�W����@E��ͷ#`�ف����	�Mv���e9������/�s�E��;�E+=��5��ܒ7��G>)J�rޠ5j��O��P})zh*��t�8-��Sw&��W����w�uch%WK�2E����s���d�kl�w@��w�H�kU�	��S�޻���W�Y�NP�;�i���P��c���n���.�l�y�9n��Y&�N���$�7��`+SUr�AC�Ree�ʹ�2�$g���UNp�N Wk1֪3� ��R�&SҘʨ��[e6�Rr�t`l�nh�#ۥ��R�����ד��Ӯc�V�F΁;�{��v��\ҷr�TZβ��wFsC��rb`K��h����q�帥@^k��Wbg?҈��7˫�Yy����R��"=��K����O%p�7iB=�����o7T	�w��_�~�/ׇ��      �   	  x�����1��w1�'��-V�@@A����BB\�����(�XM�Rf_��ש]�:@�p���vEgޱ&��������y]K����v���i����O��߽+$��3޾�㕪W�)l8`5A��ӝ�?��e����?���r�q�Y�+6?�l���X`kW�ڷ�0��p����R����a�4��^�m�/��� �����S�y���C����;��!jV���{\��Zٓ���p��h�O��ڵ>I�oZ�H �t>��/X:3����!����s34�݀����N\�[ǁ�j��0�!�Ty���^Ib�F��x��7�}=�^ɕE��5g�°�M�ABXQ���ִD_Ɉo�g^����.�k��Z(�:��6^�����4��Ȉ<fr	_l'��'eK4""3$ӱ�bmؐi�f9#�uR{�}L�+�X���&#���$�1fz����M�/pMï�ˆ;�&i1��4qj�Vz��u���5*'G�� ��1$vw��Û���o��      �   f  x����r�8���OA�Mn�3�1�ʡ*ɐj�I��^lU�-�A�,1� ��+C2�pHZ����V�W�]�eZ��wc��'��Ei�f����-�8U�^K�� IX�X�l��0eq�� a�6��]�RH�Cp�A]��������+ih$���E��X�֨��QY�c�v�}�)k�0��$nC.4�~��^u������[��'A�U�Ѭv`P���7 �������EfׯV{:8���߃��Vֽ��EK >��*��L(6�"�9�C�T�z�!]�"���F�E�a�K&f9f�U�&�����ǜX8�)������^ͬO�Ko�����C8Q
ѓ�V���$W�����e�Z���i�xUW%s��(
J.y9+��q6�T#.�)�(�w1=�4�k�z���������qT�_PX����z�u	/���B�G�Feg2��vz���#��kcϴ��^�B��Q�Y'�n�0�w�0�,,�!v0�Y�(Ҙ97S��Ш��	����l)h�G9�ט c�?NX(�H���ɑ��<y�}^}<���?	r,`&쀏$Xw�b�\o��E����TQ.���:�,.y��*]Y�W/�ˢAq;�$Ij�Ol���4�I�a��v�&i�8�<�X��E֊i6K"m��"�,���͒8�6K���6KJ�m6KB��fi��m��;m���fI���,��͒(�l����҄��fIѻl���f=���`H��x$��`H�G��U���A~E�����i���\�nܭ�.~��c)��q��au\~���5hW�Q�um=A�Rp�٩����v�u�p5���a�9h[G�;Э���ZN�����<���T��9.+�Yy1�'��ښ�"��|s��g�n�[ظ�>���H�hx�n4�uf��?Q��ت$k�O��Y�ٷ��b��NϪ��7N�>d��o��}�t.\syo���_��?�O���7\��]d�Z�/��+�=�.�h����__#�386ac�����|�稗W�)c��i��.����G�h��kULU����1���69Q�wc�~0� ���ף��}A�:��$��9�i�aa��w�v�-��Є�>A�]�0      �      x������ � �      �      x������ � �      �   Z   x�]�9�0���eQl��/4�s����=ӏrQ�f�Q6��G�����H���Y�����y�ӕTB��A=dK�Z'hco"m�D���ιNX=      �      x������ � �      �   `   x�m�;1E�z���8��L��$-i���i�����ݏ���Z���S�'�K�� nU����k�5m�e�¦�>��5�Y�-�"� 4+#�      �      x������ � �      �      x������ � �      �   �   x�}��m�0��s<J֒(��.�P��Ml v��.I{� �O��:<���	��@u�n�4^�����Xor�㾊������RrD���R���p�&���x�cE)��r
�q .C���e�}m��v��1�v.���t���p`�\�QKC~N�~˹o��c�6W��g��NO	4;����+S�@�u�W��ցy�{V{�?�_����,�"SqS      �      x������ � �      �   �  x����j[I�?��~-s�\�1$�bH��8-f.������P��Wn�lk{ӓ.�3�#�5�~:�x��%h>�b3Cʮ�C�!v��������M��7���h�)-�]2��*�GX���S�����&��]�~4�To[�ށ7�5+��`K�����=�_]��������f�=~�iǣ�ͺ-�<����-hLT@3Iԕ���J6���������z���t<�������->>mx�_v~dE�>v�5I�HTA�n�hSL��^4_<<|��^�Ğ��/�M}{�CV�Mk��*P��0��X䠬�����������Ws��j2���>t3�|ڎҪ��6�b�X��ä4��5iT���*@�R��%W����CMWy�;��R�O�]w�u9�x^�pdƫ���J�����!�j�1S6:0�p8V6\y�[��A��;�SrjL+Փrd5e BɊ%���7�I���J�B����O[�̗뒤�+�Q�F7߶+9cN���	M`�R��EZ#:��FlQrU0������k����x�}x�M;������sR��"9��=$BJUW	m�`OO���&Y�v{�饇���u�?���Wi���L�K�RH/ISp�(5>p���g��iGfH�/�c����]�� h�uR�l_9r��5�h�J���*���ς\EY�
�z9���M�Ⱥ���v5�O@>��)ȋ��zm�z̀-5Ȧ��R+)���� ��䁪$�$�r��~l
�(F��O�{�7��C�F����&u�c��i?NJ�ΫF�o � )��<�hU�Q�AR�N�T]�lU��N|��NA�M����܆�2Ե�Z(����"�A ��� W%�LVʹ}YHaF/E�e�)+�� ��@�^@5B	�d+�^�KN�\�r�Aπ|��� G#}X�c�H��#��
�"�m1�O�����3զ��R�oH�^;p��e�)�ߊ��@��o}���~X      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x��ͻ�0E�x�#0ؘ^6�c�/a]�H/�:,!Δ�=AN����bK�~J�Ckv�&A��-]�Xb�_$#����R�q��[-�8U�:�1��<�<�M'�TkF����~�s2�]2c����'-���7	#��q8��np���&[�6�1�?��M�      �      x������ � �      �   k   x�%�Q
�  �o�K�&��K���&�~t����W(�Ϸ}�C��{��[�����T'))Z�PL5���[F�<�������J��`PP�1X����y���{��	t      �      x������ � �      �      x������ � �      �   |   x�%�A1 ��_0�R���{��$�����d2���D���]�n	|���C:�\�2�lq���t8	���8x,�,�_����{�w�M&�x4�T�����x�n4it�ɿ�u��~ �q&�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   a   x��̹1 ����	zq��	V	�w6ˉ\ʁ���A��-�!�d.�@/����T�鍵���f%w%H�E�/�ޓg"1&���c� ��(8      �      x������ � �      �   M   x�ʱ�  �:��#gD@vI# ���~~y-�ʮ8�8�54fj���uCiW�.���4!����d�|D��= �d�     