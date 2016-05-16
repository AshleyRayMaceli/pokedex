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

ALTER TABLE ONLY pokemons ALTER COLUMN id SET DEFAULT nextval('pokemons_id_seq'::regclass);


--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY pokemons (id, type_1, type_2, name, description, weight, height, mega_evolves, evolves) FROM stdin;
1	Grass	None	Bulbasaur	Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the suns rays, the seed grows progressively larger.	15.1999999999999993	26	f	16
2	Grass	Poison	Ivysaur	\N	28.6999999999999993	39	f	32
4	Fire	None	Charmander	\N	18.6999999999999993	24	f	16
5	Fire	None	Charmeleon	\N	41.8999999999999986	43	f	32
8	Water	None	Wartortle	\N	49.6000000000000014	39	f	32
7	Water	None	Squirtle	\N	19.8000000000000007	20	f	16
10	Bug	None	Caterpie	\N	6.40000000000000036	12	f	7
11	Bug	None	Metapod	\N	21.8000000000000007	28	f	10
12	Bug	Flying	Butterfree	\N	70.5	43	f	0
13	Bug	Poison	Weedle	\N	7.09999999999999964	12	f	7
14	Bug	Poison	Kakuna	\N	22	24	f	10
15	Bug	Poison	Beedrill	\N	65	39	t	0
16	Normal	Flying	Pidgey	\N	4	12	f	18
17	Normal	Flying	Pidgeotto	\N	66.0999999999999943	43	f	36
18	Normal	Flying	Pidgeot	\N	87.0999999999999943	59	t	0
19	Normal	None	Rattata	\N	7.70000000000000018	12	f	20
20	Normal	None	Raticate	\N	40.7999999999999972	28	f	0
6	Fire	Flying	Charizard	\N	199.5	67	t	0
3	Grass	Poison	Venusaur	\N	220.5	79	t	0
9	Water	None	Blastoise	\N	188.5	63	t	0
\.


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('pokemons_id_seq', 20, true);


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

