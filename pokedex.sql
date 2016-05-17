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
    name character varying
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

COPY moves (id, name) FROM stdin;
1	Tackle
2	Vine Whip
3	Leech Seed
4	Razor Leaf
7	Tackle
8	Razor Leaf
9	Vine Whip
10	Poison Powder
11	Solar Beam
\.


--
-- Name: moves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('moves_id_seq', 11, true);


--
-- Data for Name: moves_pokemons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY moves_pokemons (id, move_id, pokemon_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	0	2
6	5	2
7	6	2
8	7	2
9	8	2
10	9	2
11	10	2
12	11	3
\.


--
-- Name: moves_pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('moves_pokemons_id_seq', 13, true);


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
33	Poison	None	Nidorino	Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.	43	35	f	0
21	Normal	Flying	Spearow	Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.	4.40000000000000036	12	f	20
22	Normal	Flying	Fearow	Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.	83.7999999999999972	47	f	0
23	Poison	None	Ekans	Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.	15.1999999999999993	79	f	22
26	Electric	None	Raichu	If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon's nest.	66.0999999999999943	31	f	0
29	Poison	None	Nidoran♀	Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.	15.4000000000000004	16	f	16
36	Normal	None	Clefable	Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.	88.2000000000000028	51	f	0
38	Fire	None	Ninetales	Ninetales casts a sinister light from its bright red eyes to gain total control over its foe's mind. This Pokémon is said to live for a thousand years.	43.8999999999999986	43	f	0
24	Poison	None	Arbok	This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.	143.300000000000011	138	f	0
25	Electric	None	Pikachu	Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it's evidence that this Pokémon mistook the intensity of its charge.	13.1999999999999993	16	f	0
27	Ground	None	Sandshrew	Sandshrew's body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.	26.5	24	f	22
28	Ground	None	Sandslash	Sandslash's body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.	65	39	f	0
30	Poison	None	Nidorina	When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.	44.1000000000000014	31	f	0
31	Poison	Ground	Nidoqueen	Nidoqueen's body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.	132.300000000000011	51	f	0
32	Poison	None	Nidoran♂	Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon's notice.	19.8000000000000007	20	f	16
34	Poison	Ground	Nidoking	Nidoking's thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.	136.699999999999989	55	f	0
35	Normal	None	Clefairy	On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.	16.5	24	f	0
37	Fire	None	Vulpix	At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.	21.8000000000000007	24	f	0
39	Normal	None	Jigglypuff	Jigglypuff's vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.	12.0999999999999996	20	f	0
40	Normal	None	Wigglytuff	Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon's eyes, it is quickly washed away.	26.5	39	f	0
41	Poison	Flying	Zubat	Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.	16.5	31	f	22
42	Poison	Flying	Golbat	Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.	121.299999999999997	63	f	0
43	Grass	Poison	Oddish	During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.	11.9000000000000004	20	f	21
44	Grass	Poison	Gloom	Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.	19	31	f	0
45	Grass	Poison	Vileplume	Vileplume's toxic pollen triggers atrocious allergy attacks. That's why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.	41	47	f	0
46	Bug	Grass	Paras	Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.	11.9000000000000004	12	f	24
47	Bug	Grass	Parasect	Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.	65	39	f	0
48	Bug	Poison	Venonat	Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even minuscule prey.	66.0999999999999943	39	f	31
49	Bug	Poison	Venomoth	Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.	27.6000000000000014	59	f	0
50	Ground	None	Diglett	Diglett are raised in most farms. The reason is simple— wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.	1.80000000000000004	8	f	26
51	Ground	None	Dugtrio	Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.	73.4000000000000057	28	f	0
52	Normal	None	Meowth	Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.	9.30000000000000071	16	f	28
53	Normal	None	Persian	Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon's surrounding vicinity. It becomes docile if grabbed by the whiskers.	70.5	39	f	0
54	Water	None	Psyduck	Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.	43.2000000000000028	31	f	33
55	Water	None	Golduck	The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. This Pokémon is definitely much faster than even the most athletic swimmer.	168.900000000000006	67	f	0
56	Fighting	None	Mankey	When Mankey starts shaking and its nasal breathing turns rough, it's a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.	61.7000000000000028	20	f	28
57	Fighting	None	Primeape	When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.	70.5	39	f	0
58	Fire	None	Growlithe	Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won't forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.	41.8999999999999986	28	f	0
59	Fire	None	Arcanine	Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon's body is its source of power.	341.699999999999989	75	f	0
60	Water	None	Poliwag	Poliwag has a very thin skin. It is possible to see the Pokémon's spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.	27.3000000000000007	24	f	25
61	Water	None	Poliwhirl	The surface of Poliwhirl's body is always wet and slick with a slimy fluid. Because of this slippery covering, it can easily slip and slide out of the clutches of any enemy in battle.	44.1000000000000014	39	f	0
62	Water	Fighting	Poliwrath	Poliwrath's highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.	119	51	f	0
63	Psychic	None	Abra	Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.	43	35	f	16
64	Psychic	None	Kadabra	Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a Trainer of this Pokémon.	124.599999999999994	51	f	0
65	Psychic	None	Alakazam	Alakazam's brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.	105.799999999999997	59	t	0
\.


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('pokemons_id_seq', 65, true);


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

