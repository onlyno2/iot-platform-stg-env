--
-- PostgreSQL database dump
--

-- Dumped from database version 10.16
-- Dumped by pg_dump version 10.16

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

--
-- Name: core_app_development; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE core_app_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE core_app_development OWNER TO admin;

\connect core_app_development

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.actions (
    id bigint NOT NULL,
    rule_id bigint,
    action_type character varying,
    data json DEFAULT '{}'::json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.actions OWNER TO admin;

--
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_id_seq OWNER TO admin;

--
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.actions_id_seq OWNED BY public.actions.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO admin;

--
-- Name: device_events; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.device_events (
    id bigint NOT NULL,
    name character varying,
    device_type_id bigint NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    schema_id character varying
);


ALTER TABLE public.device_events OWNER TO admin;

--
-- Name: device_events_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.device_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_events_id_seq OWNER TO admin;

--
-- Name: device_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.device_events_id_seq OWNED BY public.device_events.id;


--
-- Name: device_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.device_types (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    name character varying,
    description text,
    metadata json DEFAULT '{}'::json NOT NULL,
    info json DEFAULT '{}'::json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.device_types OWNER TO admin;

--
-- Name: device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.device_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_types_id_seq OWNER TO admin;

--
-- Name: device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.device_types_id_seq OWNED BY public.device_types.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.devices (
    id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    name character varying,
    description text,
    active boolean,
    last_active timestamp without time zone,
    metadata json DEFAULT '{}'::json NOT NULL,
    info json DEFAULT '{}'::json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.devices OWNER TO admin;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO admin;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: external_apps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.external_apps (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    name character varying,
    description text,
    type_id character varying NOT NULL,
    instance_id character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.external_apps OWNER TO admin;

--
-- Name: external_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.external_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_apps_id_seq OWNER TO admin;

--
-- Name: external_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.external_apps_id_seq OWNED BY public.external_apps.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO admin;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO admin;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: jwt_denylists; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.jwt_denylists (
    id bigint NOT NULL,
    jti character varying NOT NULL,
    exp timestamp without time zone NOT NULL
);


ALTER TABLE public.jwt_denylists OWNER TO admin;

--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.jwt_denylists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jwt_denylists_id_seq OWNER TO admin;

--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.jwt_denylists_id_seq OWNED BY public.jwt_denylists.id;


--
-- Name: mosq_acls; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.mosq_acls (
    id bigint NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL,
    topic character varying DEFAULT ''::character varying NOT NULL,
    permission smallint DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mosq_acls OWNER TO admin;

--
-- Name: mosq_acls_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.mosq_acls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mosq_acls_id_seq OWNER TO admin;

--
-- Name: mosq_acls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.mosq_acls_id_seq OWNED BY public.mosq_acls.id;


--
-- Name: mosq_auths; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.mosq_auths (
    id bigint NOT NULL,
    username character varying DEFAULT 'token-auth'::character varying NOT NULL,
    encrypted_token character varying NOT NULL,
    client_id character varying,
    superuser boolean,
    mosq_authenticatable_type character varying,
    mosq_authenticatable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mosq_auths OWNER TO admin;

--
-- Name: mosq_auths_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.mosq_auths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mosq_auths_id_seq OWNER TO admin;

--
-- Name: mosq_auths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.mosq_auths_id_seq OWNED BY public.mosq_auths.id;


--
-- Name: object_schemas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.object_schemas (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id bigint,
    name character varying,
    description text,
    schema_type character varying,
    schema character varying,
    string character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    project_id bigint
);


ALTER TABLE public.object_schemas OWNER TO admin;

--
-- Name: platform_core_apps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.platform_core_apps (
    id bigint NOT NULL,
    name character varying,
    description text,
    type_id character varying NOT NULL,
    instance_id character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.platform_core_apps OWNER TO admin;

--
-- Name: platform_core_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.platform_core_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platform_core_apps_id_seq OWNER TO admin;

--
-- Name: platform_core_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.platform_core_apps_id_seq OWNED BY public.platform_core_apps.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.projects OWNER TO admin;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO admin;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: rules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.rules (
    id bigint NOT NULL,
    device_type_id bigint,
    name character varying,
    description text,
    condition character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    event_id character varying
);


ALTER TABLE public.rules OWNER TO admin;

--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_id_seq OWNER TO admin;

--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.rules_id_seq OWNED BY public.rules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- Name: schemas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schemas (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    name character varying,
    description text,
    schema_type smallint,
    schema_file character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.schemas OWNER TO admin;

--
-- Name: schemas_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.schemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schemas_id_seq OWNER TO admin;

--
-- Name: schemas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.schemas_id_seq OWNED BY public.schemas.id;


--
-- Name: state_mappings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.state_mappings (
    id bigint NOT NULL,
    device_event_id bigint,
    state_id character varying,
    mappings json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.state_mappings OWNER TO admin;

--
-- Name: state_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.state_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_mappings_id_seq OWNER TO admin;

--
-- Name: state_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.state_mappings_id_seq OWNED BY public.state_mappings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: actions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actions ALTER COLUMN id SET DEFAULT nextval('public.actions_id_seq'::regclass);


--
-- Name: device_events id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_events ALTER COLUMN id SET DEFAULT nextval('public.device_events_id_seq'::regclass);


--
-- Name: device_types id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_types ALTER COLUMN id SET DEFAULT nextval('public.device_types_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: external_apps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.external_apps ALTER COLUMN id SET DEFAULT nextval('public.external_apps_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: jwt_denylists id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jwt_denylists ALTER COLUMN id SET DEFAULT nextval('public.jwt_denylists_id_seq'::regclass);


--
-- Name: mosq_acls id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mosq_acls ALTER COLUMN id SET DEFAULT nextval('public.mosq_acls_id_seq'::regclass);


--
-- Name: mosq_auths id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mosq_auths ALTER COLUMN id SET DEFAULT nextval('public.mosq_auths_id_seq'::regclass);


--
-- Name: platform_core_apps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.platform_core_apps ALTER COLUMN id SET DEFAULT nextval('public.platform_core_apps_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: rules id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.rules ALTER COLUMN id SET DEFAULT nextval('public.rules_id_seq'::regclass);


--
-- Name: schemas id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schemas ALTER COLUMN id SET DEFAULT nextval('public.schemas_id_seq'::regclass);


--
-- Name: state_mappings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.state_mappings ALTER COLUMN id SET DEFAULT nextval('public.state_mappings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actions (id, rule_id, action_type, data, created_at, updated_at) FROM stdin;
1	1	alert	{"payload":{"key":"value 1"},"alert_id":"no"}	2021-03-16 15:36:28.610196	2021-03-26 04:32:26.229533
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-03-12 03:36:44.392037	2021-03-12 03:36:44.392037
\.


--
-- Data for Name: device_events; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.device_events (id, name, device_type_id, description, created_at, updated_at, schema_id) FROM stdin;
3	fake	2	\N	2021-03-22 03:13:29.190845	2021-03-22 03:13:29.190845	290bd802-f196-444d-b35b-9cb8943f4f41
4	trash	1	exas	2021-03-22 03:14:59.572357	2021-03-22 03:14:59.572357	290bd802-f196-444d-b35b-9cb8943f4f41
2	test	2	123456	2021-03-20 14:28:10.883489	2021-03-26 03:07:38.489902	290bd802-f196-444d-b35b-9cb8943f4f41
1	test	1	123456	2021-03-20 14:13:39.355164	2021-03-28 13:53:22.34566	63d8356d-acb1-48f0-9d05-9ce6c0d234e1
6	temp	15	Su kien bao cao nhiet do	2021-03-28 13:22:24.984032	2021-03-28 14:42:11.919833	4bbd7214-6ee7-491e-9ecf-91ca2266e95c
\.


--
-- Data for Name: device_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.device_types (id, project_id, name, description, metadata, info, created_at, updated_at) FROM stdin;
1	1	facere	Enim nam tempora. Voluptas ex consequuntur. Velit aut dolorem.	"{\\"Joshua\\":\\"Tana\\",\\"Shantay\\":\\"Jake\\",\\"Antonio\\":\\"Jeff\\"}"	"{\\"Major\\":\\"Justine\\",\\"Refugio\\":\\"Janell\\",\\"Cruz\\":\\"Darius\\"}"	2021-03-12 03:36:55.813368	2021-03-12 03:36:55.813368
2	1	consequuntur	Praesentium perspiciatis sed. Id atque nisi. Omnis rem excepturi.	"{\\"Kelly\\":\\"Pansy\\",\\"Trey\\":\\"Romana\\",\\"Claude\\":\\"Benton\\"}"	"{\\"Judie\\":\\"Jadwiga\\",\\"Tiffiny\\":\\"Rickie\\",\\"Brady\\":\\"Coleman\\"}"	2021-03-12 03:36:55.848889	2021-03-12 03:36:55.848889
3	1	facilis	Et quae natus. Delectus necessitatibus harum. Eum placeat nostrum.	"{\\"Sterling\\":\\"Stacy\\",\\"America\\":\\"Valorie\\",\\"Jayne\\":\\"Jarrod\\"}"	"{\\"Enriqueta\\":\\"Hoyt\\",\\"Angelo\\":\\"Silvana\\",\\"Danyel\\":\\"Basil\\"}"	2021-03-12 03:36:55.893428	2021-03-12 03:36:55.893428
4	1	neque	Nobis non error. Sit perferendis nulla. Voluptatem eveniet illum.	"{\\"Karl\\":\\"Titus\\",\\"Ji\\":\\"Judson\\",\\"Adella\\":\\"Jimmy\\"}"	"{\\"Jarvis\\":\\"Carlos\\",\\"Jazmine\\":\\"Bradley\\",\\"Charissa\\":\\"Courtney\\"}"	2021-03-12 03:36:55.924835	2021-03-12 03:36:55.924835
5	1	voluptatum	Sit eos quia. Id modi suscipit. Officiis nihil praesentium.	"{\\"Mark\\":\\"Victor\\",\\"Gladis\\":\\"Sana\\",\\"Iluminada\\":\\"Angla\\"}"	"{\\"Berenice\\":\\"Mellie\\",\\"Emmett\\":\\"Charlie\\",\\"Norbert\\":\\"Haydee\\"}"	2021-03-12 03:36:55.962749	2021-03-12 03:36:55.962749
6	1	corporis	Cum voluptas nemo. Tenetur dolore quidem. Eum quidem aliquam.	"{\\"Maricruz\\":\\"Numbers\\",\\"Bobby\\":\\"Marcelle\\",\\"Hipolito\\":\\"Bobbi\\"}"	"{\\"Rory\\":\\"Myesha\\",\\"Meryl\\":\\"Archie\\",\\"Rod\\":\\"Fidel\\"}"	2021-03-12 03:36:56.042117	2021-03-12 03:36:56.042117
7	1	provident	Accusantium ex sint. Id rerum officia. Voluptas sit quidem.	"{\\"Caroll\\":\\"Hilario\\",\\"Cleveland\\":\\"Zane\\",\\"Mayola\\":\\"Yesenia\\"}"	"{\\"Darrick\\":\\"Shala\\",\\"Odell\\":\\"Kenisha\\",\\"Adina\\":\\"Donn\\"}"	2021-03-12 03:36:56.109545	2021-03-12 03:36:56.109545
8	1	doloremque	Voluptatem qui rem. Nam sequi dolor. Nostrum nisi et.	"{\\"Oleta\\":\\"Sherril\\",\\"Vi\\":\\"Jeramy\\",\\"Ryan\\":\\"Mariette\\"}"	"{\\"Marquis\\":\\"Josue\\",\\"Luz\\":\\"Jonna\\",\\"Antony\\":\\"Frances\\"}"	2021-03-12 03:36:56.160894	2021-03-12 03:36:56.160894
9	1	aperiam	Molestiae animi sit. Nihil eum dicta. Itaque voluptas eligendi.	"{\\"Rolland\\":\\"Aurore\\",\\"Rasheeda\\":\\"Julius\\",\\"Charlette\\":\\"Jewell\\"}"	"{\\"Doug\\":\\"Oda\\",\\"Vince\\":\\"Hazel\\",\\"Buffy\\":\\"Jude\\"}"	2021-03-12 03:36:56.201489	2021-03-12 03:36:56.201489
10	1	temporibus	Voluptatibus occaecati eum. Inventore hic dolores. Ut reprehenderit perferendis.	"{\\"Jerry\\":\\"Fermin\\",\\"Carina\\":\\"Jewel\\",\\"Randee\\":\\"Alysia\\"}"	"{\\"Shaneka\\":\\"Jefferey\\",\\"Arnoldo\\":\\"Young\\",\\"Ezequiel\\":\\"Sharie\\"}"	2021-03-12 03:36:56.263818	2021-03-12 03:36:56.263818
12	1	test_type_1		"{\\"field\\":\\"value\\"}"	"{\\"field\\":\\"value\\"}"	2021-03-26 02:11:30.905509	2021-03-26 02:11:30.905509
13	1	test_type_2		{"field":"value"}	{"field":"value"}	2021-03-26 02:11:48.309758	2021-03-26 02:11:48.309758
15	101	thiet-bi-do-nhiet-do		{"temp-max":30,"temp-min":20}	{"trang-thai":"gia lap"}	2021-03-26 15:27:14.834184	2021-03-26 15:27:14.834184
14	101	test_type_1		{"field":"value","on":"no","test_val":123456}	{"field":"value"}	2021-03-26 15:26:01.156448	2021-04-06 09:47:44.193945
16	101	new_type	mô tả	{"val1":123,"val2":456}	{}	2021-04-06 09:09:14.103259	2021-04-09 03:28:30.132101
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.devices (id, device_type_id, name, description, active, last_active, metadata, info, created_at, updated_at) FROM stdin;
1	1	harum	Enim velit aut. Beatae molestias distinctio. Aut aut voluptatem.	f	\N	{"Lashon":"Guillermo","Terrance":"Justin","Jennie":"Stanford"}	{"Latrina":"Joesph","Wes":"Aaron","Selina":"Rosalind"}	2021-03-12 03:36:56.515764	2021-03-12 03:36:56.515764
2	1	voluptate	Maxime sequi quo. Temporibus nemo et. Et est repudiandae.	f	\N	{"Ramiro":"Lakeisha","Tanner":"Wyatt","Quinn":"Cathey"}	{"Mai":"Arielle","Octavio":"Arlena","Candie":"Laurence"}	2021-03-12 03:36:56.670731	2021-03-12 03:36:56.670731
3	1	voluptatibus	Excepturi autem consequatur. Dolore recusandae aut. Voluptatem et perspiciatis.	f	\N	{"Kiana":"Isaiah","Oswaldo":"Kristin","Danial":"Azzie"}	{"Bryant":"Jeni","Sue":"Marcelino","Jorge":"Donnell"}	2021-03-12 03:36:56.795287	2021-03-12 03:36:56.795287
4	1	eveniet	Praesentium ipsam sequi. Esse quasi porro. Suscipit doloribus voluptas.	f	\N	{"Hector":"German","Gracie":"Rolland","Carrol":"Bonita"}	{"Felipe":"Alline","Elvin":"Valencia","Tyron":"Thaddeus"}	2021-03-12 03:36:57.153192	2021-03-12 03:36:57.153192
5	1	ipsa	Iste nihil delectus. Inventore esse accusamus. Est quia corrupti.	f	\N	{"Dawne":"Anh","Janae":"Fidel","Sacha":"Vaughn"}	{"Kristeen":"Herb","Jude":"Cletus","Cathi":"Irene"}	2021-03-12 03:36:57.348749	2021-03-12 03:36:57.348749
6	1	exercitationem	Consequatur deleniti est. Repellendus velit quisquam. Ad ullam cum.	f	\N	{"Lynwood":"Armanda","Wayne":"Lorine","Jason":"Melvin"}	{"Marquis":"Nicholas","Sherie":"Xavier","Bruno":"Abraham"}	2021-03-12 03:36:57.463133	2021-03-12 03:36:57.463133
7	1	porro	Enim mollitia quia. Quod aut aliquam. Minus saepe qui.	f	\N	{"Zulma":"Mallory","Cheryl":"Nakita","Calvin":"Derick"}	{"Patti":"Brandon","Kristel":"Alonzo","Clarence":"Louis"}	2021-03-12 03:36:57.575967	2021-03-12 03:36:57.575967
8	1	quos	Molestias ipsam magni. Sed voluptatibus dignissimos. Dolor ex nobis.	f	\N	{"Malcom":"Dana","Erin":"Awilda","Pablo":"Johnathan"}	{"Trula":"Kristle","Domingo":"Tomas","June":"Dorthea"}	2021-03-12 03:36:57.803988	2021-03-12 03:36:57.803988
9	1	maiores	Est nisi fugiat. Ratione sed autem. Sunt hic nihil.	f	\N	{"Denny":"Moira","Leroy":"Shenika","Theo":"Jani"}	{"Collette":"Miquel","Lorretta":"Leo","Brittny":"Sophia"}	2021-03-12 03:36:57.96769	2021-03-12 03:36:57.96769
10	1	adipisci	Consectetur sunt sed. Et nostrum est. Sapiente aliquam maiores.	f	\N	{"Lovella":"Emerson","Benedict":"Tari","Keva":"Tanna"}	{"Wilford":"Dario","Adrianne":"Olene","Louie":"Tim"}	2021-03-12 03:36:58.082984	2021-03-12 03:36:58.082984
11	1	device-004	description	\N	\N	{}	{"value1":"ket","key2":"sad"}	2021-03-12 03:40:36.954766	2021-03-12 03:40:36.954766
13	2	test-device-2	\N	\N	\N	"{}"	"{}"	2021-03-22 03:10:03.128255	2021-03-22 03:10:03.128255
16	15	thiet-bi-do-nhiet-1	do nhiet do ho ca 1	f	2021-03-29 08:55:08.098272	{"max_temp":30,"min_temp":20,"max-light":20,"test-attr":100}	{"field-1":"ues","yes":1}	2021-03-26 15:29:19.949579	2021-03-29 08:55:08.115225
17	15	thiet-bi-do-nhiet-2	do nhiet do ho ca 2	f	2021-03-29 08:55:08.10127	{"max_temp":30,"min_temp":20}	{"yes":1}	2021-03-26 15:29:33.05592	2021-03-29 08:55:08.118687
12	1	device-001	description	f	2021-03-23 14:29:56.805338	"{}"	"{\\"value1\\":\\"ket\\",\\"key2\\":\\"sad\\"}"	2021-03-12 03:43:55.59869	2021-03-23 14:29:56.818998
14	1	device-002	description	\N	\N	{"key 1":"123456"}	"{\\"value1\\":\\"ket\\",\\"key2\\":\\"sad\\"}"	2021-03-26 02:09:25.466594	2021-03-26 02:30:11.49779
29	15	thiet-bi-do-nhiet-3	cập nhật mới 2	\N	\N	{}	{}	2021-04-08 02:14:27.013559	2021-04-09 03:28:06.225245
\.


--
-- Data for Name: external_apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.external_apps (id, project_id, name, description, type_id, instance_id, created_at, updated_at, slug) FROM stdin;
1	1	app 1	\N	Ee0nqg	Qdze_3	2021-03-22 00:42:33.950886	2021-03-22 00:42:33.950886	app-1
2	1	app 2	\N	-RgP4A	-MbxgC	2021-03-22 00:43:43.302931	2021-03-22 00:43:43.302931	app-2
3	1	test app 2	description	l6W3DR	p-hJL6	2021-03-25 14:33:22.252692	2021-03-25 14:33:22.252692	test-app-2
4	1	test app 4	description	pcQfQp	zQzPQ-	2021-03-25 14:56:29.283303	2021-03-25 14:56:29.283303	test-app-4
5	101	node-red-app	Ung dung su dung de nhan, hien thi du lieu	6Xb1yM	CM2xyz	2021-03-26 15:19:42.734853	2021-03-26 15:19:42.734853	node-red-app
12	101	test-app-2	Cập nhật mới :v	EA3Nxl	FZ0yPa	2021-04-09 02:46:08.283695	2021-04-09 03:26:13.011349	test-app-2-473a7542-93e0-4cc0-88d8-84282998ef70
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	eum	1	Project	\N	2021-03-12 03:36:45.863749
107	test_project	102	Project	\N	2021-04-05 15:00:16.555203
114	test-app-1	12	ExternalApp	\N	2021-04-09 02:46:08.389902
115	test-app-2-9a62d3c9-7b38-46ae-860b-9085e55737a9	12	ExternalApp	\N	2021-04-09 03:24:33.51283
116	test-app-2-473a7542-93e0-4cc0-88d8-84282998ef70	12	ExternalApp	\N	2021-04-09 03:26:13.048743
101	app-1	1	ExternalApp	\N	2021-03-22 00:42:34.132073
102	app-2	2	ExternalApp	\N	2021-03-22 00:43:43.419025
103	test-app-2	3	ExternalApp	\N	2021-03-25 14:33:22.462841
104	test-app-4	4	ExternalApp	\N	2021-03-25 14:56:29.458287
105	nuoi-ca	101	Project	\N	2021-03-26 15:02:16.857968
106	node-red-app	5	ExternalApp	\N	2021-03-26 15:19:42.919465
\.


--
-- Data for Name: jwt_denylists; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jwt_denylists (id, jti, exp) FROM stdin;
1	cd492c37-d66f-4775-b5ba-ad7d2516248d	2021-03-25 15:55:59
\.


--
-- Data for Name: mosq_acls; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.mosq_acls (id, username, topic, permission, created_at, updated_at) FROM stdin;
14	token-auth	v1/evt/+	2	2021-03-12 04:06:49.141529	2021-03-12 04:06:49.141529
15	token-auth	v1/cmd/+	1	2021-03-12 04:06:49.215702	2021-03-12 04:06:49.215702
16	token-auth	v1/cmd/+	4	2021-03-12 04:06:49.248965	2021-03-12 04:06:49.248965
17	token-auth	v1/cmd/%project_id/+/types/+/devices/+	2	2021-03-12 04:06:49.281987	2021-03-12 04:06:49.281987
18	token-auth	v1/response	1	2021-03-12 04:06:49.315227	2021-03-12 04:06:49.315227
19	token-auth	v1/response	4	2021-03-12 04:06:49.348675	2021-03-12 04:06:49.348675
20	token-auth	v1/manage	2	2021-03-12 04:06:49.382091	2021-03-12 04:06:49.382091
21	ext-app	v1/evt/%project_id/+/types/+/devices/+	1	2021-03-12 04:06:49.415041	2021-03-12 04:06:49.415041
22	ext-app	v1/evt/%project_id/+/types/+/devices/+	4	2021-03-12 04:06:49.448594	2021-03-12 04:06:49.448594
23	ext-app	v1/cmd/%project_id/+/types/+/devices/+	2	2021-03-12 04:06:49.481497	2021-03-12 04:06:49.481497
24	ext-app	v1/infr/%project_id/+/types/+/instances/+/state/+	1	2021-03-12 04:06:49.535779	2021-03-12 04:06:49.535779
25	ext-app	v1/infr/%project_id/+/types/+/instances/+/state/+	4	2021-03-12 04:06:49.570201	2021-03-12 04:06:49.570201
26	core-app	v1/core/evt	1	2021-03-12 04:06:49.603259	2021-03-12 04:06:49.603259
27	core-app	v1/core/evt	4	2021-03-12 04:06:49.636497	2021-03-12 04:06:49.636497
28	core-app	v1/core/manage	1	2021-03-12 04:06:49.669698	2021-03-12 04:06:49.669698
29	core-app	v1/core/manage	4	2021-03-12 04:06:49.702722	2021-03-12 04:06:49.702722
30	core-app	v1/cmd/+/+/types/+/devices/+	2	2021-03-12 04:06:49.735686	2021-03-12 04:06:49.735686
31	core-app	v1/res/+/+/types/+/devices/+	1	2021-03-12 04:06:49.769625	2021-03-12 04:06:49.769625
32	core-app	v1/res/+/+/types/+/devices/+	4	2021-03-12 04:06:49.802592	2021-03-12 04:06:49.802592
33	core-app	v1/infr/+/+/types/+/instances/+/state/+	2	2021-03-12 04:06:49.835526	2021-03-12 04:06:49.835526
34	core-app	v1/disconnect	1	2021-03-22 09:11:26.443503	2021-03-22 09:11:26.443503
35	core-app	v1/disconnect	4	2021-03-22 09:11:29.769922	2021-03-22 09:11:29.769922
36	core-app	v1/connect	1	2021-03-22 16:19:21.559873	2021-03-22 16:19:21.559873
37	core-app	v1/connect	4	2021-03-22 16:19:22.39725	2021-03-22 16:19:22.39725
38	ext-app	v1/evt/%project_id/+/types/+/devices/+/event/+	1	2021-03-26 15:36:18.654722	2021-03-26 15:36:18.654722
39	ext-app	v1/evt/%project_id/+/types/+/devices/+/event/+	4	2021-03-26 15:36:26.853122	2021-03-26 15:36:26.853122
40	ext-app	v1/evt-2/%project_id/+/types/+/devices/+/event/+	1	2021-03-26 16:03:32.344475	2021-03-26 16:03:32.344475
41	ext-app	v1/evt-2/%project_id/+/types/+/devices/+/event/+	4	2021-03-26 16:03:35.602583	2021-03-26 16:03:35.602583
42	core-app	v1/cmd/+/+/types/+/devices/+/command/+	2	2021-03-29 07:38:38.998228	2021-03-29 07:38:38.998228
43	ext-app	v1/cmd/%project_id/+/types/+/devices/+/command/+	2	2021-03-29 08:00:18.882245	2021-03-29 08:00:18.882245
\.


--
-- Data for Name: mosq_auths; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.mosq_auths (id, username, encrypted_token, client_id, superuser, mosq_authenticatable_type, mosq_authenticatable_id, created_at, updated_at) FROM stdin;
1	token-auth	$2a$10$mFnmn1mJvVzZksBIr1A78.sonR9fWnfEr4EtWyVKTj5q0Ur8uyWxa	1:d:facere:harum	f	Device	1	2021-03-12 03:36:56.601665	2021-03-12 03:36:56.601665
2	token-auth	$2a$10$vljRNPIYOv776ZPTZs0O3Opls4wrPmOvOiIralXKC6HG6JW6HaEIW	1:d:facere:voluptate	f	Device	2	2021-03-12 03:36:56.740099	2021-03-12 03:36:56.740099
3	token-auth	$2a$10$FRwaYJdSdaq8NlhRn1OoYuTnFkugy7enBytHaYSUEdY0kbJY8qtV2	1:d:facere:voluptatibus	f	Device	3	2021-03-12 03:36:56.891412	2021-03-12 03:36:56.891412
4	token-auth	$2a$10$4.pR7DX02Et5pbfKC8H6quVEzDF8UeS3iicOJYqFOK7juT.oi4qy2	1:d:facere:eveniet	f	Device	4	2021-03-12 03:36:57.266476	2021-03-12 03:36:57.266476
5	token-auth	$2a$10$WTFYD/vrPklr/HJqS8Ljau/LeQ5s/WIRVpP5vnPu5fctan0Q0W/cG	1:d:facere:ipsa	f	Device	5	2021-03-12 03:36:57.422947	2021-03-12 03:36:57.422947
6	token-auth	$2a$10$28kjwi3RIhrffDSF4Ggzb.6PcHu6EKDM5uOdtuR3L/1feILTxM3mi	1:d:facere:exercitationem	f	Device	6	2021-03-12 03:36:57.536131	2021-03-12 03:36:57.536131
7	token-auth	$2a$10$0.F4RVzZc9XAgOigr/fGe.e6Tkraw3dBzT5yhRDBhAiFYz8S.3zoq	1:d:facere:porro	f	Device	7	2021-03-12 03:36:57.648295	2021-03-12 03:36:57.648295
8	token-auth	$2a$10$NFnPbF4K6ZJETQNODIk1.ON.cVC9gi8ZaELVmJ5xBw.W0tzhSJpwG	1:d:facere:quos	f	Device	8	2021-03-12 03:36:57.874321	2021-03-12 03:36:57.874321
9	token-auth	$2a$10$t6WEj1SG75XRzZhCiLBZN.jU7hCvBKTaC5qcvdr3LmirhCYRxSrXe	1:d:facere:maiores	f	Device	9	2021-03-12 03:36:58.038122	2021-03-12 03:36:58.038122
10	token-auth	$2a$10$/bKBS0AquVlOE.FIs95Cn.lqWXGLykClg67YNXML/BzbfsZyll.1.	1:d:facere:adipisci	f	Device	10	2021-03-12 03:36:58.154253	2021-03-12 03:36:58.154253
11	token-auth	$2a$10$M/iDTB13ckAHtYgJKoyx1OuEMH0tRn5o75pCOiFe9D7w9xtUXXfa2	1:d:facere:device-004	f	Device	11	2021-03-12 03:40:37.045181	2021-03-12 03:40:37.045181
12	token-auth	$2a$10$wjewOvdqEUdFufdowCE4Xewkbbf04Gfc7GqRK.CqCrA0tfyaahXNO	1:d:facere:device-001	f	Device	12	2021-03-12 03:43:55.705205	2021-03-12 03:43:55.705205
13	core-app	$2a$10$sZPnCOjJhGt0jvWR/D8atuyVX0qpWTjYr6yI2lU6LbJpRD4dRWN7i	0:core:cfpqfd:YFpZQ-	f	PlatformCoreApp	1	2021-03-12 03:46:14.080504	2021-03-12 03:46:14.080504
14	ext-app	$2a$10$c3EcPGKYlr76RxrTAz3bxez6PT7ep94/kB38Fel3rcqvyonCv5bH.	1:app:Ee0nqg:Qdze_3	f	ExternalApp	1	2021-03-22 00:42:34.074438	2021-03-22 00:42:34.074438
15	ext-app	$2a$10$umZJ93PveB9pT00gQ3EdROVvDw.jU7uZOdx2ul0tOIcywZwrrqZTe	1:app:-RgP4A:-MbxgC	f	ExternalApp	2	2021-03-22 00:43:43.39868	2021-03-22 00:43:43.39868
16	core-app	$2a$10$COIyMz2emBQ2XB9KvcxeTO2o7odXmu7T4fFZpCp3.2dIsb.PNEfP.	0:core:cfpqde:YFpZQ-	f	PlatformCoreApp	2	2021-03-22 01:38:08.347722	2021-03-22 01:38:08.347722
17	core-app	$2a$10$St7oaSaoJqUnrkAHGrxUieGWcvLKu7T4yfs3Pi821zhtMDk7BRTba	0:core:cfpqdf:YFpZQ-	f	PlatformCoreApp	3	2021-03-22 01:48:57.52919	2021-03-22 01:48:57.52919
18	token-auth	$2a$10$RUO1YdQBU/bJu1SNReSaIuVxYxBIpaRkdUwdw52ZFkFuwgL2CPflW	1:d:consequuntur:test-device-2	f	Device	13	2021-03-22 03:10:03.3337	2021-03-22 03:10:03.3337
19	core-app	$2a$10$tNHe2yA6L8sFbOHLDB03J.44K9nkiFKidhTO3p2KGtwiHyChMZMCe	0:core:cfpqdg:YFpZQ-	f	PlatformCoreApp	4	2021-03-22 09:16:41.32389	2021-03-22 09:16:41.32389
20	ext-app	$2a$10$qXHOU9TgSLgEEFlnSBDB0unf3sF87LbyIapytOzObaNaNEnxIGAma	1:app:l6W3DR:p-hJL6	f	ExternalApp	3	2021-03-25 14:33:22.418958	2021-03-25 14:33:22.418958
21	ext-app	$2a$10$yjuFEQf9ZYZxQJks44mbmOWDN77MN5ke2qEVD8Ei8hv.jIk4JA4ue	1:app:pcQfQp:zQzPQ-	f	ExternalApp	4	2021-03-25 14:56:29.387406	2021-03-25 14:56:29.387406
22	token-auth	$2a$10$Z4FIOcQxmJaoUGqnx4lim.ai5VD2z3WM38Bg.cKkUTQp00OKI0GLO	1:d:facere:device-002	f	Device	14	2021-03-26 02:09:25.607688	2021-03-26 02:09:25.607688
23	token-auth	$2a$10$AgVBuP3zWEZJN3fyUiNdjeCPZWHEFUI7LDiSewlSicK8OMbAbGdx2	1:d:facere:device-003	f	Device	15	2021-03-26 02:10:49.429124	2021-03-26 02:10:49.429124
24	ext-app	$2a$10$FeAHkSIykLAMNMjE2R.DveXk9Digcp2N44g27bljydBVfGB1q7mNK	101:app:6Xb1yM:CM2xyz	f	ExternalApp	5	2021-03-26 15:19:42.876937	2021-03-26 15:19:42.876937
25	token-auth	$2a$10$.NQE6Y/yqYKs6.WzlDqOW.hhaJLPzkM8uR2NV0fZ6Ay2FWAHvbY6a	101:d:thiet-bi-do-nhiet-do:thiet-bi-do-nhiet-1	f	Device	16	2021-03-26 15:29:20.069695	2021-03-26 15:29:20.069695
26	token-auth	$2a$10$m8ExFGBj7EScd.qlmOgENeNH/vb482.RWDLf2PO20hj0ZzmxPoUIW	101:d:thiet-bi-do-nhiet-do:thiet-bi-do-nhiet-2	f	Device	17	2021-03-26 15:29:33.190681	2021-03-26 15:29:33.190681
27	core-app	$2a$10$auF/4fHCuaOxNpJn5TicZeKHp/yN066AsalZIEEaQUdEumyiQqGQ.	0:core:cfpqdh:YFpZQ-	f	PlatformCoreApp	4	2021-03-29 03:06:56.600561	2021-03-29 03:24:52.21547
28	core-app	$2a$10$CHa39cs1mQZTs4jGHjWDuOD4CNryUI0TurCjNZcA5jsUn0NZX7FHC	0:core:cfpqdi:YFpZQ-	f	PlatformCoreApp	3	2021-03-29 07:07:17.911815	2021-03-29 07:07:17.911815
29	token-auth	$2a$10$rVJIvV7/oYYhXqRnbyHLhe1VJIGMrb8LDnKXyvuWBrVxb03YTqhhC	101:d:test_type_1:d1	f	Device	18	2021-04-08 01:49:04.446106	2021-04-08 01:49:04.446106
30	token-auth	$2a$10$jxBFQXmKIh8cA54C9mmxIu8lIWaJqTyjw5W.gCuqFKh4D2MIKVUT6	101:d:test_type_1:d2	f	Device	19	2021-04-08 01:49:48.133191	2021-04-08 01:49:48.133191
31	token-auth	$2a$10$ld2ZtDkSwF6VpJEXletBF.J/6NjH/20k.08sLnyGiT8NxOInUuKoy	101:d:test_type_1:d3	f	Device	20	2021-04-08 01:51:24.589217	2021-04-08 01:51:24.589217
32	token-auth	$2a$10$PNuXaorDHTt1qGAeVfjkVu8U07.o0MtJXYlRtfh.J0lu0RNZhIbMC	101:d:test_type_1:d4	f	Device	21	2021-04-08 01:52:29.986395	2021-04-08 01:52:29.986395
33	token-auth	$2a$10$5d3Czgk5liY3bnaEB7XYwO3c7zfD/wORs0jemiRACFQrbNs9Xyciy	101:d:test_type_1:d5	f	Device	22	2021-04-08 01:53:45.860024	2021-04-08 01:53:45.860024
34	token-auth	$2a$10$i3rHHk7tGXF80Ox9DoLt0O9Af.7TuXC.SSRdes6j6lEVfI/11EeHu	101:d:test_type_1:s1	f	Device	23	2021-04-08 02:02:01.584265	2021-04-08 02:02:01.584265
35	token-auth	$2a$10$roJukZRSCOBhKF1w/nkwU.u1zym3B8RnFAGK.1YOwRjSUhI5GOOx6	101:d:test_type_1:s90	f	Device	24	2021-04-08 02:04:27.100043	2021-04-08 02:04:27.100043
36	token-auth	$2a$10$Ioxq07v3Q7tPgTyoqZzU8u8rtSBTH9FqySfNRrDwZlit9jkIoQqr6	101:d:test_type_1:k1	f	Device	25	2021-04-08 02:05:12.53537	2021-04-08 02:05:12.53537
37	token-auth	$2a$10$a20/JEa.OH1EeMmkh032cOdhMHZlF54CrYE4O.JTrL25HPfWIbntK	101:d:test_type_1:test_last	f	Device	26	2021-04-08 02:11:04.646667	2021-04-08 02:11:04.646667
38	token-auth	$2a$10$9RVOhVJJUf7/89e7AJoNNOETHiesJlQTDioor6vAvUSjusSgjikx2	101:d:test_type_1:yes	f	Device	27	2021-04-08 02:13:35.64181	2021-04-08 02:13:35.64181
39	token-auth	$2a$10$SAP746.jdswwWvtcIWQb2uvUF79pQsEg0FytTauaPHNXT2NScKhKq	101:d:test_type_1:wwww	f	Device	28	2021-04-08 02:13:56.610807	2021-04-08 02:13:56.610807
40	token-auth	$2a$10$KhSWmXdZfD0eVyR9eSGsmODrXgOp6eFyku5WTpPAQ7tjXWoQq11tK	101:d:thiet-bi-do-nhiet-do:thiet-bi-do-nhiet-3	f	Device	29	2021-04-08 02:14:27.090474	2021-04-08 02:14:27.090474
41	ext-app	$2a$10$UO3IWB00HIksarr6RbtbIOMJfH148d6Nu/rlU0XX50CT4kGTo9rZ.	101:app:l_J3mp:0dz_wW	f	ExternalApp	6	2021-04-09 02:18:06.061383	2021-04-09 02:18:06.061383
42	ext-app	$2a$10$ctUMrYRoE6NNliRyW6JDG.P.41cBLZvkZwwwI2TXrkS65duJ0gO86	101:app:2R1zH9:Z6h96p	f	ExternalApp	7	2021-04-09 02:24:00.582838	2021-04-09 02:24:00.582838
43	ext-app	$2a$10$PNp1bX6s2boOP6NrlEND0uhdbE05zVGo4bpjNtu4LmLbkd.KNaEOi	101:app:dFYcYt:LLZEP_	f	ExternalApp	8	2021-04-09 02:25:04.846929	2021-04-09 02:25:04.846929
44	ext-app	$2a$10$VWF36uLkcFX9ytenNqNya.6WGQnUVvK7AC4xoXxPbFqxvbmDBeeLa	101:app:AegfbC:1_rr9C	f	ExternalApp	9	2021-04-09 02:26:08.418863	2021-04-09 02:26:08.418863
45	ext-app	$2a$10$ye1B6Rcvr./k05pWRjOO3ey9QFlckSjQ6vy2bmj6.pkybZjD//Avy	101:app:xNwf7d:1Yf7lG	f	ExternalApp	10	2021-04-09 02:32:29.009405	2021-04-09 02:32:29.009405
46	ext-app	$2a$10$3R.ec.hy3QGy6ael4hK9LebDGBNLNwtIOPbBnZUeIu0nY/h3w9wb2	101:app:XmAHeq:2GDy2p	f	ExternalApp	11	2021-04-09 02:37:16.664529	2021-04-09 02:37:16.664529
47	ext-app	$2a$10$OX8m.lEhQP/27Kjc3rxJVuDRXUtg86AvmXyS/fFUwFKO6Ca7yuDIC	101:app:EA3Nxl:FZ0yPa	f	ExternalApp	12	2021-04-09 02:46:08.356586	2021-04-09 02:46:08.356586
48	token-auth	$2a$10$3qMMlTVgXkKJdxvXU.2o6Ouen9P8fvc5S6tV3CAiahoBg5nHmKtQ.	101:d:thiet-bi-do-nhiet-do:rule1	f	Device	30	2021-04-12 02:10:01.782249	2021-04-12 02:10:01.782249
49	token-auth	$2a$10$PCE.TUysT1kE7G59qlRbhespbI64mkI04G.x2XJvx0IQpODwKq8JO	101:d:new_type:rule	f	Device	31	2021-04-12 02:14:12.782538	2021-04-12 02:14:12.782538
\.


--
-- Data for Name: object_schemas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.object_schemas (id, user_id, name, description, schema_type, schema, string, created_at, updated_at, project_id) FROM stdin;
cbb45323-bf70-445e-a05b-a464d651588a	\N	cbb45323-bf70-445e-a05b-a464d651588a	\N	\N	\N	\N	2021-03-15 07:00:46.344052	2021-03-15 07:00:46.344052	1
8422e761-4e18-473a-bc9a-c3924f03be5d	\N	8422e761-4e18-473a-bc9a-c3924f03be5d	\N	\N	\N	\N	2021-03-15 07:01:06.005134	2021-03-15 07:01:06.005134	1
9e4e7331-0cb2-4a95-8ae3-782a823d6abe	\N	9e4e7331-0cb2-4a95-8ae3-782a823d6abe	\N	\N	\N	\N	2021-03-15 07:01:57.576275	2021-03-15 07:01:57.576275	1
513cd50d-222a-4712-a216-f238e31119d4	\N	513cd50d-222a-4712-a216-f238e31119d4	\N	\N	\N	\N	2021-03-15 07:02:36.882192	2021-03-15 07:02:36.882192	1
2faee931-7ea7-4f49-9c74-206bc400ead1	\N	2faee931-7ea7-4f49-9c74-206bc400ead1	\N	\N	\N	\N	2021-03-15 07:07:38.228635	2021-03-15 07:07:38.228635	1
fe6bdd48-aaf7-4d92-95cc-1d71980e38f4	\N	fe6bdd48-aaf7-4d92-95cc-1d71980e38f4	\N	\N	\N	\N	2021-03-15 07:15:30.7047	2021-03-15 07:15:30.7047	1
cfc24353-1a2a-4612-981a-0c7fc71d5b4a	\N	cfc24353-1a2a-4612-981a-0c7fc71d5b4a	\N	\N	\N	\N	2021-03-15 07:17:16.135207	2021-03-15 07:17:16.135207	1
288f005c-306d-4498-9d32-dcd5f282817b	\N	288f005c-306d-4498-9d32-dcd5f282817b	\N	\N	\N	\N	2021-03-15 07:17:54.079411	2021-03-15 07:17:54.079411	1
51783df5-164f-4e55-bd7e-014d5c8853e1	\N	51783df5-164f-4e55-bd7e-014d5c8853e1	\N	\N	\N	\N	2021-03-15 07:30:39.358459	2021-03-15 07:30:39.358459	1
ba432b6d-a331-42bf-89e3-cfafb7ac8495	\N	ba432b6d-a331-42bf-89e3-cfafb7ac8495	\N	\N	\N	\N	2021-03-15 07:31:28.875844	2021-03-15 07:31:28.875844	1
e4bb5d49-0b29-4c51-9ca5-ebb54f47807e	\N	e4bb5d49-0b29-4c51-9ca5-ebb54f47807e	\N	\N	\N	\N	2021-03-15 07:31:44.606295	2021-03-15 07:31:44.606295	1
6b5cbe69-e7db-4c32-8897-e4c51f24c8b3	\N	6b5cbe69-e7db-4c32-8897-e4c51f24c8b3	\N	\N	test.json	\N	2021-03-15 07:34:47.262836	2021-03-15 07:34:47.262836	1
3fd29011-e641-440f-95d5-74adee5bf806	\N	3fd29011-e641-440f-95d5-74adee5bf806	\N	\N	test.json	\N	2021-03-15 07:39:47.39668	2021-03-15 07:39:47.39668	1
12964c2e-0b5c-4981-87f6-3cce719b6356	\N	12964c2e-0b5c-4981-87f6-3cce719b6356	\N	\N	test.json	\N	2021-03-15 07:40:27.280754	2021-03-15 07:40:27.280754	1
e078a495-5d73-4b0a-9b16-4d149ed43f0e	\N	e078a495-5d73-4b0a-9b16-4d149ed43f0e	\N	\N	test.json	\N	2021-03-15 07:40:55.503883	2021-03-15 07:40:55.503883	1
442ad77e-bb14-4552-a7ce-d972dfb508dd	\N	442ad77e-bb14-4552-a7ce-d972dfb508dd	\N	\N	test_-_Copy.json	\N	2021-03-15 07:41:24.550786	2021-03-15 07:41:24.550786	1
a2ea185e-875b-4676-8c62-edcfd8bc870d	\N	a2ea185e-875b-4676-8c62-edcfd8bc870d	\N	\N	test_-_Copy.json	\N	2021-03-15 07:46:26.850481	2021-03-15 07:46:26.850481	1
f62d99fd-c094-4d98-80c5-9b8e0802e5c0	\N	f62d99fd-c094-4d98-80c5-9b8e0802e5c0	\N	\N	test_-_Copy.json	\N	2021-03-15 07:47:18.41034	2021-03-15 07:47:18.41034	1
eee8466c-76be-4791-bc80-5e5b1df17cd7	\N	eee8466c-76be-4791-bc80-5e5b1df17cd7	\N	\N	test_-_Copy.json	\N	2021-03-15 07:49:53.432826	2021-03-15 07:49:53.432826	1
33f34c20-69bd-4672-a6ee-4e09e4ded56f	\N	33f34c20-69bd-4672-a6ee-4e09e4ded56f	\N	\N	test_-_Copy.json	\N	2021-03-15 07:50:11.185522	2021-03-15 07:50:11.185522	1
91fc2490-eb40-4373-92a7-6cd51280b32b	\N	91fc2490-eb40-4373-92a7-6cd51280b32b	\N	\N	test_-_Copy.json	\N	2021-03-15 07:51:23.698981	2021-03-15 07:51:23.698981	1
db6104fb-3bc4-4033-83f5-909c5c2e7e4c	\N	db6104fb-3bc4-4033-83f5-909c5c2e7e4c	\N	\N	test_-_Copy.json	\N	2021-03-15 07:51:35.248313	2021-03-15 07:51:35.248313	1
2a704ece-4dd9-4d33-a294-57c9b1fcdf07	\N	2a704ece-4dd9-4d33-a294-57c9b1fcdf07	\N	\N	test_-_Copy.json	\N	2021-03-15 07:56:37.855557	2021-03-15 07:56:37.855557	1
2abfed8e-365a-43a9-931d-c7a7a4016691	\N	2abfed8e-365a-43a9-931d-c7a7a4016691	\N	\N	test_-_Copy.json	\N	2021-03-15 07:56:53.38107	2021-03-15 07:56:53.38107	1
0c477856-436a-4993-a8fe-f712b1545c87	\N	0c477856-436a-4993-a8fe-f712b1545c87	\N	\N	test_-_Copy.json	\N	2021-03-15 07:57:51.657843	2021-03-15 07:57:51.657843	1
67e0977f-aabd-4165-9afd-be73e9f0e3bf	\N	67e0977f-aabd-4165-9afd-be73e9f0e3bf	\N	\N	39626cb1-f037-43a5-b1b9-c5af4c52399a.json	\N	2021-03-15 08:01:00.758632	2021-03-15 08:01:00.758632	1
4dac535a-e9d1-4224-816c-e9ec7e505102	\N	4dac535a-e9d1-4224-816c-e9ec7e505102	\N	\N	dc93270b-ac9f-41c1-a3e4-775a0c0f2a69.json	\N	2021-03-15 08:15:11.182124	2021-03-15 08:15:11.182124	1
94543fb4-60df-4a9b-b6c8-52c73d27f7f6	\N	94543fb4-60df-4a9b-b6c8-52c73d27f7f6	\N	\N	dc9f35b3-8cb1-4da4-bf42-90ebc8a66096.json	\N	2021-03-15 08:17:11.058052	2021-03-15 08:17:11.058052	1
91d453ce-2eab-480c-9e2c-633c150f168c	\N	91d453ce-2eab-480c-9e2c-633c150f168c	\N	json_schema_v4	fe6f03f8-fb3d-45fe-acc2-aa2a28da3a81.json	\N	2021-03-15 08:21:55.42657	2021-03-15 08:21:55.42657	1
290bd802-f196-444d-b35b-9cb8943f4f41	\N	290bd802-f196-444d-b35b-9cb8943f4f42	\N	json_schema_v4	aa5b61b2-d176-4d50-883f-923515c35ae3.json	\N	2021-03-19 04:26:20.405864	2021-03-23 15:12:08.2936	1
4bbd7214-6ee7-491e-9ecf-91ca2266e95c	\N	4bbd7214-6ee7-491e-9ecf-91ca2266e95c	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	93eb7ff0-456e-429d-8b48-ec8f83e426c7.json	\N	2021-03-28 14:41:26.977098	2021-03-28 14:41:26.977098	101
444d2bc5-63e6-4b01-b340-4b2c2d723146	\N	444d2bc5-63e6-4b01-b340-4b2c2d723146	\N	json_schema_v4	12d73844-8e59-4b1c-8d49-2716688d94c5.json	\N	2021-03-26 02:54:00.130853	2021-03-26 02:54:00.130853	1
b04d4096-abae-4791-a464-8225d60c5dbb	\N	b04d4096-abae-4791-a464-8225d60c5dbb	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 13:21:07.666664	2021-03-28 13:21:07.666664	101
ce048a75-c633-41b2-9f71-4e5c368d5d5c	\N	ce048a75-c633-41b2-9f71-4e5c368d5d5c	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 13:49:54.690831	2021-03-28 13:49:54.690831	101
7d1cb189-0200-43b0-bb5c-e68e9166fb3f	\N	7d1cb189-0200-43b0-bb5c-e68e9166fb3f	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 13:51:38.084441	2021-03-28 13:51:38.084441	101
63d8356d-acb1-48f0-9d05-9ce6c0d234e1	\N	63d8356d-acb1-48f0-9d05-9ce6c0d234e1	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	c82c59f3-2ae4-4226-9df3-82e95b30ed5f.json	\N	2021-03-28 13:52:16.319746	2021-03-28 14:02:01.204548	101
91601ee4-257c-4c5a-a93e-f9d4d1d1010c	\N	91601ee4-257c-4c5a-a93e-f9d4d1d1010c	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:04:35.834685	2021-03-28 14:04:35.834685	101
954b3872-4d46-4964-8cff-e0e0eaf7ff40	\N	954b3872-4d46-4964-8cff-e0e0eaf7ff40	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:08:00.915621	2021-03-28 14:08:00.915621	101
18358ffc-2603-4d96-85a4-cd91a5662d2b	\N	18358ffc-2603-4d96-85a4-cd91a5662d2b	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:12:20.832163	2021-03-28 14:12:20.832163	101
9f776b3b-ce70-4d31-bdbc-17dc36205582	\N	9f776b3b-ce70-4d31-bdbc-17dc36205582	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:12:36.811975	2021-03-28 14:12:36.811975	101
20273fb3-42ae-4796-b700-b1a097acbe7f	\N	20273fb3-42ae-4796-b700-b1a097acbe7f	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:18:24.697616	2021-03-28 14:18:24.697616	101
e1ca5ff0-2bec-46ea-919c-e45fdf9b2f17	\N	e1ca5ff0-2bec-46ea-919c-e45fdf9b2f17	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:21:22.814062	2021-03-28 14:21:22.814062	101
0f599c34-a78f-40fb-a4ea-af327b7f9baa	\N	0f599c34-a78f-40fb-a4ea-af327b7f9baa	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:22:26.61865	2021-03-28 14:22:26.61865	101
c9765307-c5ef-4df8-a772-42a788807ced	\N	c9765307-c5ef-4df8-a772-42a788807ced	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:26:48.368107	2021-03-28 14:26:48.368107	101
d4a808d0-3aa5-42dc-b1d4-d4f1973b3df6	\N	d4a808d0-3aa5-42dc-b1d4-d4f1973b3df6	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	\N	\N	2021-03-28 14:30:34.803163	2021-03-28 14:30:34.803163	101
0a5fa00d-43f4-45fc-9c8a-745ed1b95a43	\N	0a5fa00d-43f4-45fc-9c8a-745ed1b95a43	dinh nghia schema cho su kien bao cao nhiet do nuoc	json_schema_v4	c8a7f590-561b-4c0c-a11f-4f111fe55eea.json	\N	2021-03-28 14:30:58.836883	2021-03-28 14:30:58.836883	101
\.


--
-- Data for Name: platform_core_apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.platform_core_apps (id, name, description, type_id, instance_id, created_at, updated_at) FROM stdin;
1	nill\n	core	cfpqfd	YFpZQ-	2021-03-12 03:46:13.983005	2021-03-12 03:46:13.983005
2	nill\n	core	cfpqde	YFpZQ-	2021-03-22 01:38:08.177322	2021-03-22 01:38:08.177322
3	nill\n	core	cfpqdf	YFpZQ-	2021-03-22 01:48:57.454976	2021-03-22 01:48:57.454976
4	nill\n	core	cfpqdg	YFpZQ-	2021-03-22 09:16:41.176915	2021-03-22 09:16:41.176915
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.projects (id, user_id, name, description, created_at, updated_at, slug) FROM stdin;
1	0	eum	Aliquid rerum qui. Rerum sunt eius. Vel veritatis est.	2021-03-12 03:36:45.835181	2021-03-12 03:36:45.835181	eum
102	0	test_project	1	2021-04-05 15:00:16.407391	2021-04-05 15:00:16.407391	test_project
101	0	Nuoi-ca	Project nay chi de nuoi ca thoi nha haha	2021-03-26 15:02:16.727668	2021-04-05 14:50:29.201558	nuoi-ca
\.


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.rules (id, device_type_id, name, description, condition, created_at, updated_at, event_id) FROM stdin;
2	1	renamed	\N	event.idol < 2	2021-03-23 15:37:50.718037	2021-03-23 15:50:59.111531	\N
1	1	test rule	123456	event.a > 2	2021-03-16 15:19:23.481368	2021-03-26 03:15:16.895708	\N
4	15	Test rule	Mô tả sự kiện	event.status > 5	2021-04-12 02:26:27.945785	2021-04-12 02:26:27.945785	\N
5	15	asdasdasd	mô tả	event.test > 20	2021-04-12 02:53:09.807401	2021-04-12 02:53:09.807401	event
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schema_migrations (version) FROM stdin;
20210302040635
20210302041708
20210302084737
20210302090948
20210302091918
20210302091919
20210302094221
20210302131621
20210302132041
20210309084251
20210309085102
20210309092054
20210311131756
20210313144722
20210315060318
20210315135240
20210316135019
20210316135338
20210317025528
20210320140209
20210321081944
20210324155912
20210328141724
20210329060324
\.


--
-- Data for Name: schemas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schemas (id, project_id, name, description, schema_type, schema_file, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: state_mappings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.state_mappings (id, device_event_id, state_id, mappings, created_at, updated_at) FROM stdin;
2	4	test_state	{"humidity":"event.h * 1000"}	2021-03-22 03:17:03.157627	2021-03-22 03:17:03.157627
1	1	new_state-x	{"ok":"event.test * 2"}	2021-03-22 00:23:55.236159	2021-03-26 14:28:36.681076
6	6	current_temp	{"temp":"(event.temp - 32) * 5 / 9"}	2021-03-28 13:23:44.543252	2021-03-28 13:23:44.543252
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
0	user001	example.01@gmail.com	$2a$12$k1Dm6LTOSxEjfyB0.LzFQuJm1HhskUfBDaWruPhJRm0ZA67t6HQ4y	\N	\N	\N	2021-03-12 03:36:45.338903	2021-03-12 03:36:45.338903
\.


--
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actions_id_seq', 12, true);


--
-- Name: device_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.device_events_id_seq', 6, true);


--
-- Name: device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.device_types_id_seq', 55, true);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.devices_id_seq', 31, true);


--
-- Name: external_apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.external_apps_id_seq', 12, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 116, true);


--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.jwt_denylists_id_seq', 1, true);


--
-- Name: mosq_acls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.mosq_acls_id_seq', 43, true);


--
-- Name: mosq_auths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.mosq_auths_id_seq', 49, true);


--
-- Name: platform_core_apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.platform_core_apps_id_seq', 4, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.projects_id_seq', 102, true);


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.rules_id_seq', 5, true);


--
-- Name: schemas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.schemas_id_seq', 1, false);


--
-- Name: state_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.state_mappings_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: device_events device_events_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_events
    ADD CONSTRAINT device_events_pkey PRIMARY KEY (id);


--
-- Name: device_types device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_types
    ADD CONSTRAINT device_types_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: external_apps external_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.external_apps
    ADD CONSTRAINT external_apps_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: jwt_denylists jwt_denylists_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jwt_denylists
    ADD CONSTRAINT jwt_denylists_pkey PRIMARY KEY (id);


--
-- Name: mosq_acls mosq_acls_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mosq_acls
    ADD CONSTRAINT mosq_acls_pkey PRIMARY KEY (id);


--
-- Name: mosq_auths mosq_auths_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mosq_auths
    ADD CONSTRAINT mosq_auths_pkey PRIMARY KEY (id);


--
-- Name: object_schemas object_schemas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.object_schemas
    ADD CONSTRAINT object_schemas_pkey PRIMARY KEY (id);


--
-- Name: platform_core_apps platform_core_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.platform_core_apps
    ADD CONSTRAINT platform_core_apps_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: schemas schemas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT schemas_pkey PRIMARY KEY (id);


--
-- Name: state_mappings state_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.state_mappings
    ADD CONSTRAINT state_mappings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_actions_on_rule_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_actions_on_rule_id ON public.actions USING btree (rule_id);


--
-- Name: index_device_events_on_device_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_device_events_on_device_type_id ON public.device_events USING btree (device_type_id);


--
-- Name: index_device_types_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_device_types_on_project_id ON public.device_types USING btree (project_id);


--
-- Name: index_devices_on_device_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_devices_on_device_type_id ON public.devices USING btree (device_type_id);


--
-- Name: index_external_apps_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_external_apps_on_project_id ON public.external_apps USING btree (project_id);


--
-- Name: index_external_apps_on_slug; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_external_apps_on_slug ON public.external_apps USING btree (slug);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_jwt_denylists_on_jti; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_jwt_denylists_on_jti ON public.jwt_denylists USING btree (jti);


--
-- Name: index_mosq_auths_on_mosq_authenticatable; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_mosq_auths_on_mosq_authenticatable ON public.mosq_auths USING btree (mosq_authenticatable_type, mosq_authenticatable_id);


--
-- Name: index_object_schemas_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_object_schemas_on_project_id ON public.object_schemas USING btree (project_id);


--
-- Name: index_object_schemas_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_object_schemas_on_user_id ON public.object_schemas USING btree (user_id);


--
-- Name: index_projects_on_slug; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_projects_on_slug ON public.projects USING btree (slug);


--
-- Name: index_projects_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_projects_on_user_id ON public.projects USING btree (user_id);


--
-- Name: index_rules_on_device_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_rules_on_device_type_id ON public.rules USING btree (device_type_id);


--
-- Name: index_schemas_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_schemas_on_project_id ON public.schemas USING btree (project_id);


--
-- Name: index_state_mappings_on_device_event_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_state_mappings_on_device_event_id ON public.state_mappings USING btree (device_event_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: device_events fk_rails_0286887b26; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_events
    ADD CONSTRAINT fk_rails_0286887b26 FOREIGN KEY (device_type_id) REFERENCES public.device_types(id);


--
-- Name: devices fk_rails_64f294c7d5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT fk_rails_64f294c7d5 FOREIGN KEY (device_type_id) REFERENCES public.device_types(id);


--
-- Name: schemas fk_rails_72cac554a9; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT fk_rails_72cac554a9 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: device_types fk_rails_8f400a3c00; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device_types
    ADD CONSTRAINT fk_rails_8f400a3c00 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: external_apps fk_rails_af32157894; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.external_apps
    ADD CONSTRAINT fk_rails_af32157894 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: projects fk_rails_b872a6760a; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_b872a6760a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

