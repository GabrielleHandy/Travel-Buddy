--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)

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
-- Name: destinations; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.destinations (
    dest_id integer NOT NULL,
    city_name character varying(50),
    country_name character varying(100) NOT NULL
);


ALTER TABLE public.destinations OWNER TO hackbright;

--
-- Name: destinations_dest_id_seq; Type: SEQUENCE; Schema: public; Owner: hackbright
--

CREATE SEQUENCE public.destinations_dest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destinations_dest_id_seq OWNER TO hackbright;

--
-- Name: destinations_dest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackbright
--

ALTER SEQUENCE public.destinations_dest_id_seq OWNED BY public.destinations.dest_id;


--
-- Name: embassies; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.embassies (
    embassy_id integer NOT NULL,
    home_country character varying(50) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    address character varying,
    website character varying,
    dest_id integer
);


ALTER TABLE public.embassies OWNER TO hackbright;

--
-- Name: embassies_embassy_id_seq; Type: SEQUENCE; Schema: public; Owner: hackbright
--

CREATE SEQUENCE public.embassies_embassy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.embassies_embassy_id_seq OWNER TO hackbright;

--
-- Name: embassies_embassy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackbright
--

ALTER SEQUENCE public.embassies_embassy_id_seq OWNED BY public.embassies.embassy_id;


--
-- Name: tps_dests; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.tps_dests (
    tpdest_id integer NOT NULL,
    dest_id integer,
    tp_id integer,
    date timestamp without time zone
);


ALTER TABLE public.tps_dests OWNER TO hackbright;

--
-- Name: tps_dests_tpdest_id_seq; Type: SEQUENCE; Schema: public; Owner: hackbright
--

CREATE SEQUENCE public.tps_dests_tpdest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tps_dests_tpdest_id_seq OWNER TO hackbright;

--
-- Name: tps_dests_tpdest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackbright
--

ALTER SEQUENCE public.tps_dests_tpdest_id_seq OWNED BY public.tps_dests.tpdest_id;


--
-- Name: travelplanners; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.travelplanners (
    tp_id integer NOT NULL,
    name character varying(50) NOT NULL,
    user_id integer
);


ALTER TABLE public.travelplanners OWNER TO hackbright;

--
-- Name: travelplanners_tp_id_seq; Type: SEQUENCE; Schema: public; Owner: hackbright
--

CREATE SEQUENCE public.travelplanners_tp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.travelplanners_tp_id_seq OWNER TO hackbright;

--
-- Name: travelplanners_tp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackbright
--

ALTER SEQUENCE public.travelplanners_tp_id_seq OWNED BY public.travelplanners.tp_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    email character varying(30),
    password character varying(30) NOT NULL,
    home_country character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO hackbright;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: hackbright
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO hackbright;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackbright
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: destinations dest_id; Type: DEFAULT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.destinations ALTER COLUMN dest_id SET DEFAULT nextval('public.destinations_dest_id_seq'::regclass);


--
-- Name: embassies embassy_id; Type: DEFAULT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.embassies ALTER COLUMN embassy_id SET DEFAULT nextval('public.embassies_embassy_id_seq'::regclass);


--
-- Name: tps_dests tpdest_id; Type: DEFAULT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.tps_dests ALTER COLUMN tpdest_id SET DEFAULT nextval('public.tps_dests_tpdest_id_seq'::regclass);


--
-- Name: travelplanners tp_id; Type: DEFAULT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners ALTER COLUMN tp_id SET DEFAULT nextval('public.travelplanners_tp_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.destinations (dest_id, city_name, country_name) FROM stdin;
1	Kabul	Afghanistan
2	Mariehamn	Aland Islands
3	Tirana	Albania
4	Algiers	Algeria
5	Pago Pago	American Samoa
6	Andorra la Vella	Andorra
7	Luanda	Angola
8	The Valley	Anguilla
9		Antarctica
10	St. John's	Antigua and Barbuda
11	Buenos Aires	Argentina
12	Yerevan	Armenia
13	Oranjestad	Aruba
14	Canberra	Australia
15	Vienna	Austria
16	Baku	Azerbaijan
17	Nassau	Bahamas
18	Manama	Bahrain
19	Dhaka	Bangladesh
20	Bridgetown	Barbados
21	Minsk	Belarus
22	Brussels	Belgium
23	Belmopan	Belize
24	Porto-Novo	Benin
25	Hamilton	Bermuda
26	Thimphu	Bhutan
27	Sucre	Bolivia
28		Bonaire, Saint Eustatius and Saba 
29	Sarajevo	Bosnia and Herzegovina
30	Gaborone	Botswana
31		Bouvet Island
32	Brasilia	Brazil
33	Diego Garcia	British Indian Ocean Territory
34	Road Town	British Virgin Islands
35	Bandar Seri Begawan	Brunei
36	Sofia	Bulgaria
37	Ouagadougou	Burkina Faso
38	Bujumbura	Burundi
39	Phnom Penh	Cambodia
40	Yaounde	Cameroon
41	Ottawa	Canada
42	Praia	Cape Verde
43	George Town	Cayman Islands
44	Bangui	Central African Republic
45	N'Djamena	Chad
46	Santiago	Chile
47	Beijing	China
48	Flying Fish Cove	Christmas Island
49	West Island	Cocos (Keeling) Islands
50	West Island	Cocos Islands
51	Bogota	Colombia
52	Moroni	Comoros
53	Brazzaville	Congo
54	Avarua	Cook Islands
55	San Jose	Costa Rica
56	Zagreb	Croatia
57	Havana	Cuba
58	 Willemstad	Curacao
59	Nicosia	Cyprus
60	Prague	Czech Republic
61	Kinshasa	Democratic Republic of the Congo
62	Copenhagen	Denmark
63	Djibouti	Djibouti
64	Roseau	Dominica
65	Santo Domingo	Dominican Republic
66	Quito	Ecuador
67	Cairo	Egypt
68	San Salvador	El Salvador
69	Malabo	Equatorial Guinea
70	Asmara	Eritrea
71	Tallinn	Estonia
72	Addis Ababa	Ethiopia
73	Stanley	Falkland Islands
74	Torshavn	Faroe Islands
75	Suva	Fiji
76	Helsinki	Finland
77	Paris	France
78	Papeete	French Polynesia
79	Port-aux-Francais	French Southern Territories
80	Libreville	Gabon
81	Banjul	Gambia
82	Tbilisi	Georgia
83	Berlin	Germany
84	Accra	Ghana
85	Gibraltar	Gibraltar
86	Athens	Greece
87	Nuuk	Greenland
88	St. George's	Grenada
89	Basse-Terre	Guadeloupe
90	Hagatna	Guam
91	Guatemala City	Guatemala
92	St Peter Port	Guernsey
93	Conakry	Guinea
94	Bissau	Guinea-Bissau
95	Georgetown	Guyana
96	Port-au-Prince	Haiti
97		Heard Island and McDonald Islands
98	Tegucigalpa	Honduras
99	Hong Kong	Hong Kong
100	Budapest	Hungary
101	Reykjavik	Iceland
102	New Delhi	India
103	Jakarta	Indonesia
104	Tehran	Iran
105	Baghdad	Iraq
106	Dublin	Ireland
107	Douglas, Isle of Man	Isle of Man
108	Jerusalem	Israel
109	Rome	Italy
110	Yamoussoukro	Ivory Coast
111	Kingston	Jamaica
112	Tokyo	Japan
113	Saint Helier	Jersey
114	Amman	Jordan
115	Astana	Kazakhstan
116	Nairobi	Kenya
117	Tarawa	Kiribati
118	Pristina	Kosovo
119	Kuwait City	Kuwait
120	Bishkek	Kyrgyzstan
121	Vientiane	Laos
122	Riga	Latvia
123	Beirut	Lebanon
124	Maseru	Lesotho
125	Monrovia	Liberia
126	Tripolis	Libya
127	Vaduz	Liechtenstein
128	Vilnius	Lithuania
129	Luxembourg	Luxembourg
130	Macao	Macau
131	Skopje	Macedonia
132	Antananarivo	Madagascar
133	Lilongwe	Malawi
134	Kuala Lumpur	Malaysia
135	Male	Maldives
136	Bamako	Mali
137	Valletta	Malta
138	Majuro	Marshall Islands
139	Fort-de-France	Martinique
140	Nouakchott	Mauritania
141	Port Louis	Mauritius
142	Mamoudzou	Mayotte
143	Mexico City	Mexico
144	Palikir	Micronesia
145	Chisinau	Moldova
146	Monaco	Monaco
147	Ulan Bator	Mongolia
148	Podgorica	Montenegro
149	Plymouth	Montserrat
150	Rabat	Morocco
151	Maputo	Mozambique
152	Nay Pyi Taw	Myanmar
153	Windhoek	Namibia
154	Yaren	Nauru
155	Kathmandu	Nepal
156	Amsterdam	Netherlands
157	Noumea	New Caledonia
158	Wellington	New Zealand
159	Managua	Nicaragua
160	Niamey	Niger
161	Abuja	Nigeria
162	Alofi	Niue
163	Kingston	Norfolk Island
164	Pyongyang	North Korea
165	Saipan	Northern Mariana Islands
166	Oslo	Norway
167	Muscat	Oman
168	Islamabad	Pakistan
169	Melekeok	Palau
170	East Jerusalem	Palestinian Territory
171	Panama City	Panama
172	Port Moresby	Papua New Guinea
173	Asuncion	Paraguay
174	Lima	Peru
175	Manila	Philippines
176	Adamstown	Pitcairn
177	Warsaw	Poland
178	Lisbon	Portugal
179	San Juan	Puerto Rico
180	Doha	Qatar
181	Bucharest	Romania
182	Moscow	Russia
183	Kigali	Rwanda
184	Saint-Denis	Réunion
185	Gustavia	Saint Barthelemy
186	Jamestown	Saint Helena
187	Basseterre	Saint Kitts and Nevis
188	Castries	Saint Lucia
189	Marigot	Saint Martin
190	Saint-Pierre	Saint Pierre and Miquelon
191	Kingstown	Saint Vincent and the Grenadines
192	Apia	Samoa
193	San Marino	San Marino
194	Sao Tome	Sao Tome and Principe
195	Riyadh	Saudi Arabia
196	Dakar	Senegal
197	Belgrade	Serbia
198	Victoria	Seychelles
199	Freetown	Sierra Leone
200	Singapur	Singapore
201	Philipsburg	Sint Maarten
202	Bratislava	Slovakia
203	Ljubljana	Slovenia
204	Honiara	Solomon Islands
205	Mogadishu	Somalia
206	Pretoria	South Africa
207	Grytviken	South Georgia and the South Sandwich Islands
208	Seoul	South Korea
209	Juba	South Sudan
210	Madrid	Spain
211	Colombo	Sri Lanka
212	Khartoum	Sudan
213	Paramaribo	Suriname
214	Longyearbyen	Svalbard and Jan Mayen
215	Mbabane	Swaziland
216	Stockholm	Sweden
217	Berne	Switzerland
218	Damascus	Syria
219	Taipei	Taiwan
220	Dushanbe	Tajikistan
221	Dodoma	Tanzania
222	Bangkok	Thailand
223	Dili	Timor-Leste
224	Lome	Togo
225		Tokelau
226	Nuku'alofa	Tonga
227	Port of Spain	Trinidad and Tobago
228	Tunis	Tunisia
229	Ankara	Turkey
230	Ashgabat	Turkmenistan
231	Cockburn Town	Turks and Caicos Islands
232	Funafuti	Tuvalu
233	Charlotte Amalie	U.S. Virgin Islands
234	Kampala	Uganda
235	Kiev	Ukraine
236	Abu Dhabi	United Arab Emirates
237	London	United Kingdom
238	Washington	United States
239		United States Minor Outlying Islands
240	Montevideo	Uruguay
241	Tashkent	Uzbekistan
242	Port Vila	Vanuatu
243	Vatican City	Vatican
244	Vatican City	Vatican City State (Holy See)
245	Caracas	Venezuela
246	Hanoi	Vietnam
247	Mata Utu	Wallis and Futuna
248	El-Aaiun	Western Sahara
249	Sanaa	Yemen
250	Lusaka	Zambia
251	Harare	Zimbabwe
252	Melbourne	Australia
253	Sydney	Australia
254	Perth	Australia
255	Austria	Austria
256	Grenada	Barbados
257	City	Benin
258	La Paz	Bolivia
259	Recife	Brazil
260	Rio de Janeiro	Brazil
261	Sarajevo	Bosnia & Herzegovina
262	Sao Paulo	Brazil
263	Rangoon	Burma
264	Porto Alegre	Brazil
265	Praia	Cabo Verde
266	Montreal	Canada
267	Vancouver	Canada
268	Quebec	Canada
269	Calgary	Canada
270	Toronto	Canada
271	Halifax	Canada
272	Winnipeg	Canada
273	Ndjamena	Chad
274	Wuhan	China
275	Guangzhou	China
276	Shanghai	China
277	Shenyang	China
278	Abidjan	Côte d’Ivoire
279	in Zagreb	Croatia
280	Guayaquil	Ecuador
281	Alexandria	Egypt
282	Mbabane	Eswatini
283	Finland	Finland
284	Bordeaux	France
285	Rennes	France
286	Lyon	France
287	Strasbourg	France
288	Marseille	France
289	Toulouse	France
290	Frankfurt	Germany
291	Düsseldorf	Germany
292	Hamburg	Germany
293	Munich	Germany
294	Leipzig	Germany
295	Thessaloniki	Greece
296	Guinea-Bissau	Guinea-Bissau
297	Banjul	The Gambia
298	See	Italy
299	Kolkata	India
300	Chennai	India
301	Hyderabad	India
302	Mumbai	India
303	Medan	Indonesia
304	Surabaya	Indonesia
305	Bali	Indonesia
306	Florence	Italy
307	Milan	Italy
308	Naples	Italy
309	Nagoya	Japan
310	Sapporo	Japan
311	Naha	Japan
312	Osaka	Japan
313	Fukuoka	Japan
314	Almaty	Kazakhstan
315	Bishkek	Kyrgyz Republic
316	Antananarivo	Madagascar & Comoros
317	Post–Comoros	Madagascar & Comoros
318	Maldives	Maldives
319	Guadalajara	Mexico
320	Hermosillo	Mexico
321	Matamoros	Mexico
322	Merida	Mexico
323	Tijuana	Mexico
324	Nuevo Laredo	Mexico
325	Nogales	Mexico
326	Kolonia	Micronesia
327	Casablanca	Morocco
328	Auckland	New Zealand
329	Lagos	Nigeria
330	Skopje	North Macedonia
331	Peshawar	Pakistan
332	Karachi	Pakistan
333	Lahore	Pakistan
334	Koror	Palau
335	Krakow	Poland
336	Poznan	Poland
337	Azores	Portugal
338	Dhahran	Saudi Arabia
339	Jeddah	Saudi Arabia
340	Singapore	Singapore
341	Somalia	Somalia
342	Cape Town	South Africa
343	Johannesburg	South Africa
344	U.S. Consulate General in Durban	South Africa
345	Barcelona	Spain
346	Bern	Switzerland
347	Liechtenstein	Switzerland
348	Office	American Institute in Taiwan
349	Taiwan	American Institute in Taiwan
350	Dar es Salaam	Tanzania
351	Mai	Thailand
352	Tonga	Tonga
353	Port of Spain	Trinidad & Tobago
354	Istanbul	Turkey
355	Adana	Turkey
356	Rome	U.S. Mission to the UN-Rome
357	Dubai	United Arab Emirates
358	America	United Kingdom
359	Belfast	United Kingdom
360	Edinburgh	United Kingdom
361	Ponta Delgada	Azores
362	St. George	Bermuda
363	New York	United States
364	Belo Horizonte	Brazil
365	Rio De Janeiro	Brazil
366	São Paulo	Brazil
367	Yaoundé	Cameroon
368	Douala	Cameroon
369	Seven Mile Beach	Cayman Islands
370	Chongqing	China
371	Bogotá	Colombia
372	Cartagena	Colombia
373	Dar Es Salaam	Tanzania
374	Kinshasa	Democratic Republic of Congo (Kinshasa)
375	San José	Costa Rica
376	Guardalavaca	Cuba
377	Punta Cana	Dominican Republic
378	Puerto Plata	Dominican Republic
379	Nice	France
380	Nouméa	New Caledonia
381	Banjul	Gambia, The
382	Stuttgart	Germany
383	Pointe-à-Pitre	Guadeloupe
384	Pohnpei	Micronesia (FSM)
385	Hong Kong	China
386	Bengaluru (formerly Bangalore)	India
387	Chandigarh	India
388	Kolkata (formerly Calcutta)	India
389	Mumbai (Formerly Bombay)	India
390	Erbil	Iraq
391	Tel Aviv	Israel, the West Bank and the Gaza Strip
392	Ramallah	Israel, the West Bank and the Gaza Strip
393	Abidjan	Côte d'Ivoire (Ivory Coast)
394	Montego Bay	Jamaica
395	Hiroshima	Japan
396	Nur-Sultan	Kazakhstan
397	Busan	South Korea
398	Penang	Malaysia
399	Rabat-Souissi	Morocco
400	Acapulco	Mexico
401	Cabo San Lucas	Mexico
402	Cancún	Mexico
403	Mazatlán	Mexico
404	Monterrey	Mexico
405	Playa Del Carmen	Mexico
406	Puerto Vallarta	Mexico
407	Ulaanbaatar	Mongolia
408	Yangon	Myanmar
409	Nauru	Nauru
410	The Hague	Netherlands
411	Port Harcourt	Nigeria
412	Stavanger	Norway
413	Panama	Panama
414	Asunción	Paraguay
415	Cebu	Philippines
416	Faro	Portugal
417	Miami	United States
418	Vladivostok	Russia
419	Saint-Pierre	Saint-Pierre-et-Miquelon
420	Málaga	Spain
421	Gothenburg	Sweden
422	Geneva	Switzerland
423	Chiang Mai	Thailand
424	Phuket	Thailand
425	Providenciales	Turks and Caicos Islands
426	Kyiv	Ukraine
427	Lviv	Ukraine
428	Cardiff	United Kingdom
429	Atlanta	United States
430	Boston	United States
431	Chicago	United States
432	Dallas	United States
433	Denver	United States
434	Detroit	United States
435	Honolulu	United States
436	Los Angeles	United States
437	Minneapolis	United States
438	San Francisco	United States
439	Seattle	United States
440	Ho Chi Minh City	Vietnam
441	Sint Maarten	Sint Maarten
442	Willemstad	Curaçao
443	Dili	Timor-Leste (East Timor)
444	Goma	Democratic Republic of the Congo
445	Abidjan	Ivory Coast
446	Kaduna	Nigeria
447	Enugu	Nigeria
448	Kano	Nigeria
449	Hargeisa	Somalia
450	St.John's	Antigua and Barbuda
451	St.George's	Grenada
452	Port au Prince	Haiti
453	Cancun	Mexico
454	Kingstown	St. Vincent & Grenadines
455	Port Of Spain	Trinidad and Tobago
456	Houston	United States
457	Orlando	United States
458	Raleigh	United States
459	San Diego	United States
460	Brisbane	Australia
461	Bandar Seri Begawan	Brunei Darussalam
462	Hong Kong SAR	China
463	Pyongyang	Democratic People's Republic of Korea
464	Yangon	Myanmar (Burma)
465	Atyrau	Kazakhstan
466	St. Petersburg	Russia
467	Yekaterinburg	Russia
468	Banja Luka	Bosnia and Herzegovina
469	Split	Croatia
470	Marseilles	France
471	Dusseldorf	Germany
472	Corfu	Greece
473	Zakynthos	Greece
474	Rhodes	Greece
475	Heraklion	Greece
476	Vatican City	Holy See
477	Portimao	Portugal
478	Bilbao	Spain
479	Palma	Spain
480	Ibiza	Spain
481	Alicante	Spain
482	Malaga	Spain
483	Santa Cruz de Tenerife	Spain
484	Las Palmas	Spain
485	Izmir	Turkey
486	Antalya	Turkey
487	Fethiye	Turkey
488	Marmaris	Turkey
489	Manama/Bahrain	Bahrain
490	Tel Aviv	Israel
491	Kuwait	Kuwait
492	Tripoli	Libya
493	Jerusalem	Occupied Palestinian territories
494	Gaza	Occupied Palestinian territories
495	Al-Khobar	Saudi Arabia
496	Sana'a	Yemen
497	Anguilla	Anguilla
498	Ascension Island	Ascension Island
499	Tortola	British Virgin Islands
500	Brades	Montserrat
501	Adamstown	Pitcairn Islands
502	Tristan Da Cunha	Tristan Da Cunha 
503	Grand Turk	Turks and Caicos Islands
504	Pune	India
505	Goa	India
506	Bengaluru	India
507	Ahmedabad	India
508	Winston-Salem	United States
509	Weihai	China
510	Venice	Italy
511	Cantt	Pakistan
512	Toyrim	Mongolia
513	Ambon City	Indonesia
\.


--
-- Data for Name: embassies; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.embassies (embassy_id, home_country, latitude, longitude, address, website, dest_id) FROM stdin;
1	United States	38.4979093	-94.07474150000002	\N	\N	1
2	United States	41.31778250000001	19.832494	Rruga e Elbasanit No. 103 Tirana, ALBANIA	\N	3
3	United States	36.7549707	3.0419132	05 Chemin Cheikh Bachir Ibrahimi El-Biar 16030 Alger Algerie	\N	4
4	United States	-8.8100366	13.2455099	R. Houari Boumediene 32, Luanda, Angola, C.P. 6468	\N	7
5	United States	-34.5767977	-58.4183835	Av. Colombia 4300 (C1425GMN) Buenos Aires Argentina	\N	11
6	United States	40.1651787	44.4815771	1 American Avenue Yerevan 0082, Republic of Armenia	\N	12
7	United States	-37.8469056	144.9802442	553 St. Kilda Road Melbourne, VIC 3004	\N	252
8	United States	-35.3076255	149.1175268	Moonah Place Yarralumla, ACT 2600	\N	14
9	United States	-33.868669	151.2090347	Level 10, MLC Centre 19-29 Martin Place Sydney, NSW 2000	\N	253
10	United States	-31.9568503	115.8644221	16 St. George’s Terrace Perth, WA 6000	\N	254
11	United States	48.2230861	16.3568584	Boltzmanngasse 16 1090 Vienna, Austria	\N	255
12	United States	40.3869885	49.8430172	111 Azadlig avenue AZ1007 Baku, Azerbaijan	\N	16
13	United States	25.0772626	-77.34693419999999	42 Queen St. Nassau, the Bahamas	\N	17
14	United States	26.2070785	50.5714278	Bldg. 979, Road 3119, Block 331, Zinj P.O. Box 26431 Manama – Kingdom of Bahrain	\N	18
15	United States	23.7980828	90.42211569999999	Madani Avenue, Baridhara, Dhaka -1212, Bangladesh	\N	19
16	United States	13.0932136	-59.58548320000001	Wildey Business Park St. Michael BB 14006 Barbados, W.I.	\N	20
17	United States	11.998833	-61.756109	Lance Aux Epines St. George’s Grenada	\N	256
18	United States	53.9129625	27.558673	46 Starovilenskaya St. Minsk 220002, Belarus	\N	21
19	United States	50.8445639	4.3673185	Regentlaan 27 Boulevard du Régent, B-1000 Brussels	\N	22
20	United States	17.2574043	-88.7724468	Floral Park Road Belmopan, Cayo Belize	\N	23
21	United States	6.350391699999999	2.4174213	Marina Avenue, 01 BP 2012, Cotonou, Benin	\N	257
22	United States	32.295395	-64.76810569999999	16 Middle Road Devonshire, DV 03 Bermuda	\N	25
23	United States	-16.5126828	-68.121301	Avenida Arce 2780 Casilla 425 La Paz, Bolivia	\N	258
24	United States	-8.057470499999999	-34.8929446	Rua Gonçalves Maia, 163 – Boa Vista 50070-060 – Recife, PE	\N	259
25	United States	-22.9113613	-43.1740495	Av. Presidente Wilson, 147 – CasSTOPo 20030-020 – Rio de Janeiro, RJ	\N	260
26	United States	4.920613599999999	114.9549133	Simpang 336-52-16-9, Jalan Duta Bandar Seri Begawan BC4115 Brunei	\N	35
27	United States	42.6668063	23.3120142	16, Kozyak Street Sofia 1408, Bulgaria	\N	36
28	United States	12.3099593	-1.4914202	Secteur 15, Ouaga 2000 Avenue Sembène Ousmane, Rue 15.873 Ouagadougou, Burkina Faso	\N	37
29	United States	-15.9190829	-48.0536191	SES – Av. das Nações, Quadra 801, Lote 03 70403-900 – Brasília, DF	\N	32
30	United States	43.8566638	18.4003922	1 Robert C. Frasure Street, 71000 SARAJEVO	\N	261
31	United States	-23.6294064	-46.6974844	Rua Henri Dunant, 500, Chácara Santo Antônio, São Paulo- SP, 04709-110	\N	262
32	United States	16.8253686	96.1444142	110 University Ave Kamayut Township Rangoon, Burma	\N	263
33	United States	-24.656729	25.909818	Embassy Drive Government Enclave Gaborone, Botswana	\N	30
34	United States	-30.0125879	-51.1685878	Av. Assis Brasil, 1889 Passo d’Areia Porto Alegre – RS	\N	264
35	United States	-3.3682629	29.3824716	B.P. 1720 Avenue Des Etats-Unis Bujumbura, Burundi	\N	38
36	United States	14.9210923	-23.506333	Rua Abilio Macedo 6 Praia, Cape Verde	\N	265
37	United States	3.8991951	11.4986357	Avenue Rosa Parks Yaounde, Cameroon	\N	40
38	United States	45.49944	-73.5732376	1134 Saint-Catherine St W Montreal, QC H3B 5K2	\N	266
39	United States	49.2875786	-123.119728	1075 West Pender Street Vancouver, British Columbia V6E 2M6	\N	267
40	United States	46.8106128	-71.204747	2, rue de la Terrasse-Dufferin Quebec, Quebec G1R 4T9 Canada	\N	268
41	United States	45.4280069	-75.69595679999999	490 Sussex Drive Ottawa, Ontario K1N 1G8 Canada	\N	41
42	United States	51.0466528	-114.0586221	615 MacLeod Trail S.E. 10th Floor Rocky Mountain Plaza Building Calgary, Alberta T2G 4T8	\N	269
43	United States	43.65278259999999	-79.38789709999999	360 University Avenue Toronto, Ontario M5G 1S4	\N	270
44	United States	44.6526567	-63.5745702	1969 Upper Water Street Suite 904, Purdy’s Wharf Tower II B3J 3R7	\N	271
45	United States	49.8957545	-97.13925449999999	201 Portage Avenue, Suite 860 Winnipeg, Manitoba R3B 3K6 Canada	\N	272
46	United States	4.3657254	18.5615548	Avenue David Dacko P.O. Box 924 Bangui Central African Republic	\N	44
47	United States	12.10201	15.0478635	U.S. Embassy N’Djamena B.P. 413 N’Djamena, Chad	\N	273
48	United States	-33.4127906	-70.6048674	Av. Andrés Bello 2800 Las Condes Santiago, Chile	\N	46
55	United States	4.6357134	-74.0939408	Carrera 45 No. 24B-27 Bogotá, D.C. Colombia	\N	51
56	United States	9.941862500000001	-84.1236452	Calle 98 Vía 104, Pavas San José, Costa Rica	\N	55
57	United States	5.3314583	-3.975088299999999	Cocody Riviéra Golf, 01 BP 1712 Abidjan 01, Abidjan, Côte d’Ivoire	\N	278
58	United States	45.7431467	16.0040439	Ulica Thomasa Jeffersona 2 10010 Zagreb Croatia	\N	279
59	United States	32.6669187	-115.3877299	Calzada between L & M Streets, Vedado Havana, Cuba	\N	57
60	United States	35.168565	33.3471136	Metochiou & Ploutarchou Street 2407, Engomi Nicosia, Cyprus	\N	59
61	United States	50.0873342	14.4013251	Tržiště 15 118 01 Praha 1 – Malá Strana Czech Republic	\N	60
62	United States	-4.30068	15.3136601	310 Avenue des Aviateurs Kinshasa, Gombe Democratic Republic of the Congo	\N	61
51	United States	31.21647	121.45836	1469 Huai Hai Zhong Road (Near Wulumuqi Nan Lu) 200031 Shanghai China	https://mo.usembassy.gov	276
54	United States	30.595124	114.270037	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	https://mo.usembassy.gov	274
50	United States	23.119397	113.321208	Huaxia Road, Zhujiang New Town (near Exit B1 of the Zhujiang New Town subway station, Line 3 and Line 5) Tianhe District Guangzhou, China	https://mo.usembassy.gov	275
52	United States	30.595124	114.270037	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	https://mo.usembassy.gov	274
63	United States	11.5639163	43.1671799	Lot 350-B Haramouss B.P. 185 Djibouti	\N	63
64	United States	-2.191271	-79.9393178	Santa Ana St. and Jose Eduardo Rodriguez Bonin Ave. San Eduardo Sector Guayaquil	\N	280
65	United States	-0.1383838	-78.46782379999999	E12-170 Avigiras Ave. and Eloy Alfaro Ave. Quito, Ecuador	\N	66
66	United States	31.2051141	29.9054277	3 Pharaana Street, Azarita Alexandria, Egypt	\N	281
67	United States	30.0411666	31.2333678	5 Tawfik Diab Street Garden City, Cairo Egypt	\N	67
68	United States	13.6643665	-89.2580255	Final Boulevard Santa Elena Antiguo Cuscatlán, La Libertad	\N	68
69	United States	3.75116	8.754836	Malabo II highway Malabo, Guinea Ecuatorial	\N	69
70	United States	15.3228767	38.9250517	179 Alaa Street Asmara, Eritrea	\N	70
71	United States	59.43054530000001	24.7516595	Kentmanni 20 15099 Tallinn Estonia	\N	71
72	United States	-26.3260321	31.14716019999999	7th Floor, Central Bank Building Mahlokohla Street P.O. Box 199 Mbabane, Swaziland	\N	282
73	United States	9.0585866	38.7633293	Entoto Street P.O. Box 1014 Addis Ababa Embassy	\N	72
74	United States	-18.1165602	178.4407101	“158 Princes Road, Tamavua P.O. Box 218 Suva, Fiji	\N	75
75	United States	60.157353	24.9608875	Itäinen Puistotie 14 B 00140 Helsinki Finland	\N	283
76	United States	44.85481009999999	-0.5671940999999999	89 Quai des Chartrons 33300 Bordeaux	\N	284
77	United States	48.1101622	-1.6824906	P30, Quai Duguay-Trouin 35000 Rennes	\N	285
78	United States	45.7629696	4.8379508	1, quai Jules Courmont 69002 Lyon	\N	286
79	United States	48.5869776	7.761515199999999	15, Avenue d’Alsace 67082 Strasbourg Cedex France	\N	287
80	United States	48.867443	2.3202637	2 avenue Gabriel 75008 Paris France	\N	77
81	United States	43.29031380000001	5.3792122	Place Varian Fry 13286 Marseille Cedex 6 France	\N	288
82	United States	43.6065902	1.4493215	25, allées Jean Jaurès 31000 Toulouse	\N	289
83	United States	0.4161854	9.467299400000002	Sablière B.P. 4000 Libreville, Gabon	\N	80
84	United States	41.787101	44.776792	11 George Balanchine Street Tbilisi, Georgia, 0131	\N	82
91	United States	5.5797544	-0.1708615	No. 24, Fourth Circular Rd., Cantonments, Accra P.O. Box GP 2288 Accra, Ghana	\N	84
92	United States	40.6333034	22.942451	43 Tsimiski, 7th Floor 546 23 Thessaloniki GREECE	\N	295
93	United States	37.9765726	23.7482357	91 Vasilisis Sophias Avenue 10160 Athens, Greece	\N	86
94	United States	14.6058227	-90.5150208	Avenida Reforma 7-01, Zona 10 Guatemala	\N	91
95	United States	9.583333	-13.65	P.O. Box 603 Transversale No. 2 Centre Administratif de Koloma Commune de Ratoma Conakry, Republic of Guinea	\N	93
96	United States	14.7418188	-17.5187227	Route des Almadies – BP 49 Dakar, Senegal	\N	296
97	United States	6.8239198	-58.16224260000001	100 Young and Duke Streets, Kingston Georgetown, Guyana	\N	95
98	United States	13.4619959	-16.6867609	Kairaba Avenue, Fajara P.M.B. 19 Banjul, The Gambia	\N	297
99	United States	18.580522	-72.2678251	Tabarre 41 Route de Tabarre Port-au-Prince, Haiti	\N	96
100	United States	41.9060753	12.4913537	Via Sallustiana, 49 00187 Rome, Italy	\N	298
101	United States	14.103893	-87.1909809	Avenida La Paz Tegucigalpa M.D.C. Honduras	\N	98
102	United States	22.2782104	114.1587519	26 Garden Road, Central Hong Kong	\N	99
103	United States	47.5044608	19.051426	Szabadság tér 12 H-1054 Budapest Hungary	\N	100
104	United States	64.14379869999999	-21.9375998	Laufásvegur 21 101 Reykjavík	\N	101
105	United States	22.5511885	88.3493395	38A, J.L.Nehru Road Kolkata 700 071, West Bengal, India	\N	299
106	United States	28.5901863	77.18693929999999	Shantipath, Chanakyapuri New Delhi – 110021	\N	102
107	United States	13.0495622	80.2490564	Gemini Circle Chennai 600 006	\N	300
108	United States	17.4414731	78.47420869999999	Paigah Palace 1-8-323, Chiran Fort Lane Begumpet Secunderabad 500 003	\N	301
109	United States	19.0640487	72.8633411	C-49, G-Block, Bandra Kurla Complex Bandra East, Mumbai 400051	\N	302
110	United States	3.5860499	98.6823189	Uni Plaza Building 4th Floor (West Tower) Jl. Let. Jend. MT Haryono A-1 Medan 20231, Indonesia	\N	303
111	United States	-7.2836544	112.6479534	Jl. Citra Raya Niaga No. 2 Surabaya, Indonesia	\N	304
112	United States	-8.6722475	115.2444518	Jl. Hayam Wuruk 310, Denpasar Bali, Indonesia	\N	305
113	United States	-6.1810602	106.8303286	Jl. Medan Merdeka Selatan No. 3 – 5 Jakarta 10110, Indonesia	\N	103
114	United States	35.771504	51.4651724	Embassy of Switzerland Foreign Interests Section No. 39, Shahid Mousavi (Golestan 5th) Corner of Paidarfard St. (ex-Amir Ebrahimi St.) Pasdaran, Tehran	\N	104
115	United States	53.3302944	-6.233710599999999	42 Elgin Road Ballsbridge Dublin 4	\N	106
116	United States	31.7476119	35.2245487	14 David Flusser Street Jerusalem 9378322	\N	108
117	United States	43.7738567	11.240557	Lungarno Vespucci, 38 50123 Firenze	\N	306
118	United States	45.47500290000001	9.1944964	via Principe Amedeo, 2/10 20121 MILANO	\N	307
119	United States	41.9072651	12.4905066	via Vittorio Veneto 121 00187 Roma	\N	109
120	United States	40.8321873	14.2260334	Piazza della Repubblica 80122 NAPOLI	\N	308
121	United States	18.0184667	-76.7648542	142 Old Hope Road Kingston 6 Jamaica, West Indies	\N	111
122	United States	35.1728083	136.8901895	Nagoya International Center Bldg. 6F 1-47-1 Nagono, Nakamura-ku, Nagoya 450-0001	\N	309
123	United States	35.6688048	139.743326	1-10-5 Akasaka Minato-ku, Tokyo 107-8420 JAPAN	\N	112
124	United States	43.056348	141.313697	Kita 1-jo Nishi 28-chome, Chuo-ku Sapporo 064-0821, Japan	\N	310
125	United States	26.2528989	127.7386313	U.S. Consulate General Naha 2-1-1 Toyama, Urasoe City, Okinawa	\N	311
85	United States	50.140646	8.6938367	Gießener Str. 30 60435 Frankfurt am Main Federal Republic of Germany	https://de.usembassy.gov	290
89	United States	48.1452183	11.5836608	Königinstraße 5 80539 München Federal Republic of Germany	https://de.usembassy.gov	293
86	United States	52.4522127	13.2720431	Clayallee 170 14191 Berlin Federal Republic of Germany	https://de.usembassy.gov	83
90	United States	51.3338963	12.3683524	Wilhelm-Seyfferth-Straße 4 04107 Leipzig Federal Republic of Germany	https://de.usembassy.gov	294
126	United States	34.69680330000001	135.501877	2-11-5, Nishitenma Kita-ku, Osaka 530-8543	\N	312
127	United States	33.5881047	130.3730286	5-26 Ohori 2-chome Chuo-ku Fukuoka 810-0052	\N	313
128	United States	31.9399646	35.879487	Abdoun, Al-Umawyeen St. Amman – Jordan	\N	114
129	United States	51.1508536	71.4647846	Rakhymzhan Koshkarbayev Avenue, No. 3. Astana, Kazakhstan, 010010	\N	115
130	United States	43.233565	76.95417890000002	Samal-2, 97 Zholdasbekov Street, Almaty, Kazakhstan, 050051	\N	314
131	United States	-1.2297184	36.8134779	United Nations Avenue Nairobi P. O. Box 606 Village Market 00621 Nairobi, Kenya	\N	116
132	United States	42.6624838	21.1376087	Arberia/Dragodan, Nazim Hikmet 30 Pristina, Kosovo	\N	118
133	United States	29.3715596	47.9736459	P. O. Box 77 Safat 13001 Kuwait	\N	119
134	United States	42.8267324	74.5824841	171 Prospect Mira Bishkek 720016 Kyrgyz Republic	\N	315
135	United States	17.8840408	102.648401	Ban Somvang Thai Thadeua Road, Km 9 Hatsayfong district	\N	121
136	United States	56.93049749999999	24.0290906	1 Samnera Velsa St. (former Remtes) Riga LV-1510 Latvia	\N	122
137	United States	33.9346943	35.5978345	Awkar-Facing the Municipality, Main Street Beirut, Lebanon	\N	123
138	United States	-29.3150767	27.4869229	P.O. Box 333 Maseru 100 Lesotho	\N	124
139	United States	6.316432799999999	-10.8133567	502 Benson Street Monrovia	\N	125
140	United States	54.6841428	25.2705385	Akmenų g. 6 Vilnius, Lithuania	\N	128
141	United States	49.6189705	6.129033499999999	22 Boulevard Emmanuel Servais L-2535 Luxembourg	\N	129
142	United States	-18.8587693	47.4753985	Lot 207 A – Andranoro – Antehiroka 105 Antananarivo – Madagascar	\N	316
143	United States	-18.8587693	47.4753985	Lot 207 A – Andranoro – Antehiroka 105 Antananarivo – Madagascar	\N	317
144	United States	-13.9812821	33.7740728	P.O Box 30016 16 Jomo Kenyatta Road, Lilongwe 3, Malawi	\N	133
145	United States	3.1556223	101.7229636	376 Jalan Tun Razak 50400 Kuala Lumpur	\N	134
146	United States	6.912968299999999	79.849116	210 Galle Road Colombo 03 Sri Lanka	\N	318
147	United States	12.6298493	-8.018906300000001	ACI 2000 Rue 243, Porte 297 Bamako, Mali	\N	136
148	United States	35.8924089	14.4206599	Ta’ Qali National Park Attard, ATD 4000	\N	137
149	United States	7.066667	171.266667	Mejen Weto, Ocean Side Majuro, Marshall Islands	\N	138
150	United States	18.0951066	-15.9771465	288, rue 42-100, (rue Abdallaye) BP 222, Nouakchott, Mauritania	\N	140
151	United States	-20.1619906	57.50047509999999	4th Floor, Rogers House John Kennedy Avenue P.O. Box 544 Port Louis Republic of Mauritius	\N	141
152	United States	19.428387	-99.1663299	Paseo de la Reforma 305 Colonia Cuauhtemoc 06500 Mexico, D.F.	\N	143
153	United States	20.6734316	-103.3669868	Progreso 175 Col. Americana Codigo Postal 44160 Guadalajara, Jalisco, Mexico	\N	319
154	United States	29.0785051	-110.958953	141 Monterey Street Col. Esqueda, C.P. 83000 Hermosillo, Sonora, Mexico	\N	320
155	United States	25.8867588	-97.5031726	Calle Constitución No. 1 Colonia Jardín Matamoros, Tamaulipas 87330	\N	321
156	United States	20.9889434	-89.6199267	Calle 60 No. 338-K x 29 y 31 Col. Alcala Martin Merida, Yucatan, Mexico	\N	322
157	United States	32.5257154	-116.9552129	Paseo de las Culturas s/n Mesa de Otay Delegación Centenario C.P. 22425 Tijuana, Baja California	\N	323
158	United States	27.4652804	-99.50001859999999	Paseo Colon 1901 Colonia Madero Nuevo Laredo, Tamaulipas 88260	\N	324
159	United States	31.2886516	-110.9400018	Calle San José s/n Fraccionamiento los Alamos C. P. 84065 Nogales, Sonora	\N	325
160	United States	6.9641667	158.2083333	P.O. Box 1286 Kolonia, Pohnpei FSM 96941	\N	326
161	United States	47.0217867	28.81902699999999	103 Mateevici street Chisinau MD-2009 Republic of Moldova	\N	145
162	United States	42.4371052	19.2512567	Dzona Dzeksona 2 81000 Podgorica Montenegro	\N	148
163	United States	33.590059	-7.6263704	8, Bd Moulay Youssef Casablanca	\N	327
164	United States	33.9558109	-6.8240101	Km 5.7, Avenue Mohamed VI Souissi, Rabat 10170, Morocco	\N	150
165	United States	-25.9567095	32.59510330000001	Av. Kenneth Kaunda, 193 Caixa Postal, 783	\N	151
166	United States	-22.5758281	17.0872341	14 Lossen Street Windhoek, Namibia	\N	153
167	United States	27.7381702	85.3363838	Embassy of the United States of America Maharajgunj, Kathmandu, Nepal	\N	155
168	United States	52.3561892	4.8820771	Museumplein 19 1071 DJ Amsterdam The Netherlands	\N	156
169	United States	52.3561892	4.8820771	Museumplein 19 1071 DJ Amsterdam The Netherlands	\N	156
170	United States	-41.27268919999999	174.7788378	29 Fitzherbert Terrace Thorndon Wellington 6011 New Zealand	\N	158
171	United States	-36.8451345	174.7675626	Level 3, 23 Customs Street East Auckland 1010 New Zealand	\N	328
172	United States	12.1174298	-86.31529379999999	Kilometer 5.5 Carretera Sur Managua, Nicaragua	\N	159
173	United States	13.5115963	2.1253854	BP 11201 Niamey, Niger	\N	160
174	United States	6.4410754	3.4069013	2 Walter Carrington Crescent, Victoria Island, Lagos STOP(234)-1- 460-3600 or (234)-1- 460-3400	\N	329
175	United States	9.040467699999999	7.476518199999998	Plot 1075 Diplomatic Drive Central District Area, Abuja, Nigeria	\N	161
176	United States	42.005325	21.433459	Str. “Samoilova” Nr.21 1000 Skopje Republic of North Macedonia	\N	330
177	United States	59.94170589999999	10.6704495	Morgedalsvegen 36 0378 Oslo Norway	\N	166
178	United States	23.5994813	58.45443629999999	P.C. 115 Madinat Al Sultan Qaboos Muscat, Oman	\N	167
179	United States	34.0027814	71.5406541	11, Hospital Road, Peshawar, Pakistan	\N	331
180	United States	33.7218964	73.10840519999999	Diplomatic Enclave, Ramna 5 Islamabad, Pakistan	\N	168
181	United States	24.8404131	67.010059	Plot 3, 4, 5, New TPX Area Mai Kolachi Road, Karachi	\N	332
182	United States	31.5604277	74.33648869999999	50, Shahrah-e-Abdul Hameed Bin Badees, (Old Empress Road) near Shimla Hill, Lahore, Pakistan	\N	333
183	United States	7.364184199999999	134.5360667	Airai State, in an area known as Omsangel (no street address) P.O. Box 6028 Koro, Palau	\N	334
184	United States	8.9994152	-79.5619202	Building 783, Demetrio Basilio Lakas Avenue Clayton, Panama	\N	171
185	United States	-9.443800399999999	147.1802671	Embassy of the United States of America P.O. Box 1492 Port Moresby, Papua New Guinea	\N	172
186	United States	-25.2931785	-57.6039652	1776 Mariscal Lopez Avenue Asunción, Paraguay	\N	173
187	United States	-12.1006744	-76.9689454	Avenida La Encalada cdra. 17 s/n Surco, Lima 33, Peru	\N	174
188	United States	14.5791844	120.9781407	1201 Roxas Boulevard Manila, Philippines	\N	175
189	United States	50.0601436	19.9388634	ul. Stolarska 9 31-043 Krakow	\N	335
190	United States	52.40778630000001	16.9295664	ul. Paderewskiego 8 61-770 Poznan	\N	336
191	United States	52.22450019999999	21.0236106	Aleje Ujazdowskie 29/31 00-540 Warsaw Poland	\N	177
192	United States	37.7366601	-25.6823822	Avenida Príncipe do Mónaco, 6-2 F 9500 Ponta Delgada	\N	337
193	United States	38.7444316	-9.1632308	Avenida das Forças Armadas 1600-081 Lisboa	\N	178
194	United States	25.3108748	51.47169419999999	22nd February Street Al Luqta District P.O. Box 2399 Doha, Qatar	\N	180
195	United States	-13.8309477	-171.7699055	5th Floor ACC Building Matafele Apia, Samoa	\N	192
196	United States	43.7738567	11.240557	Lungarno Amerigo Vespucci, 38 50123 Florence, Italy	\N	193
197	United States	24.7135517	46.6752957	P.O. Box 94309 Riyadh 11693 Saudi Arabia	\N	195
198	United States	20.0155348	49.1625989	P.O. Box 38955 Dhahran Airport 31942 Saudi Arabia	\N	338
199	United States	21.5244595	39.1670437	Falastin Al-Hamra’a Jeddah 23323, Saudi Arabia	\N	339
200	United States	14.7417774	-17.5186477	Route des Almadies Dakar, Senegal	\N	196
201	United States	44.7725748	20.4526923	92 Bulevar kneza Aleksandra Karadjordjevica 11040 Belgrade, Serbia	\N	197
202	United States	8.4517081	-13.2298476	Southridge – Hill Station Freetown, Sierra Leone	\N	199
203	United States	1.3052732	103.820494	27 Napier Road Singapore	\N	340
204	United States	48.1485965	17.1077478	814 99 Bratislava Slovak Republic	\N	202
205	United States	46.0524987	14.4987152	Prešernova 31 1000 Ljubljana Slovenia	\N	203
206	United States	2.0469343	45.3181623	Mogadishu, Somalia	\N	341
207	United States	-34.0768111	18.4296679	2 Reddam Ave Westlake 7945	\N	342
208	United States	-25.7463649	28.223893	877 Pretorius St Arcadia, Pretoria	\N	206
209	United States	-26.1115163	28.0516459	1 Sandton Drive Sandhurst	\N	343
210	United States	-29.8585811	31.0240265	303 Dr. Pixley KaSeme Street 31st Floor Delta Towers Durban 4001	\N	344
211	United States	37.5731872	126.9780536	188 Sejong-daero, Jongno-gu, Seoul, Korea 03141	\N	208
212	United States	4.8557282	31.5860544	Kololo Road adjacent to the European Union’s compound Juba, South Sudan	\N	209
213	United States	41.3977256	2.1174287	Paseo Reina Elisenda de Montcada, 23 08034 Barcelona, España	\N	345
214	United States	40.4347403	-3.687380499999999	Calle de Serrano, 75 28006 Madrid, Spain	\N	210
215	United States	6.912968299999999	79.849116	210 Galle Road Colombo 03 Sri Lanka	\N	211
216	United States	15.4991903	32.6634212	P.O. Box 699 Kilo 10, Soba Khartoum, Sudan	\N	212
217	United States	5.8642539	-55.12722489999999	Kristalstraat 165 Paramaribo, Suriname	\N	213
218	United States	59.3336644	18.1055425	Dag Hammarskjölds Väg 31, SE-115 89 Stockholm	\N	216
219	United States	46.9435088	7.438304199999999	Sulgeneckstrasse 19 CH-3007 Bern, Switzerland	\N	346
220	United States	46.9434334	7.4382834	In Care Of: Sulgeneckstrasse 19 CH-3007 Bern, Switzerland	\N	347
221	United States	33.49006	36.2371921	Abou Roumaneh, 2 Al Mansour Street Damascus, Syria	\N	218
222	United States	22.6048844	120.3017528	5F, No.88, Chenggong 2nd Road Qianzhen Dist.,Kaohsiung 80661 Taiwan	\N	348
223	United States	25.0807732	121.5982727	No. 100, Jinhu Road, Neihu District 11461, Taipei City, Taiwan	\N	349
224	United States	38.5844043	68.7184784	109-A, Ismoili Somoni Avenue (Zarafshon district) Dushanbe, Tajikistan	\N	220
225	United States	-6.7746691	39.2669673	686 Old Bagamoyo Road, Msasani Dar es Salaam, Tanzania	\N	350
226	United States	18.8160541	98.9848536	387 Witchayanond Road Chiang Mai 50300, Thailand	\N	351
227	United States	13.7359432	100.5472008	95 Wireless Road Bangkok 10330, Thailand	\N	222
228	United States	-8.5483237	125.568763	Avenida de Portugal Praia dos Coqueiros Dili, Timor-Leste	\N	223
229	United States	6.2003657	1.2086934	Boulevard Eyadema B.P. 852, Lomé STOP(+228) 2261 5470 Fax:(+228) 2261 5501	\N	224
230	United States	-18.1440472	178.4244407	31 Loftus Street Suva, Fiji	\N	352
231	United States	10.6659338	-61.51654019999999	15 Queen’s Park West Port of Spain Trinidad and Tobago	\N	353
232	United States	36.8403905	10.2516005	Les Berges du Lac 1053 TUNIS Tunisia	\N	228
233	United States	41.1178218	29.0430833	İstinye Mahallesi, Üç Şehitler Sokak No.2 İstinye 34460 – Istanbul / Turkey	\N	354
234	United States	39.908221	32.856147	110 Atatürk Blvd. Kavaklıdere, 06100 Ankara – Turkey	\N	229
235	United States	36.9828394	35.3851924	Girne Bulvari No:212 Guzelevler Mah. Yuregir, Adana – TÜRKİYE	\N	355
236	United States	37.9392942	58.38565070000001	9 1984 Street (formerly Pushkin Street) Ashgabat, Turkmenistan	\N	230
237	United States	41.9078454	12.4920858	via Boncompagni 2 Rome, Italy	\N	356
238	United States	25.2600603	55.3091059	Corner of Al Seef Rd. and Sheikh Khalifa bin Zayed Rd. Dubai, U.A.E	\N	357
239	United States	24.453884	54.3773438	Airport Road at Rabdan (29th) Street Embassies District, Plot 38, Sector W59-02, Street No. 4 Abu Dhabi, U.A.E.	\N	236
240	United States	51.4828211	-0.1320614	33 Nine Elms Lane London SW11 7US (mailing postcode) or SW8 5DB (driving/GPS postcode) United Kingdom	\N	358
241	United States	-34.9135014	-56.1758807	Lauro Müller 1776 Montevideo, Uruguay	\N	240
242	United States	54.5715178	-5.9456513	Danesfort House 223 Stranmillis Road Belfast BT9 5GR	\N	359
243	United States	55.9542802	-3.1779461	3 Regent Terrace Edinburgh EH7 5BW	\N	360
244	United States	10.4780745	-66.871376	F St. and Suapure St. Urb . Colinas de Valle Arriba Caracas, Venezuela	\N	245
245	United States	-15.4205772	28.3456204	Eastern end of Kabulonga Road Ibex Hill Lusaka, Zambia	\N	250
246	United States	-17.8223148	31.0441818	172 Herbert Chitepo Ave Harare, Zimbabwe	\N	251
247	Canada	37.74324	-25.66968	Rua D’Agua, 28, 9500-016 Ponta Delgada, São Miguel, Azores, Portugal	\N	361
248	Canada	38.72104	-9.1458	Avenida da Liberdade 196-200, 3rd Floor, 1269-121 Lisbon, Portugal	http://www.portugal.gc.ca	178
249	Canada	41.327546	19.818698	Rr. Ibrahim Rugova,  ND 41, H7, Kati5, Tirana, Albania	http://www.portugal.gc.ca	3
250	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	109
251	Canada	36.76148	3.0166	18 Mustapha Khalef St., Ben Aknoun, Algiers, Algeria	http://www.algeria.gc.ca	4
252	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	210
253	Canada	-8.819391	13.244298	Rua Rei Katyavala 113, Luanda, Angola	http://www.spain.gc.ca	7
254	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	251
255	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
256	Canada	17.131657	-61.836037	#12 Village Walk Commercial Center, Friars Hill Road, St. John’s, Antigua	http://www.barbados.gc.ca	10
257	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
258	Canada	-34.58005	-58.3978	Tagle 2828, C1425EEH Buenos Aires, Argentina	http://www.argentina.gc.ca	11
259	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	182
260	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
261	Canada	-33.86164	151.2071	Level 5, Quay West Building, 111 Harrington Street, Sydney, NSW 2000, Australia	http://www.australia.gc.ca	253
262	Canada	48.21076	16.37836	Laurenzenberg 2, A-1010, Vienna, Austria	http://www.austria.gc.ca	15
263	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	229
264	Canada	25.06	-77.345	Shirley Street Plaza, Nassau, Bahamas	http://www.turkey.gc.ca	17
265	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	111
266	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	195
267	Canada	23.79979	90.4185	United Nations Road, Baridhara, Dhaka, Bangladesh	http://www.bangladesh.gc.ca	19
268	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
269	Canada	52.22477	21.02602	ul. Jana Matejki 1/5, 00-481, Warsaw, Poland	http://www.poland.gc.ca	177
270	Canada	50.84003	4.39781	Avenue des Arts 58, 1000, Brussels, Belgium	http://www.belgium.gc.ca	22
271	Canada	14.59704	-90.50452	Edyma Plaza Building, 8th Floor, 13 Calle 8-44, Zona 10, Guatemala City, Guatemala	http://www.guatemala.gc.ca	91
272	Canada	12.369416	-1.516655	316 Professeur Ki-Zerbo Street, Ouagadougou, Burkina Faso	http://www.burkinafaso.gc.ca	37
273	Canada	32.381695	-64.677982	Stewart Hall, 5 Queen Street, St. George, GE 05, Bermuda	https://www.canada.ca/Canada-In-New-York	362
274	Canada	40.75368	-73.974423	466 Lexington Avenue, 20th Floor, New York, New York, U.S.A., 10017	https://www.canada.ca/Canada-In-New-York	363
275	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	102
276	Canada	-17.46667	-68.93333	2678, Calle Victor Sanjinez, Edificio Barcelona, 2nd Floor, Plaza España (Sopocachi), La Paz, Bolivia	http://www.canada.ca/CanadaAndIndia	258
277	Canada	-12.120851	-77.035953	Calle Bolognesi 228, Miraflores, Lima 15074, Peru	http://www.peru.gc.ca	174
278	Canada	48.21076	16.37836	Laurenzenberg 2, A-1010, Vienna, Austria	http://www.austria.gc.ca	15
279	Canada	-24.67857	25.927319	9th floor, iTowers North, Lot 54368 Gaborone	http://www.austria.gc.ca	30
280	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	251
281	Canada	-15.815613	-47.878642	SES - Av. das Nações, Quadra 803, Lote 16, 70410-900 Brasília, DF, Brazil	http://www.brazil.gc.ca	32
282	Canada	-19.93679	-43.92222	SES - Av. das Nações, Quadra 803, Lote 16, 70410-900 Brasília, DF, Brazil	http://www.brazil.gc.ca	364
283	Canada	-22.964916	-43.173957	Av. Atlântica 1130, 13º andar, Copacabana, 22021-000 Rio de Janeiro - RJ, Brazil	http://www.brazil.gc.ca	365
284	Canada	-23.609325	-46.697676	Centro Empresarial Nações Unidas - Torre Norte, Av. das Nações Unidas, 12901, 16º andar, 04578-000 São Paulo - SP, Brazil	http://www.brazil.gc.ca	366
285	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
286	Canada	4.887292	114.943692	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.brunei.gc.ca	35
287	Canada	42.696228	23.316952	7 Pozitano Street, Block #3, 1st Floor, Office #4, 1000 Sofia, Bulgaria	http://www.brunei.gc.ca	36
288	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	181
289	Canada	12.369416	-1.516655	316 Professeur Ki-Zerbo Street, Ouagadougou, Burkina Faso	http://www.burkinafaso.gc.ca	37
290	Canada	-3.37166	29.3565	Hôtel Club du Lac Tanganyika, Chaussée d’Uvira, Bujumbura, Burundi	http://www.burkinafaso.gc.ca	38
291	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	116
292	Canada	11.579752	104.912604	27-29 Street 75, Sangkat Srah Chak, Khan Daun Penh, Phnom Penh, Cambodia	http://www.canadainternational.gc.ca/kenya/	39
293	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	222
294	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	367
295	Canada	4.04749	9.70637	90 Avenue Douala Manga Bell, Bonanjo, Douala	http://www.canadainternational.gc.ca/cameroon-cameroun/	368
296	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	196
297	Canada	19.332905	-81.37997	1st Floor Landmark Square, 64 Earth Close, Seven Mile Beach, Cayman Islands	http://www.senegal.gc.ca	369
298	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	111
299	Canada	4.3617	18.55598	Cabinet ARC, Bangui, Central African Republic	http://www.jamaica.gc.ca	44
300	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	367
301	Canada	12.134846	15.055741	3602, Avenue Ngarta Tombalbaye, door 586, N'Djamena, Chad	http://www.canadainternational.gc.ca/cameroon-cameroun/	45
302	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	367
303	Canada	-33.416678	-70.605389	Nueva Tajamar 481, Torre Norte, 12th Floor, Las Condes, Santiago, Chile	http://www.chile.gc.ca	46
304	Canada	39.94164	116.44616	Consular Section, 19 Dongzhimenwai Dajie, Chaoyang District, Beijing 100600, China	http://www.china.gc.ca	47
305	Canada	29.55725	106.57394	Room 1705, Metropolitan Tower, Wu Yi Lu, Yu Zhong District, Chongqing 400010, China	www.china.gc.ca	370
306	Canada	23.14033	113.26022	26/F, TaiKoo Hui Tower 1, 385 Tianhe Road, Tianhe District, Guangzhou, China, 510620	http://www.china.gc.ca	275
307	Canada	31.222252	121.44395	ECO City Building, 8th floor, 1788 Nanjing Xi Lu - Jing An District, Shanghai, 200040, China	http://www.china.gc.ca	276
308	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	371
309	Canada	10.403862	-75.553888	Edificio Centro Ejecutivo Bocagrande, Carrera 3, No. 8-129, Oficina No. 1103, Cartagena, Colombia	http://www.colombia.gc.ca	372
310	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	373
311	Canada	-4.315966	15.276362	17, avenue Pumbu, Commune de Gombe, Kinshasa, Congo (Kinshasa)	http://www.canadainternational.gc.ca/congo/	374
312	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	375
313	Canada	45.81723	15.95733	Prilaz Gjure Dezelica 4, 10000 Zagreb, Croatia	http://www.croatia.gc.ca	56
314	Canada	23.11783	-82.423445	Calle 30, No. 518 esquina a 7ma, Miramar, Havana, Cuba	www.cuba.gc.ca	57
315	Canada	21.125	-75.82889	Hotel Atlantico, Suite 1, Guardalavaca, Holguín, Cuba	www.cuba.gc.ca	376
316	Canada	35.166503	33.358065	15 Themistocles Dervis Street, 1066 Nicosia, Cyprus	www.cuba.gc.ca	59
317	Canada	37.97739	23.749223	48 Ethnikis Antistaseos Street, Chalandri, 152 31, Athens, Greece	http://www.greece.gc.ca	86
318	Canada	50.09847	14.40626	Ve Struhach 95/2, 160 00 Prague 6, Czech Republic	http://www.czechrepublic.gc.ca	60
319	Canada	55.67977	12.58216	Kristen Bernikowsgade 1, 1105 Copenhagen K., Denmark	http://www.denmark.gc.ca	62
320	Canada	11.82514	42.59028	Place Lagarde, Djibouti	http://www.canadainternational.gc.ca/ethiopia-ethiopie/index.aspx?lang=eng	63
321	Canada	8.995726	38.73621	Old Airport Area, Nefas Silk Lafto Sub City, Kebele 04, House No.122, Addis Ababa, Ethiopia	http://www.canadainternational.gc.ca/ethiopia-ethiopie/	72
322	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
323	Canada	18.469616	-69.939394	Av. Winston Churchill 1099, Torre Citigroup en Acropólis Center,  18th Floor, Ensanche Piantini, Santo Domingo, Dominican Republic	www.dominicanrepublic.gc.ca	65
324	Canada	18.613468	-68.403969	Carretera Veron- Bavaro Km. 2,5, Amstar Business Center, Building 5, Suite 521, Punta Cana, Dominican Republic	www.dominicanrepublic.gc.ca	377
325	Canada	19.796819	-70.690316	Calle Villanueva No. 8, Edificio Abraxas, Puerto Plata, Dominican Republic	www.dominicanrepublic.gc.ca	378
326	Canada	-0.173957	-78.48547	Av. Amazonas N37-29 and Union Nacional de Periodistas, Eurocenter Building, 3rd Floor (one block north of the Supreme Court Building, near Amazonas and United Nations), Quito, Ecuador	http://www.ecuador.gc.ca	66
327	Canada	-2.166869	-79.896377	Avenida Francisco de Orellana, Number 234, Blue Towers Building, 6th Floor, Office 604, Guayaquil, Ecuador	http://www.ecuador.gc.ca	280
328	Canada	30.072131	31.227967	Nile City Towers, 2005 (A) Corniche El Nile, South Tower, 18th floor 11221	https://www.Canada.ca/Canada-And-Egypt	67
329	Canada	13.731	-89.161	Centro Financiero Gigante, Tower A, Lobby 2, Alameda Roosevelt and 63 Avenue S, Colonia Escalón, San Salvador, El Salvador	http://www.elsalvador.gc.ca	68
330	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	161
331	Canada	15.333333	38.933333	Abeneh Street 745, House No. 152/154, Tiravolo, Asmara, Eritrea	http://www.canadainternational.gc.ca/nigeria/	70
332	Canada	15.59715	32.537652	29 Africa Road, Block 56, Khartoum 1, Sudan	http://www.canadainternational.gc.ca/sudan-soudan/	212
333	Canada	59.436744	24.737378	Toom Kooli 13, 2nd Floor, 15186 Tallinn, Estonia	https://www.Canada.ca/Canada-And-Estonia	71
334	Canada	8.995726	38.73621	Old Airport Area, Nefas Silk Lafto Sub City, Kebele 04, House No.122, Addis Ababa, Ethiopia	http://www.canadainternational.gc.ca/ethiopia-ethiopie/	72
335	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
336	Canada	60.1679	24.94848	Pohjoisesplanadi 25B, 00100 Helsinki, Finland	http://www.finland.gc.ca	76
337	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
338	Canada	45.764962	4.836703	3, place de la Bourse 69002 Lyon, France	http://www.france.gc.ca	286
339	Canada	43.700804	7.269396	37, boulevard Dubouchage – 1st floor, 06000 Nice, France	http://www.france.gc.ca	379
340	Canada	48.862725	2.287592	59, allées Jean-Jaurès, 31000 Toulouse, France	http://www.france.gc.ca	289
341	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
342	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
343	Canada	-22.27055	166.4426	Immeuble Norwich, Level 2, 11 Georges Baudoux Street, Artillerie, Noumea, New Caledonia	http://www.france.gc.ca	380
344	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
345	Canada	0.39084	9.45364	Quartier Batterie IV, Pont de Gué-Gué (1st street behind the European Union office), Libreville, Gabon	http://www.newzealand.gc.ca	80
346	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	367
347	Canada	13.47402	-16.69271	48 Atlantic Road, Fajara, Banjul, The Gambia	http://www.cameroon.gc.ca	381
348	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	196
349	Canada	41.701391	44.794189	34 Rustaveli Avenue, Third Floor, Tbilisi, Georgia, 0108	http://www.senegal.gc.ca	82
350	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	229
351	Canada	52.51044	13.3776	Leipziger Platz 17, 10117 Berlin, Germany	http://www.germany.gc.ca	83
352	Canada	51.22327	6.77467	Benrather Strasse 8, 40213 Düsseldorf, Germany	http://www.germany.gc.ca	291
353	Canada	48.13569	11.58082	Tal 29, 80331 Munich, Germany	http://www.germany.gc.ca	293
354	Canada	48.81332	9.17843	Leitzstrasse 45, 70469 Stuttgart, Germany	http://www.germany.gc.ca	382
355	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	84
356	Canada	37.97739	23.749223	48 Ethnikis Antistaseos Street, Chalandri, 152 31, Athens, Greece	http://www.greece.gc.ca	86
357	Canada	40.63401	22.9369	19, N. Kountouriotou Street, 546 25, Thessaloniki, Greece	http://www.greece.gc.ca	295
358	Canada	64.1755	-51.74619	Tuapannguit 48, 3900 Nuuk, Greenland	http://www.greece.gc.ca	87
359	Canada	55.67977	12.58216	Kristen Bernikowsgade 1, 1105 Copenhagen K., Denmark	http://www.denmark.gc.ca	62
360	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
361	Canada	16.265	-61.551	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	383
362	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
363	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.france.gc.ca	384
364	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
365	Canada	14.59704	-90.50452	Edyma Plaza Building, 8th Floor, 13 Calle 8-44, Zona 10, Guatemala City, Guatemala	http://www.guatemala.gc.ca	91
366	Canada	9.53298	-13.69048	Residence Micheline Bloc B 1er Étage Apt 202, Camayenne, Commune de Dixinn, Conakry, Republic of Guinea	http://www.guatemala.gc.ca	93
367	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	196
368	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	196
369	Canada	6.82328	-58.15962	High and Young Streets, Georgetown, Guyana	http://www.guyana.gc.ca	95
370	Canada	18.540347	-72.297276	Delmas Road, between Delmas 75 and 71, Port-au-Prince	http://www.haiti.gc.ca	96
371	Canada	22.287647	114.213278	9th Floor, 25 Westlands Road, Quarry Bay, Hong Kong SAR, China	http://www.hongkong.gc.ca	385
372	Canada	14.088764587915215	-87.1787828207016	Plaza Ficohsa, 3rd Floor, Boulevard San Juan Bosco, Colonia Payaquí, Tegucigalpa, Honduras	http://www.hongkong.gc.ca	98
373	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	375
374	Canada	47.5109	19.036961	Ganz utca 12-14, 1027 Budapest, Hungary	http://www.hungary.gc.ca	100
375	Canada	64.147899	-21.945141	14 Tungata, 101 Reykjavik, Iceland	https://www.canadainternational.gc.ca/iceland-islande/	101
376	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	102
377	Canada	13.012526	77.556032	World Trade Center, 22nd Floor, 26/1, Dr. Rajkumar Road, Malleshwaram West, Yeshwantpur, Bangalore 560055, Karnataka, India	http://www.canada.ca/CanadaAndIndia	386
378	Canada	30.743959	76.784088	C413-C416, 4th Floor, Elante Office Complex, Plot No. 178-178A,  Industrial & Business Park, Phase 1, Chandigarh 160002, India	http://www.canada.ca/CanadaAndIndia	387
379	Canada	22.579376	88.349845	Duncan House, 31 Netaji Subhas Road, Kolkata 700 001, India	http://www.canada.ca/CanadaAndIndia	388
380	Canada	19.00987	72.83558	One International Centre, Tower 2, 21st Floor, Senapati Bapat Marg, Elphinstone Road West, Mumbai 400 013, India	http://www.canada.ca/CanadaAndIndia	389
381	Canada	-6.21516	106.8204	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	103
382	Canada	-8.67006	115.22838	Jalan Tantular No. 32, Renon, Denpasar, Bali, Indonesia	https://bali.indonesia.embassy.gov.au/	305
383	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	229
384	Canada	33.312	44.395	British Embassy Compound, International Zone, Baghdad, Iraq	https://www.Canada.ca/Canada-And-Iraq	105
385	Canada	36.187525	43.973936	Rotana Hotel, Gulan Street, Erbil, Iraq	https://www.canada.ca/Canada-And-Iraq	390
386	Canada	53.333536	-6.248976	7-8 Wilton Terrace, Dublin 2, Ireland	https://www.Canada.ca/Canada-And-Ireland	106
387	Canada	32.06242	34.79066	Canada House, 3/5 Nirim Street, 4th Floor, Tel Aviv 67060, Israel	http://www.israel.gc.ca	391
388	Canada	31.899636	35.204223	12 Elias Odeh Street, Ramallah, West Bank	http://www.westbankandgaza.gc.ca	392
389	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	109
390	Canada	45.4728864	9.1948976	3, Piazza Cavour, 6th floor, 20121 Milan, Italy	http://www.italy.gc.ca	307
391	Canada	5.31778	-4.0161	Immeuble Trade Centre, 23 avenue Noguès, Le Plateau, Abidjan, Côte d'Ivoire	http://www.canadainternational.gc.ca/cotedivoire/	393
392	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	111
393	Canada	18.48212	-77.92932	29 Gloucester Street, Montego Bay	http://www.jamaica.gc.ca	394
394	Canada	35.673609	139.728174	3-38 Akasaka 7-chome, Minato-ku, Tokyo, Japan, 107-8503	http://www.japan.gc.ca	112
395	Canada	33.583544	130.404485	c/o Kyushu Electric Power Co., Inc. 1-82 Watanabe-dori 2-chome, Chuo-ku, Fukuoka, Japan, 810-8720	japan.gc.ca	313
396	Canada	34.388594	132.45584	c/o Chugoku Electric Power Co. Inc., 4-33 Komachi, Naka-ku, Hiroshima-shi, Hiroshima-ken, Japan, 730-8701	http://www.japan.gc.ca	395
397	Canada	35.175289	136.905632	Nakato Marunouchi Building, 6F, 3-17-6 Marunouchi, Naka-ku, Nagoya-shi, Aichi-ken, Japan, 460-0002	http://www.japan.gc.ca	309
398	Canada	34.616354	135.447783	c/o Tsuda Sangyo Co. Ltd., 1-8-19 Hirabayashi Minami, Suminoe-ku, Osaka, 559-8550, Japan	japan.gc.ca	312
399	Canada	43.055789	141.318457	Canada Place, Poseidon Maruyama 2F, 26-1-3 Odori Nishi, Chuo-ku, Sapporo, Japan 064-0820	http://www.japan.gc.ca	310
400	Canada	31.960588	35.881015	133 Zahran Street, Amman, Jordan	https://www.Canada.ca/Canada-And-Jordan	114
401	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	396
402	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	116
403	Canada	1.32905	172.97905	Bairiki, Tarawa, Kiribati	http://www.kiribati.embassy.gov.au/twaa/home.html	117
404	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
405	Canada	39.03031	125.80072	Munsu-dong, Taehak Street, Taedonggang District, Pyongyang, Democratic People’s Republic of Korea	https://www.swedenabroad.se/en/embassies/north-korea-pyongyang/	164
406	Canada	37.56694	126.97079	21 Jeongdong-gil (Jeong-dong), Jung-gu, Seoul (04518), Republic of Korea	http://www.korea.gc.ca	208
407	Canada	37.56694	126.97079	21 Jeongdong-gil (Jeong-dong), Jung-gu, Seoul (04518), Republic of Korea	http://www.korea.gc.ca	208
408	Canada	35.10442	128.97471	c/o Dongsung Chemical Corporation, 99 Sinsan-ro (472 Shinpyung-dong), Saha-gu, Busan, 49421, Republic of Korea	http://www.korea.gc.ca	397
409	Canada	45.81723	15.95733	Prilaz Gjure Dezelica 4, 10000 Zagreb, Croatia	http://www.croatia.gc.ca	56
410	Canada	29.3294	48.00393	Villa 24, Block 4, 24 Al-Mutawakkal Street, Da'aiyah, Kuwait City, Kuwait	http://www.kuwait.gc.ca	119
411	Canada	42.87116	74.58326	299/5, Chingiz Aitmatov Avenue, Bishkek, 720016, Kyrgyz Republic	http://www.kuwait.gc.ca	120
412	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	396
413	Canada	17.96277	102.61443	KM4, Thadeua Road, Watnak Village,  Sisattanak District, Vientiane, Laos	http://www.kazakhstan.gc.ca	121
414	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	222
415	Canada	56.957612	24.121325	20/22 Baznicas Street, 6th Floor, Riga LV-1010, Latvia	https://www.Canada.ca/Canada-And-Latvia	122
416	Canada	33.909298	35.578156	First Floor, Coolrite Building, 43 Jal El Dib Highway (seaside), Beirut, Lebanon	http://www.lebanon.gc.ca	123
417	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	206
418	Canada	5.31778	-4.0161	Immeuble Trade Centre, 23 avenue Noguès, Le Plateau, Abidjan, Côte d'Ivoire	http://www.canadainternational.gc.ca/cotedivoire/	393
419	Canada	36.847113	10.276961	Lot 24, rue de la Feuille d’Érable, Cité des Pins, Tunis, Tunisia	http://www.tunisia.gc.ca	228
420	Canada	46.94036	7.45753	Kirchenfeldstrasse 88, CH-3005 Bern, Switzerland	http://www.switzerland.gc.ca	346
421	Canada	54.686371	25.27891	Business Centre 2000, Jogailos St. 4, 7th Floor, Vilnius 01116, Lithuania	https://www.Canada.ca/Canada-And-Lithuania	128
422	Canada	49.37008	6.10068	51 rue Raoul Follereau, L-1529 Luxembourg	http://www.belgium.gc.ca	129
423	Canada	50.84003	4.39781	Avenue des Arts 58, 1000, Brussels, Belgium	http://www.belgium.gc.ca	22
424	Canada	22.287647	114.213278	9th Floor, 25 Westlands Road, Quarry Bay, Hong Kong SAR, China	http://www.hongkong.gc.ca	385
425	Canada	-18.868517	47.524364	Ivandry Business Center (ex-pullman), 5th floor, Velo Rainimangalahy Street, Ivandry, Antananarivo 101	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	132
426	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	206
427	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	151
428	Canada	3.14468	101.70825	17th Floor, Menara Tan & Tan, 207 Jalan Tun Razak, 50400 Kuala Lumpur, Malaysia	http://www.malaysia.gc.ca	134
429	Canada	5.35441	100.40908	3007, Tingkat Perusahaan 5, Prai Industrial Park, 13600 Prai, Penang, Malaysia	http://www.malaysia.gc.ca	398
430	Canada	6.9049	79.85555	33-A 5th Lane, Colombo 03, Sri Lanka	http://www.srilanka.gc.ca	211
431	Canada	12.659541	-7.962958	Immeuble Séméga, Route de Koulikoro, Commune II, Bamako, Mali	http://www.mali.gc.ca	136
432	Canada	35.899888	14.513605	Demajo House, 103 Archbishop Street (Triq L-Arcisqof), Valletta VLT 09, Malta	http://www.mali.gc.ca	137
433	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	109
434	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.italy.gc.ca	384
435	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
436	Canada	18.09507	-15.975503	Al Khayma city center, 10 Mamadou Konaté street, 3rd floor, Nouakchott, Mauritania	http://www.france.gc.ca	140
437	Canada	33.99335	-6.8485	66 Mehdi Ben Barka Avenue, Rabat-Souissi, Morocco	http://www.morocco.gc.ca	399
438	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	206
439	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	197
440	Canada	42.000408	21.417712	Bul. Partizanski odredi 70b, Third floor, 1000 Skopje, North Macedonia	http://www.serbia.gc.ca	330
441	Canada	19.428712	-99.185908	Calle Schiller No. 529, Colonia Polanco, 11560 México, D.F., México	http://www.mexico.gc.ca	143
442	Canada	16.859705	-99.873603	Pasaje Diana, Avenida Costera Miguel Alemán 121, L-16, Fracc. Magallanes, 39670 Acapulco, Guerrero, México	http://www.mexico.gc.ca	400
443	Canada	22.901506	-109.899599	Carretera Transpeninsular Km. 0.5, Local 82, Col. El Tezal, 23454 Cabo San Lucas, Baja California Sur, México	http://www.mexico.gc.ca	401
444	Canada	21.106841	-86.764022	Centro Empresarial, Oficina E7, Blvd. Kukulcan Km. 12, Zona Hotelera, 77599 Cancún, Quintana Roo, México	http://www.mexico.gc.ca	402
445	Canada	20.655751	-103.389528	World Trade Center, Av. Mariano Otero 1249, Torre Pacifico Piso 8, Col. Rinconada del Bosque, 44530 Guadalajara, Jalisco, México	http://www.mexico.gc.ca	319
446	Canada	23.274546	-106.454229	Centro Comercial La Marina Business and Life, Blvd. Marina Mazatlán 2302, Office 41, Col. Marina Mazatlán, 82103 Mazatlán, Sinaloa, Mexico	http://www.mexico.gc.ca	403
447	Canada	25.644956	-100.3603	Torre Gomez Morin 955, Ave. Gomez Morin No. 955, Suite 404, Col. Montebello, 66279 San Pedro Garza Garcia, Nuevo Léon, México	http://www.mexico.gc.ca	404
659	United Kingdom	9.52	44.07	AfBarwaaqo Rd, Hargeisa, Somalia	\N	449
448	Canada	20.620746	-87.078264	Plaza Paraíso Caribe, Modulo C, Planta 2, Oficina C21 - 24, Av. 10 Sur entre Calle 3 y 5 Sur, M-35, Lote 1, Colonia Centro, 77710 Playa del Carmen, Quintana Roo, México	http://www.mexico.gc.ca	405
449	Canada	20.646788	-105.239151	Plaza Peninsula, Local Sub F, Boulevard Francisco Medina Ascencio 2485, Zona Hotelera Norte, 48300 Puerto Vallarta, Jalisco, México	http://www.mexico.gc.ca	406
450	Canada	32.520393	-117.012578	Germán Gedovius No.10411-101, Condominio del Parque, Zona Río, 22320 Tijuana, Baja California Norte, México	http://www.mexico.gc.ca	323
451	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.mexico.gc.ca	384
452	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
453	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	181
454	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
455	Canada	43.728344	7.413862	Le Mercator, 7, rue de l'Industrie (9th floor), 98000, Monaco	http://www.france.gc.ca	146
456	Canada	47.918157	106.920625	Sukhbaatar Square 2, Central Tower, Suite 608, Sukhbaatar District, Horoo 8, Ulaanbaatar, Mongolia	http://www.mongolia.gc.ca	407
457	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	197
458	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
459	Canada	33.99335	-6.8485	66 Mehdi Ben Barka Avenue, Rabat-Souissi, Morocco	http://www.morocco.gc.ca	399
460	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	151
461	Canada	23.61	58.54	7th Floor, Getco Tower, Muscat, Oman	http://www.canadainternational.gc.ca/mozambique/	167
462	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	195
463	Canada	16.772558	96.158467	9th Floor, Centrepoint Towers, 65 Sule Pagoda Road, Yangon, Myanmar	https://www.Canada.ca/Canada-And-Myanmar	408
464	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	206
465	Canada	-0.53	166.911667	MQ45 NPC OE, Aiwo District, Nauru	http://nauru.highcommission.gov.au	409
466	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
467	Canada	27.717731	85.306019	Kaldhara Marg 20356, Khusibu, Kathmandu, Nepal	http://www.australia.gc.ca	155
468	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	102
469	Canada	52.08552	4.30372	Sophialaan 7, 2514 JP The Hague, The Netherlands	http://www.netherlands.gc.ca	410
470	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
471	Canada	12.139515	-86.279466	De Los Pipitos, 2 Blocks West, El Nogal Street No. 25, Bolonia, Managua, Nicaragua	http://www.newzealand.gc.ca	159
472	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	375
473	Canada	13.32056	2.04247	Rue KK 41 Kouara Kano, Porte 335, Niamey, Niger	http://www.costarica.gc.ca	160
474	Canada	12.659541	-7.962958	Immeuble Séméga, Route de Koulikoro, Commune II, Bamako, Mali	http://www.mali.gc.ca	136
475	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	161
476	Canada	6.434491	3.414936	4 Anifowoshe Street, Victoria Island, Lagos, Nigeria	http://www.canadainternational.gc.ca/nigeria/	329
477	Canada	4.845686	7.050609	15 Ahoada Street, Rumuibekwe Housing Estate, Port Harcourt, Nigeria	http://www.canadainternational.gc.ca/nigeria/	411
478	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
479	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.newzealand.gc.ca	384
480	Canada	59.91891	10.7316	Wergelandsveien 7, 0244 Oslo, Norway	http://www.norway.gc.ca	166
481	Canada	58.915001	5.729692	Olav Kyrres gate 21, Stavanger, Norway	http://www.norway.gc.ca	412
482	Canada	33.72311	73.1039	Diplomatic Enclave, Sector G-5, Islamabad, Pakistan	http://www.pakistan.gc.ca	168
483	Canada	24.893194	67.028061	c/o Beach Luxury Hotel, Moulvi Tamiz Khan Road, Karachi, Sindh, Pakistan 74000	http://www.pakistan.gc.ca	332
484	Canada	31.54505	74.34068	102-A, Siddique Trade Centre, 72 Main Boulevard, Gulberg 111, Lahore, Punjab, Pakistan 54660	http://www.pakistan.gc.ca	333
485	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.pakistan.gc.ca	384
486	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
487	Canada	8.97683	-79.50765	Torres de Las Americas, Tower A, 11th Floor, Punta Pacifica, Panama City, Panama	http://www.panama.gc.ca	413
488	Canada	-9.438	147.18953	Godwit Road, Waigani NCD, Port Moresby, Papua New Guinea	http://www.png.embassy.gov.au	172
489	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
490	Canada	-25.294754	-57.579378	Edificio Citicenter, Avenida Mariscal Francisco Solano López 3794 (Cruz del Chaco entrance), 5th floor, Asunción, Paraguay	http://www.australia.gc.ca	414
491	Canada	-34.58005	-58.3978	Tagle 2828, C1425EEH Buenos Aires, Argentina	http://www.argentina.gc.ca	11
492	Canada	-12.120851	-77.035953	Calle Bolognesi 228, Miraflores, Lima 15074, Peru	http://www.peru.gc.ca	174
493	Canada	14.56075	121.016443	8th Floor, Tower 2, RCBC Plaza, 6819 Ayala Avenue, Makati City, Manila, Philippines 0707	http://www.philippines.gc.ca	175
494	Canada	10.345649	123.912861	RD Corporate Center, 96 Gov. M.C. Cuenco Avenue, Cebu City 6000, Philippines	http://www.philippines.gc.ca	415
495	Canada	52.22477	21.02602	ul. Jana Matejki 1/5, 00-481, Warsaw, Poland	http://www.poland.gc.ca	177
496	Canada	38.72104	-9.1458	Avenida da Liberdade 196-200, 3rd Floor, 1269-121 Lisbon, Portugal	http://www.portugal.gc.ca	178
497	Canada	37.021647	-7.934266	Rua Frei Lourenço de Santa Maria No. 1, 1st Floor, Apartado 79, 8000-352 Faro, Portugal	http://www.portugal.gc.ca	416
498	Canada	37.74324	-25.66968	Rua D’Agua, 28, 9500-016 Ponta Delgada, São Miguel, Azores, Portugal	http://www.portugal.gc.ca	361
499	Canada	18.4250387	-66.0579801	Hato Rey Center, 268 Ponce de Leon, Suite 1111, San Juan (Hato Rey), Puerto Rico, U.S.A., 00918	http://www.portugal.gc.ca	179
500	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	417
501	Canada	25.319303	51.527986	Tornado Tower, 30th Floor, Majlis Al Taawon Street, Doha	http://www.canadainternational.gc.ca/qatar/	180
502	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
503	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	181
504	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	182
505	Canada	43.127337	131.907132	707-59 Krasnogo Znameni prospekt, Vladivostok 690002, Russia	http://www.russia.gc.ca	418
506	Canada	-1.9542	30.07272	59 KN16 Avenue, Kiyovu, Kigali, Rwanda	http://www.russia.gc.ca	183
507	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
508	Canada	14.0101	-60.99	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	188
509	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
510	Canada	46.783038	-56.172751	19, rue Docteur Dunan, 97500, Saint-Pierre, Saint-Pierre et Miquelon	http://www.France.gc.ca	419
511	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
512	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
513	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	109
514	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	161
515	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	195
516	Canada	21.54349	39.17299	Ali Reza Tower, 12th Floor, Medinah Road, Jeddah, Saudi Arabia	http://www.saudiarabia.gc.ca	339
517	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	196
518	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	373
519	Canada	8.459018	-13.252692	1 Lewis Drive, Hill Station, Freetown, Sierra Leone	http://www.tanzania.gc.ca	199
520	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	84
521	Canada	1.28566	103.84781	One George Street, #11-01 Singapore 049145	http://www.singapore.gc.ca	340
522	Canada	48.14119	17.10945	Carlton Savoy Building, Mostova 2, 811 02 Bratislava, Slovakia	www.kanada.at	202
523	Canada	46.06758	14.524	Linhartova cesta 49a., 1000 Ljubljana, Slovenia	www.kanada.at	203
524	Canada	47.5109	19.036961	Ganz utca 12-14, 1027 Budapest, Hungary	http://www.hungary.gc.ca	100
525	Canada	-9.43038	159.94832	Corner Hibiscus Avenue and Mud Alley, Honiara, Solomon Islands	http://www.solomonislands.embassy.gov.au/honi/home.html	204
526	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
527	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	116
528	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	206
529	Canada	-33.857825	18.60683	12, 2nd Avenue, Boston, Bellville, Cape Town, 7530	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	342
530	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	210
531	Canada	41.38698	2.16911	Plaça de Catalunya, 9, 1º, 2ª - 08002, Barcelona, Spain	http://www.spain.gc.ca	345
532	Canada	36.73047	-4.40021	Horizonte Building, Plaza de la Malagueta 2, 1st Floor, 29016 Málaga, Spain	http://www.spain.gc.ca	420
533	Canada	6.9049	79.85555	33-A 5th Lane, Colombo 03, Sri Lanka	http://www.srilanka.gc.ca	211
534	Canada	15.59715	32.537652	29 Africa Road, Block 56, Khartoum 1, Sudan	http://www.canadainternational.gc.ca/sudan-soudan/	212
535	Canada	5.8139165	-55.1688636	VSH United, Van’t Hogerhuysstraat 9 – 11, Paramaribo, Suriname	http://www.canadainternational.gc.ca/sudan-soudan/	213
536	Canada	6.82328	-58.15962	High and Young Streets, Georgetown, Guyana	http://www.guyana.gc.ca	95
537	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	151
538	Canada	59.33213	18.06284	23 Klarabergsgatan, Stockholm, Sweden	http://www.sweden.gc.ca	216
539	Canada	57.698179	11.98713	Mässans gata 10, 7th floor, Gothenburg, Sweden	http://www.sweden.gc.ca	421
540	Canada	46.94036	7.45753	Kirchenfeldstrasse 88, CH-3005 Bern, Switzerland	http://www.switzerland.gc.ca	346
541	Canada	46.22536	6.13523	5, de l'Ariana Avenue, CH-1202 Geneva, Switzerland	http://www.switzerland.gc.ca	422
542	Canada	33.909298	35.578156	First Floor, Coolrite Building, 43 Jal El Dib Highway (seaside), Beirut, Lebanon	http://www.lebanon.gc.ca	123
543	Canada	25.038478	121.565854	6F, Hua-Hsin (Citibank building), No. 1 SongZhi Road, Xinyi District, Taipei 11047, Taiwan	https://www.canada.ca/Canada-and-Taiwan	219
544	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	396
545	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	373
546	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	222
547	Canada	18.76743	99.02394	151 Super Highway, Tambon Tahsala, Amphur Muang, Chiang Mai, 50000, Thailand	http://www.thailand.gc.ca	423
548	Canada	7.91045	98.367121	6th Floor CCM Complex, 77/77 Chalermprakiat Rama 9 Road (Bypass Road), Muang Phuket, Thailand	http://www.thailand.gc.ca	424
549	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	84
550	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
551	Canada	-21.13664	-175.19579	Salote Road, Nuku'alofa, Tonga	http://www.tonga.embassy.gov.au/nkfa/home.html	226
552	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
553	Canada	10.67072	-61.5209	3-3A Sweet Briar Road, Maple House, St. Clair, Port of Spain, Trinidad and Tobago	http://www.trinidadandtobago.gc.ca	227
554	Canada	36.847113	10.276961	Lot 24, rue de la Feuille d’Érable, Cité des Pins, Tunis, Tunisia	http://www.tunisia.gc.ca	228
555	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	229
556	Canada	41.08207	29.00933	209 Buyukdere Caddesi, Tekfen Tower - 16th Floor, Levent 4, Istanbul, Turkey	http://www.turkey.gc.ca	354
557	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	229
558	Canada	21.782597802984256	-72.24716070323575	#11 Caribbean Place, 1254 Leeward Highway, TKCS 1ZZ	http://www.turkey.gc.ca	425
559	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	111
560	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
561	Canada	0.31334	32.58652	Jubilee Insurance Centre, 14 Parliament Avenue, Kampala, Uganda	http://www.newzealand.gc.ca	234
562	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	116
563	Canada	50.45335	30.50647	13A Kostelna Street, Kyiv 01901, Ukraine	http://www.ukraine.gc.ca	426
564	Canada	49.83741	24.03533	2 / 4 Academika Bohomoltsia Street, Lviv 79005, Ukraine	http://www.ukraine.gc.ca	427
565	Canada	24.497012	54.382067	Abu Dhabi Trade Towers (Abu Dhabi Mall), West Tower, 9th Floor, Abu Dhabi, United Arab Emirates	http://www.canadainternational.gc.ca/uae-eau/	236
566	Canada	25.05946	55.12781	19th Floor, Jumeirah Emirates Towers, Sheikh Zayed Road, Dubai, United Arab Emirates	http://www.canadainternational.gc.ca/uae-eau/	357
567	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	237
568	Canada	54.597285	-5.93012	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	359
569	Canada	51.47497	-3.15195	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	428
570	Canada	55.934225	-3.202224	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	360
571	Canada	38.89268	-77.01848	501 Pennsylvania Avenue, N.W., Washington, D.C., U.S.A., 20001	https://www.canada.ca/Canada-In-Washington	238
572	Canada	33.7869	-84.38273	1175 Peachtree Street N.E., 100 Colony Square, Suite 1700, Atlanta, Georgia, U.S.A., 30361-6205	https://www.canada.ca/Canada-In-Atlanta	429
573	Canada	42.34749	-71.07855	3 Copley Place, Suite 400, Boston, Massachusetts, U.S.A., 02116	https://www.canada.ca/Canada-In-Boston	430
574	Canada	41.88517	-87.6223	Two Prudential Plaza, 180 North Stetson Avenue, Suite 2400, Chicago, Illinois, U.S.A., 60601	https://www.canada.ca/Canada-In-Chicago	431
575	Canada	32.78432	-96.80022	500 N. Akard Street, Suite 2900, Dallas, Texas, U.S.A., 75201	https://www.canada.ca/Canada-In-Dallas	432
576	Canada	39.74236	-104.98814	1625 Broadway, Suite 2600, Denver, Colorado, U.S.A., 80202	https://www.canada.ca/Canada-In-Denver	433
577	Canada	42.33079	-83.03782	600 Renaissance Center, Suite 1100, Detroit, Michigan, U.S.A., 48243-1798	https://www.canada.ca/Canada-In-Detroit	434
578	Canada	21.30889	-157.86139	Penthouse Suite, 1000 Bishop Street, Honolulu, Hawaii, U.S.A., 96813-4299	https://www.canada.ca/Canada-In-Detroit	435
579	Canada	34.04972	-118.25565	550 South Hope Street, 9th Floor, Los Angeles, California, U.S.A., 90071-2327	https://www.canada.ca/Canada-In-Los-Angeles	436
580	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	417
581	Canada	44.97427	-93.26676	701 Fourth Avenue South, Suite 900, Minneapolis, Minnesota, U.S.A., 55415-1899	https://www.canada.ca/Canada-In-Minneapolis	437
582	Canada	40.75368	-73.974423	466 Lexington Avenue, 20th Floor, New York, New York, U.S.A., 10017	https://www.canada.ca/Canada-In-New-York	363
583	Canada	37.79287	-122.40424	580 California Street, 14th Floor, San Francisco, California, U.S.A., 94104	https://www.canada.ca/Canada-In-San-Francisco	438
584	Canada	47.610246	-122.336819	1501 4th Ave, Suite 600, Seattle, Washington, U.S.A., 98101	https://www.canada.ca/Canada-In-Seattle	439
585	Canada	-34.905893	-56.199923	Plaza Independencia 749, oficina 102, 11100, Montevideo, Uruguay	http://www.uruguay.gc.ca	240
586	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	182
587	Canada	41.275287	69.258272	58A, Bobur Street, Yakkasaroy district, Tashkent, 100022	http://www.russia.gc.ca	241
588	Canada	-17.74061	168.31618	Winston Churchill Avenue, Port Vila	http://www.vanuatu.highcommission.gov.au/pvla/home.html	242
589	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
590	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	371
591	Canada	21.034662	105.835017	31 Hung Vuong Street, Hanoi, Vietnam	http://www.vietnam.gc.ca	246
592	Canada	10.778558	106.699895	9th Floor, The Metropolitan, 235 Dong Khoi Street, District 1, Ho Chi Minh City, Vietnam	http://www.vietnam.gc.ca	440
593	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	417
594	Canada	-13.83282	-171.76462	Beach Road, Apia, Samoa	http://www.samoa.embassy.gov.au/apia/home.html	192
595	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
596	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	195
597	Canada	-4.315966	15.276362	17, avenue Pumbu, Commune de Gombe, Kinshasa, Congo (Kinshasa)	http://www.canadainternational.gc.ca/congo/	374
598	Canada	-15.42307	28.31042	5210 Independence Avenue, Lusaka, Zambia	http://www.tanzania.gc.ca	250
599	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	251
600	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
601	Canada	18.054761	-63.02711	Dawn Beach Estate, Sint Maarten	http://www.france.gc.ca	441
602	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	20
603	Canada	-22.27055	166.4426	Immeuble Norwich, Level 2, 11 Georges Baudoux Street, Artillerie, Noumea, New Caledonia	http://www.barbados.gc.ca	380
604	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	14
605	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
606	Canada	12.11125	-68.897167	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	442
607	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	371
608	Canada	-8.553508	125.558134	Rua Mártires da Pátria, Dili, Timor-Leste	http://www.timorleste.embassy.gov.au/dili/home.html	443
609	Canada	-6.21516	106.8204	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	103
610	Canada	12.11125	-68.897167	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	442
611	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	371
612	Canada	12.11125	-68.897167	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	442
613	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	371
614	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	197
615	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	210
616	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	237
617	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	237
618	Canada	4.855807	31.609267	Joint Embassy Compound, opposite to New Sudan Palace Hotel, Airport Avenue, Juba, South Sudan	http://www.canadainternational.gc.ca/south_sudan-soudan_du_sud/	209
619	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	116
620	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
621	Canada	-13.83282	-171.76462	Beach Road, Apia, Samoa	http://www.samoa.embassy.gov.au/apia/home.html	192
622	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	158
623	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	77
624	United Kingdom	-8.81	13.22	Unnamed Road, Luanda, Angola	\N	7
625	United Kingdom	-24.65	25.91	3171 Morupule, Gaborone, Botswana	\N	30
626	United Kingdom	-3.38	29.36	Ave du Stade, Bujumbura, Burundi	\N	38
627	United Kingdom	3.87	11.51	VGC5+2X Yaoundé, Cameroon	\N	40
628	United Kingdom	12.11	15.05	4352+J8F, N'Djamena, Chad	\N	45
629	United Kingdom	-4.3	15.27	78 Av. Des Nations Unies, Kinshasa, Democratic Republic of the Congo	\N	61
630	United Kingdom	-1.69	29.24	866Q+4P3, Goma, Democratic Republic of the Congo	\N	444
631	United Kingdom	15.33	38.92	Mereb St, Asmara, Eritrea	\N	70
632	United Kingdom	-26.41	31.18	H5RH+FCH, Lobamba, Eswatini	\N	282
633	United Kingdom	9.03	38.78	2QHH+QQW, Addis Ababa, Ethiopia	\N	72
634	United Kingdom	13.48	-16.67	F8HJ+WCX, Bakau, The Gambia	\N	297
635	United Kingdom	5.56	-0.19	2 Asafoanye O. Broni Cir, Accra, Ghana	\N	84
636	United Kingdom	9.52	-13.68	Corniche S, Conakry, Guinea	\N	93
637	United Kingdom	5.33	-3.99	82H5+XX Abidjan, Côte d'Ivoire	\N	445
638	United Kingdom	-1.29	36.81	Integrity Center, Nairobi, Kenya	\N	116
639	United Kingdom	-29.31	27.48	243 Constitution Rd, Foso, Lesotho	\N	124
640	United Kingdom	6.29	-10.78	Jasmin Compound Warner Ave, Monrovia, Liberia	\N	125
641	United Kingdom	-18.91	47.53	121 Lalana Rainandriamampandry, Antananarivo, Madagascar	\N	132
642	United Kingdom	-13.95	33.78	M1, Lilongwe, Malawi	\N	133
643	United Kingdom	12.63	-7.96	Route sans nom, Bamako, Mali	\N	136
644	United Kingdom	-20.16	57.5	RGR2+22 Port Louis, Mauritius	\N	141
645	United Kingdom	-25.97	32.57	2HH9+PXR, Maputo, Mozambique	\N	151
646	United Kingdom	-22.56	17.08	3 Pavlov Street, Windhoek, Namibia	\N	153
647	United Kingdom	13.52	2.07	Route sans nom, Niamey, Niger	\N	160
648	United Kingdom	9.08	7.48	3FHH+XX Abuja, Nigeria	\N	161
649	United Kingdom	6.43	3.4	121 Louis Solomon Cl, Victoria Island 106104, Lagos, Nigeria	\N	329
650	United Kingdom	4.81	7	4 Wonodi Street, Elechi 500101, Port Harcourt, Nigeria	\N	411
651	United Kingdom	10.52	7.43	5 Ahmadu Bello Way, Sabon Gari 800283, Kaduna, Nigeria	\N	446
652	United Kingdom	6.44	7.48	CFQH+XX Enugu, Nigeria	\N	447
653	United Kingdom	11.99	8.54	Sky Line, Nassarawa 700213, Kano, Nigeria	\N	448
654	United Kingdom	-1.94	30.09	336Q+2XP, Kigali, Rwanda	\N	183
655	United Kingdom	14.65	-17.43	Rte de la Corniche Estate, Dakar, Senegal	\N	196
656	United Kingdom	-4.62	55.45	9CHX+XX Victoria, Seychelles	\N	198
657	United Kingdom	8.47	-13.27	FP9H+XX Freetown, Sierra Leone	\N	199
658	United Kingdom	2.03	45.33	طريق بدون اسم، مقديشو‎، Somalia	\N	205
660	United Kingdom	-33.91	18.42	ERF158581 W Quay Rd, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa	\N	342
661	United Kingdom	-26.13	28.03	95 Rutland Ave, Craighall Park, Randburg, 2196, South Africa	\N	343
662	United Kingdom	-25.74	28.22	813 Government Ave, Eastwood, Pretoria, 0083, South Africa	\N	206
663	United Kingdom	4.85	31.58	RHXJ+X2 Juba, South Sudan	\N	209
664	United Kingdom	15.6	32.53	HGXJ+X2 Khartoum, Sudan	\N	212
665	United Kingdom	0.33	32.58	14 Kyaddondo Rd, Kampala, Uganda	\N	234
666	United Kingdom	-6.81	39.29	Ghana St, Dar es Salaam, Tanzania	\N	373
667	United Kingdom	-15.42	28.31	Pandit Nehru Rd, Lusaka, Zambia	\N	250
668	United Kingdom	-17.76	31.03	62RJ+22 Harare, Zimbabwe	\N	251
669	United Kingdom	17.15	-61.85	Unnamed Road, Antigua and Barbuda	\N	450
670	United Kingdom	-34.58	-58.39	Cam. del Trabajo 202, Buenos Aires, Argentina	\N	11
671	United Kingdom	25.07	-77.39	W Bay St, Nassau, The Bahamas	\N	17
672	United Kingdom	13.09	-59.6	20 Chapel Pl., Bridgetown, Barbados	\N	20
673	United Kingdom	17.25	-88.77	66XJ+V8J, Belmopan, Belize	\N	23
674	United Kingdom	-16.51	-68.12	FVRJ+75Q, La Paz, Bolivia	\N	258
675	United Kingdom	-8.06	-34.89	R. da Soledade, 44 - Boa Vista, Recife - PE, 50070-040, Brazil	\N	259
676	United Kingdom	-23.56	-46.69	R. Mourato Coelho, 884 - Pinheiros, São Paulo - SP, 05417-001, Brazil	\N	262
677	United Kingdom	-22.93	-43.17	Av. Infante Dom Henrique, 1000 - Flamengo, Rio de Janeiro - RJ, 20021-060, Brazil	\N	365
678	United Kingdom	-19.93	-43.94	R. Espírito Santo, 1757 - Centro, Belo Horizonte - MG, 30160-030, Brazil	\N	364
679	United Kingdom	-15.8	-47.87	642H+2X Brasilia, Federal District, Brazil	\N	32
680	United Kingdom	51.04	-114.06	Nuera 1.0, 211 13 Ave SE, Calgary, AB T2G 1E1, Canada	\N	269
681	United Kingdom	49.28	-123.12	882-872 BC-99, Vancouver, BC V6B, Canada	\N	267
682	United Kingdom	45.5	-73.57	1153 Rue Metcalfe, Montréal, QC H3B 2V6, Canada	\N	266
683	United Kingdom	45.42	-75.69	111 Lisgar St, Ottawa, ON K2P 0C1, Canada	\N	41
684	United Kingdom	43.66	-79.38	40 Gerrard St E, Toronto, ON M5B 2M2, Canada	\N	270
685	United Kingdom	-33.41	-70.6	Cristal de Abelli 2988, Las Condes, Región Metropolitana, Chile	\N	46
686	United Kingdom	4.66	-74.05	Cra. 5 #79-26, Bogotá, Colombia	\N	51
687	United Kingdom	9.93	-84.09	WWJ6+22 San José Province, San José, Costa Rica	\N	55
688	United Kingdom	23.11	-82.42	4H5J+936, Havana, Cuba	\N	57
689	United Kingdom	18.46	-69.92	UASD, Santo Domingo 10105, Dominican Republic	\N	65
690	United Kingdom	-0.17	-78.47	Av. Eloy Alfaro N40-153, Quito 170138, Ecuador	\N	66
691	United Kingdom	13.7	-89.24	MQX5+WV2, San Salvador, El Salvador	\N	68
692	United Kingdom	12	-61.76	Prickly Bay, St. George, Grenada	\N	451
693	United Kingdom	14.59	-90.51	20 calle 10-30, Cdad. de Guatemala, Guatemala	\N	91
694	United Kingdom	6.81	-58.16	146 Regent St, Georgetown, Guyana	\N	95
695	United Kingdom	18.53	-72.29	GPJ6+22 Port-au-Prince, Haiti	\N	452
696	United Kingdom	18	-76.78	5 Swallowfield Rd, Kingston, Jamaica	\N	111
697	United Kingdom	19.43	-99.16	Reforma I, Juárez, 06600 Ciudad de México, CDMX, Mexico	\N	143
698	United Kingdom	21.1	-86.76	Tepen, Zona Hotelera, 77500 Cancún, Q.R., Mexico	\N	453
699	United Kingdom	20.67	-103.37	MJCJ+22 Guadalajara, Jalisco, Mexico	\N	319
700	United Kingdom	25.64	-100.35	Mallorca 114, San Patricio 1er Sector, 66270 San Pedro Garza García, N.L., Mexico	\N	404
701	United Kingdom	8.98	-79.51	XFJR+22 Panama City, Panama	\N	171
702	United Kingdom	-25.29	-57.57	Teniente Héctor Vera 1848, Asunción, Paraguay	\N	173
703	United Kingdom	-12.13	-77.02	Av. 28 de Julio 1269, Miraflores 15047, Peru	\N	174
704	United Kingdom	13.13	-61.2	Windward Highway, Arnos Vale, St Vincent and the Grenadines	\N	454
705	United Kingdom	14.01	-60.99	1 Peynier St, Castries, St Lucia	\N	188
706	United Kingdom	10.66	-61.52	28 French St, Port of Spain, Trinidad and Tobago	\N	455
707	United Kingdom	47.61	-122.33	JM6C+22 Seattle, WA, USA	\N	439
708	United Kingdom	42.36	-71.08	Dr Paul Dudley White Bike Path, Cambridge, MA 02142, USA	\N	430
709	United Kingdom	41.89	-87.62	455 N Cityfront Plaza Dr, Chicago, IL 60611, USA	\N	431
710	United Kingdom	40.75	-73.96	Q22R+22 New York, NY, USA	\N	363
711	United Kingdom	39.74	-104.98	571 E Colfax Ave, Denver, CO 80203, USA	\N	433
712	United Kingdom	38.92	-77.06	3003 Massachusetts Ave NW, Washington, DC 20008, USA	\N	238
713	United Kingdom	37.79	-122.4	555 Market St, San Francisco, CA 94105, USA	\N	438
714	United Kingdom	34.05	-118.41	2HXR+X2 Los Angeles, CA, USA	\N	436
715	United Kingdom	33.75	-84.38	298 Decatur St SE, Atlanta, GA 30312, USA	\N	429
716	United Kingdom	29.75	-95.36	1836 Polk St, Houston, TX 77010, USA	\N	456
717	United Kingdom	25.76	-80.18	749 Brickell Key Dr, Miami, FL 33131, USA	\N	417
718	United Kingdom	28.43	-81.3	Terminal B, Orlando, FL 32827, USA	\N	457
719	United Kingdom	44.94	-93.09	1 W Water St, St Paul, MN 55107, USA	\N	437
720	United Kingdom	35.77	-78.63	505 Martin Luther King Jr Blvd, Raleigh, NC 27601, USA	\N	458
721	United Kingdom	32.71	-117.16	449 Fifth Ave, San Diego, CA 92101, USA	\N	459
722	United Kingdom	-34.9	-56.13	Av. Gral. Rivera 3850, 11300 Montevideo, Departamento de Montevideo, Uruguay	\N	240
723	United Kingdom	10.49	-66.85	1 Av. Ávila, Caracas 1060, Miranda, Venezuela	\N	245
724	United Kingdom	-37.81	144.97	Exhibition St/Lonsdale St, Melbourne VIC 3000, Australia	\N	252
725	United Kingdom	-35.3	149.12	200 Alexandrina Dr, Yarralumla ACT 2600, Australia	\N	14
726	United Kingdom	-33.86	151.2	45RX+2X Barangaroo NSW, Australia	\N	253
727	United Kingdom	-31.95	115.86	51 James Street Mall, Perth WA 6000, Australia	\N	254
728	United Kingdom	-27.46	153.03	97A School St, Fortitude Valley QLD 4006, Australia	\N	460
729	United Kingdom	4.88	114.94	VWHQ+XX Bandar Seri Begawan, Brunei	\N	461
730	United Kingdom	11.58	104.91	12201 St 86, Phnom Penh, Cambodia	\N	39
731	United Kingdom	39.91	116.44	WC5Q+XX Chaoyang, Beijing, China	\N	47
732	United Kingdom	31.22	121.45	6C9X+XX Jing'An, Shanghai, China	\N	276
733	United Kingdom	29.55	106.57	GHX9+XX Yuzhong District, Chongqing, China	\N	370
734	United Kingdom	23.11	113.32	Unnamed Road, 二沙岛 Yue Xiu Qu, Guang Zhou Shi, Guang Dong Sheng, China, 510310	\N	275
735	United Kingdom	22.27	114.16	Hong Kong, The Peak, 施勳道	\N	462
736	United Kingdom	30.6	114.31	Yan Jiang Da Dao, Jiang An Qu, Wu Han Shi, Hu Bei Sheng, China, 430014	\N	274
737	United Kingdom	39.02	125.79	2Q9Q+QX9, Pyongyang, North Korea	\N	463
738	United Kingdom	-18.14	178.42	VC5C+JXJ, Suva - City Center, Fiji	\N	75
739	United Kingdom	-6.23	106.83	Jl. Denpasar II No.49, RT.1/RW.2, Kuningan, Kuningan Tim., Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12950, Indonesia	\N	103
740	United Kingdom	-8.7	115.25	Jl. Kutat Lestari No.120, Sanur Kauh, Denpasar Selatan, Kota Denpasar, Bali 80228, Indonesia	\N	305
741	United Kingdom	35.68	139.74	2-chōme-7-7 Hirakawachō, Chiyoda City, Tokyo 102-0093, Japan	\N	112
742	United Kingdom	34.67	135.5	2-chōme-3-5 Nishishinsaibashi, Chuo Ward, Osaka, 542-0086, Japan	\N	312
743	United Kingdom	17.97	102.62	Patuxay, Vientiane, Laos	\N	121
744	United Kingdom	3.15	101.71	86, Jalan Raja Chulan, Kuala Lumpur, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia	\N	134
745	United Kingdom	47.91	106.94	WW5Q+XFR, Ulaanbaatar, Mongolia	\N	407
746	United Kingdom	16.76	96.16	Min Tan Rd, Yangon, Myanmar (Burma)	\N	464
747	United Kingdom	-41.27	174.77	Te Ahumairangi Hill loops, Wellington 6012, New Zealand	\N	158
748	United Kingdom	-36.84	174.76	161 Halsey Street, Auckland CBD, Auckland 1010, New Zealand	\N	328
749	United Kingdom	-9.43	147.19	Independence Drive, Port Moresby, Papua New Guinea	\N	172
750	United Kingdom	14.54	121.05	G3Q2+X2 Taguig, Metro Manila, Philippines	\N	175
751	United Kingdom	1.3	103.82	18 Chatsworth Rd, Singapore 249780	\N	340
752	United Kingdom	-9.43	159.96	Mendana Ave, Honiara, Solomon Islands	\N	204
753	United Kingdom	37.56	126.97	HX69+2X Seoul, South Korea	\N	208
754	United Kingdom	25.03	121.56	No. 15號, Alley 26, Lane 118, Wuxing St, Xinyi District, Taipei City, Taiwan 110	\N	219
755	United Kingdom	13.74	100.54	St Regis Bangkok, 159 Ratchadamri Rd, Khwaeng Lumphini, Khet Pathum Wan, Krung Thep Maha Nakhon 10330, Thailand	\N	222
756	United Kingdom	-17.73	168.31	40 Kumul Hwy, Port Vila, Vanuatu	\N	242
757	United Kingdom	21.02	105.85	55b Bà Triệu, Hàng Bài, Hoàn Kiếm, Hà Nội, Vietnam	\N	246
758	United Kingdom	10.78	106.7	8 Đường Nguyễn Văn Bình, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Vietnam	\N	440
759	United Kingdom	40.19	44.5	5GQ2+X2 Yerevan, Armenia	\N	12
760	United Kingdom	40.37	49.85	9RCX+2X Baku, Azerbaijan	\N	16
761	United Kingdom	53.9	27.56	vulica Lienina 9, Minsk, Belarus	\N	21
762	United Kingdom	41.67	44.81	MR96+X2 Tbilisi, Georgia	\N	82
763	United Kingdom	51.14	71.42	Ulitsa Karasakal Yerimbet 39, Nur-Sultan 020000, Kazakhstan	\N	396
764	United Kingdom	47.1	51.91	211а, Atyrau, Kazakhstan	\N	465
765	United Kingdom	42.87	74.57	VH99+QXR, Bishkek, Kyrgyzstan	\N	120
766	United Kingdom	47.02	28.82	Strada Alexei Mateevici 87, Chișinău, Moldova	\N	145
767	United Kingdom	59.94	30.39	Novgorodskaya Ulitsa, 19, Sankt-Peterburg, Russia, 191124	\N	466
768	United Kingdom	56.83	60.61	Ulitsa Karla Marksa, 8-208, Yekaterinburg, Sverdlovskaya oblast', Russia, 620026	\N	467
769	United Kingdom	55.75	37.57	5/3к2, Kutuzovsky Ave, Moskva, Russia, 121248	\N	182
770	United Kingdom	38.58	68.79	HQHQ+XX Dushanbe, Tajikistan	\N	220
771	United Kingdom	37.95	58.36	Mäti Kösäýew köçesi 85, Aşgabat, Turkmenistan	\N	230
772	United Kingdom	50.45	30.51	Ivana Franka St, 1, Kyiv, Ukraine, 01030	\N	426
773	United Kingdom	41.3	69.28	872J+22 Tashkent, Uzbekistan	\N	241
774	United Kingdom	41.33	19.8	8RH2+X2 Tirana, Albania	\N	3
775	United Kingdom	48.19	16.38	Prinz Eugen-Straße 66, 1040 Wien, Austria	\N	15
776	United Kingdom	50.84	4.38	Chau. d'Etterbeek 154, 1040 Etterbeek, Belgium	\N	22
777	United Kingdom	44.76	17.18	Kozarska 33, Banja Luka 78000, Bosnia and Herzegovina	\N	468
778	United Kingdom	43.85	18.39	Behdžeta Mutevelića bb, Sarajevo 71000, Bosnia and Herzegovina	\N	29
779	United Kingdom	42.69	23.32	ul. "Neofit Rilski" 36, 1000 Old City Center, Sofia, Bulgaria	\N	36
780	United Kingdom	45.79	15.97	Obala dr. Savke Dabčević Kučar, 10000, Zagreb, Croatia	\N	56
781	United Kingdom	43.5	16.43	Sustipanski put 60, 21000, Croatia	\N	469
782	United Kingdom	35.18	33.34	Ι. Ψυχάρη 33, Nicosia 1107	\N	59
783	United Kingdom	50.08	14.4	3CJ2+22 Prague, Czechia	\N	60
784	United Kingdom	55.69	12.58	Vej uden navn, 2100 København, Denmark	\N	62
785	United Kingdom	59.43	24.73	Koidu 46, 10142 Tallinn, Estonia	\N	71
786	United Kingdom	60.15	24.96	Väg utan namn, Helsingfors, Finland	\N	76
787	United Kingdom	48.86	2.31	36 Bd de la Tour-Maubourg, 75007 Paris, France	\N	77
788	United Kingdom	45.76	4.85	21 Rue François Garcin, 69003 Lyon, France	\N	286
789	United Kingdom	44.85	-0.59	31 Rue Rosa Bonheur, 33000 Bordeaux, France	\N	284
790	United Kingdom	43.28	5.38	17 Rue Notre Dame des Anges, 13008 Marseille, France	\N	470
791	United Kingdom	52.51	13.38	Leipziger Str. 133, 10117 Berlin, Germany	\N	83
792	United Kingdom	51.22	6.78	Bahnstraße 2, Königsallee 92, 40212 Düsseldorf, Germany	\N	471
793	United Kingdom	48.14	11.59	Tattenbachstraße 8, 80538 München, Germany	\N	293
794	United Kingdom	39.62	19.91	Miltiadou Margariti 92, Kerkira 491 00, Greece	\N	472
795	United Kingdom	37.97	23.74	Irodou Attikou 1, Athina 106 74, Greece	\N	86
796	United Kingdom	37.78	20.89	QVJQ+2X Zakynthos, Greece	\N	473
797	United Kingdom	36.44	28.22	Komninon 71, Rodos 851 00, Greece	\N	474
798	United Kingdom	35.34	25.13	Apokoronou 7, Iraklio 712 02, Greece	\N	475
799	United Kingdom	41.9	12.5	Via Giovanni Amendola, 32, 00185 Roma RM, Italy	\N	476
800	United Kingdom	47.49	19.05	F3R2+22 Budapest, Hungary	\N	100
801	United Kingdom	64.14	-21.93	Sjúkrahótel, Reykjavík, Iceland	\N	101
802	United Kingdom	53.32	-6.22	Embassy of Pakistan Residence, Ailesbury Rd, Ballsbridge, Dublin 4, Ireland	\N	106
803	United Kingdom	45.47	9.21	Via Carlo Poerio, 15, 20129 Milano MI, Italy	\N	307
804	United Kingdom	41.9	12.5	Via Giovanni Amendola, 32, 00185 Roma RM, Italy	\N	109
805	United Kingdom	42.66	21.15	149 Ahmet Krasniqi, Prishtinë 10000	\N	118
806	United Kingdom	56.95	24.11	Zirgu iela 1, Centra rajons, Rīga, LV-1050, Latvia	\N	122
807	United Kingdom	54.69	25.3	T. Kosciuškos g. 5, Vilnius 01100, Lithuania	\N	128
808	United Kingdom	49.6	6.12	106 Rte d'Esch, 1470 Luxembourg	\N	129
809	United Kingdom	35.89	14.49	213 Triq Qrejten, Tal-Pietà, Malta	\N	137
810	United Kingdom	42.44	19.27	32 IV Proleterske, Podgorica, Montenegro	\N	148
811	United Kingdom	52.35	4.86	Cornelis Krusemanstraat 75 b, 1075 NJ Amsterdam, Netherlands	\N	156
812	United Kingdom	52.08	4.31	Kneuterdijk 2, 2514 EN Den Haag, Netherlands	\N	410
813	United Kingdom	41.97	21.42	Rrugë pa emër, 1000, North Macedonia	\N	330
814	United Kingdom	59.91	10.7	Frognerstranda 2, 0250 Oslo, Norway	\N	166
815	United Kingdom	52.21	21.03	Aleksandra Sulkiewicza 5, 00-758 Warszawa, Poland	\N	177
816	United Kingdom	38.71	-9.15	Travessa do Terreiro a Santa Catarina 48, 1200-343 Lisboa, Portugal	\N	178
817	United Kingdom	37.13	-8.53	Ac. Porto Comercial de Portimão, 8500 Portimão, Portugal	\N	477
818	United Kingdom	44.44	26.1	Bd. Nicolae Balcescu, Bulevardul Nicolae Bălcescu, București, Romania	\N	181
819	United Kingdom	44.8	20.45	RC2X+2X Belgrade, Serbia	\N	197
820	United Kingdom	48.14	17.1	Nábrežie armádneho generála Ludvíka Svobodu, 811 02 Bratislava, Slovakia	\N	202
821	United Kingdom	46.05	14.49	Škrabčeva ulica 11, 1000 Ljubljana, Slovenia	\N	203
822	United Kingdom	43.26	-2.92	Mallona Galtzada, 15B, 48006 Bilbo, Bizkaia, Spain	\N	478
823	United Kingdom	41.39	2.14	Passatge de les Cinc Torres, 4, 08029 Barcelona, Spain	\N	345
824	United Kingdom	40.47	-3.68	C. Levante, 36, 28036 Madrid, Spain	\N	210
825	United Kingdom	39.57	2.65	Carrer dels Paners, 9, 07001 Palma, Illes Balears, Spain	\N	479
826	United Kingdom	38.9	1.42	C. de Carles Roman Ferrer, 17, 07800 Eivissa, Illes Balears, Spain	\N	480
827	United Kingdom	38.34	-0.48	Mlle. Levante, 8, 03001 Alicante (Alacant), Alicante, Spain	\N	481
828	United Kingdom	36.71	-4.43	C. Fernán Núñez, 6, 29002 Málaga, Spain	\N	482
829	United Kingdom	28.46	-16.25	Av. Víctor Zurita Soler, s/n, 38003 Santa Cruz de Tenerife, Spain	\N	483
830	United Kingdom	28.14	-15.43	Pl. Comandante Ramón Franco, 1, 35007 Las Palmas de Gran Canaria, Las Palmas, Spain	\N	484
831	United Kingdom	59.33	18.1	83HX+XX Stockholm, Sweden	\N	216
832	United Kingdom	46.94	7.45	Kirchenfeldstrasse 24, 3005 Bern, Switzerland	\N	217
833	United Kingdom	41.03	28.97	Bedrettin, Ambar Arkası Sk. No:25, 34440 Beyoğlu/İstanbul, Turkey	\N	354
834	United Kingdom	39.89	32.85	Aziziye, Portakal Çiçeği Sk. 17/A, 06690 Çankaya/Ankara, Turkey	\N	229
835	United Kingdom	38.43	27.14	Kültür, Şevket Özçelik Sk. NO:35, 35220 Konak/İzmir, Turkey	\N	485
836	United Kingdom	36.85	30.62	Liman, 3. Sk. No:4, 07130 Konyaaltı/Antalya, Turkey	\N	486
837	United Kingdom	36.62	29.1	Karagözler, 27. Sk. 11/5, 48300 Fethiye/Muğla, Turkey	\N	487
838	United Kingdom	36.85	28.27	Turkey	\N	488
839	United Kingdom	36.75	3.04	Q22Q+2X Hydra, Algeria	\N	4
840	United Kingdom	26.23	50.58	6HJH+2X Manama, Bahrain	\N	489
841	United Kingdom	30.03	31.23	26HH+QJ8, Old Cairo, Cairo Governorate, Egypt	\N	67
842	United Kingdom	35.69	51.41	Tehran, Jami St, Iran	\N	104
843	United Kingdom	36.32	44.15	Erbil Hwy, Iraq	\N	390
844	United Kingdom	33.31	44.39	14th of July St, Baghdad, Iraq	\N	105
845	United Kingdom	32.08	34.77	Ben Yehuda St 72, Tel Aviv-Yafo, Israel	\N	490
846	United Kingdom	31.94	35.89	Irbid St 33, Amman, Jordan	\N	114
847	United Kingdom	29.39	47.99	1 شارع 132، Al Kuwayt, Kuwait	\N	491
848	United Kingdom	33.89	35.5	VGR2+22 Beirut, Lebanon	\N	123
849	United Kingdom	32.89	13.16	Al Kurnish Rd, Tarabulus, Libya	\N	492
850	United Kingdom	18.09	-15.98	32QC+Q4R, Nouakchott, Mauritania	\N	140
851	United Kingdom	33.97	-6.84	X5C5+6GP, Rabat, Morocco	\N	150
852	United Kingdom	33.55	-7.62	G9XH+XX Casablanca, Morocco	\N	327
853	United Kingdom	31.79	35.23	Q6QH+XX Jerusalem, Israel	\N	493
854	United Kingdom	31.52	34.45	Al-Thawra	\N	494
855	United Kingdom	23.6	58.43	Thaqafah St, Muscat, Oman	\N	167
856	United Kingdom	25.34	51.51	Tabariya St، Doha, Qatar	\N	180
857	United Kingdom	24.68	46.62	8564 Al Sarat St, Al Safarat, Riyadh 12523, Saudi Arabia	\N	195
858	United Kingdom	21.61	39.11	J456+X2 Ash Shati, Jeddah Saudi Arabia	\N	339
859	United Kingdom	26.33	50.2	4449 7ا، حي الجوهرة، Al Khobar 34431 8988, Saudi Arabia	\N	495
860	United Kingdom	33.27	36.51	Route sans nom, Syria	\N	218
861	United Kingdom	36.83	10.24	Les Berges Du Lac Walkway, Tunis, Tunisia	\N	228
862	United Kingdom	25.25	55.3	Obaidullah Building - 11B St - Al Mankhool - Dubai - United Arab Emirates	\N	357
863	United Kingdom	24.48	54.35	F8JX+2X Abu Dhabi - United Arab Emirates	\N	236
864	United Kingdom	15.36	44.23	965H+XX Sana'a, Yemen	\N	496
865	United Kingdom	18.21	-63.05	6W5X+CJJ, The Quarter 2640, Anguilla	\N	497
866	United Kingdom	-7.92	-14.41	Unnamed Road, Georgetown ASCN 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	498
867	United Kingdom	32.3	-64.78	4 Union St, Hamilton, Bermuda	\N	25
868	United Kingdom	18.41	-64.61	Waterfront Dr, Road Town, British Virgin Islands	\N	499
869	United Kingdom	19.29	-81.37	Crewe Rd, George Town, Cayman Islands	\N	43
870	United Kingdom	-51.69	-57.87	Ross Rd, Stanley FIQQ 1ZZ, Falkland Islands (Islas Malvinas)	\N	73
871	United Kingdom	36.13	-5.35	3 Engineer Rd, Gibraltar GX11 1AA, Gibraltar	\N	85
872	United Kingdom	16.79	-62.21	QQQQ+XX Brades, Montserrat	\N	500
873	United Kingdom	-25.06	-130.1	Unnamed Road, Adamstown PCRN 1ZZ, Pitcairn Islands	\N	501
874	United Kingdom	-15.95	-5.72	Redgate, STHL 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	186
875	United Kingdom	-37.06	-12.3	M1, TDCU 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	502
876	United Kingdom	21.43	-71.14	Unnamed Road, TKCA 1ZZ, Turks and Caicos Islands	\N	503
877	United Kingdom	34.53	69.17	G5JC+22 Kabul, Afghanistan	\N	1
878	United Kingdom	23.79	90.41	Bureau Veritas (Bangladesh) Private Limited, Nur Empori, Plot: 77 (Floor-10), Road: 11, Block-M,, Rd No. 11, Dhaka 1213, Bangladesh	\N	19
879	United Kingdom	28.59	77.19	H5RQ+2X New Delhi, Delhi, India	\N	102
880	United Kingdom	22.54	88.34	UCM Building, Debendra Lal Khan Rd, S S K M Hospital, Bhowanipore, Kolkata, West Bengal 700020, India	\N	299
881	United Kingdom	19.06	72.86	Bank of India, G Block BKC, Bandra Kurla Complex, Bandra East, Mumbai, Maharashtra 400051, India	\N	302
882	United Kingdom	18.52	73.85	GRCX+3WG, Shaniwar Peth, Pune, Maharashtra 411030, India	\N	504
883	United Kingdom	17.41	78.45	201 A ,2 Floor Maheshwari Towers, 3 rd Lane From Karachi Bakery After Care Hospital, Rd Number 1, Shyam Rao Nagar, Banjara Hills, Hyderabad, Telangana 500034, India	\N	301
884	United Kingdom	15.48	73.8	Sharda Mandir School Pedestrian Opas, Miramar, Panaji, Goa 403001, India	\N	505
885	United Kingdom	13.06	80.24	10/18, Deivanayagam St, Pushpa Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India	\N	300
886	United Kingdom	12.97	77.59	XH9R+X2 Bengaluru, Karnataka, India	\N	506
887	United Kingdom	30.7	76.8	140/24, Industrial Area Phase I, Chandigarh, 160002, India	\N	387
888	United Kingdom	27.72	85.31	P896+R2F, Kathmandu 44600, Nepal	\N	155
889	United Kingdom	33.72	73.11	P496+X2 Islamabad, Pakistan	\N	168
890	United Kingdom	31.55	74.31	20 Bahawalpur Rd, Al Hamad Colony Mozang Chungi, Lahore, Punjab 54000, Pakistan	\N	333
891	United Kingdom	24.81	67.02	Plot COM 2/6/1, Block 3 Clifton, Karachi, Karachi City, Sindh, Pakistan	\N	332
892	United Kingdom	6.9	79.87	15/3 Malalasekara Pl, Colombo 00700, Sri Lanka	\N	211
893	United Kingdom	23.02	72.56	Embrald 3 Residency Parimal Garden Road, Ellisbridge, Ahmedabad, Gujarat 380006, India	\N	507
87	United States	51.218403	6.795717199999999	Willi-Becker-Allee 10 40227 Düsseldorf Federal Republic of Germany	https://de.usembassy.gov	291
88	United States	53.56216	9.997029999999999	Alsterufer 27/28 20354 Hamburg Federal Republic of Germany	https://de.usembassy.gov	292
53	United States	41.7839499	123.4220099	52, 14th Wei Road, Heping District 110003 China	https://mo.usembassy.gov	277
49	United States	30.595124	114.270037	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	https://mo.usembassy.gov	274
\.


--
-- Data for Name: tps_dests; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.tps_dests (tpdest_id, dest_id, tp_id, date) FROM stdin;
1	434	1	2030-03-17 00:00:00
2	83	1	2024-01-01 00:00:00
5	123	3	2025-06-02 00:00:00
6	382	4	2030-04-04 00:00:00
7	134	5	2026-08-20 00:00:00
8	245	5	2022-06-19 00:00:00
9	208	5	2026-08-18 00:00:00
10	421	6	2025-12-22 00:00:00
11	185	6	2025-10-11 00:00:00
12	54	6	2027-11-10 00:00:00
13	325	7	2024-01-08 00:00:00
14	112	7	2029-02-05 00:00:00
15	22	7	2028-11-20 00:00:00
16	381	8	2027-02-01 00:00:00
17	10	8	2028-01-25 00:00:00
18	184	8	2027-04-07 00:00:00
19	119	9	2027-01-11 00:00:00
20	90	9	2028-09-11 00:00:00
21	129	9	2025-06-12 00:00:00
22	394	10	2024-04-19 00:00:00
23	390	10	2028-05-24 00:00:00
24	459	10	2026-03-18 00:00:00
25	230	11	2027-03-14 00:00:00
26	52	12	2023-12-20 00:00:00
27	353	12	2029-02-11 00:00:00
28	72	13	2026-08-20 00:00:00
29	48	13	2028-12-09 00:00:00
30	77	13	2022-02-17 00:00:00
31	397	14	2024-04-12 00:00:00
32	107	14	2029-10-22 00:00:00
33	430	14	2025-01-20 00:00:00
34	59	15	2023-06-02 00:00:00
35	417	15	2028-08-17 00:00:00
36	99	15	2024-08-19 00:00:00
37	447	16	2024-02-21 00:00:00
38	225	17	2028-03-14 00:00:00
39	425	18	2023-06-20 00:00:00
40	6	19	2029-07-26 00:00:00
41	81	20	2027-03-09 00:00:00
42	454	21	2030-08-03 00:00:00
44	509	25	2022-01-12 00:00:00
45	510	25	2022-01-13 00:00:00
47	508	26	\N
48	512	27	\N
49	513	27	\N
51	219	29	\N
\.


--
-- Data for Name: travelplanners; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.travelplanners (tp_id, name, user_id) FROM stdin;
1	test_user1's Travel_planner test 1	1
3	test_user2's Travel_planner test 1	2
4	test_user2's Travel_planner test 2	2
5	test_user3's Travel_planner test 1	3
6	test_user3's Travel_planner test 2	3
7	test_user4's Travel_planner test 1	4
8	test_user5's Travel_planner test 1	5
9	test_user5's Travel_planner test 2	5
10	test_user5's Travel_planner test 3	5
11	test_user6's Travel_planner test 1	6
12	test_user7's Travel_planner test 1	7
13	test_user8's Travel_planner test 1	8
14	test_user8's Travel_planner test 2	8
15	test_user8's Travel_planner test 3	8
16	test_user9's Travel_planner test 1	9
17	test_user9's Travel_planner test 2	9
18	test_user9's Travel_planner test 3	9
19	test_user10's Travel_planner test 1	10
20	test_user10's Travel_planner test 2	10
21	test_user10's Travel_planner test 3	10
25	Fun Times	1
26	Excitement	1
27	ff	1
29	Fun Times	11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.users (user_id, fname, lname, email, password, home_country) FROM stdin;
1	test_user1	Test	test_user1@test.com	test	United States
2	test_user2	Test	test_user2@test.com	test	United States
3	test_user3	Test	test_user3@test.com	test	United States
4	test_user4	Test	test_user4@test.com	test	United States
5	test_user5	Test	test_user5@test.com	test	United Kingdom
6	test_user6	Test	test_user6@test.com	test	Canada
7	test_user7	Test	test_user7@test.com	test	United Kingdom
8	test_user8	Test	test_user8@test.com	test	Canada
9	test_user9	Test	test_user9@test.com	test	United Kingdom
10	test_user10	Test	test_user10@test.com	test	United States
11	Tameka Handy	Handy	handytameka@gmail.com	test	United Kingdom
\.


--
-- Name: destinations_dest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.destinations_dest_id_seq', 513, true);


--
-- Name: embassies_embassy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.embassies_embassy_id_seq', 893, true);


--
-- Name: tps_dests_tpdest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.tps_dests_tpdest_id_seq', 83, true);


--
-- Name: travelplanners_tp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.travelplanners_tp_id_seq', 61, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (dest_id);


--
-- Name: embassies embassies_pkey; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.embassies
    ADD CONSTRAINT embassies_pkey PRIMARY KEY (embassy_id);


--
-- Name: tps_dests tps_dests_pkey; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.tps_dests
    ADD CONSTRAINT tps_dests_pkey PRIMARY KEY (tpdest_id);


--
-- Name: travelplanners travelplanners_pkey; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners
    ADD CONSTRAINT travelplanners_pkey PRIMARY KEY (tp_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: embassies embassies_dest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.embassies
    ADD CONSTRAINT embassies_dest_id_fkey FOREIGN KEY (dest_id) REFERENCES public.destinations(dest_id);


--
-- Name: tps_dests tps_dests_dest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.tps_dests
    ADD CONSTRAINT tps_dests_dest_id_fkey FOREIGN KEY (dest_id) REFERENCES public.destinations(dest_id);


--
-- Name: tps_dests tps_dests_tp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.tps_dests
    ADD CONSTRAINT tps_dests_tp_id_fkey FOREIGN KEY (tp_id) REFERENCES public.travelplanners(tp_id);


--
-- Name: travelplanners travelplanners_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners
    ADD CONSTRAINT travelplanners_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

