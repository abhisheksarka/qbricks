--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO abhishek;

--
-- Name: conditions; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.conditions (
    id bigint NOT NULL,
    expression character varying NOT NULL,
    conditionable_type character varying NOT NULL,
    conditionable_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.conditions OWNER TO abhishek;

--
-- Name: conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conditions_id_seq OWNER TO abhishek;

--
-- Name: conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.conditions_id_seq OWNED BY public.conditions.id;


--
-- Name: datasets; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.datasets (
    id bigint NOT NULL,
    content jsonb,
    type character varying,
    site_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.datasets OWNER TO abhishek;

--
-- Name: datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.datasets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datasets_id_seq OWNER TO abhishek;

--
-- Name: datasets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.datasets_id_seq OWNED BY public.datasets.id;


--
-- Name: flows; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.flows (
    id bigint NOT NULL,
    site_id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.flows OWNER TO abhishek;

--
-- Name: flows_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.flows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flows_id_seq OWNER TO abhishek;

--
-- Name: flows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.flows_id_seq OWNED BY public.flows.id;


--
-- Name: flows_steps; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.flows_steps (
    id bigint NOT NULL,
    flow_id bigint,
    step_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    serial double precision
);


ALTER TABLE public.flows_steps OWNER TO abhishek;

--
-- Name: flows_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.flows_steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flows_steps_id_seq OWNER TO abhishek;

--
-- Name: flows_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.flows_steps_id_seq OWNED BY public.flows_steps.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO abhishek;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.sites (
    id bigint NOT NULL,
    name character varying NOT NULL,
    code character varying NOT NULL,
    config jsonb NOT NULL,
    datamap jsonb NOT NULL,
    domain character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sites OWNER TO abhishek;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO abhishek;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.sites_id_seq OWNED BY public.sites.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.steps (
    id bigint NOT NULL,
    site_id bigint NOT NULL,
    name character varying NOT NULL,
    step_type character varying NOT NULL,
    config jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    signature jsonb,
    script text
);


ALTER TABLE public.steps OWNER TO abhishek;

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO abhishek;

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: abhishek
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    full_name character varying NOT NULL,
    phone_number character varying NOT NULL,
    country_code character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO abhishek;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO abhishek;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: conditions id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.conditions ALTER COLUMN id SET DEFAULT nextval('public.conditions_id_seq'::regclass);


--
-- Name: datasets id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.datasets ALTER COLUMN id SET DEFAULT nextval('public.datasets_id_seq'::regclass);


--
-- Name: flows id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows ALTER COLUMN id SET DEFAULT nextval('public.flows_id_seq'::regclass);


--
-- Name: flows_steps id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows_steps ALTER COLUMN id SET DEFAULT nextval('public.flows_steps_id_seq'::regclass);


--
-- Name: sites id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.sites ALTER COLUMN id SET DEFAULT nextval('public.sites_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-04-04 15:42:11.296652	2019-04-04 15:42:11.296652
\.


--
-- Data for Name: conditions; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.conditions (id, expression, conditionable_type, conditionable_id, created_at, updated_at) FROM stdin;
3	<%= 1==1 %>	Step	2	2019-04-04 18:05:32.232863	2019-04-04 18:05:32.232863
4	<%= dataset['basics']['transaction'] == 'SALE' && dataset['basics']['type'] == 'BUILDER_FLOOR_APARTMENT' %>	Flow	1	2019-04-09 16:25:53.544373	2019-04-09 16:31:55.98755
7	<%= params['basics']['status'] == 'Under Construction' %>	Step	31	2019-05-04 16:45:33.579796	2019-05-04 16:45:33.579796
8	<%= params['basics']['status'] == 'Under Construction' %>	Step	32	2019-05-04 16:46:38.295306	2019-05-04 16:46:38.295306
9	<%= params['basics']['transaction'] == 'Sale' %>	Step	33	2019-05-06 15:53:12.620785	2019-05-06 15:59:44.052434
10	<%= params['basics']['transaction'] == 'Sale' %>	Step	34	2019-05-06 16:11:30.757417	2019-05-06 17:14:10.438231
11	<%= params['basics']['transaction'] == 'Sale' %>	Step	35	2019-05-06 17:14:27.469295	2019-05-06 17:14:27.469295
12	<%= params['basics']['transaction'] == 'Sale' %>	Step	36	2019-05-06 18:03:12.612091	2019-05-06 18:03:12.612091
13	<%= params['basics']['transaction'] == 'Sale' %>	Step	37	2019-05-08 16:37:31.263903	2019-05-08 16:37:31.263903
5	<%= dataset['basics']['transaction'] == 'RENT' && dataset['basics']['type'] == 'BUILDER_FLOOR_APARTMENT' %>	Flow	2	2019-04-18 16:16:30.365608	2019-05-14 15:16:11.601862
17	<%= dataset['basics']['transaction'] == 'RENT' && dataset['basics']['type'] == 'BUILDER_FLOOR_APARTMENT' %>	Flow	5	2019-05-14 15:59:16.597053	2019-05-14 15:59:16.597053
15	<%= ['Sale', 'Rent'].include?(params['basics']['transaction']) %>	Step	39	2019-05-08 16:44:19.924998	2019-05-14 16:19:37.332061
16	<%= ['Sale', 'Rent'].include?(params['basics']['transaction']) %>	Step	40	2019-05-08 16:51:03.436189	2019-05-14 16:20:01.383006
18	<%= params['basics']['transaction'] == 'Rent' %>	Step	45	2019-05-15 14:55:41.685411	2019-05-15 14:55:41.685411
14	<%= ['Sale', 'Rent'].include?(params['basics']['transaction']) %>	Step	38	2019-05-08 16:38:54.019792	2019-05-15 14:58:25.060349
6	<%= (params['basics']['transaction'] == 'Rent') || (params['basics']['transaction'] == 'Sale' && params['basics']['status'] == 'Ready to Move') %>	Step	30	2019-05-04 16:42:04.79051	2019-05-15 15:26:36.144311
19	<%= params['basics']['status']=='Select Date' %>	Step	47	2019-05-16 16:11:27.839702	2019-05-16 16:11:27.839702
20	<%= dataset['basics']['transaction'] == 'SALE' && dataset['basics']['type'] == 'BUILDER_FLOOR_APARTMENT' %>	Flow	6	2019-05-23 14:09:07.806501	2019-05-23 14:09:07.806501
21	<%= dataset['basics']['transaction'] == 'RENT' && dataset['basics']['type'] == 'BUILDER_FLOOR_APARTMENT' %>	Flow	7	2019-05-23 14:23:41.385731	2019-05-23 14:23:41.385731
22	<%= dataset['basics']['transaction'] == 'SALE' && dataset['basics']['type'] == 'VILLA' %>	Flow	8	2019-05-23 14:25:35.642008	2019-05-23 14:25:35.642008
23	<%= dataset['basics']['transaction'] == 'RENT' && dataset['basics']['type'] == 'VILLA' %>	Flow	9	2019-05-23 14:26:44.402745	2019-05-23 14:26:44.402745
24	<%= dataset['basics']['transaction'] == 'RENT' && dataset['basics']['type'] == 'VILLA' %>	Flow	10	2019-05-23 14:31:24.579623	2019-05-23 14:31:24.579623
\.


--
-- Data for Name: datasets; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.datasets (id, content, type, site_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flows; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.flows (id, site_id, name, created_at, updated_at) FROM stdin;
1	1	Sale of Builder Floor Apartment	2019-04-04 17:14:48.742893	2019-04-04 17:14:48.742893
5	1	Rent of Builder Floor Apartment	2019-05-14 15:58:50.083692	2019-05-14 15:59:16.547459
6	2	Sale of Builder Floor Apartment	2019-05-23 14:09:07.737874	2019-05-23 14:09:07.737874
7	2	Rent of Builder Floor Apartment	2019-05-23 14:23:41.362577	2019-05-23 14:23:41.362577
8	2	Sale of Villa	2019-05-23 14:25:35.555433	2019-05-23 14:25:35.555433
10	2	Rent of Villa	2019-05-23 14:31:24.567415	2019-05-23 14:31:24.567415
\.


--
-- Data for Name: flows_steps; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.flows_steps (id, flow_id, step_id, created_at, updated_at, serial) FROM stdin;
37	1	17	2019-04-20 14:45:43.998746	2019-04-20 14:46:08.544835	13
36	1	16	2019-04-18 16:58:12.677213	2019-04-20 14:46:13.858615	14
38	1	18	2019-04-20 18:02:06.419448	2019-04-20 18:06:37.780903	15
39	1	19	2019-04-20 18:02:54.417278	2019-04-20 18:06:43.493647	16
40	1	20	2019-04-21 12:03:06.001914	2019-04-21 12:03:25.869727	17
41	1	21	2019-04-21 12:05:07.955178	2019-04-21 12:06:39.53286	18
42	1	22	2019-04-21 12:06:19.822565	2019-04-21 12:06:44.092988	19
43	1	23	2019-04-21 12:12:37.738827	2019-04-21 12:12:58.035636	20
44	1	24	2019-04-21 12:36:37.050051	2019-04-21 12:51:44.72399	21
45	1	25	2019-04-21 12:51:21.419116	2019-04-21 12:51:48.325079	22
46	1	26	2019-04-21 12:53:21.436629	2019-04-21 12:54:07.014367	23
47	1	27	2019-04-21 12:53:56.234078	2019-04-21 12:54:11.207441	24
48	1	28	2019-05-01 16:48:03.85879	2019-05-01 16:48:03.85879	26
49	1	29	2019-05-01 16:54:56.126326	2019-05-01 16:54:56.126326	27
50	1	30	2019-05-02 16:05:37.11033	2019-05-02 16:05:37.11033	28
26	1	12	2019-04-15 16:53:44.543565	2019-04-16 15:51:08.219011	9
51	1	31	2019-05-04 16:45:33.642247	2019-05-04 16:45:33.642247	29
52	1	32	2019-05-04 16:46:38.311194	2019-05-04 16:46:38.311194	30
53	1	33	2019-05-06 15:53:12.65036	2019-05-06 15:53:12.65036	31
54	1	34	2019-05-06 16:11:30.810303	2019-05-06 16:11:30.810303	32
4	1	4	2019-04-08 16:07:04.307873	2019-04-16 16:36:21.512774	1
22	1	5	2019-04-15 14:22:11.553504	2019-04-18 16:17:15.782129	2
55	1	35	2019-05-06 17:14:27.482608	2019-05-06 17:14:27.482608	33
56	1	36	2019-05-06 18:03:12.644135	2019-05-06 18:03:12.644135	34
57	1	37	2019-05-08 16:33:22.027109	2019-05-08 16:33:22.027109	35
8	1	6	2019-04-08 17:31:34.323879	2019-04-18 16:26:26.626257	3
23	1	7	2019-04-15 14:28:03.574057	2019-04-18 16:26:36.441543	4
11	1	8	2019-04-08 17:37:40.463174	2019-04-18 16:26:46.137017	5
12	1	9	2019-04-08 17:39:26.569025	2019-04-18 16:27:02.015049	6
13	1	10	2019-04-09 16:11:59.076245	2019-04-18 16:27:11.326916	7
27	1	11	2019-04-15 16:54:35.095776	2019-04-18 16:27:35.022745	8
58	1	38	2019-05-08 16:38:54.035652	2019-05-08 16:38:54.035652	36
60	1	40	2019-05-08 16:51:03.455524	2019-05-08 16:51:03.455524	38
30	1	13	2019-04-18 16:35:03.418337	2019-04-18 16:39:42.368213	10
59	1	39	2019-05-08 16:44:26.437433	2019-05-12 17:18:08.957199	37
62	1	42	2019-05-12 17:26:03.352421	2019-05-12 17:26:33.442062	39
61	1	41	2019-05-09 16:45:26.336092	2019-05-12 17:26:44.41343	40
33	1	14	2019-04-18 16:46:43.83084	2019-04-18 16:51:32.624325	11
34	1	15	2019-04-18 16:57:28.024761	2019-04-18 16:57:28.024761	12
63	1	43	2019-05-12 17:29:47.805085	2019-05-12 17:29:47.805085	41
64	1	44	2019-05-12 17:30:54.782723	2019-05-12 17:30:54.782723	42
109	5	5	2019-05-14 15:58:50.097711	2019-05-14 15:58:50.097711	2
110	5	6	2019-05-14 15:58:50.099925	2019-05-14 15:58:50.099925	3
111	5	7	2019-05-14 15:58:50.101838	2019-05-14 15:58:50.101838	4
112	5	8	2019-05-14 15:58:50.117677	2019-05-14 15:58:50.117677	5
113	5	9	2019-05-14 15:58:50.121543	2019-05-14 15:58:50.121543	6
114	5	10	2019-05-14 15:58:50.128574	2019-05-14 15:58:50.128574	7
115	5	11	2019-05-14 15:58:50.131334	2019-05-14 15:58:50.131334	8
116	5	12	2019-05-14 15:58:50.134084	2019-05-14 15:58:50.134084	9
117	5	13	2019-05-14 15:58:50.136403	2019-05-14 15:58:50.136403	10
118	5	14	2019-05-14 15:58:50.1386	2019-05-14 15:58:50.1386	11
119	5	15	2019-05-14 15:58:50.142761	2019-05-14 15:58:50.142761	12
120	5	17	2019-05-14 15:58:50.145697	2019-05-14 15:58:50.145697	13
121	5	16	2019-05-14 15:58:50.14804	2019-05-14 15:58:50.14804	14
122	5	18	2019-05-14 15:58:50.15008	2019-05-14 15:58:50.15008	15
123	5	19	2019-05-14 15:58:50.152562	2019-05-14 15:58:50.152562	16
124	5	20	2019-05-14 15:58:50.168072	2019-05-14 15:58:50.168072	17
125	5	21	2019-05-14 15:58:50.171941	2019-05-14 15:58:50.171941	18
126	5	22	2019-05-14 15:58:50.178443	2019-05-14 15:58:50.178443	19
127	5	23	2019-05-14 15:58:50.18121	2019-05-14 15:58:50.18121	20
128	5	24	2019-05-14 15:58:50.184062	2019-05-14 15:58:50.184062	21
129	5	25	2019-05-14 15:58:50.18626	2019-05-14 15:58:50.18626	22
130	5	26	2019-05-14 15:58:50.188496	2019-05-14 15:58:50.188496	23
131	5	27	2019-05-14 15:58:50.193278	2019-05-14 15:58:50.193278	24
143	5	39	2019-05-14 15:58:50.24863	2019-05-14 15:58:50.24863	37
144	5	40	2019-05-14 15:58:50.251314	2019-05-14 15:58:50.251314	38
145	5	42	2019-05-14 15:58:50.253393	2019-05-14 15:58:50.253393	39
146	5	41	2019-05-14 15:58:50.267746	2019-05-14 15:58:50.267746	40
147	5	43	2019-05-14 15:58:50.272572	2019-05-14 15:58:50.272572	41
148	5	44	2019-05-14 15:58:50.277336	2019-05-14 15:58:50.277336	42
149	5	45	2019-05-15 14:55:41.750514	2019-05-15 14:56:17.461649	25
150	5	38	2019-05-15 14:58:25.08137	2019-05-15 14:58:45.166197	26
108	5	4	2019-05-14 15:58:50.09451	2019-05-15 15:32:59.139937	1
152	5	46	2019-05-16 15:57:34.463154	2019-05-16 15:58:17.491629	24.1000000000000014
151	5	30	2019-05-15 15:26:36.161524	2019-05-16 15:58:29.169019	24.1999999999999993
153	5	47	2019-05-16 16:11:27.925459	2019-05-16 16:12:04.329015	24.3000000000000007
154	5	48	2019-05-21 14:35:51.987661	2019-05-21 14:40:19.317609	20.1000000000000014
155	5	49	2019-05-21 14:36:41.154595	2019-05-21 14:40:27.431037	20.1999999999999993
156	5	50	2019-05-21 14:38:04.837402	2019-05-21 14:40:34.324435	20.3000000000000007
157	5	51	2019-05-21 14:38:48.596115	2019-05-21 14:40:40.497551	20.3999999999999986
158	6	52	2019-05-23 14:34:03.338705	2019-05-23 14:34:03.338705	81
159	7	52	2019-05-23 14:34:03.348216	2019-05-23 14:34:03.348216	82
160	8	52	2019-05-23 14:34:03.355342	2019-05-23 14:34:03.355342	83
161	10	52	2019-05-23 14:34:03.364661	2019-05-23 14:34:03.364661	84
162	6	53	2019-05-27 14:32:29.682466	2019-05-27 14:32:29.682466	85
163	7	53	2019-05-27 14:32:29.742737	2019-05-27 14:32:29.742737	86
164	8	53	2019-05-27 14:32:29.76748	2019-05-27 14:32:29.76748	87
165	10	53	2019-05-27 14:32:29.783973	2019-05-27 14:32:29.783973	88
166	6	54	2019-05-27 14:33:12.120482	2019-05-27 14:33:12.120482	89
167	7	54	2019-05-27 14:33:12.214952	2019-05-27 14:33:12.214952	90
168	8	54	2019-05-27 14:33:12.224391	2019-05-27 14:33:12.224391	91
169	10	54	2019-05-27 14:33:12.233816	2019-05-27 14:33:12.233816	92
170	6	55	2019-05-27 14:34:39.054104	2019-05-27 14:34:39.054104	93
171	7	55	2019-05-27 14:34:39.063158	2019-05-27 14:34:39.063158	94
172	8	55	2019-05-27 14:34:39.117348	2019-05-27 14:34:39.117348	95
173	10	55	2019-05-27 14:34:39.127035	2019-05-27 14:34:39.127035	96
183	7	58	2019-05-27 15:30:17.764154	2019-05-27 15:31:21.096401	82.5
182	6	58	2019-05-27 15:30:17.632268	2019-05-27 15:30:41.372651	81.5
184	8	58	2019-05-27 15:30:17.773522	2019-05-27 15:37:18.347441	83.5
185	10	58	2019-05-27 15:30:17.804485	2019-05-27 15:37:35.062256	84.5
186	6	59	2019-05-28 14:40:07.874166	2019-05-28 14:40:07.874166	101
187	7	59	2019-05-28 14:40:07.929045	2019-05-28 14:40:07.929045	102
188	8	59	2019-05-28 14:40:07.94034	2019-05-28 14:40:07.94034	103
189	10	59	2019-05-28 14:40:07.954299	2019-05-28 14:40:07.954299	104
190	6	60	2019-05-29 15:47:12.071144	2019-05-29 15:47:12.071144	105
192	8	60	2019-05-29 15:47:12.100381	2019-05-29 15:47:12.100381	107
193	10	60	2019-05-29 15:47:12.109008	2019-05-29 15:47:12.109008	108
191	7	60	2019-05-29 15:47:12.089203	2019-05-29 15:47:31.807213	95
194	6	61	2019-05-29 16:07:06.271644	2019-05-29 16:07:06.271644	109
196	8	61	2019-05-29 16:07:06.293795	2019-05-29 16:07:06.293795	111
197	10	61	2019-05-29 16:07:06.30257	2019-05-29 16:07:06.30257	112
195	7	61	2019-05-29 16:07:06.283693	2019-05-29 16:07:33.350619	94.5
198	6	62	2019-05-31 15:17:09.023411	2019-05-31 15:17:09.023411	113
199	7	62	2019-05-31 15:17:09.042283	2019-05-31 15:17:09.042283	114
200	8	62	2019-05-31 15:17:09.09986	2019-05-31 15:17:09.09986	115
201	10	62	2019-05-31 15:17:09.138347	2019-05-31 15:17:09.138347	116
202	6	63	2019-05-31 15:32:00.300933	2019-05-31 15:32:00.300933	117
203	7	63	2019-05-31 15:32:00.323892	2019-05-31 15:32:00.323892	118
204	8	63	2019-05-31 15:32:00.345967	2019-05-31 15:32:00.345967	119
205	10	63	2019-05-31 15:32:00.361463	2019-05-31 15:32:00.361463	120
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.schema_migrations (version) FROM stdin;
20190207081725
20190207081842
20190207081851
20190207082724
20190213102903
20190214111415
20190214111416
20190214111417
20190214111418
20190214111419
20190214111420
20190606153901
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.sites (id, name, code, config, datamap, domain, created_at, updated_at) FROM stdin;
1	Magic Bricks	mb	{"browser_type": "chrome"}	{"_var_": {"months": {"1": "January", "2": "February", "3": "March", "4": "April", "5": "May", "6": "June", "7": "July", "8": "August", "9": "September", "10": "October", "11": "November", "12": "December"}, "area_units": {"are": "Are", "acre": "Acre", "cent": "Cent", "rood": "Rood", "sq-m": "Sq-m", "bigha": "Bigha", "kanal": "Kanal", "marla": "Marla", "perch": "Perch", "sq-ft": "Sq-ft", "biswa1": "Biswa1", "biswa2": "Biswa2", "chatak": "Chatak", "ground": "Ground", "guntha": "Guntha", "kottah": "Kottah", "sq-yrd": "Sq-yrd", "hectare": "Hectare", "aankadam": "Aankadam"}, "basics_type": {"VILLA": "Villa", "RESIDENTIAL_HOUSE": "Residential House", "MULTISTOREY_APARTMENT": "Multistorey Apartment", "BUILDER_FLOOR_APARTMENT": "Builder Floor Apartment"}, "basics_status": {"READY_FOR_RENT_NOW": "Immediately", "READY_FOR_SALE_NOW": "Ready to Move", "READY_FOR_RENT_FROM": "Select Date", "READY_FOR_SALE_FROM": "Under Construction"}, "price_frequency": {"WEEKLY": "Weekly", "YEARLY": "Yearly", "MONTHLY": "Monthly", "ONE_TIME": "One-Time", "QUARTERLY": "Quarterly", "PER_SQUARE_UNIT_MONTHLY": "Per sq. Unit Monthly"}, "basics_transaction": {"PG": "PG", "RENT": "Rent", "SALE": "Sale"}, "basics_transaction_type": {"RESALE": "Resale", "NEW_PROPERTY": "New Property"}}, "basics": {"type": {"_var_": "basics_type"}, "status": {"_var_": "basics_status"}, "transaction": {"_var_": "basics_transaction"}, "age_in_years": {"_r_": {"..0": "New Construction", "1..4": "Less than 5 years", "20..": "Above 20 years", "5..10": "5 to 10 years", "11..15": "10 to 15 years", "16..20": "15 to 20 years"}}, "transaction_type": {"_var_": "basics_transaction_type"}, "sale_available_from": {"month": {"_var_": "months"}}}, "prices": {"maintenance": {"frequency": {"_var_": "price_frequency"}}}, "features": {"floor": {"0": "Ground", "-1": "Upper Basement", "-2": "Lower Basement"}, "bedrooms": {"_r_": {"11..": "> 10"}}, "balconies": {"_r_": {"11..": "> 10"}}, "bathrooms": {"0": "None", "_r_": {"11..": "> 10"}}, "furnishing": {"FURNISHED": "Furnished", "UNFURNISHED": "Unfurnished", "SEMI_FURNISHED": "Semi-Furnished"}}, "location": {"city": {"Bengaluru": "Bangalore"}}, "dimensions": {"carpet_area": {"unit": {"_var_": "area_units"}}, "covered_area": {"unit": {"_var_": "area_units"}}}, "furnishing": {"ac": {"_r_": {"..0": "Select", "4..": "3+"}}, "tv": {"_r_": {"..0": "Select", "4..": "3+"}}, "bed": {"_r_": {"..0": "Select", "4..": "3+"}}, "wardrobe": {"_r_": {"..0": "Select", "4..": "3+"}}}}	www.magicbricks.com	2019-04-04 15:46:38.091393	2019-05-21 14:58:05.684716
2	CommonFloor	cf	{"browser_type": "chrome"}	{"auth": {"role": {"agent": "Broker"}}, "location": {"city": {"Bengaluru": "Bangalore"}}}	www.commonfloor.com	2019-05-21 15:26:49.203975	2019-05-31 15:27:12.50577
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.steps (id, site_id, name, step_type, config, created_at, updated_at, signature, script) FROM stdin;
6	1	Next	nclick	{"button": "Next", "nearest": "button"}	2019-04-08 17:27:08.831961	2019-04-08 17:31:34.286912	\N	\N
10	1	Close Buy Dialog	m_click	{"a": {"class": "md-close"}}	2019-04-09 16:11:58.997602	2019-04-09 16:11:58.997602	\N	\N
8	1	Login	nclick	{"button": "Login", "nearest": "button"}	2019-04-08 17:37:40.405507	2019-04-08 17:37:40.405507	\N	\N
9	1	Open Listing Page	goto	{"url": "https://post.magicbricks.com/"}	2019-04-08 17:39:26.54559	2019-04-08 17:39:26.54559	\N	\N
29	1	Status	nset	{"set": true, "label": "<%= params['basics']['status'] %>", "nearest": "radio"}	2019-05-01 16:54:56.1117	2019-05-01 16:54:56.1117	\N	
7	1	Enter Password	nset	{"set": "<%= params['auth']['pwd'] %>", "label": "Password", "nearest": "text_field"}	2019-04-08 17:34:18.374361	2019-04-15 14:28:03.507071	\N	\N
12	1	Property Type	nset	{"div": {"class": "formLabel", "visible_text": "Property Type"}, "set": "<%= params['basics']['type'] %>", "nearest": "select"}	2019-04-09 18:00:18.818261	2019-04-15 16:53:44.490661	\N	\N
11	1	Property For	nset	{"set": true, "label": "<%= params['basics']['transaction'] %>", "nearest": "radio"}	2019-04-09 17:44:56.237586	2019-04-15 16:54:35.038174	\N	\N
14	1	Locality	nset	{"div": {"class": "formLabel", "visible_text": "Locality"}, "set": "<%= params['location']['locality']%>", "nearest": "text_field"}	2019-04-18 16:32:37.029131	2019-04-18 16:33:46.730939	\N	\N
13	1	City	nset	{"div": {"class": "formLabel", "visible_text": "City"}, "set": "<%= params['location']['city'] %>", "nearest": "select"}	2019-04-09 18:12:52.532004	2019-04-18 16:35:03.397962	\N	\N
15	1	Complex	nset	{"div": {"class": "formLabel", "visible_text": "Name of Project/Society"}, "set": "<%= params['location']['complex']%>", "nearest": "text_field"}	2019-04-18 16:57:28.006246	2019-04-18 16:57:28.006246	\N	\N
16	1	Unit	nset	{"div": {"class": "formLabel", "visible_text": "Address"}, "set": "<%= params['location']['unit']%>", "nearest": "text_field"}	2019-04-18 16:58:12.62551	2019-04-18 16:58:12.62551	\N	\N
17	1	Body click	m_click	{"body": {"index": 0}}	2019-04-20 14:45:43.979706	2019-04-20 14:45:43.979706	\N	\N
23	1	Bathrooms	m_set	{"set": "<%= params['features']['bathrooms'] %>", "select": {"id": "bathrooms"}}	2019-04-21 12:12:37.720529	2019-04-21 12:12:37.720529	\N	\N
36	1	Price includes Club Membership	nset	{"set": "<%=params['prices']['sale']['includes']['club_membership']%>", "label": "Club Membership", "nearest": "checkbox", "body_click": true}	2019-05-06 18:03:12.599617	2019-05-06 18:25:44.104327	\N	
4	1	Open Login Page	goto	{"url": "https://www.magicbricks.com/userLogin"}	2019-04-08 16:07:04.281331	2019-05-01 16:14:24.966746	\N	
5	1	Enter Email	nset	{"set": "<%= params['auth']['uid']%>", "label": "Enter Email or Mobile to Login", "nearest": "text_field"}	2019-04-08 16:13:32.471182	2019-05-01 16:20:45.228859	\N	
28	1	Transaction Type	nset	{"set": true, "label": "<%= params['basics']['transaction_type'] %>", "nearest": "radio"}	2019-05-01 16:48:03.818926	2019-05-01 16:48:03.818926	\N	
35	1	Price includes Car Parking	nset	{"set": "<%=params['prices']['sale']['includes']['car_parking']%>", "label": "Car Parking", "nearest": "checkbox", "body_click": true}	2019-05-06 17:14:27.419453	2019-05-06 18:25:28.614657	\N	
34	1	Price includes PLC	nset	{"set": "<%=params['prices']['sale']['includes']['plc']%>", "label": "PLC", "nearest": "checkbox", "body_click": true}	2019-05-06 16:11:30.736413	2019-05-08 16:27:58.908493	\N	
42	1	Select Exterior Photos	m_click	{"a": {"visible_text": "Exterior View"}}	2019-05-12 17:26:03.289687	2019-05-12 17:28:37.502784	\N	
43	1	Select Living Room Photos	m_click	{"a": {"visible_text": "Living Room"}}	2019-05-12 17:29:47.788059	2019-05-12 17:29:47.788059	\N	
44	1	Upload Living Room Photos	m_set	{"set": "<%=params['photos']['living_rooms']['urls']%>", "after_wait": 5, "file_field": {"id": "fileupload"}}	2019-05-12 17:30:54.751981	2019-05-14 15:11:17.337849	\N	
41	1	Upload Exterior Photos	m_set	{"set": "<%=params['photos']['exteriors']['urls']%>", "after_wait": 5, "file_field": {"id": "fileupload"}}	2019-05-09 16:45:26.274675	2019-05-14 15:11:20.000146	\N	
55	2	Login	m_click	{"input": {"type": "button", "value": "Login"}}	2019-05-27 14:34:38.953548	2019-05-27 15:10:33.941548	\N	
60	2	Page load wait	m_click	{"input": {"id": "UserName"}}	2019-05-29 15:47:12.030884	2019-05-29 16:05:42.954435	\N	
46	1	Rent Status	nset	{"set": true, "label": "<%= params['basics']['status'] %>", "nearest": "radio"}	2019-05-16 15:57:34.441069	2019-05-16 15:57:34.441069	\N	
59	2	User Role	js_click	{"li": {"id": "<%= params['auth']['role'] %>"}}	2019-05-28 14:40:07.618924	2019-05-29 15:38:05.469752	\N	
52	2	Open Listing Page	goto	{"url": "https://www.commonfloor.com/list-your-property"}	2019-05-23 14:34:03.303234	2019-05-27 15:33:12.621446	\N	
45	1	Rent Price	m_set	{"set": "<%=params['prices']['rent']['value']%>", "input": {"id": "totalPrice"}}	2019-05-15 14:55:41.574279	2019-05-15 14:55:41.574279	\N	
47	1	Rent From Date	m_set	{"js": true, "set": "<%=params['basics']['rent_available_from']['day'] + '-' + params['basics']['rent_available_from']['month'] + '-' + params['basics']['rent_available_from']['year']%>", "input": {"id": "availableDateStr"}}	2019-05-16 16:11:27.817106	2019-05-16 16:29:43.601151	\N	
58	2	Open Login Modal	goto	{}	2019-05-27 15:30:17.564742	2019-05-31 15:05:05.285821	\N	$(\r\n    function () { \r\n        CfAppActions.getLogin('sign-in'); \r\n        CfAppActions.pushAnalytics('hp-login-click', 'log-in');\r\n    }\r\n)
61	2	After login open listing	goto	{"url": "https://www.commonfloor.com/list-your-property"}	2019-05-29 16:07:06.258375	2019-05-29 16:07:06.258375	\N	
24	1	Covered Area	m_set	{"set": "<%= params['dimensions']['covered_area']['value'] %>", "input": {"id": "coveredArea"}}	2019-04-21 12:36:37.001336	2019-04-21 12:51:01.292567	\N	\N
25	1	Carpet Area	m_set	{"set": "<%= params['dimensions']['carpet_area']['value'] %>", "input": {"id": "carpetArea"}}	2019-04-21 12:51:21.404833	2019-04-21 12:51:21.404833	\N	\N
26	1	Covered Area Unit	m_set	{"set": "<%= params['dimensions']['covered_area']['unit'] %>", "select": {"id": "coveredAreaType"}}	2019-04-21 12:53:21.381496	2019-04-21 12:53:21.381496	\N	\N
27	1	Carpet Area Unit	m_set	{"set": "<%= params['dimensions']['carpet_area']['unit'] %>", "select": {"id": "carpetAreaType"}}	2019-04-21 12:53:56.183001	2019-04-21 12:53:56.183001	\N	\N
30	1	Age of Construction	m_set	{"set": "<%= params['basics']['age_in_years']%>", "select": {"id": "ageofcons"}}	2019-05-02 16:05:37.045948	2019-05-02 16:05:37.045948	\N	
19	1	Balconies	m_set	{"set": "<%= params['features']['balconies'] %>", "select": {"id": "balconies"}}	2019-04-20 18:02:54.403707	2019-04-21 06:51:25.589702	\N	\N
18	1	Bedrooms	m_set	{"set": "<%= params['features']['bedrooms'] %>", "select": {"id": "bedrooms"}}	2019-04-20 18:02:06.37406	2019-04-21 11:35:12.083085	\N	\N
20	1	Floor	m_set	{"set": "<%= params['features']['floor'] %>", "select": {"id": "floorNumber"}}	2019-04-21 12:03:05.965986	2019-04-21 12:03:05.965986	\N	\N
21	1	Total Floors	m_set	{"set": "<%= params['features']['floors_total'] %>", "select": {"id": "totalFloorNumber"}}	2019-04-21 12:05:07.899692	2019-04-21 12:05:07.899692	\N	\N
22	1	Furnishing	m_set	{"set": "<%= params['features']['furnishing'] %>", "select": {"id": "furnished"}}	2019-04-21 12:06:19.811346	2019-04-21 12:06:19.811346	\N	\N
32	1	Available From Year	m_set	{"js": true, "set": "<%= params['basics']['sale_available_from']['year'] %>", "select": {"id": "availFromYear"}}	2019-05-04 16:46:38.284648	2019-05-16 16:28:55.123781	\N	
33	1	Sale Price	m_set	{"set": "<%= params[:prices][:sale][:value] %>", "input": {"id": "totalPrice"}}	2019-05-06 15:53:12.55185	2019-05-06 15:53:12.55185	\N	
38	1	Booking Amount	m_set	{"set": "<%=params['prices']['booking_deposit']['value']%>", "input": {"id": "bookingAmount"}}	2019-05-08 16:38:54.004021	2019-05-15 14:58:57.476949	\N	
51	1	Rent TV Count	m_set	{"js": true, "set": "<%= params['furnishing']['tv'] %>", "select": {"id": "tvCount"}}	2019-05-21 14:38:48.579986	2019-05-21 15:17:06.044006	\N	
49	1	Rent Bed Count	m_set	{"js": true, "set": "<%= params['furnishing']['bed'] %>", "select": {"id": "bedCount"}}	2019-05-21 14:36:41.099919	2019-05-21 15:17:23.33685	\N	
48	1	Rent AC Count	m_set	{"js": true, "set": "<%= params['furnishing']['ac'] %>", "select": {"id": "acCount"}}	2019-05-21 14:35:51.921437	2019-05-21 15:17:37.346474	\N	
50	1	Rent Wadrobe Count	m_set	{"js": true, "set": "<%= params['furnishing']['wardrobe'] %>", "select": {"id": "wardrobeCount"}}	2019-05-21 14:38:04.819335	2019-05-21 15:17:57.476701	\N	
54	2	Enter Password	m_set	{"set": "<%= params['auth']['pwd'] %>", "input": {"id": "login-password-id"}}	2019-05-27 14:33:12.061881	2019-05-27 15:09:57.896199	\N	
53	2	Enter Email	m_set	{"set": "<%= params['auth']['uid'] %>", "input": {"id": "login-email-id"}}	2019-05-27 14:32:29.472555	2019-05-27 15:10:01.686465	\N	
37	1	Price includes Stamp and Registration Charges	m_set	{"set": "<%=params['prices']['sale']['includes']['stamp_and_registration']%>", "input": {"id": "stampAndOtherCharges", "type": "checkbox"}, "body_click": true}	2019-05-08 16:33:21.985799	2019-05-08 16:33:21.985799	\N	
39	1	Maintenance Value	m_set	{"set": "<%=params['prices']['maintenance']['value']%>", "input": {"id": "maintenanceCharges"}}	2019-05-08 16:44:19.885005	2019-05-08 16:44:19.885005	\N	
40	1	Maintenance Frequency	m_set	{"js": true, "set": "<%= params['prices']['maintenance']['frequency'] %>", "select": {"id": "maintenanceChargeFrequency"}}	2019-05-08 16:51:03.420418	2019-05-08 16:56:12.373437	\N	
31	1	Available From Month	m_set	{"js": true, "set": "<%= params['basics']['sale_available_from']['month'] %>", "select": {"id": "availFromMonth"}}	2019-05-04 16:45:33.561896	2019-05-16 16:28:44.65228	\N	
63	2	Autocomplete Locality	js_autocomplete	{"set": "<%= params['location']['locality'] %>", "input": {"id": "pap-basic-locality"}, "triggers": ["click"], "autocomplete": {"ul": {"id": "pap-basic-locality-select"}, "items": "li", "before_wait": 1}}	2019-05-31 15:32:00.247761	2019-06-02 16:54:42.421885	\N	
62	2	Autocomplete City	js_autocomplete	{"set": "<%= params['location']['city'] %>", "input": {"id": "pap-basic-city"}, "autocomplete": {"ul": {"id": "pap-basic-city-select"}, "items": "li", "before_wait": 1}}	2019-05-31 15:17:08.879542	2019-06-02 16:56:56.849032	\N	
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.users (id, full_name, phone_number, country_code, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.conditions_id_seq', 24, true);


--
-- Name: datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.datasets_id_seq', 1, false);


--
-- Name: flows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.flows_id_seq', 10, true);


--
-- Name: flows_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.flows_steps_id_seq', 205, true);


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.sites_id_seq', 2, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.steps_id_seq', 63, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: conditions conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.conditions
    ADD CONSTRAINT conditions_pkey PRIMARY KEY (id);


--
-- Name: datasets datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (id);


--
-- Name: flows flows_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows
    ADD CONSTRAINT flows_pkey PRIMARY KEY (id);


--
-- Name: flows_steps flows_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows_steps
    ADD CONSTRAINT flows_steps_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_conditions_on_conditionable_type_and_conditionable_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_conditions_on_conditionable_type_and_conditionable_id ON public.conditions USING btree (conditionable_type, conditionable_id);


--
-- Name: index_conditions_on_expression; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_conditions_on_expression ON public.conditions USING btree (expression);


--
-- Name: index_datasets_on_site_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_datasets_on_site_id ON public.datasets USING btree (site_id);


--
-- Name: index_flows_on_name; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_flows_on_name ON public.flows USING btree (name);


--
-- Name: index_flows_on_site_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_flows_on_site_id ON public.flows USING btree (site_id);


--
-- Name: index_flows_steps_on_flow_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_flows_steps_on_flow_id ON public.flows_steps USING btree (flow_id);


--
-- Name: index_flows_steps_on_step_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_flows_steps_on_step_id ON public.flows_steps USING btree (step_id);


--
-- Name: index_sites_on_code; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_sites_on_code ON public.sites USING btree (code);


--
-- Name: index_sites_on_domain; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_sites_on_domain ON public.sites USING btree (domain);


--
-- Name: index_sites_on_name; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_sites_on_name ON public.sites USING btree (name);


--
-- Name: index_steps_on_name; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_steps_on_name ON public.steps USING btree (name);


--
-- Name: index_steps_on_site_id; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_steps_on_site_id ON public.steps USING btree (site_id);


--
-- Name: index_steps_on_step_type; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE INDEX index_steps_on_step_type ON public.steps USING btree (step_type);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_phone_number; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE UNIQUE INDEX index_users_on_phone_number ON public.users USING btree (phone_number);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: abhishek
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: flows_steps fk_rails_16d05a7368; Type: FK CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows_steps
    ADD CONSTRAINT fk_rails_16d05a7368 FOREIGN KEY (flow_id) REFERENCES public.flows(id);


--
-- Name: steps fk_rails_61d6b3062e; Type: FK CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT fk_rails_61d6b3062e FOREIGN KEY (site_id) REFERENCES public.sites(id);


--
-- Name: flows_steps fk_rails_aa8bcef8b3; Type: FK CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows_steps
    ADD CONSTRAINT fk_rails_aa8bcef8b3 FOREIGN KEY (step_id) REFERENCES public.steps(id);


--
-- Name: flows fk_rails_b36fda4fd7; Type: FK CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.flows
    ADD CONSTRAINT fk_rails_b36fda4fd7 FOREIGN KEY (site_id) REFERENCES public.sites(id);


--
-- Name: datasets fk_rails_cf1a97a02e; Type: FK CONSTRAINT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT fk_rails_cf1a97a02e FOREIGN KEY (site_id) REFERENCES public.sites(id);


--
-- PostgreSQL database dump complete
--

