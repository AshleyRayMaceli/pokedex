--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: moves; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE moves (
    id integer NOT NULL,
    name character varying,
    type character varying,
    power integer,
    accuracy integer
);


ALTER TABLE moves OWNER TO "Guest";

--
-- Name: moves_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE moves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moves_id_seq OWNER TO "Guest";

--
-- Name: moves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE moves_id_seq OWNED BY moves.id;


--
-- Name: moves_pokemons; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE moves_pokemons (
    id integer NOT NULL,
    move_id integer,
    pokemon_id integer
);


ALTER TABLE moves_pokemons OWNER TO "Guest";

--
-- Name: moves_pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE moves_pokemons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moves_pokemons_id_seq OWNER TO "Guest";

--
-- Name: moves_pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE moves_pokemons_id_seq OWNED BY moves_pokemons.id;


--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE pokemons (
    id integer NOT NULL,
    type_1 character varying,
    type_2 character varying,
    name character varying,
    description text,
    weight double precision,
    height integer,
    mega_evolves boolean,
    evolves integer
);


ALTER TABLE pokemons OWNER TO "Guest";

--
-- Name: pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE pokemons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemons_id_seq OWNER TO "Guest";

--
-- Name: pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE pokemons_id_seq OWNED BY pokemons.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY moves ALTER COLUMN id SET DEFAULT nextval('moves_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY moves_pokemons ALTER COLUMN id SET DEFAULT nextval('moves_pokemons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY pokemons ALTER COLUMN id SET DEFAULT nextval('pokemons_id_seq'::regclass);


--
-- Data for Name: moves; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY moves (id, name, type, power, accuracy) FROM stdin;
12	Absorb	Grass	20	100
13	Acid	Poison	40	100
14	Aurora Beam	Ice	65	100
15	Barrage	Normal	15	85
16	Bind	Normal	15	85
17	Blizzard	Ice	110	70
18	Bite	Normal	60	100
19	Body Slam	Normal	85	100
20	Bone Club	Ground	65	85
21	Boomerang	Ground	50	90
22	Bubble	Water	40	100
23	Bubble Beam	Water	65	100
24	Clamp	Water	35	85
25	Comet Punch	Normal	18	85
26	Confusion	Psychic	50	100
27	Constrict	Normal	10	100
28	Crabhammer	Water	100	90
29	Cut	Normal	50	95
30	Dig	Ground	80	100
31	Dizzy Punch	Normal	70	100
32	Double Kick	Fighting	30	100
33	Double Slap	Normal	15	85
34	Double Edge	Normal	120	100
35	Dream Eater	Psychic	100	100
36	Drill Peck	Flying	80	100
37	Earthquake	Ground	100	100
38	Egg Bomb	Normal	100	75
39	Ember	Fire	40	100
40	Explosion	Normal	250	100
41	Fire Blast	Fire	110	85
42	Fire Punch	Fire	75	100
43	Fire Spin	Fire	35	85
44	Flamethrower	Fire	90	100
45	Fly	Flying	90	95
46	Fury Attack	Normal	15	85
47	Fury Swipes	Normal	18	80
48	Gust	Flying	40	100
49	Headbutt	Normal	70	100
50	High Jump Kick	Fighting	130	90
51	Horn Attack	Normal	65	100
52	Hydro Pump	Water	110	80
53	Hyper Beam	Normal	150	90
54	Hyper Fang	Normal	80	90
55	Ice Beam	Ice	90	100
56	Ice Punch	Ice	75	100
57	Jump Kick	Fighting	100	95
58	Karate Chop	Fighting	50	100
59	Leech Life	Bug	20	100
60	Lick	Ghost	30	100
61	Mega Drain	Grass	40	100
62	Mega Kick	Normal	120	75
63	Mega Punch	Normal	80	85
64	Pay Day	Normal	40	100
65	Peck	Flying	35	100
66	Pin Missile	Bug	25	95
67	Petal Dance	Grass	120	100
68	Poison Sting	Poison	15	100
69	Pound	Normal	40	100
70	Psybeam	Psychic	65	100
71	Psychic	Psychic	90	100
72	Quick Attack	Normal	40	100
73	Rage	Normal	20	100
74	Razor Leaf	Grass	55	95
75	Razor Wind	Normal	80	100
76	Rock Slide	Rock	75	90
77	Rock Throw	Rock	50	90
78	Rolling Kick	Fighting	60	85
79	Scratch	Normal	40	100
80	Self-Destruct	Normal	200	100
81	Skull Bash	Normal	130	100
82	Sky Attack	Flying	140	90
83	Slam	Normal	80	75
84	Slash	Normal	70	100
85	Sludge	Poison	65	100
86	Smog	Poison	30	70
87	Solar Beam	Grass	120	100
88	Spike Cannon	Normal	20	100
89	Stomp	Normal	65	100
90	Strength	Normal	80	100
91	Struggle	Normal	50	100
92	Submission	Fighting	80	80
93	Surf	Water	90	100
94	Swift	Normal	60	999
95	Tackle	Normal	50	100
96	Take Down	Normal	90	85
97	Thrash	Normal	120	100
98	Thunder	Electric	110	70
99	Thunder Punch	Electric	75	100
100	Thunder Shock	Electric	40	100
101	Thunderbolt	Electric	90	100
102	Tri Attack	Normal	80	100
103	Twineedle	Bug	25	100
104	Vice Grip	Normal	55	100
105	Vine Whip	Grass	45	100
106	Water Gun	Water	40	100
107	Waterfall	Water	80	100
108	Wing Attack	Flying	60	100
109	Wrap	Normal	15	90
\.


--
-- Name: moves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('moves_id_seq', 109, true);


--
-- Data for Name: moves_pokemons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY moves_pokemons (id, move_id, pokemon_id) FROM stdin;
\.


--
-- Name: moves_pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('moves_pokemons_id_seq', 13, true);


--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY pokemons (id, type_1, type_2, name, description, weight, height, mega_evolves, evolves) FROM stdin;
\.


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('pokemons_id_seq', 22, true);


--
-- Name: moves_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (id);


--
-- Name: moves_pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY moves_pokemons
    ADD CONSTRAINT moves_pokemons_pkey PRIMARY KEY (id);


--
-- Name: pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

