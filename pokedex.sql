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
14	13	3
15	25	3
16	74	3
17	79	4
18	39	4
19	73	4
20	44	4
21	79	5
22	39	5
23	73	5
24	84	5
25	43	6
26	44	6
27	84	6
28	73	6
29	95	7
30	22	7
31	18	7
32	81	7
33	81	8
34	52	8
35	18	8
36	22	8
37	52	9
38	81	9
39	18	9
40	106	9
41	95	10
42	95	11
43	95	12
44	70	12
45	68	13
46	68	14
47	66	15
48	73	15
49	46	15
50	68	15
51	48	16
52	72	16
53	108	16
54	48	17
55	108	17
56	48	18
57	72	18
58	108	18
59	95	19
60	72	19
61	54	19
62	54	20
63	72	20
64	95	20
65	65	21
66	46	21
67	36	21
68	65	22
69	46	22
70	36	22
71	109	23
72	68	23
73	18	23
74	13	23
75	109	24
76	68	24
77	18	24
78	13	24
79	100	25
80	72	25
81	98	25
82	98	26
83	100	26
84	79	27
85	84	27
86	47	27
87	84	28
88	68	28
89	46	28
90	95	29
91	68	29
92	18	29
93	47	29
94	95	30
95	79	30
96	18	30
97	47	30
98	95	31
99	79	31
100	68	31
101	19	31
102	95	32
103	51	32
104	68	32
105	46	32
107	95	33
108	51	33
109	68	33
110	46	33
111	95	34
112	51	34
113	68	34
114	97	34
115	69	35
116	33	35
117	69	36
118	33	36
119	39	37
120	72	37
121	44	37
122	43	37
123	39	38
124	72	38
125	44	38
126	43	38
127	33	39
128	34	39
129	34	40
130	33	40
131	59	41
132	18	41
133	108	41
134	59	42
135	18	42
136	108	42
137	12	43
138	13	43
139	87	43
140	12	44
141	13	44
142	87	44
143	87	45
144	13	45
145	12	45
146	79	46
147	59	46
148	84	46
149	59	47
150	84	47
151	79	47
152	95	48
153	59	48
154	70	48
155	10	48
156	59	49
157	70	49
158	95	49
159	71	49
160	79	50
161	30	50
162	84	50
163	37	50
164	37	51
165	84	51
166	30	51
167	79	51
168	79	52
169	18	52
170	47	52
171	84	52
172	84	53
173	47	53
174	18	53
175	79	53
176	52	54
177	79	54
178	47	54
179	79	55
180	47	55
181	52	55
182	79	56
183	58	56
184	47	56
185	97	56
186	79	57
187	47	57
188	97	57
189	58	57
190	18	58
191	39	58
192	96	58
193	44	58
194	18	59
195	39	59
196	96	59
197	44	59
198	22	60
199	106	60
200	33	60
201	52	60
202	22	61
203	106	61
204	33	61
205	52	61
206	22	62
207	106	62
208	32	62
209	19	62
210	33	63
211	33	64
212	70	64
213	70	65
214	71	65
215	58	66
216	92	66
217	58	67
218	92	67
219	58	68
220	92	68
221	105	69
222	109	69
223	13	69
224	74	69
225	2	70
226	13	70
227	74	70
228	83	70
229	13	71
230	109	71
231	2	71
232	83	71
233	13	72
234	52	72
235	68	72
237	106	73
238	68	73
239	13	73
240	52	73
241	95	74
242	77	74
243	37	74
244	40	74
245	95	75
246	80	75
247	37	75
248	40	75
249	95	76
250	37	76
251	40	76
252	77	76
253	39	77
254	89	77
255	41	77
256	96	77
257	39	78
258	43	78
259	96	78
260	89	78
261	26	79
262	49	79
263	106	79
264	71	79
265	26	80
266	49	80
267	106	80
268	71	80
269	95	81
270	100	81
271	94	81
272	95	82
273	94	82
274	100	82
275	65	83
276	46	83
277	84	83
278	65	84
279	46	84
280	36	84
281	73	84
282	102	84
283	65	85
284	46	85
285	36	85
286	102	85
287	49	86
288	14	86
289	96	86
290	55	86
291	49	87
292	14	87
293	96	87
294	55	87
295	69	88
296	85	88
297	69	89
298	85	89
299	95	90
300	24	90
301	14	90
302	55	90
303	95	91
304	88	91
305	60	92
306	35	92
307	60	93
308	35	93
309	60	94
310	35	94
311	95	95
312	16	95
313	77	95
314	73	95
315	83	95
316	69	96
317	49	96
318	71	96
319	69	97
320	49	97
321	71	97
322	22	98
323	104	98
324	89	98
325	28	98
326	22	99
327	28	99
328	89	99
329	95	100
330	80	100
331	94	100
332	40	100
333	95	101
334	80	101
335	94	101
336	40	101
337	15	102
338	3	102
339	11	102
340	15	103
341	89	103
342	20	104
343	97	104
344	21	104
345	73	104
346	20	105
347	97	105
348	21	105
349	73	105
350	32	106
351	78	106
352	57	106
353	50	106
354	62	106
355	25	107
356	42	107
357	56	107
358	99	107
359	63	107
360	109	108
361	89	108
362	83	108
363	95	109
364	86	109
365	85	109
366	80	109
367	40	109
368	95	110
369	86	110
370	85	110
371	80	110
372	40	110
373	51	111
374	89	111
375	46	111
376	96	111
377	51	112
378	89	112
379	46	112
380	96	112
381	69	113
382	33	113
383	34	113
384	27	114
385	16	114
386	12	114
387	83	114
388	25	115
389	73	115
390	18	115
391	63	115
392	31	115
393	22	116
394	106	116
395	52	116
396	22	117
397	106	117
398	52	117
399	65	118
400	51	118
401	46	118
402	107	118
403	65	119
404	51	119
405	46	119
406	107	119
407	95	120
408	106	120
409	94	120
410	52	120
411	52	121
412	26	122
413	33	122
414	72	123
415	84	123
416	69	124
417	60	124
418	33	124
419	56	124
420	19	124
421	97	124
422	17	124
423	72	125
424	100	125
425	99	125
426	98	125
427	39	126
428	42	126
429	86	126
430	44	126
431	104	127
432	84	127
433	95	128
434	89	128
435	73	128
436	96	128
437	95	129
438	95	130
439	18	130
440	52	130
441	53	130
442	106	131
443	19	131
444	55	131
445	52	131
446	33	132
447	95	133
448	72	133
449	18	133
450	96	133
451	95	134
452	72	134
453	106	134
454	18	134
455	52	134
456	95	135
457	72	135
458	100	135
459	98	135
460	66	135
461	32	135
462	95	136
463	72	136
464	39	136
465	18	136
466	43	136
467	73	136
468	44	136
469	95	137
470	70	137
471	102	137
472	106	138
473	51	138
474	88	138
475	52	138
476	106	139
477	51	139
478	88	139
479	52	139
480	79	140
481	12	140
482	84	140
483	52	140
484	79	141
485	12	141
486	84	141
487	52	141
488	108	142
489	18	142
490	96	142
491	53	142
492	49	143
493	19	143
494	34	143
495	53	143
496	65	144
497	55	144
498	17	144
499	100	145
500	36	145
501	98	145
502	65	146
503	43	146
504	82	146
505	109	147
506	83	147
507	53	147
508	109	148
509	83	148
510	53	148
511	109	149
512	83	149
513	53	149
514	94	150
515	71	150
516	69	151
517	63	151
518	71	151
519	95	1
520	105	1
521	74	1
522	87	1
523	95	2
524	105	2
525	74	2
526	87	2
527	28	3
\.


--
-- Name: moves_pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('moves_pokemons_id_seq', 527, true);


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
21	Normal	Flying	Spearow	Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.	4.40000000000000036	12	f	20
22	Normal	Flying	Fearow	Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.	83.7999999999999972	47	f	0
23	Poison	None	Ekans	Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.	15.1999999999999993	79	f	22
26	Electric	None	Raichu	If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon's nest.	66.0999999999999943	31	f	0
29	Poison	None	Nidoran♀	Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.	15.4000000000000004	16	f	16
36	Normal	None	Clefable	Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.	88.2000000000000028	51	f	0
38	Fire	None	Ninetales	Ninetales casts a sinister light from its bright red eyes to gain total control over its foe's mind. This Pokémon is said to live for a thousand years.	43.8999999999999986	43	f	0
24	Poison	None	Arbok	This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.	143.300000000000011	138	f	0
27	Ground	None	Sandshrew	Sandshrew's body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.	26.5	24	f	22
28	Ground	None	Sandslash	Sandslash's body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.	65	39	f	0
31	Poison	Ground	Nidoqueen	Nidoqueen's body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.	132.300000000000011	51	f	0
32	Poison	None	Nidoran♂	Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon's notice.	19.8000000000000007	20	f	16
34	Poison	Ground	Nidoking	Nidoking's thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.	136.699999999999989	55	f	0
40	Normal	None	Wigglytuff	Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon's eyes, it is quickly washed away.	26.5	39	f	0
41	Poison	Flying	Zubat	Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.	16.5	31	f	22
42	Poison	Flying	Golbat	Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.	121.299999999999997	63	f	0
43	Grass	Poison	Oddish	During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.	11.9000000000000004	20	f	21
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
30	Poison	None	Nidorina	When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.	44.1000000000000014	31	f	996
35	Normal	None	Clefairy	On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.	16.5	24	f	996
37	Fire	None	Vulpix	At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.	21.8000000000000007	24	f	995
39	Normal	None	Jigglypuff	Jigglypuff's vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.	12.0999999999999996	20	f	996
44	Grass	Poison	Gloom	Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.	19	31	f	994
59	Fire	None	Arcanine	Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon's body is its source of power.	341.699999999999989	75	f	0
60	Water	None	Poliwag	Poliwag has a very thin skin. It is possible to see the Pokémon's spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.	27.3000000000000007	24	f	25
62	Water	Fighting	Poliwrath	Poliwrath's highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.	119	51	f	0
63	Psychic	None	Abra	Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.	43	35	f	16
65	Psychic	None	Alakazam	Alakazam's brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.	105.799999999999997	59	t	0
68	Fighting	None	Machamp	Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.	286.600000000000023	63	f	0
69	Grass	Poison	Bellsprout	Bellsprout's thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.	8.80000000000000071	28	f	21
71	Grass	Poison	Victreebel	Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.	34.2000000000000028	67	f	0
72	Water	Poison	Tentacool	Tentacool's body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.	100.299999999999997	35	f	30
73	Water	Poison	Tentacruel	Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon's outburst creates rough waves around it.	121.299999999999997	63	f	0
74	Rock	Ground	Geodude	The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon's heart will remain hard, craggy, and rough always.	44.1000000000000014	16	f	25
76	Rock	Ground	Golem	Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.	661.399999999999977	55	f	0
77	Fire	None	Ponyta	Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.	66.0999999999999943	39	f	40
78	Fire	None	Rapidash	Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.	209.400000000000006	67	f	0
79	Water	Psychic	Slowpoke	Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it's doing and often spends entire days just loafing at water's edge.	79.4000000000000057	47	f	37
80	Water	Psychic	Slowbro	Slowbro's tail has a Shellder firmly attached with a bite. As a result, the tail can't be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.	173.099999999999994	63	t	0
81	Electric	None	Magnemite	Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.	13.1999999999999993	12	f	30
82	Electric	None	Magneton	Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.	132.300000000000011	39	f	0
83	Normal	Flying	Farfetch'd	Farfetch'd is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.	33.1000000000000014	31	f	0
84	Normal	Flying	Doduo	Doduo's two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.	86.4000000000000057	55	f	31
85	Normal	Flying	Dodrio	Watch out if Dodrio's three heads are looking in three separate directions. It's a sure sign that it is on its guard. Don't go near this Pokémon if it's being wary—it may decide to peck you.	187.800000000000011	71	f	0
86	Water	None	Seel	Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.	198.400000000000006	43	f	34
61	Water	None	Poliwhirl	The surface of Poliwhirl's body is always wet and slick with a slimy fluid. Because of this slippery covering, it can easily slip and slide out of the clutches of any enemy in battle.	44.1000000000000014	39	f	993
70	Grass	Poison	Weepinbell	Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.	14.0999999999999996	39	f	994
64	Psychic	None	Kadabra	Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a Trainer of this Pokémon.	124.599999999999994	51	f	999
67	Fighting	None	Machoke	Machoke's thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.	155.400000000000006	59	f	999
75	Rock	Ground	Graveler	Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.	231.5	39	f	999
87	Water	Ice	Dewgong	Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.	264.600000000000023	67	f	0
88	Poison	None	Grimer	Grimer's sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.	66.0999999999999943	35	f	38
89	Poison	None	Muk	From Muk's body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon's body fluid can turn a pool stagnant and rancid.	66.0999999999999943	47	f	0
91	Water	Ice	Cloyster	Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.	292.100000000000023	59	f	0
92	Ghost	Poison	Gastly	Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.	0.200000000000000011	51	f	25
94	Ghost	Poison	Gengar	Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.	89.2999999999999972	59	t	0
95	Rock	Ground	Onix	Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.	463	346	f	0
96	Psychic	None	Drowzee	If your nose becomes itchy while you are sleeping, it's a sure sign that one of these Pokémon is standing above your pillow and trying to eat your dream through your nostrils.	71.4000000000000057	39	f	26
97	Psychic	None	Hypno	Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.	166.699999999999989	63	f	0
98	Water	None	Krabby	Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.	14.3000000000000007	16	f	28
99	Water	None	Kingler	Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.	132.300000000000011	51	f	0
100	Electric	None	Voltorb	Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.	22.8999999999999986	20	f	30
101	Electric	None	Electrode	Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.	146.800000000000011	47	f	0
103	Grass	Psychic	Exeggutor	Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.	264.600000000000023	79	f	0
104	Ground	None	Cubone	Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.	14.3000000000000007	16	f	28
105	Ground	None	Marowak	Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon's tempered and hardened spirit is not easily broken.	99.2000000000000028	39	f	0
106	Fighting	None	Hitmonlee	Hitmonlee's legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.	109.799999999999997	59	f	0
107	Fighting	None	Hitmonchan	Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.	110.700000000000003	55	f	0
108	Normal	None	Lickitung	Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.	144.400000000000006	47	f	0
109	Poison	None	Koffing	If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.	2.20000000000000018	24	f	35
110	Poison	None	Weezing	Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.	20.8999999999999986	47	f	0
111	Ground	Rock	Rhyhorn	Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.	253.5	39	f	42
112	Ground	Rock	Rhydon	Rhydon's horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon's hide is extremely tough. Even direct cannon hits don't leave a scratch.	264.600000000000023	75	f	0
113	Normal	None	Chansey	Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.	76.2999999999999972	43	f	0
114	Grass	None	Tangela	Tangela's vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.	77.2000000000000028	39	f	0
115	Normal	None	Kangaskhan	If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon's parent is sure to be in the area, and it will become violently enraged at you.	176.400000000000006	75	t	0
102	Grass	Psychic	Exeggcute	This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.	5.5	16	f	994
93	Ghost	Poison	Haunter	Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.	0.200000000000000011	63	f	999
116	Water	None	Horsea	Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.	17.6000000000000014	16	f	32
117	Water	None	Seadra	Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon's poison barbs if they fail to notice it.	55.1000000000000014	47	f	0
118	Water	None	Goldeen	Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don't let your guard down around this Pokémon—it could ram you powerfully with its horn.	33.1000000000000014	24	f	33
119	Water	None	Seaking	In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon's body coloration is at its most beautiful.	86	51	f	0
121	Water	Psychic	Starmie	Starmie's center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."	176.400000000000006	43	f	0
123	Bug	Flying	Scyther	Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon's scythes are so effective, they can slice through thick logs in one wicked stroke.	123.5	59	f	0
122	Psychic	None	Mr.Mime	Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.	120.099999999999994	51	f	0
25	Electric	None	Pikachu	Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it's evidence that this Pokémon mistook the intensity of its charge.	13.1999999999999993	16	f	997
33	Poison	None	Nidorino	Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.	43	35	f	996
58	Fire	None	Growlithe	Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won't forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.	41.8999999999999986	28	f	995
90	Water	None	Shellder	At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.	8.80000000000000071	12	f	993
120	Water	None	Staryu	Staryu's center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.	76.0999999999999943	31	f	993
124	Ice	Psychic	Jynx	Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.	89.5	31	f	0
125	Electric	None	Electabuzz	When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.	66.0999999999999943	43	f	0
126	Fire	None	Magmar	In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon's fiery bursts create heat waves that ignite grass and trees in its surroundings.	98.0999999999999943	51	f	0
127	Bug	None	Pinsir	Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon's movements turn sluggish in cold places.	121.299999999999997	59	t	0
128	Normal	None	Tauros	This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.	194.900000000000006	55	f	0
129	Water	None	Magikarp	Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.	22	35	f	20
130	Water	Flying	Gyarados	When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon's wildly violent nature.	518.100000000000023	256	t	0
131	Water	Ice	Lapras	People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.	485	98	f	0
132	Normal	None	Ditto	Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.	8.80000000000000071	12	f	0
133	Normal	None	Eevee	Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.	14.3000000000000007	12	f	998
134	Water	None	Vaporeon	Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.	63.8999999999999986	39	f	0
135	Electric	None	Jolteon	Jolteon's cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.	54	31	f	0
136	Fire	None	Flareon	Flareon's fluffy fur has a functional purpose—it releases heat into the air so that its body does not get excessively hot. This Pokémon's body temperature can rise to a maximum of 1,650 degrees Fahrenheit.	55.1000000000000014	35	f	0
137	Normal	None	Porygon	Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy protected so it cannot be duplicated by copying.	80.5	31	f	0
138	Rock	Water	Omanyte	Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.	16.5	16	f	40
139	Rock	Water	Omastar	Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.	77.2000000000000028	39	f	0
140	Rock	Water	Kabuto	Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.	25.3999999999999986	20	f	40
141	Rock	Water	Kabutops	Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water dweller to living on land as evident from the beginnings of change in its gills and legs.	89.2999999999999972	51	f	0
142	Rock	Flying	Aerodactyl	Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.	130.099999999999994	71	t	0
143	Normal	None	Snorlax	Snorlax's typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.	1014.10000000000002	83	f	0
144	Ice	Flying	Articuno	Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.	122.099999999999994	67	f	0
145	Electric	Flying	Zapdos	Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.	116	63	f	0
146	Fire	Flying	Moltres	Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.	132.300000000000011	79	f	0
147	Dragon	None	Dratini	Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.	7.29999999999999982	71	f	30
148	Dragon	None	Dragonair	Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from the crystals on its neck and tail.	36.3999999999999986	157	f	55
149	Dragon	Flying	Dragonite	Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.	463	87	f	0
150	Psychic	None	Mewtwo	Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon's body, they failed to endow Mewtwo with a compassionate heart.	269	79	t	0
151	Psychic	None	Mew	Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.	8.80000000000000071	16	f	0
66	Fighting	None	Machop	Machop's muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.	43	31	f	28
\.


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('pokemons_id_seq', 151, true);


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

