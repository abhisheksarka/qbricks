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
    serial integer
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
    signature jsonb
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
5	<%= dataset['basics']['transaction'] == 'SALE' && dataset['basics']['type'] == 'VILLA' %>	Flow	2	2019-04-18 16:16:30.365608	2019-04-18 16:16:30.365608
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
2	1	Sale of Villa	2019-04-15 17:07:29.464592	2019-04-15 17:07:29.464592
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
26	1	12	2019-04-15 16:53:44.543565	2019-04-16 15:51:08.219011	9
4	1	4	2019-04-08 16:07:04.307873	2019-04-16 16:36:21.512774	1
22	1	5	2019-04-15 14:22:11.553504	2019-04-18 16:17:15.782129	2
8	1	6	2019-04-08 17:31:34.323879	2019-04-18 16:26:26.626257	3
23	1	7	2019-04-15 14:28:03.574057	2019-04-18 16:26:36.441543	4
11	1	8	2019-04-08 17:37:40.463174	2019-04-18 16:26:46.137017	5
12	1	9	2019-04-08 17:39:26.569025	2019-04-18 16:27:02.015049	6
13	1	10	2019-04-09 16:11:59.076245	2019-04-18 16:27:11.326916	7
27	1	11	2019-04-15 16:54:35.095776	2019-04-18 16:27:35.022745	8
30	1	13	2019-04-18 16:35:03.418337	2019-04-18 16:39:42.368213	10
33	1	14	2019-04-18 16:46:43.83084	2019-04-18 16:51:32.624325	11
34	1	15	2019-04-18 16:57:28.024761	2019-04-18 16:57:28.024761	12
35	2	15	2019-04-18 16:57:28.037583	2019-04-18 16:57:28.037583	13
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
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.sites (id, name, code, config, datamap, domain, created_at, updated_at) FROM stdin;
1	Magic Bricks	mb	{"browser_type": "chrome"}	{"basics": {"type": {"VILLA": "Villa", "RESIDENTIAL_HOUSE": "Residential House", "MULTISTOREY_APARTMENT": "Multistorey Apartment", "BUILDER_FLOOR_APARTMENT": "Builder Floor Apartment"}, "transaction": {"PG": "PG", "RENT": "Rent", "SALE": "Sale"}}, "features": {"floor": {"0": "Ground", "-1": "Upper Basement", "-2": "Lower Basement"}, "bedrooms": {"11..": "> 10"}, "balconies": {"11..": "> 10"}, "bathrooms": {"0": "None", "11..": "> 10"}, "furnishing": {"FURNISHED": "Furnished", "UNFURNISHED": "Unfurnished", "SEMI_FURNISHED": "Semi-Furnished"}}, "location": {"city": {"Bengaluru": "Bangalore"}}}	www.magicbricks.com	2019-04-04 15:46:38.091393	2019-04-21 12:13:39.953242
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY public.steps (id, site_id, name, step_type, config, created_at, updated_at, signature) FROM stdin;
23	1	Bathrooms	mset	{"set": "<%= params['features']['bathrooms'] %>", "select": {"id": "bathrooms"}}	2019-04-21 12:12:37.720529	2019-04-21 12:12:37.720529	\N
4	1	Open Login Page	goto	{"url": "https://www.magicbricks.com/userLogin"}	2019-04-08 16:07:04.281331	2019-04-08 16:07:04.281331	\N
6	1	Next	nclick	{"button": "Next", "nearest": "button"}	2019-04-08 17:27:08.831961	2019-04-08 17:31:34.286912	\N
8	1	Login	nclick	{"button": "Login", "nearest": "button"}	2019-04-08 17:37:40.405507	2019-04-08 17:37:40.405507	\N
9	1	Open Listing Page	goto	{"url": "https://post.magicbricks.com/"}	2019-04-08 17:39:26.54559	2019-04-08 17:39:26.54559	\N
10	1	Close Buy Dialog	mclick	{"a": {"class": "md-close"}}	2019-04-09 16:11:58.997602	2019-04-09 16:11:58.997602	\N
5	1	Enter Email	nset	{"set": "<%= params['auth']['uid']%>", "label": "Enter Email or Mobile to Login", "nearest": "text_field"}	2019-04-08 16:13:32.471182	2019-04-15 14:21:32.677307	\N
7	1	Enter Password	nset	{"set": "<%= params['auth']['pwd'] %>", "label": "Password", "nearest": "text_field"}	2019-04-08 17:34:18.374361	2019-04-15 14:28:03.507071	\N
12	1	Property Type	nset	{"div": {"class": "formLabel", "visible_text": "Property Type"}, "set": "<%= params['basics']['type'] %>", "nearest": "select"}	2019-04-09 18:00:18.818261	2019-04-15 16:53:44.490661	\N
11	1	Property For	nset	{"set": true, "label": "<%= params['basics']['transaction'] %>", "nearest": "radio"}	2019-04-09 17:44:56.237586	2019-04-15 16:54:35.038174	\N
14	1	Locality	nset	{"div": {"class": "formLabel", "visible_text": "Locality"}, "set": "<%= params['location']['locality']%>", "nearest": "text_field"}	2019-04-18 16:32:37.029131	2019-04-18 16:33:46.730939	\N
13	1	City	nset	{"div": {"class": "formLabel", "visible_text": "City"}, "set": "<%= params['location']['city'] %>", "nearest": "select"}	2019-04-09 18:12:52.532004	2019-04-18 16:35:03.397962	\N
15	1	Complex	nset	{"div": {"class": "formLabel", "visible_text": "Name of Project/Society"}, "set": "<%= params['location']['complex']%>", "nearest": "text_field"}	2019-04-18 16:57:28.006246	2019-04-18 16:57:28.006246	\N
16	1	Unit	nset	{"div": {"class": "formLabel", "visible_text": "Address"}, "set": "<%= params['location']['unit']%>", "nearest": "text_field"}	2019-04-18 16:58:12.62551	2019-04-18 16:58:12.62551	\N
17	1	Body click	mclick	{"body": {"index": 0}}	2019-04-20 14:45:43.979706	2019-04-20 14:45:43.979706	\N
19	1	Balconies	mset	{"set": "<%= params['features']['balconies'] %>", "select": {"id": "balconies"}}	2019-04-20 18:02:54.403707	2019-04-21 06:51:25.589702	\N
18	1	Bedrooms	mset	{"set": "<%= params['features']['bedrooms'] %>", "select": {"id": "bedrooms"}}	2019-04-20 18:02:06.37406	2019-04-21 11:35:12.083085	\N
20	1	Floor	mset	{"set": "<%= params['features']['floor'] %>", "select": {"id": "floorNumber"}}	2019-04-21 12:03:05.965986	2019-04-21 12:03:05.965986	\N
21	1	Total Floors	mset	{"set": "<%= params['features']['floors_total'] %>", "select": {"id": "totalFloorNumber"}}	2019-04-21 12:05:07.899692	2019-04-21 12:05:07.899692	\N
22	1	Furnishing	mset	{"set": "<%= params['features']['furnishing'] %>", "select": {"id": "furnished"}}	2019-04-21 12:06:19.811346	2019-04-21 12:06:19.811346	\N
\.


--
-- Name: conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.conditions_id_seq', 5, true);


--
-- Name: datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.datasets_id_seq', 1, false);


--
-- Name: flows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.flows_id_seq', 2, true);


--
-- Name: flows_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.flows_steps_id_seq', 43, true);


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.sites_id_seq', 1, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('public.steps_id_seq', 23, true);


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

