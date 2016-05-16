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
18	Normal	Flying	Pidgeot	This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.	87.0999999999999943	59	t	0
19	Normal	None	Rattata	Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.	7.70000000000000018	12	f	20
20	Normal	None	Raticate	Raticate's sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.	40.7999999999999972	28	f	0
2	Grass	Poison	Ivysaur	There is a bud on this Pokémon's back. To support its weight, Ivysaur's legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it's a sign that the bud will bloom into a large flower soon.	28.6999999999999993	39	f	32
3	Grass	Poison	Venusaur	There is a large flower on Venusaur's back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower's aroma soothes the emotions of people.	220.5	79	t	0
4	Fire	None	Charmander	The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.	18.6999999999999993	24	f	16
5	Fire	None	Charmeleon	Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.	41.8999999999999986	43	f	32
6	Fire	Flying	Charizard	Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.	199.5	67	t	0
7	Water	None	Squirtle	Squirtle's shell is not merely used for protection. The shell's rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.	19.8000000000000007	20	f	16
8	Water	None	Wartortle	Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon's toughness as a battler.	49.6000000000000014	39	f	32
9	Water	None	Blastoise	Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.	188.5	63	t	0
10	Bug	None	Caterpie	Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.	6.40000000000000036	12	f	7
11	Bug	None	Metapod	The shell covering this Pokémon's body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.	21.8000000000000007	28	f	10
12	Bug	Flying	Butterfree	Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.	70.5	43	f	0
13	Bug	Poison	Weedle	Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).	7.09999999999999964	12	f	7
14	Bug	Poison	Kakuna	Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.	22	24	f	10
15	Bug	Poison	Beedrill	Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.	65	39	t	0
16	Normal	Flying	Pidgey	Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.\n	4	12	f	18
17	Normal	Flying	Pidgeotto	Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.	66.0999999999999943	43	f	36
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

