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
    country_name character varying(50) NOT NULL
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
-- Name: travelplanners; Type: TABLE; Schema: public; Owner: hackbright
--

CREATE TABLE public.travelplanners (
    tp_id integer NOT NULL,
    name character varying(50) NOT NULL,
    user_id integer,
    dest_id integer,
    date timestamp without time zone
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
1	city	country
2	Tokyo	Japan
3	Jakarta	Indonesia
4	Delhi	India
5	Manila	Philippines
6	Shanghai	China
7	São Paulo	Brazil
8	Seoul	South Korea
9	Mexico City	Mexico
10	Beijing	China
11	Cairo	Egypt
12	New York	United States
13	Moscow	Russia
14	Bangkok	Thailand
15	Buenos Aires	Argentina
16	Dhaka	Bangladesh
17	Lagos	Nigeria
18	Istanbul	Turkey
19	Karachi	Pakistan
20	Tehran	Iran
21	Kinshasa	Congo (Kinshasa)
22	Ho Chi Minh City	Vietnam
23	Paris	France
24	London	United Kingdom
25	Lima	Peru
26	Bogotá	Colombia
27	Luanda	Angola
28	Kuala Lumpur	Malaysia
29	Hanoi	Vietnam
30	Hong Kong	Hong Kong
31	Khartoum	Sudan
32	Santiago	Chile
33	Riyadh	Saudi Arabia
34	Dar es Salaam	Tanzania
35	Zunyi	China
36	Jieyang	China
37	Lu’an	China
38	Yichun	China
39	Madrid	Spain
40	Changde	China
41	Taizhou	China
42	Liaocheng	China
43	Qujing	China
44	Baghdad	Iraq
45	Qingdao	China
46	Singapore	Singapore
47	Dazhou	China
48	Suzhou	China
49	Xiangyang	China
50	Nairobi	Kenya
51	Nangandao	China
52	Ankara	Turkey
53	Tai’an	China
54	Yulin	China
55	Dezhou	China
56	Yongzhou	China
57	Rangoon	Myanmar
58	Toronto	Canada
59	Suihua	China
60	Washington	United States
61	Qiqihar	China
62	Jinhua	China
63	Shantou	China
64	Sydney	Australia
65	Weinan	China
66	Suqian	China
67	Suzhou	China
68	Fuzhou	China
69	Zhaotong	China
70	Pudong	China
71	Zhangzhou	China
72	Bozhou	China
73	Nanchang	China
74	Xianyang	China
75	Taizhou	China
76	Abidjan	Côte D’Ivoire
77	Huaihua	China
78	Ji’an	China
79	Mianyang	China
80	Xiaoganzhan	China
81	Shaoxing	China
82	Yuncheng	China
83	Pingdingshan	China
84	Huizhou	China
85	Huai’an	China
86	Xinpu	China
87	Chenzhou	China
88	Guilin	China
89	Jiujiang	China
90	Anqing	China
91	Huanglongsi	China
92	Jiangmen	China
93	Changzhou	China
94	Wuxi	China
95	Zibo	China
96	Jiaxing	China
97	Dalian	China
98	Hengshui	China
99	Harbin	China
100	Yangzhou	China
101	Yibin	China
102	Johannesburg	South Africa
103	Yiyang	China
104	Meizhou	China
105	Chifeng	China
106	Casablanca	Morocco
107	Guiyang	China
108	Langfang	China
109	Zhangjiakou	China
110	Linfen	China
111	Wenzhou	China
112	Luzhou	China
113	Jiangguanchi	China
114	Neijiang	China
115	Yanjiang	China
116	Zhaoqing	China
117	Xiaoxita	China
118	Guigang	China
119	Xiamen	China
120	Chuzhou	China
121	Fuzhou	China
122	Zhuzhou	China
123	Amman	Jordan
124	Loudi	China
125	Deyang	China
126	Qingyuan	China
127	Wuhu	China
128	Hechi	China
129	Binzhou	China
130	Liuzhou	China
131	Baojishi	China
132	Guang’an	China
133	Hanzhong	China
134	Kabul	Afghanistan
135	Zaozhuang	China
136	Berlin	Germany
137	Anshan	China
138	Lanzhou	China
139	Chengde	China
140	Puyang	China
141	Suining	China
142	Jiaozuo	China
143	Bengbu	China
144	Baicheng	China
145	Algiers	Algeria
146	Qincheng	China
147	Taiyuan	China
148	Shiyan	China
149	Chaoyang	China
150	Hechi	China
151	Leshan	China
152	Yulinshi	China
153	Siping	China
154	Zhongshan	China
155	Changzhi	China
156	Santa Cruz	Bolivia
157	Qinhuangdao	China
158	Bazhou	China
159	Zhenjiang	China
160	Ürümqi	China
161	Tongliao	China
162	Heyuan	China
163	Tongren	China
164	Qinzhou	China
165	Xinzhou	China
166	Addis Ababa	Ethiopia
167	Meishan	China
168	Brasília	Brazil
169	Jinzhou	China
170	Tieling	China
171	Shaoguan	China
172	Kuwait City	Kuwait
173	Shanwei	China
174	Kyiv	Ukraine
175	Sanaa	Yemen
176	Dingxi	China
177	Ningde	China
178	Daqing	China
179	Putian	China
180	Huzhou	China
181	Wuzhou	China
182	Xiangtan	China
183	Rome	Italy
184	La Paz	Bolivia
185	Pyongyang	North Korea
186	Taichung	Taiwan
187	Zigong	China
188	Mudanjiang	China
189	Huludao	China
190	Guayaquil	Ecuador
191	Rizhao	China
192	Baotou	China
193	Taipei	Taiwan
194	Nanping	China
195	Chaozhou	China
196	Longyan	China
197	Hohhot	China
198	Antananarivo	Madagascar
199	Longba	China
200	Weihai	China
201	Santo Domingo	Dominican Republic
202	Xuanzhou	China
203	Sanming	China
204	Yangjiang	China
205	Yunfu	China
206	Baoshan	China
207	Dubai	United Arab Emirates
208	Luohe	China
209	Qinbaling	China
210	Guangyuan	China
211	Huangshi	China
212	Guatemala City	Guatemala
213	Yaoundé	Cameroon
214	Jilin	China
215	Lianshan	China
216	Lincang	China
217	Tashkent	Uzbekistan
218	Huainan	China
219	Dandong	China
220	Shangzhou	China
221	Jiamusi	China
222	Accra	Ghana
223	Yuxi	China
224	Anshun	China
225	Yingkou	China
226	Sanmenxia	China
227	Ma’anshan	China
228	Pingliang	China
229	Quzhou	China
230	Baku	Azerbaijan
231	Gaoping	China
232	Huaibei	China
233	Xining	China
234	Harare	Zimbabwe
235	Yan’an	China
236	Havana	Cuba
237	Phnom Penh	Cambodia
238	Mogadishu	Somalia
239	Jincheng	China
240	Puning	China
241	Lishui	China
242	Qingyang	China
243	Laibin	China
244	Fushun	China
245	Bamako	Mali
246	Quito	Ecuador
247	Minsk	Belarus
248	Pingxiang	China
249	Chongzuo	China
250	Hezhou	China
251	Jixi	China
252	Caracas	Venezuela
253	Fuxin	China
254	Aleppo	Syria
255	Almaty	Kazakhstan
256	Vienna	Austria
257	Blantyre	Malawi
258	Zhuhai	China
259	Bucharest	Romania
260	Wuwei	China
261	Xiping	China
262	Asunción	Paraguay
263	Brazzaville	Congo (Brazzaville)
264	Liaoyang	China
265	Baiyin	China
266	Warsaw	Poland
267	Shengli	China
268	Haikou	China
269	Damascus	Syria
270	Shuyangzha	China
271	Brussels	Belgium
272	Budapest	Hungary
273	Heihe	China
274	Lusaka	Zambia
275	Shuozhou	China
276	Sanzhou	China
277	Conakry	Guinea
278	Kampala	Uganda
279	Yushan	China
280	Ouagadougou	Burkina Faso
281	Yinchuan	China
282	Chengtangcun	China
283	Jingdezhen	China
284	Benxi	China
285	Zhangjiajie	China
286	Beihai	China
287	Shuangyashan	China
288	Yucheng	China
289	Changshu	China
290	Lianjiang	China
291	Ximeicun	China
292	Jianguang	China
293	Xushan	China
294	Guiping	China
295	Leizhou	China
296	Auckland	New Zealand
297	Huangshan	China
298	Huazhou	China
299	Pizhou	China
300	Yangshe	China
301	Chizhou	China
302	Guyuan	China
303	Rui’an	China
304	Muscat	Oman
305	Hebi	China
306	Gaozhou	China
307	The Hague	Netherlands
308	Ulaanbaatar	Mongolia
309	Yueqing	China
310	Belgrade	Serbia
311	Pingdu	China
312	Yutan	China
313	Wenling	China
314	Sofia	Bulgaria
315	Prague	Czechia
316	Liangshi	China
317	Montevideo	Uruguay
318	Fuqing	China
319	Xintai	China
320	Doha	Qatar
321	Yushu	China
322	Rongcheng	China
323	Huazhou	China
324	Yangquan	China
325	Haicheng	China
326	Yingtan	China
327	Huaiyin	China
328	Wuzhong	China
329	Zhangye	China
330	Rucheng	China
331	Comayagüela	Honduras
332	Shaoyang	China
333	Yichun	China
334	Laiwu	China
335	Jingling	China
336	Dayan	China
337	Jiangyin	China
338	Yongcheng	China
339	Abuja	Nigeria
340	Yiwu	China
341	Beidao	China
342	Shuangshui	China
343	Maputo	Mozambique
344	Xinyu	China
345	Pikine	Senegal
346	Dublin	Ireland
347	Guankou	China
348	Dingzhou	China
349	Lianyuan	China
350	Rongcheng	China
351	Kaiyuan	China
352	Nay Pyi Taw	Myanmar
353	Dakar	Senegal
354	Zhuji	China
355	Kigali	Rwanda
356	Leiyang	China
357	Dadukou	China
358	Xiantao	China
359	Yingchuan	China
360	Tegucigalpa	Honduras
361	Tripoli	Libya
362	Tbilisi	Georgia
363	N’Djamena	Chad
364	Yerevan	Armenia
365	Nur-Sultan	Kazakhstan
366	Nouakchott	Mauritania
367	Tunis	Tunisia
368	Bishkek	Kyrgyzstan
369	Ashgabat	Turkmenistan
370	Niamey	Niger
371	Managua	Nicaragua
372	Monrovia	Liberia
373	Port-au-Prince	Haiti
374	Islamabad	Pakistan
375	Kathmandu	Nepal
376	Abu Dhabi	United Arab Emirates
377	Stockholm	Sweden
378	Asmara	Eritrea
379	Freetown	Sierra Leone
380	Jerusalem	Israel
381	Bangui	Central African Republic
382	Panama City	Panama
383	Amsterdam	Netherlands
384	Lomé	Togo
385	Libreville	Gabon
386	Zagreb	Croatia
387	Dushanbe	Tajikistan
388	Lilongwe	Malawi
389	Cotonou	Benin
390	Vientiane	Laos
391	Colombo	Sri Lanka
392	Pretoria	South Africa
393	Oslo	Norway
394	Athens	Greece
395	Bujumbura	Burundi
396	Helsinki	Finland
397	Skopje	Macedonia
398	Chisinau	Moldova
399	Riga	Latvia
400	Copenhagen	Denmark
401	Kingston	Jamaica
402	Rabat	Morocco
403	Vilnius	Lithuania
404	San Salvador	El Salvador
405	Djibouti	Djibouti
406	Lisbon	Portugal
407	Tallinn	Estonia
408	Cape Town	South Africa
409	Bratislava	Slovakia
410	Tirana	Albania
411	Canberra	Australia
412	Wellington	New Zealand
413	Beirut	Lebanon
414	Dodoma	Tanzania
415	Bissau	Guinea-Bissau
416	Juba	South Sudan
417	Port Moresby	Papua New Guinea
418	Yamoussoukro	Côte D’Ivoire
419	Maseru	Lesotho
420	Nicosia	Cyprus
421	Windhoek	Namibia
422	Porto-Novo	Benin
423	Sucre	Bolivia
424	San José	Costa Rica
425	Ljubljana	Slovenia
426	Sarajevo	Bosnia And Herzegovina
427	Nassau	Bahamas, The
428	Bloemfontein	South Africa
429	Fort-de-France	Martinique
430	Gaborone	Botswana
431	Paramaribo	Suriname
432	Dili	Timor-Leste
433	Pristina	Kosovo
434	Georgetown	Guyana
435	Malabo	Equatorial Guinea
436	Gibraltar	Gibraltar
437	Saint-Denis	Reunion
438	Male	Maldives
439	Podgorica	Montenegro
440	Manama	Bahrain
441	Port Louis	Mauritius
442	Willemstad	Curaçao
443	New Delhi	India
444	Bern	Switzerland
445	Papeete	French Polynesia
446	Reykjavík	Iceland
447	Praia	Cabo Verde
448	Luxembourg	Luxembourg
449	Sri Jayewardenepura Kotte	Sri Lanka
450	Bridgetown	Barbados
451	Moroni	Comoros
452	Thimphu	Bhutan
453	Mbabane	Swaziland
454	Nouméa	New Caledonia
455	Honiara	Solomon Islands
456	Suva	Fiji
457	Castries	Saint Lucia
458	Cayenne	French Guiana
459	São Tomé	Sao Tome And Principe
460	Port-Vila	Vanuatu
461	Hamilton	Bermuda
462	Bandar Seri Begawan	Brunei
463	Monaco	Monaco
464	Gitega	Burundi
465	Port of Spain	Trinidad And Tobago
466	Apia	Samoa
467	Douglas	Isle Of Man
468	Oranjestad	Aruba
469	Saint Helier	Jersey
470	Vaduz	Liechtenstein
471	Banjul	Gambia, The
472	Mamoudzou	Mayotte
473	Majuro	Marshall Islands
474	Tarawa	Kiribati
475	George Town	Cayman Islands
476	Victoria	Seychelles
477	Kingstown	Saint Vincent And The Grenadines
478	Saint John’s	Antigua And Barbuda
479	Nuku‘alofa	Tonga
480	Andorra la Vella	Andorra
481	Nuuk	Greenland
482	Belmopan	Belize
483	Roseau	Dominica
484	Basseterre	Saint Kitts And Nevis
485	Tórshavn	Faroe Islands
486	Pago Pago	American Samoa
487	Valletta	Malta
488	Gaza	Gaza Strip
489	Grand Turk	Turks And Caicos Islands
490	Palikir	Micronesia, Federated States Of
491	Funafuti	Tuvalu
492	Lobamba	Swaziland
493	Avarua	Cook Islands
494	Saint George’s	Grenada
495	San Marino	San Marino
496	Al Quds	West Bank
497	Capitol Hill	Northern Mariana Islands
498	Basse-Terre	Guadeloupe
499	Stanley	Falkland Islands (Islas Malvinas)
500	Vatican City	Vatican City
501	Alofi	Niue
502	Hagåtña	Guam
503	Jamestown	Saint Helena, Ascension, And Tristan Da Cunha
504	Marigot	Saint Martin
505	Philipsburg	Sint Maarten
506	Road Town	British Virgin Islands
507	Gustavia	Saint Barthelemy
508	Saint-Pierre	Saint Pierre And Miquelon
509	The Valley	Anguilla
510	Mata-Utu	Wallis And Futuna
511	Kingston	Norfolk Island
512	Ngerulmud	Palau
513	Tifariti	Morocco
514	Tifariti	Western Sahara
515	Longyearbyen	Svalbard
516	Adamstown	Pitcairn Islands
517	Flying Fish Cove	Christmas Island
518	Macau	Macau
519	Irapuato	Mexico
520	Nuevo Laredo	Mexico
521	Cuernavaca	Mexico
522	Nicolás Romero	Mexico
523	Tecámac	Mexico
524	Ciudad General Escobedo	Mexico
525	Surgut	Russia
526	Vladimir	Russia
527	Minatitlán	Mexico
528	Nizhniy Tagil	Russia
529	Arkhangelsk	Russia
530	Chita	Russia
531	Kaluga	Russia
532	Tepic	Mexico
533	Iwaki	Japan
534	Maebashi	Japan
535	Smolensk	Russia
536	Asahikawa	Japan
537	Gómez Palacio	Mexico
538	Volzhskiy	Russia
539	Kōchi	Japan
540	Naha	Japan
541	San Juan	Puerto Rico
542	Kurgan	Russia
543	Uruapan	Mexico
544	Tapachula	Mexico
545	Cherepovets	Russia
546	Coatzacoalcos	Mexico
547	Tampico	Mexico
548	Vologda	Russia
549	Saransk	Russia
550	Toshima	Japan
551	Orël	Russia
552	Yokkaichi	Japan
553	Chalco	Mexico
554	Kasugai	Japan
555	Vladikavkaz	Russia
556	Yakutsk	Russia
557	Podolsk	Russia
558	Ciudad Victoria	Mexico
559	Ōakashichō	Japan
560	Oaxaca	Mexico
561	Akita	Japan
562	Murmansk	Russia
563	Tambov	Russia
564	Groznyy	Russia
565	Morioka	Japan
566	Coacalco	Mexico
567	Fukushima	Japan
568	Sterlitamak	Russia
569	Petrozavodsk	Russia
570	Kostroma	Russia
571	Nizhnevartovsk	Russia
572	Pachuca	Mexico
573	Tehuacán	Mexico
574	Tsu	Japan
575	Aomori	Japan
576	Minato	Japan
577	Fuchū	Japan
578	Novorossiysk	Russia
579	Mito	Japan
580	Yoshkar-Ola	Russia
581	Nalchik	Russia
582	Ichihara	Japan
583	Salamanca	Mexico
584	Engels	Russia
585	Ciudad Benito Juárez	Mexico
586	Hiratsuka	Japan
587	Fukui	Japan
588	Sōka	Japan
589	Ciudad Santa Catarina	Mexico
590	Los Mochis	Mexico
591	Texcoco	Mexico
592	Playa del Carmen	Mexico
593	Tokushima	Japan
594	La Paz	Mexico
595	Shinozaki	Japan
596	Taganrog	Russia
597	Hakodate	Japan
598	Chōfugaoka	Japan
599	Komsomol’sk-na-Amure	Russia
600	Chigasaki	Japan
601	Yato	Japan
602	Yamagata	Japan
603	Tsukuba-kenkyūgakuen-toshi	Japan
604	Syktyvkar	Russia
605	Khimki	Russia
606	Fuji	Japan
607	San Juan del Río	Mexico
608	Arakawa	Japan
609	Hachimanchō	Japan
610	Sato	Japan
611	Nizhnekamsk	Russia
612	Neya	Japan
613	Shakhty	Russia
614	Monclova	Mexico
615	Saga	Japan
616	Dzerzhinsk	Russia
617	Bratsk	Russia
618	Ageoshimo	Japan
619	Orsk	Russia
620	Noginsk	Russia
621	Guadalupe	Mexico
622	Taitō	Japan
623	Kolpino	Russia
624	Puerto Vallarta	Mexico
625	Buenavista	Mexico
626	Angarsk	Russia
627	Heroica Nogales	Mexico
628	Campeche	Mexico
629	Korolëv	Russia
630	Minamiōzuma	Japan
631	Blagoveshchensk	Russia
632	Velikiy Novgorod	Russia
633	Staryy Oskol	Russia
634	Soledad de Graciano Sánchez	Mexico
635	Córdoba	Mexico
636	Ciudad Acuña	Mexico
637	Ciudad Madero	Mexico
638	Kure	Japan
639	Metepec	Mexico
640	Pskov	Russia
641	Kamirenjaku	Japan
642	Mytishchi	Russia
643	Yachiyo	Japan
644	Biysk	Russia
645	Poza Rica de Hidalgo	Mexico
646	Lyubertsy	Russia
647	Matsue	Japan
648	San Pablo de las Salinas	Mexico
649	Ashino	Japan
650	Chilpancingo	Mexico
651	Higashi-Hiroshima	Japan
652	Hino	Japan
653	Prokopyevsk	Russia
654	Suzuka	Japan
655	San Luis Río Colorado	Mexico
656	Naka	Japan
657	Cholula de Rivadabia	Mexico
658	Yuzhno-Sakhalinsk	Russia
659	Kumagaya	Japan
660	Aydın	Turkey
661	Armavir	Russia
662	Balakovo	Russia
663	Anjōmachi	Japan
664	Rybinsk	Russia
665	Tachikawa	Japan
666	Kōfu	Japan
667	Tottori	Japan
668	Jōetsu	Japan
669	Izuo	Japan
670	Manzanillo	Mexico
671	Severodvinsk	Russia
672	Narashino	Japan
673	Abakan	Russia
674	Petropavlovsk-Kamchatskiy	Russia
675	Çanakkale	Turkey
676	Edirne	Turkey
677	Torbalı	Turkey
678	Chicoloapan	Mexico
679	Norilsk	Russia
680	Ciudad Valles	Mexico
681	Cuautla	Mexico
682	Ciudad del Carmen	Mexico
683	Ereğli	Turkey
684	Ōbiraki	Japan
685	Comitán	Mexico
686	Takaoka	Japan
687	Menemen	Turkey
688	Syzran	Russia
689	Lagos de Moreno	Mexico
690	Beppuchō	Japan
691	Hitachi	Japan
692	Orekhovo-Borisovo Yuzhnoye	Russia
693	Krasnogorsk	Russia
694	Izumo	Japan
695	Niiza	Japan
696	Guanajuato	Mexico
697	Volgodonsk	Russia
698	Kamensk-Ural’skiy	Russia
699	Cuauhtémoc	Mexico
700	Ussuriysk	Russia
701	Novocherkassk	Russia
702	Nishio	Japan
703	Zlatoust	Russia
704	Iwata	Japan
705	Takaoka	Japan
706	Siirt	Turkey
707	Körfez	Turkey
708	Piedras Negras	Mexico
709	Turgutlu	Turkey
710	Ube	Japan
711	Gölcük	Turkey
712	San Martin Texmelucan de Labastida	Mexico
713	Salihli	Turkey
714	Elektrostal	Russia
715	Solingen	Germany
716	Darmstadt	Germany
717	Bingöl	Turkey
718	Talas	Turkey
719	Herne	Germany
720	Higashimurayama	Japan
721	Ōgaki	Japan
722	Matsuzaka	Japan
723	San Cristóbal	Mexico
724	Fethiye	Turkey
725	Ŭiwang	South Korea
726	Navojoa	Mexico
727	Erzincan	Turkey
728	Zonguldak	Turkey
729	Jiutepec	Mexico
730	Nazilli	Turkey
731	Chetumal	Mexico
732	Hanam	South Korea
733	Kariya	Japan
734	Hitachi-Naka	Japan
735	Ordu	Turkey
736	Neuss	Germany
737	Bartın	Turkey
738	Salavat	Russia
739	Bandırma	Turkey
740	Silao	Mexico
741	Regensburg	Germany
742	Almetyevsk	Russia
743	Tama	Japan
744	Seogwipo	South Korea
745	Tochigi	Japan
746	Kırşehir	Turkey
747	Papantla de Olarte	Mexico
748	Ueda	Japan
749	Tulancingo	Mexico
750	Gwangyang	South Korea
751	Kukichūō	Japan
752	Miass	Russia
753	Nakhodka	Russia
754	Paderborn	Germany
755	Sayama	Japan
756	Zamora	Mexico
757	Komaki	Japan
758	Shimotoda	Japan
759	Delicias	Mexico
760	Ağrı	Turkey
761	Amasya	Turkey
762	Iruma	Japan
763	Kastamonu	Turkey
764	Kanasín	Mexico
765	Yonago	Japan
766	Dolores Hidalgo Cuna de la Independencia Nacional	Mexico
767	Kopeysk	Russia
768	Lüleburgaz	Turkey
769	Pyatigorsk	Russia
770	Rubtsovsk	Russia
771	Odintsovo	Russia
772	Misato	Japan
773	Kolomna	Russia
774	García	Mexico
775	Berezniki	Russia
776	Ereğli	Turkey
777	Yalova	Turkey
778	Kusatsu	Japan
779	Kakamigahara	Japan
780	Khasavyurt	Russia
781	Tuxtepec	Mexico
782	Túxpam de Rodríguez Cano	Mexico
783	Nevşehir	Turkey
784	Cizre	Turkey
785	Telford	United Kingdom
786	Nizip	Turkey
787	Maykop	Russia
788	Fukayachō	Japan
789	Rize	Turkey
790	Colima	Mexico
791	Tepatitlán de Morelos	Mexico
792	Valle de Santiago	Mexico
793	Kovrov	Russia
794	Kokubunji	Japan
795	Sale	United Kingdom
796	Kuwana	Japan
797	San Miguel de Allende	Mexico
798	Koga	Japan
799	Ishizaki	Japan
800	Zacatecas	Mexico
801	Boca del Rio	Mexico
802	Zama	Japan
803	Ingolstadt	Germany
804	Ch’ungmu	South Korea
805	Iğdır	Turkey
806	Santa María Texmelucan	Mexico
807	Kisarazu	Japan
808	Yaizu	Japan
809	Inazawa	Japan
810	Chech’ŏn	South Korea
811	Giresun	Turkey
812	Zinacantepec	Mexico
813	Brighton	United Kingdom
814	Heroica Guaymas	Mexico
815	Apatzingan de la Constitucion	Mexico
816	Enfield	United Kingdom
817	Ōme	Japan
818	Abiko	Japan
819	Ödemiş	Turkey
820	Karabük	Turkey
821	High Wycombe	United Kingdom
822	Narita	Japan
823	Torrejón de Ardoz	Spain
824	Onomichi	Japan
825	Kislovodsk	Russia
826	Kozan	Turkey
827	Çayırova	Turkey
828	Fürth	Germany
829	Serpukhov	Russia
830	Bolton	United Kingdom
831	Würzburg	Germany
832	Novocheboksarsk	Russia
833	Romford	United Kingdom
834	Newport	United Kingdom
835	Seto	Japan
836	Bataysk	Russia
837	Domodedovo	Russia
838	Kadoma	Japan
839	Kaspiysk	Russia
840	Neftekamsk	Russia
841	Ōmiyachō	Japan
842	Ulm	Germany
843	Nefteyugansk	Russia
844	Heilbronn	Germany
845	Miramar	Mexico
846	Ixtlahuaca	Mexico
847	Ünye	Turkey
848	Exeter	United Kingdom
849	Pforzheim	Germany
850	Iizuka	Japan
851	Solihull	United Kingdom
852	Shchelkovo	Russia
853	Novomoskovsk	Russia
854	Gateshead	United Kingdom
855	Honchō	Japan
856	Orizaba	Mexico
857	Ciudad de Atlixco	Mexico
858	Daitōchō	Japan
859	Polatlı	Turkey
860	Cádiz	Spain
861	Wolfsburg	Germany
862	Pervouralsk	Russia
863	Algeciras	Spain
864	Noksan	South Korea
865	Kadirli	Turkey
866	Cherkessk	Russia
867	San Pedro Garza García	Mexico
868	Derbent	Russia
869	Preston	United Kingdom
870	Villa de Álvarez	Mexico
871	Ise	Japan
872	Patnos	Turkey
873	Blackburn	United Kingdom
874	Ciudad Hidalgo	Mexico
875	Orekhovo-Zuyevo	Russia
876	Kashiwara	Japan
877	Samandağ	Turkey
878	Tsuruoka	Japan
879	Walthamstow	United Kingdom
880	Doğubayazıt	Turkey
881	Chilapa de Álvarez	Mexico
882	Göttingen	Germany
883	Ebetsu	Japan
884	Fujimino	Japan
885	Nazran	Russia
886	Kasuga	Japan
887	Cheltenham	United Kingdom
888	Nevinnomyssk	Russia
889	Reutov	Russia
890	Akishima	Japan
891	Bottrop	Germany
892	Kōnosu	Japan
893	Karatepe	Turkey
894	Cuautitlán	Mexico
895	Ikoma	Japan
896	Martínez de la Torre	Mexico
897	Tecomán	Mexico
898	Nobeoka	Japan
899	Obninsk	Russia
900	Kapaklı	Turkey
901	Basingstoke	United Kingdom
902	Maidstone	United Kingdom
903	Reutlingen	Germany
904	Temixco	Mexico
905	Kyzyl	Russia
906	Beppu	Japan
907	Dimitrovgrad	Russia
908	San Antonio Enchisi	Mexico
909	Ramenskoye	Russia
910	Kilis	Turkey
911	Shibuya	Japan
912	Parral	Mexico
913	Huejutla de Reyes	Mexico
914	Chelmsford	United Kingdom
915	Doncaster	United Kingdom
916	Nasushiobara	Japan
917	Kōenchō	Japan
918	Niihama	Japan
919	Sano	Japan
920	Koblenz	Germany
921	Oktyabr’skiy	Russia
922	Hatsukaichi	Japan
923	Las Delicias	Mexico
924	Bremerhaven	Germany
925	Kamagaya	Japan
926	Kuşadası	Turkey
927	Colchester	United Kingdom
928	Recklinghausen	Germany
929	San Francisco del Rincón	Mexico
930	Hōfu	Japan
931	Hikone	Japan
932	Wythenshawe	United Kingdom
933	Erlangen	Germany
934	Sa-ch’on	South Korea
935	Akçakale	Turkey
936	Bergisch Gladbach	Germany
937	Novyy Urengoy	Russia
938	Burdur	Turkey
939	Jaén	Spain
940	Rotherham	United Kingdom
941	Otaru	Japan
942	Higashiōmi	Japan
943	Ōshū	Japan
944	Remscheid	Germany
945	Habikino	Japan
946	Kamyshin	Russia
947	Dolgoprudnyy	Russia
948	Jena	Germany
949	Kars	Turkey
950	Ciudad Mante	Mexico
951	Zhukovskiy	Russia
952	Escuintla	Mexico
953	Hounslow	United Kingdom
954	Trier	Germany
955	Rochdale	United Kingdom
956	Murom	Russia
957	Bedford	United Kingdom
958	Tondabayashichō	Japan
959	Stockport	United Kingdom
960	Fresnillo	Mexico
961	Yessentuki	Russia
962	Iguala de la Independencia	Mexico
963	Shirayamamachi	Japan
964	Darlington	United Kingdom
965	Yŏju	South Korea
966	Sandachō	Japan
967	Yŏngju	South Korea
968	Mineshita	Japan
969	Soma	Turkey
970	Novoshakhtinsk	Russia
971	Crawley	United Kingdom
972	Ikeda	Japan
973	Salford	United Kingdom
974	Wembley	United Kingdom
975	Huauchinango	Mexico
976	Dagenham	United Kingdom
977	Seversk	Russia
978	Reus	Spain
979	Tajimi	Japan
980	Thunder Bay	Canada
981	Gillingham	United Kingdom
982	La Piedad	Mexico
983	Mansfield	United Kingdom
984	Dieppe	Canada
985	Arzamas	Russia
986	San Felipe	Mexico
987	Artëm	Russia
988	Noyabrsk	Russia
989	Kemalpaşa	Turkey
990	Achinsk	Russia
991	Girona	Spain
992	Nusaybin	Turkey
993	Yelets	Russia
994	Pushkino	Russia
995	Lerma	Mexico
996	Ciudad Río Bravo	Mexico
997	Toride	Japan
998	Moers	Germany
999	Yozgat	Turkey
1000	Salzgitter	Germany
1001	Berdsk	Russia
1002	Waterloo	Canada
1003	San Vicente de Baracaldo	Spain
1004	Sergiyev Posad	Russia
1005	Zihuatanejo	Mexico
1006	Inzai	Japan
1007	Eastbourne	United Kingdom
1008	Worcester	United Kingdom
1009	Fyfield	United Kingdom
1010	Ginowan	Japan
1011	Tula de Allende	Mexico
1012	Saijō	Japan
1013	Isehara	Japan
1014	Wigan	United Kingdom
1015	Siegen	Germany
1016	Elista	Russia
1017	Sakado	Japan
1018	Novokuybyshevsk	Russia
1019	Bergama	Turkey
1020	Miryang	South Korea
1021	Hildesheim	Germany
1022	Sangju	South Korea
1023	Kırklareli	Turkey
1024	Hove	United Kingdom
1025	Noginsk	Russia
1026	Saint Helens	United Kingdom
1027	San Felipe del Progreso	Mexico
1028	Delta	Canada
1029	Coatepec	Mexico
1030	Boryeong	South Korea
1031	Hemel Hempstead	United Kingdom
1032	Tizayuca	Mexico
1033	Chatham	Canada
1034	Zheleznogorsk	Russia
1035	San Luis de la Paz	Mexico
1036	Wakefield	United Kingdom
1037	Gütersloh	Germany
1038	Watford	United Kingdom
1039	Jilotepec	Mexico
1040	Barnsley	United Kingdom
1041	Cottbus	Germany
1042	Kaiserslautern	Germany
1043	Kōnan	Japan
1044	Red Deer	Canada
1045	Lincoln	United Kingdom
1046	Kamloops	Canada
1047	Kettering	United Kingdom
1048	Khanty-Mansiysk	Russia
1049	Yashio	Japan
1050	San Fernando	Spain
1051	Tenancingo	Mexico
1052	Fulham	United Kingdom
1053	Schwerin	Germany
1054	Çankırı	Turkey
1055	East Ham	United Kingdom
1056	Yotsukaidō	Japan
1057	Ludwigsburg	Germany
1058	Esslingen	Germany
1059	Nisshin	Japan
1060	Ōbu	Japan
1061	Hartlepool	United Kingdom
1062	Ealing	United Kingdom
1063	Birkenhead	United Kingdom
1064	Tultepec	Mexico
1065	Ciudad Lázaro Cárdenas	Mexico
1066	Şırnak	Turkey
1067	Nuneaton	United Kingdom
1068	Brixton	United Kingdom
1069	Levallois-Perret	France
1070	Santiago de Compostela	Spain
1071	Magadan	Russia
1072	Bromley	United Kingdom
1073	Bath	United Kingdom
1074	Edmonton	United Kingdom
1075	Hayes	United Kingdom
1076	Lobnya	Russia
1077	Aulnay-sous-Bois	France
1078	Fuengirola	Spain
1079	Kitanagoya	Japan
1080	Cadereyta Jiménez	Mexico
1081	Higashiyamato	Japan
1082	Poitiers	France
1083	Acayucan	Mexico
1084	Versailles	France
1085	Woolwich	United Kingdom
1086	Ciudad de Ceuta	Spain
1087	Bracknell	United Kingdom
1088	Apizaco	Mexico
1089	San Baudilio de Llobregat	Spain
1090	Tala	Mexico
1091	Carrières-sur-Seine	France
1092	Fuentes del Valle	Mexico
1093	Salina Cruz	Mexico
1094	Jalpa de Méndez	Mexico
1095	Mardin	Turkey
1096	Nacajuca	Mexico
1097	Cárdenas	Mexico
1098	Edgware	United Kingdom
1099	Owariasahi	Japan
1100	Toledo	Spain
1101	Kuznetsk	Russia
1102	Ciudad Lerdo	Mexico
1103	Issy-les-Moulineaux	France
1104	Scunthorpe	United Kingdom
1105	Tacámbaro de Codallos	Mexico
1106	Cunduacán	Mexico
1107	Ivanteyevka	Russia
1108	Nagaoka	Japan
1109	Cozumel	Mexico
1110	Cabo San Lucas	Mexico
1111	Champigny-sur-Marne	France
1112	Kunitachi	Japan
1113	Newmarket	Canada
1114	Clichy	France
1115	West Bromwich	United Kingdom
1116	Chatham	United Kingdom
1117	Rueil-Malmaison	France
1118	Casoria	Italy
1119	Dudley	United Kingdom
1120	Zacatlán	Mexico
1121	White Rock	Canada
1122	South Shields	United Kingdom
1123	Paisley	United Kingdom
1124	Weston-super-Mare	United Kingdom
1125	Bilecik	Turkey
1126	Juchitán de Zaragoza	Mexico
1127	Cinisello Balsamo	Italy
1128	Saint-Maur-des-Fossés	France
1129	Hakkari	Turkey
1130	Bury	United Kingdom
1131	Gravesend	United Kingdom
1132	Rubí	Spain
1133	Avilés	Spain
1134	Drancy	France
1135	Lowestoft	United Kingdom
1136	Pau	France
1137	Tejupilco	Mexico
1138	Carlisle	United Kingdom
1139	Harrogate	United Kingdom
1140	Newcastle under Lyme	United Kingdom
1141	Kensington	United Kingdom
1142	La Rochelle	France
1143	East Kilbride	United Kingdom
1144	Gladbeck	Germany
1145	Cannes	France
1146	Thornton Heath	United Kingdom
1147	Tamazunchale	Mexico
1148	Jacona de Plancarte	Mexico
1149	Ashford	United Kingdom
1150	Chiryū	Japan
1151	Calais	France
1152	Montrouge	France
1153	Southall	United Kingdom
1154	Guamúchil	Mexico
1155	Musashimurayama	Japan
1156	Antibes	France
1157	Rugby	United Kingdom
1158	Guasave	Mexico
1159	Burton upon Trent	United Kingdom
1160	Uxbridge	United Kingdom
1161	Rioverde	Mexico
1162	Crewe	United Kingdom
1163	Matehuala	Mexico
1164	Hekinan	Japan
1165	Vincennes	France
1166	Yoshikawa	Japan
1167	Gosport	United Kingdom
1168	Wandsworth	United Kingdom
1169	Birobidzhan	Russia
1170	Tsurugashima	Japan
1171	Frontera	Mexico
1172	Neuilly-sur-Seine	France
1173	Finchley	United Kingdom
1174	Noisy-le-Grand	France
1175	Yawata-shimizui	Japan
1176	Feltham	United Kingdom
1177	Castelldefels	Spain
1178	Torremolinos	Spain
1179	Chingford	United Kingdom
1180	Ivry-sur-Seine	France
1181	Toyoake	Japan
1182	Inverness	United Kingdom
1183	Washington	United Kingdom
1184	Benalmádena	Spain
1185	Bitlis	Turkey
1186	Ajaccio	France
1187	Maidenhead	United Kingdom
1188	Hatogaya-honchō	Japan
1189	Misantla	Mexico
1190	Courcouronnes	France
1191	New Westminster	Canada
1192	Valle Hermoso	Mexico
1193	Jiquílpan de Juárez	Mexico
1194	Cergy	France
1195	Wimbledon	United Kingdom
1196	Viladecáns	Spain
1197	Loughborough	United Kingdom
1198	Colonia del Sol	Mexico
1199	Vénissieux	France
1200	Tynemouth	United Kingdom
1201	Walsall	United Kingdom
1202	Rochester	United Kingdom
1203	Georgiyevsk	Russia
1204	Castellammare di Stabia	Italy
1205	Huatusco	Mexico
1206	L’Aquila	Italy
1207	Acton	United Kingdom
1208	Pantin	France
1209	Antony	France
1210	Mitcham	United Kingdom
1211	Wrecsam	United Kingdom
1212	Kitamoto	Japan
1213	Afragola	Italy
1214	Waterlooville	United Kingdom
1215	Tomigusuku	Japan
1216	Buynaksk	Russia
1217	Scarborough	United Kingdom
1218	Tecate	Mexico
1219	Farnborough	United Kingdom
1220	Potenza	Italy
1221	Arrecife	Spain
1222	El Prat de Llobregat	Spain
1223	Valle de Bravo	Mexico
1224	Amozoc	Mexico
1225	Twickenham	United Kingdom
1226	Stourbridge	United Kingdom
1227	Fryazino	Russia
1228	Linares	Mexico
1229	Streatham	United Kingdom
1230	Barking	United Kingdom
1231	Épinay-sur-Seine	France
1232	Sabinas	Mexico
1233	Teoloyucan	Mexico
1234	Collado-Villalba	Spain
1235	La Seyne-sur-Mer	France
1236	Bayburt	Turkey
1237	Granollers	Spain
1238	Acámbaro	Mexico
1239	Troyes	France
1240	Maisons-Alfort	France
1241	La Línea de la Concepción	Spain
1242	Dewsbury	United Kingdom
1243	Sarcelles	France
1244	Altamira	Mexico
1245	Widnes	United Kingdom
1246	Cortazar	Mexico
1247	Portici	Italy
1248	Tago	Japan
1249	Villejuif	France
1250	Sinop	Turkey
1251	Cosamaloapan	Mexico
1252	Taunton	United Kingdom
1253	Bangor	United Kingdom
1254	Aylesbury	United Kingdom
1255	Sombrerete	Mexico
1256	Le Blanc-Mesnil	France
1257	Gorno-Altaysk	Russia
1258	Hasuda	Japan
1259	Halesowen	United Kingdom
1260	Marano di Napoli	Italy
1261	Legnano	Italy
1262	Mukōchō	Japan
1263	Tsushima	Japan
1264	Cherbourg	France
1265	Ruislip	United Kingdom
1266	Bondy	France
1267	Royal Tunbridge Wells	United Kingdom
1268	Saint-Ouen	France
1269	Wallasey	United Kingdom
1270	Barrow in Furness	United Kingdom
1271	Fontenay-sous-Bois	France
1272	Suresnes	France
1273	Fussa	Japan
1274	Lytkarino	Russia
1275	Portugalete	Spain
1276	Chambéry	France
1277	Bobigny	France
1278	Koja	Japan
1279	San Pedro	Mexico
1280	Lorient	France
1281	Zushi	Japan
1282	Temascalcingo	Mexico
1283	Hereford	United Kingdom
1284	Ellesmere Port	United Kingdom
1285	Évry	France
1286	Tezonapa	Mexico
1287	Mislata	Spain
1288	Etchojoa	Mexico
1289	Romita	Mexico
1290	Klimovsk	Russia
1291	San José Iturbide	Mexico
1292	Mérida	Spain
1293	Puteaux	France
1294	Actopan	Mexico
1295	Hamura	Japan
1296	Dzerzhinskiy	Russia
1297	San Buenaventura	Mexico
1298	Braintree	United Kingdom
1299	Clamart	France
1300	Aversa	Italy
1301	Meaux	France
1302	Port Coquitlam	Canada
1303	Chelles	France
1304	Huamantla	Mexico
1305	Sartrouville	France
1306	Sevran	France
1307	Hendon	United Kingdom
1308	Hilden	Germany
1309	Alfortville	France
1310	Nuevo Casas Grandes	Mexico
1311	Kidderminster	United Kingdom
1312	Zumpango	Mexico
1313	Crosby	United Kingdom
1314	Hamilton	United Kingdom
1315	Altrincham	United Kingdom
1316	Esplugas de Llobregat	Spain
1317	Gümüşhane	Turkey
1318	Acatzingo	Mexico
1319	Barri	United Kingdom
1320	Dunfermline	United Kingdom
1321	Royal Leamington Spa	United Kingdom
1322	Muğla	Turkey
1323	Llanelli	United Kingdom
1324	Montesilvano	Italy
1325	Mollet	Spain
1326	Saint-Quentin	France
1327	Massy	France
1328	San Giorgio a Cremano	Italy
1329	Weymouth	United Kingdom
1330	Gallarate	Italy
1331	Corbeil-Essonnes	France
1332	Greenford	United Kingdom
1333	Matamoros	Mexico
1334	Rowley Regis	United Kingdom
1335	Bootle	United Kingdom
1336	Ibiza	Spain
1337	Francisco I. Madero	Mexico
1338	Casalnuovo di Napoli	Italy
1339	Ercolano	Italy
1340	Villagrán	Mexico
1341	Paignton	United Kingdom
1342	Lancaster	United Kingdom
1343	Chiapa de Corzo	Mexico
1344	Morden	United Kingdom
1345	Catford	United Kingdom
1346	Folkestone	United Kingdom
1347	Shiraoka	Japan
1348	Rosny-sous-Bois	France
1349	Stratford	United Kingdom
1350	Choisy-le-Roi	France
1351	Cagnes-sur-Mer	France
1352	Sutton in Ashfield	United Kingdom
1353	Bayonne	France
1354	Macclesfield	United Kingdom
1355	Cologno Monzese	Italy
1356	Santiago Teyahualco	Mexico
1357	Wellingborough	United Kingdom
1358	Scafati	Italy
1359	Moskovskiy	Russia
1360	Rho	Italy
1361	Kirkcaldy	United Kingdom
1362	Barnet	United Kingdom
1363	Noisy-le-Sec	France
1364	Santurce-Antiguo	Spain
1365	Cumbernauld	United Kingdom
1366	Valladolid	Mexico
1367	Iwakura	Japan
1368	Takahama	Japan
1369	Batley	United Kingdom
1370	Collegno	Italy
1371	Elmshorn	Germany
1372	Suzukawa	Japan
1373	Vaulx-en-Velin	France
1374	Ocosingo	Mexico
1375	Pen-y-Bont ar Ogwr	United Kingdom
1376	Ramos Arizpe	Mexico
1377	Eltham	United Kingdom
1378	Surbiton	United Kingdom
1379	Ashton	United Kingdom
1380	Tizimín	Mexico
1381	Stretford	United Kingdom
1382	Cuetzalan	Mexico
1383	Loreto	Mexico
1384	Gennevilliers	France
1385	Welwyn Garden City	United Kingdom
1386	Bagneux	France
1387	Garges-lès-Gonesse	France
1388	Livry-Gargan	France
1389	West Bridgford	United Kingdom
1390	Lissone	Italy
1391	Yeovil	United Kingdom
1392	Beckenham	United Kingdom
1393	Campobasso	Italy
1394	Tlalmanalco	Mexico
1395	Kotelniki	Russia
1396	Nichelino	Italy
1397	Paderno Dugnano	Italy
1398	Meudon	France
1399	La Garenne-Colombes	France
1400	Cheshunt	United Kingdom
1401	Figueras	Spain
1402	Perth	United Kingdom
1403	Dollard-des-Ormeaux	Canada
1404	Bagnolet	France
1405	San Felíu de Llobregat	Spain
1406	Mairena del Aljarafe	Spain
1407	Ayr	United Kingdom
1408	Banbury	United Kingdom
1409	Wokingham	United Kingdom
1410	Moroleón	Mexico
1411	Mantes-la-Jolie	France
1412	La Courneuve	France
1413	Tlapa de Comonfort	Mexico
1414	Châtillon	France
1415	Krasnoznamensk	Russia
1416	Puerto Escondido	Mexico
1417	Seregno	Italy
1418	Salekhard	Russia
1419	Parras de la Fuente	Mexico
1420	Emiliano Zapata	Mexico
1421	Bastia	France
1422	Inuma	Japan
1423	Havant	United Kingdom
1424	Chalon-sur-Saône	France
1425	Torre Annunziata	Italy
1426	Nocera Inferiore	Italy
1427	Kanash	Russia
1428	Hinckley	United Kingdom
1429	Melito di Napoli	Italy
1430	Erith	United Kingdom
1431	Talence	France
1432	Morley	United Kingdom
1433	Empalme	Mexico
1434	Ripollet	Spain
1435	San Adrián de Besós	Spain
1436	Caluire-et-Cuire	France
1437	Villa de Zaachila	Mexico
1438	Charenton-le-Pont	France
1439	Malakoff	France
1440	Welling	United Kingdom
1441	Izúcar de Matamoros	Mexico
1442	Castleford	United Kingdom
1443	Fareham	United Kingdom
1444	Le Cannet	France
1445	Merthyr Tudful	United Kingdom
1446	Valenciennes	France
1447	Coatbridge	United Kingdom
1448	Saint-Brieuc	France
1449	Urmston	United Kingdom
1450	Kingswood	United Kingdom
1451	Rozzano	Italy
1452	Stains	France
1453	Igualada	Spain
1454	Vanves	France
1455	Kingston upon Thames	United Kingdom
1456	Bron	France
1457	Jáltipan de Morelos	Mexico
1458	Pinneberg	Germany
1459	Newbury	United Kingdom
1460	Coyotepec	Mexico
1461	Gagny	France
1462	Alcantarilla	Spain
1463	Sutton	United Kingdom
1464	Melun	France
1465	Bridgwater	United Kingdom
1466	Desio	Italy
1467	Bishops Stortford	United Kingdom
1468	Bois-Colombes	France
1469	Nogent-sur-Marne	France
1470	Arras	France
1471	Rezé	France
1472	Duncan	Canada
1473	Kirkby	United Kingdom
1474	Salisbury	United Kingdom
1475	Katsuren-haebaru	Japan
1476	Tarbes	France
1477	Caerphilly	United Kingdom
1478	Wattrelos	France
1479	Paracho de Verduzco	Mexico
1480	Playa Vicente	Mexico
1481	Uman	Mexico
1482	Grays	United Kingdom
1483	Abingdon	United Kingdom
1484	San Diego de la Unión	Mexico
1485	Ramsgate	United Kingdom
1486	Le Kremlin-Bicêtre	France
1487	Ilkeston	United Kingdom
1488	Pomigliano d’Arco	Italy
1489	Aldershot	United Kingdom
1490	Cleethorpes	United Kingdom
1491	Leighton Buzzard	United Kingdom
1492	Perote	Mexico
1493	Annemasse	France
1494	Saronno	Italy
1495	Juan Rodríguez Clara	Mexico
1496	Blyth	United Kingdom
1497	Franconville	France
1498	Saint-Martin-d’Hères	France
1499	Aldridge	United Kingdom
1500	Long Eaton	United Kingdom
1501	La Barca	Mexico
1502	Le Perreux-Sur-Marne	France
1503	Arnold	United Kingdom
1504	Cachan	France
1505	Small Heath	United Kingdom
1506	Ardahan	Turkey
1507	Villafranca del Panadés	Spain
1508	Blanes	Spain
1509	Herne Bay	United Kingdom
1510	Tonalá	Mexico
1511	Nakama	Japan
1512	Aberdare	United Kingdom
1513	Douai	France
1514	Cesano Maderno	Italy
1515	Savigny-sur-Orge	France
1516	Port Talbot	United Kingdom
1517	Xico	Mexico
1518	Mugnano di Napoli	Italy
1519	Nueva Rosita	Mexico
1520	Échirolles	France
1521	Ciampino	Italy
1522	Morshansk	Russia
1523	Arzano	Italy
1524	Salvatierra	Mexico
1525	Marcq-en-Baroeul	France
1526	Zacatelco	Mexico
1527	Corsico	Italy
1528	Le Pré-Saint-Gervais	France
1529	Hyde	United Kingdom
1530	Burjasot	Spain
1531	Miyoshidai	Japan
1532	Chartres	France
1533	Fleet	United Kingdom
1534	Villefranche-sur-Saône	France
1535	Whitley Bay	United Kingdom
1536	Sayula de Alemán	Mexico
1537	Grugliasco	Italy
1538	Villepinte	France
1539	Beeston	United Kingdom
1540	Camberley	United Kingdom
1541	Poissy	France
1542	Mariano Escobedo	Mexico
1543	Neuilly-sur-Marne	France
1544	Kanie	Japan
1545	Sainte-Geneviève-des-Bois	France
1546	Dunstable	United Kingdom
1547	Bletchley	United Kingdom
1548	Denton	United Kingdom
1549	North Shields	United Kingdom
1550	Pont-y-pŵl	United Kingdom
1551	San Juan Despí	Spain
1552	Kenton	United Kingdom
1553	Pioltello	Italy
1554	Bridlington	United Kingdom
1555	Sant’Antimo	Italy
1556	Houilles	France
1557	Conflans-Sainte-Honorine	France
1558	Pierrefitte-sur-Seine	France
1559	Bollate	Italy
1560	L’Haÿ-les-Roses	France
1561	Walkden	United Kingdom
1562	Pánuco	Mexico
1563	Nueva Italia de Ruiz	Mexico
1564	Creil	France
1565	Northolt	United Kingdom
1566	Miahuatlán de Porfirio Díaz	Mexico
1567	Châtenay-Malabry	France
1568	Palaiseau	France
1569	Casalecchio di Reno	Italy
1570	Highbury	United Kingdom
1571	Zinacantán	Mexico
1572	Premiá de Mar	Spain
1573	Ewell	United Kingdom
1574	Tunceli	Turkey
1575	Les Lilas	France
1576	Wisbech	United Kingdom
1577	Chorley	United Kingdom
1578	Athis-Mons	France
1579	Falkirk	United Kingdom
1580	Hanwell	United Kingdom
1581	Jiménez	Mexico
1582	Tuxpan	Mexico
1583	Brugherio	Italy
1584	Macuspana	Mexico
1585	Redcar	United Kingdom
1586	Tomatlán	Mexico
1587	Limbiate	Italy
1588	Spalding	United Kingdom
1589	Frattamaggiore	Italy
1590	Le Plessis-Robinson	France
1591	Escuinapa	Mexico
1592	Segrate	Italy
1593	Villeneuve-Saint-Georges	France
1594	Villemomble	France
1595	Hitchin	United Kingdom
1596	Nanchital de Lázaro Cárdenas del Río	Mexico
1597	Strood	United Kingdom
1598	Soteapan	Mexico
1599	Santa María Atzompa	Mexico
1600	Salt	Spain
1601	Riccione Marina	Italy
1602	Thonon-les-Bains	France
1603	Tenosique	Mexico
1604	Cernusco sul Naviglio	Italy
1605	Putla Villa de Guerrero	Mexico
1606	Saint-Mandé	France
1607	Letchworth	United Kingdom
1608	Santa Isabel	Mexico
1609	Wigston Magna	United Kingdom
1610	Bezons	France
1611	Clichy-sous-Bois	France
1612	Pinner	United Kingdom
1613	Ticul	Mexico
1614	Angri	Italy
1615	Calpulalpan	Mexico
1616	Trowbridge	United Kingdom
1617	Rayleigh	United Kingdom
1618	Roanne	France
1619	Earley	United Kingdom
1620	Paso de Ovejas	Mexico
1621	Agen	France
1622	Bicester	United Kingdom
1623	Abasolo	Mexico
1624	Paso del Macho	Mexico
1625	Rutherglen	United Kingdom
1626	Ryde	United Kingdom
1627	Amecameca de Juárez	Mexico
1628	Schiltigheim	France
1629	Lichfield	United Kingdom
1630	Chatou	France
1631	Ecclesfield	United Kingdom
1632	Ometepec	Mexico
1633	Pontypridd	United Kingdom
1634	Viry-Châtillon	France
1635	Kornwestheim	Germany
1636	Minamishiro	Japan
1637	Prestwich	United Kingdom
1638	Ermont	France
1639	San Juan Evangelista	Mexico
1640	Chirivella	Spain
1641	Romainville	France
1642	Brighouse	United Kingdom
1643	Farnworth	United Kingdom
1644	Villaricca	Italy
1645	Stroud	United Kingdom
1646	Darwen	United Kingdom
1647	Fresnes	France
1648	Montigny-le-Bretonneux	France
1649	Ixtapan de la Sal	Mexico
1650	Aosta	Italy
1651	Tancítaro	Mexico
1652	Dover	United Kingdom
1653	Bexleyheath	United Kingdom
1654	Les Mureaux	France
1655	Villanueva	Mexico
1656	Champotón	Mexico
1657	Nelson	United Kingdom
1658	Huyton	United Kingdom
1659	Sestao	Spain
1660	San Donato Milanese	Italy
1661	Pontoise	France
1662	Vigneux-sur-Seine	France
1663	Artvin	Turkey
1664	Catemaco	Mexico
1665	Villiers-sur-Marne	France
1666	Trappes	France
1667	Santa Maria Capua Vetere	Italy
1668	San Salvador El Seco	Mexico
1669	Ciudad Sabinas Hidalgo	Mexico
1670	Fontenay-aux-Roses	France
1671	Saint Neots	United Kingdom
1672	Grigny	France
1673	Huatabampo	Mexico
1674	Gentilly	France
1675	Escárcega	Mexico
1676	Swadlincote	United Kingdom
1677	Wishaw	United Kingdom
1678	Deal	United Kingdom
1679	Cananea	Mexico
1680	Aldaya	Spain
1681	Le Chesnay	France
1682	Borehamwood	United Kingdom
1683	Lens	France
1684	Uttaradit	Thailand
1685	Bresso	Italy
1686	Saint-Cloud	France
1687	San Giuseppe Vesuviano	Italy
1688	Pontefract	United Kingdom
1689	Ciudad Sahagun	Mexico
1690	Willenhall	United Kingdom
1691	Chumphon	Thailand
1692	Thiais	France
1693	Longton	United Kingdom
1694	Plympton	United Kingdom
1695	Paiporta	Spain
1696	Goussainville	France
1697	Bromsgrove	United Kingdom
1698	Mukdahan	Thailand
1699	Vandœuvre-lès-Nancy	France
1700	Liévin	France
1701	Bulwell	United Kingdom
1702	Périgueux	France
1703	Rincón de Romos	Mexico
1704	Dagestanskiye Ogni	Russia
1705	Kokhma	Russia
1706	Reddish	United Kingdom
1707	Zumpango del Río	Mexico
1708	Durango	Spain
1709	Aci Catena	Italy
1710	Sotteville-lès-Rouen	France
1711	Cramlington	United Kingdom
1712	Ris-Orangis	France
1713	Ban Bang Krang	Thailand
1714	San Andrés de la Barca	Spain
1715	Savigny-le-Temple	France
1716	Soledad de Doblado	Mexico
1717	Côte-Saint-Luc	Canada
1718	Oullins	France
1719	Otumba	Mexico
1720	Barañáin	Spain
1721	Sannois	France
1722	Aix-les-Bains	France
1723	Les Pavillons-sous-Bois	France
1724	Rillieux-la-Pape	France
1725	Álamo	Mexico
1726	Lambersart	France
1727	Yerres	France
1728	Kaita	Japan
1729	Cuitzeo del Porvenir	Mexico
1730	Navolato	Mexico
1731	Bourg-la-Reine	France
1732	El Salto	Mexico
1733	Shumerlya	Russia
1734	Montfermeil	France
1735	Chon Buri	Thailand
1736	Bègles	France
1737	Dieppe	France
1738	Villiers-le-Bel	France
1739	San Fernando	Mexico
1740	Contla	Mexico
1741	Villeneuve-la-Garenne	France
1742	Saint-Laurent-du-Var	France
1743	Limeil-Brévannes	France
1744	Ban Bang Khu Wat	Thailand
1745	Menton	France
1746	Udomlya	Russia
1747	Desnogorsk	Russia
1748	Martorell	Spain
1749	Lomme	France
1750	Tuxpan	Mexico
1751	Guyancourt	France
1752	Soissons	France
1753	Masnou	Spain
1754	Arcueil	France
1755	Catarroja	Spain
1756	Eaubonne	France
1757	Krabi	Thailand
1758	Xalisco	Mexico
1759	Ninomiya	Japan
1760	Tomares	Spain
1761	Boscoreale	Italy
1762	Jamay	Mexico
1763	Chatan	Japan
1764	Garbagnate Milanese	Italy
1765	Camas	Spain
1766	Armilla	Spain
1767	Chiavari	Italy
1768	Cardito	Italy
1769	Villeparisis	France
1770	Brunoy	France
1771	Sèvres	France
1772	Bussy-Saint-Georges	France
1773	Kamphaeng Phet	Thailand
1774	Saint-Gratien	France
1775	Cenon	France
1776	Qualiano	Italy
1777	Saint-Sébastien-sur-Loire	France
1778	Sai Mai	Thailand
1779	Samut Songkhram	Thailand
1780	Sucy-en-Brie	France
1781	Taverny	France
1782	La Madeleine	France
1783	Armentières	France
1784	Buri Ram	Thailand
1785	Vallauris	France
1786	Champs-Sur-Marne	France
1787	Giussano	Italy
1788	Vichy	France
1789	Élancourt	France
1790	Le Bouscat	France
1791	Alençon	France
1792	Deuil-la-Barre	France
1793	Mons-en-Baroeul	France
1794	Losino-Petrovskiy	Russia
1795	Le Grand-Quevilly	France
1796	Joinville-le-Pont	France
1797	Muggiò	Italy
1798	Ban Bang Phun	Thailand
1799	Alboraya	Spain
1800	Biarritz	France
1801	Béthune	France
1802	Seriate	Italy
1803	Orly	France
1804	Nova Milanese	Italy
1805	Neuilly-Plaisance	France
1806	Pompei	Italy
1807	San Juan de Aznalfarache	Spain
1808	Maisons-Laffitte	France
1809	Le Petit-Quevilly	France
1810	Cormeilles-en-Parisis	France
1811	Weingarten	Germany
1812	Montigny-lès-Cormeilles	France
1813	San Juan de Alicante	Spain
1814	Kościan	Poland
1815	Maracena	Spain
1816	Lormont	France
1817	Seveso	Italy
1818	Nakhon Phanom	Thailand
1819	Suphan Buri	Thailand
1820	Chaville	France
1821	Torcy	France
1822	San Juan de Vilasar	Spain
1823	Meda	Italy
1824	Castilleja de la Cuesta	Spain
1825	Rodez	France
1826	Bang Sao Thong	Thailand
1827	Sainte-Thérèse	Canada
1828	Amnat Charoen	Thailand
1829	Fontaine	France
1830	Montgeron	France
1831	Szczytno	Poland
1832	Nar’yan-Mar	Russia
1833	Croix	France
1834	Ottobrunn	Germany
1835	Morsang-sur-Orge	France
1836	San Giovanni la Punta	Italy
1837	Longjumeau	France
1838	Montmorency	France
1839	Eysines	France
1840	Loos	France
1841	Villabate	Italy
1842	Sainte-Foy-lès-Lyon	France
1843	Tassin-la-Demi-Lune	France
1844	Hérouville-Saint-Clair	France
1845	Montigny-lès-Metz	France
1846	Sceaux	France
1847	Benetúser	Spain
1848	Cusano Milanino	Italy
1849	Krathum Baen	Thailand
1850	Le Plessis-Trévise	France
1851	Le Mée-sur-Seine	France
1852	Juvisy-sur-Orge	France
1853	Kasamatsuchō	Japan
1854	Kanmaki	Japan
1855	Vélizy-Villacoublay	France
1856	Chevilly-Larue	France
1857	La Celle-Saint-Cloud	France
1858	Lop Buri	Thailand
1859	Cormano	Italy
1860	Saint-Pol-sur-Mer	France
1861	Garches	France
1862	Chanthaburi	Thailand
1863	Frattaminore	Italy
1864	Grumo Nevano	Italy
1865	Dammarie-lè-Lys	France
1866	Senago	Italy
1867	Hellemmes-Lille	France
1868	Villeneuve-le-Roi	France
1869	Le Bourget	France
1870	Mantes-la-Ville	France
1871	Saint-Maurice	France
1872	Chilly-Mazarin	France
1873	Satun	Thailand
1874	Saint-Michel-sur-Orge	France
1875	Phetchaburi	Thailand
1876	Novate Milanese	Italy
1877	Kudrovo	Russia
1878	Yonabaru	Japan
1879	Alfafar	Spain
1880	Wasquehal	France
1881	Coudekerque-Branche	France
1882	Achères	France
1883	Fleury-les-Aubrais	France
1884	Gröbenzell	Germany
1885	Ronchin	France
1886	Monserrato	Italy
1887	Soisy-sous-Montmorency	France
1888	Trentola	Italy
1889	Saint-Cyr-l’École	France
1890	Nogent-sur-Oise	France
1891	Ischia	Italy
1892	Phichit	Thailand
1893	Montereau-faut-Yonne	France
1894	Saint-Fons	France
1895	Loei	Thailand
1896	Arese	Italy
1897	Cercola	Italy
1898	Lingolsheim	France
1899	Phetchabun	Thailand
1900	Sant’Antonio Abate	Italy
1901	Cran-Gévrier	France
1902	Fâches-Thumesnil	France
1903	Éragny	France
1904	Bry-sur-Marne	France
1905	Saint-Lambert	Canada
1906	Kitagata	Japan
1907	Moulins	France
1908	Calella	Spain
1909	Nong Bua Lamphu	Thailand
1910	Bovisio Masciago	Italy
1911	Sant Just Desvern	Spain
1912	El Astillero	Spain
1913	Malgrat de Mar	Spain
1914	Wolfratshausen	Germany
1915	Tadaoka-higashi	Japan
1916	Aci Castello	Italy
1917	Nan	Thailand
1918	Vimodrone	Italy
1919	Yasothon	Thailand
1920	Beinasco	Italy
1921	Kirkland	Canada
1922	Cattolica	Italy
1923	Westmount	Canada
1924	Phra Pradaeng	Thailand
1925	Mont-Royal	Canada
1926	Ban Rawai	Thailand
1927	Canovellas	Spain
1928	Brusciano	Italy
1929	Sant’Arpino	Italy
1930	Albal	Spain
1931	Masamagrell	Spain
1932	Casandrino	Italy
1933	Ermúa	Spain
1934	Carugate	Italy
1935	Arenys de Mar	Spain
1936	Sing Buri	Thailand
1937	La Llagosta	Spain
1938	Prachin Buri	Thailand
1939	Sainte-Marthe-sur-le-Lac	Canada
1940	Sa Kaeo	Thailand
1941	Churriana de la Vega	Spain
1942	Gines	Spain
1943	Eppelheim	Germany
1944	Sidlice	Poland
1945	Cizur Mayor	Spain
1946	Esquimalt	Canada
1947	Tak	Thailand
1948	Eilendorf	Germany
1949	Phayao	Thailand
1950	Deux-Montagnes	Canada
1951	Canet de Mar	Spain
1952	Udelnaya	Russia
1953	Neubiberg	Germany
1954	Villasanta	Italy
1955	Phrae	Thailand
1956	L’Ancienne-Lorette	Canada
1957	Mollerusa	Spain
1958	Pathum Thani	Thailand
1959	Tabernes Blanques	Spain
1960	Chojnów	Poland
1961	Ogíjares	Spain
1962	Castellanza	Italy
1963	Mongat	Spain
1964	Ranong	Thailand
1965	Baranzate	Italy
1966	Nakhon Nayok	Thailand
1967	Solaro	Italy
1968	Varedo	Italy
1969	Monte di Procida	Italy
1970	Anadyr	Russia
1971	Sukhothai	Thailand
1972	Asperg	Germany
1973	Uthai Thani	Thailand
1974	Sedaví	Spain
1975	Calvizzano	Italy
1976	Canegrate	Italy
1977	Huétor Vega	Spain
1978	Biassono	Italy
1979	Berriozar	Spain
1980	Pincourt	Canada
1981	Kronshagen	Germany
1982	Ponte San Pietro	Italy
1983	San Gregorio di Catania	Italy
1984	Ang Thong	Thailand
1985	Capodrise	Italy
1986	Nazaret	Spain
1987	Meliana	Spain
1988	Steinbach am Taunus	Germany
1989	Procida	Italy
1990	Lamphun	Thailand
1991	Chai Nat	Thailand
1992	San Marzano sul Sarno	Italy
1993	San Sebastiano al Vesuvio	Italy
1994	Cesa	Italy
1995	Portico di Caserta	Italy
1996	Sidney	Canada
1997	Casapulla	Italy
1998	Weißenthurm	Germany
1999	Sant’Agnello	Italy
2000	Torre Boldone	Italy
2001	Reinosa	Spain
2002	Lekeitio	Spain
2003	Magas	Russia
2004	Montmeló	Spain
2005	Molochnoye	Russia
2006	Trat	Thailand
2007	Rocafort	Spain
2008	Ondárroa	Spain
2009	Phangnga	Thailand
2010	Mariglianella	Italy
2011	Almácera	Spain
2012	Puebla de Farnals	Spain
2013	Recale	Italy
2014	Rovellasca	Italy
2015	Cimitile	Italy
2016	Barlassina	Italy
2017	Bois-des-Filion	Canada
2018	Roda del Ter	Spain
2019	Carnate	Italy
2020	Isola delle Femmine	Italy
2021	Neulußheim	Germany
2022	Gorle	Italy
2023	Eichwalde	Germany
2024	Albiate	Italy
2025	Almè	Italy
2026	Cájar	Spain
2027	Hampstead	Canada
2028	Mae Hong Son	Thailand
2029	Charlemagne	Canada
2030	L’Epiphanie	Canada
2031	Montréal-Ouest	Canada
2032	Bueng Kan	Thailand
2033	Oranjestad	Netherlands
2034	The Bottom	Netherlands
2035	Sejong	South Korea
2036	Yamaguchi	Japan
2037	Hongseong	South Korea
2038	Muan	South Korea
2039	Kanchanaburi	Thailand
2040	Bakjagol	South Korea
2041	Kralendijk	Netherlands
2042	Udine	Italy
2043	Kalisz	Poland
2044	Legnica	Poland
2045	Kani	Japan
2046	Chikusei	Japan
2047	Andria	Italy
2048	Roquetas de Mar	Spain
2049	Deventer	Netherlands
2050	Arezzo	Italy
2051	Zelënodol’sk	Russia
2052	Włocławek	Poland
2053	Sakata	Japan
2054	Tobolsk	Russia
2055	Sarapul	Russia
2056	Lugo	Spain
2057	Reyhanlı	Turkey
2058	Saku	Japan
2059	Votkinsk	Russia
2060	Witten	Germany
2061	Serov	Russia
2062	Las Rozas de Madrid	Spain
2063	Bafra	Turkey
2064	Brantford	Canada
2065	Hanau	Germany
2066	Cesena	Italy
2067	Ukhta	Russia
2068	Iida	Japan
2069	Leninsk-Kuznetskiy	Russia
2070	Mezhdurechensk	Russia
2071	Cáceres	Spain
2072	Kamisu	Japan
2073	Lecce	Italy
2074	Pesaro	Italy
2075	Aliağa	Turkey
2076	Lorca	Spain
2077	Sarov	Russia
2078	Solikamsk	Russia
2079	La Spezia	Italy
2080	Barletta	Italy
2081	Jaworzno	Poland
2082	San Cugat del Vallés	Spain
2083	Kanuma	Japan
2084	Gera	Germany
2085	Grudziądz	Poland
2086	Gatchina	Russia
2087	Michurinsk	Russia
2088	Alessandria	Italy
2089	Glazov	Russia
2090	Marmaris	Turkey
2091	Cape Breton	Canada
2092	Azumino	Japan
2093	Menderes	Turkey
2094	Higashi-Matsuyama	Japan
2095	Voskresensk	Russia
2096	Mikhaylovsk	Russia
2097	Iserlohn	Germany
2098	Velikiye Luki	Russia
2099	Hanamaki Onsen	Japan
2100	San Sebastián de los Reyes	Spain
2101	Lethbridge	Canada
2102	Kitakami	Japan
2103	Saint-Jean-sur-Richelieu	Canada
2104	Vaciamadrid	Spain
2105	Clarington	Canada
2106	Düren	Germany
2107	Pickering	Canada
2108	Flensburg	Germany
2109	Tübingen	Germany
2110	Imizuchō	Japan
2111	Mestre	Italy
2112	Pisa	Italy
2113	Pistoia	Italy
2114	Nanaimo	Canada
2115	Kansk	Russia
2116	Kiselëvsk	Russia
2117	Zwickau	Germany
2118	Mihara	Japan
2119	Gießen	Germany
2120	Lucca	Italy
2121	Hilversum	Netherlands
2122	Kamensk-Shakhtinskiy	Russia
2123	El Puerto de Santa María	Spain
2124	Heerlen	Netherlands
2125	Ratingen	Germany
2126	Sudbury	Canada
2127	Buzuluk	Russia
2128	Lünen	Germany
2129	Ceylanpınar	Turkey
2130	Fukuroi	Japan
2131	Brindisi	Italy
2132	Mobara	Japan
2133	Gubkin	Russia
2134	Gotenba	Japan
2135	Novotroitsk	Russia
2136	Treviso	Italy
2137	Konstanz	Germany
2138	Bugulma	Russia
2139	Shchëkino	Russia
2140	Kitakōriyamachō	Japan
2141	Mijas	Spain
2142	Ushiku	Japan
2143	North Vancouver	Canada
2144	Torrevieja	Spain
2145	Yeysk	Russia
2146	Sekimachi	Japan
2147	Brossard	Canada
2148	Chita	Japan
2149	Villingen-Schwenningen	Germany
2150	Sokcho	South Korea
2151	Chiclana de la Frontera	Spain
2152	Kineshma	Russia
2153	Torrente	Spain
2154	Jelenia Góra	Poland
2155	Moriyama	Japan
2156	Repentigny	Canada
2157	Marl	Germany
2158	Yokotemachi	Japan
2159	Tire	Turkey
2160	Dmitrov	Russia
2161	El Ejido	Spain
2162	Worms	Germany
2163	Zheleznogorsk	Russia
2164	Pontevedra	Spain
2165	Arona	Spain
2166	Chilliwack	Canada
2167	Yurga	Russia
2168	Marsala	Italy
2169	Chaykovskiy	Russia
2170	Velbert	Germany
2171	Pozzuoli	Italy
2172	Vélez-Málaga	Spain
2173	Nakatsu	Japan
2174	Ōmihachiman	Japan
2175	Muroran	Japan
2176	Kaneyama	Japan
2177	Minden	Germany
2178	Maple Ridge	Canada
2179	Grosseto	Italy
2180	Peterborough	Canada
2181	Varese	Italy
2182	Ust’-Ilimsk	Russia
2183	Azov	Russia
2184	Anapa	Russia
2185	Kimitsu	Japan
2186	Dessau-Roßlau	Germany
2187	Novouralsk	Russia
2188	Akiruno	Japan
2189	Neumünster	Germany
2190	Norderstedt	Germany
2191	Manresa	Spain
2192	Natori-shi	Japan
2193	Fiumicino	Italy
2194	Gyōda	Japan
2195	Hannō	Japan
2196	Iwamizawa	Japan
2197	Klin	Russia
2198	Ozërsk	Russia
2199	Mooka	Japan
2200	Maizuru	Japan
2201	Bamberg	Germany
2202	Delmenhorst	Germany
2203	Vyborg	Russia
2204	Valdemoro	Spain
2205	Usol’ye-Sibirskoye	Russia
2206	Kropotkin	Russia
2207	Bor	Russia
2208	Roosendaal	Netherlands
2209	Viersen	Germany
2210	Marburg	Germany
2211	Söke	Turkey
2212	Gelendzhik	Russia
2213	Chernogorsk	Russia
2214	Siedlce	Poland
2215	Nikkō	Japan
2216	Gandía	Spain
2217	Ryūgasaki	Japan
2218	Caserta	Italy
2219	Balashov	Russia
2220	Wilhelmshaven	Germany
2221	Asti	Italy
2222	Rheine	Germany
2223	Anzhero-Sudzhensk	Russia
2224	Mysłowice	Poland
2225	Daisen	Japan
2226	Troisdorf	Germany
2227	Fukuchiyama	Japan
2228	Piotrków Trybunalski	Poland
2229	Alcalá de Guadaira	Spain
2230	Shadrinsk	Russia
2231	Bayreuth	Germany
2232	Dubna	Russia
2233	Nakatsugawa	Japan
2234	Lüneburg	Germany
2235	Kawartha Lakes	Canada
2236	Tatebayashi	Japan
2237	Dorsten	Germany
2238	Gela	Italy
2239	Castrop-Rauxel	Germany
2240	Novoaltaysk	Russia
2241	Detmold	Germany
2242	Tatsunochō-tominaga	Japan
2243	Çınar	Turkey
2244	Mineral’nyye Vody	Russia
2245	Yelabuga	Russia
2246	Troitsk	Russia
2247	Konin	Poland
2248	Majadahonda	Spain
2249	Arnsberg	Germany
2250	Prince George	Canada
2251	Pavia	Italy
2252	Yurihonjō	Japan
2253	Yegoryevsk	Russia
2254	Kasama	Japan
2255	Ragusa	Italy
2256	Ostrowiec Świętokrzyski	Poland
2257	Molina de Segura	Spain
2258	Kirovo-Chepetsk	Russia
2259	Lüdenscheid	Germany
2260	Landshut	Germany
2261	Shibukawa	Japan
2262	Sault Ste. Marie	Canada
2263	Tatvan	Turkey
2264	Chapayevsk	Russia
2265	Ōtawara	Japan
2266	Cremona	Italy
2267	Vsevolozhsk	Russia
2268	Belovo	Russia
2269	Ede	Netherlands
2270	Paterna	Spain
2271	Brandenburg	Germany
2272	Benidorm	Spain
2273	Ishioka	Japan
2274	Bocholt	Germany
2275	Carpi	Italy
2276	Aschaffenburg	Germany
2277	Quartu Sant’Elena	Italy
2278	Sarnia	Canada
2279	Wood Buffalo	Canada
2280	Verkhnyaya Pyshma	Russia
2281	Rittō	Japan
2282	Châteauguay	Canada
2283	Loulé	Portugal
2284	Altamura	Italy
2285	Chekhov	Russia
2286	Imola	Italy
2287	Celle	Germany
2288	Kempten	Germany
2289	Uwajima	Japan
2290	Massa	Italy
2291	Suwałki	Poland
2292	Villanueva y Geltrú	Spain
2293	Sanlúcar de Barrameda	Spain
2294	Gniezno	Poland
2295	Saint-Jérôme	Canada
2296	Ko Samui	Thailand
2297	Fulda	Germany
2298	Minusinsk	Russia
2299	Cosenza	Italy
2300	Sosnovyy Bor	Russia
2301	Dinslaken	Germany
2302	Aalen	Germany
2303	Głogów	Poland
2304	Drummondville	Canada
2305	Lippstadt	Germany
2306	Tuymazy	Russia
2307	Przemyśl	Poland
2308	Kstovo	Russia
2309	Viterbo	Italy
2310	Trapani	Italy
2311	Ban Suan	Thailand
2312	İslahiye	Turkey
2313	Sagunto	Spain
2314	Kashima	Japan
2315	Bergen op Zoom	Netherlands
2316	Saint John	Canada
2317	Hashima	Japan
2318	Herford	Germany
2319	Oktyabrskiy	Russia
2320	Yachimata	Japan
2321	Moita	Portugal
2322	Vidnoye	Russia
2323	Pabianice	Poland
2324	Kerpen	Germany
2325	Belogorsk	Russia
2326	Saiki	Japan
2327	Rüsselsheim	Germany
2328	Ishim	Russia
2329	Caledon	Canada
2330	Gukovo	Russia
2331	Urla	Turkey
2332	Stupino	Russia
2333	Ferrol	Spain
2334	Slavyansk-na-Kubani	Russia
2335	Kungur	Russia
2336	Sindelfingen	Germany
2337	Weimar	Germany
2338	Ina	Japan
2339	Zarechnyy	Russia
2340	St. Albert	Canada
2341	Pavlovskiy Posad	Russia
2342	Plauen	Germany
2343	Leszno	Poland
2344	Beloretsk	Russia
2345	Ishimbay	Russia
2346	Neuwied	Germany
2347	Zeist	Netherlands
2348	Dormagen	Germany
2349	Rosenheim	Germany
2350	Bucak	Turkey
2351	Donskoy	Russia
2352	Neubrandenburg	Germany
2353	Vittoria	Italy
2354	Irún	Spain
2355	Pomezia	Italy
2356	Crotone	Italy
2357	Grevenbroich	Germany
2358	Asbest	Russia
2359	Póvoa de Varzim	Portugal
2360	Asahi	Japan
2361	Vigevano	Italy
2362	Klintsy	Russia
2363	Kurihara	Japan
2364	Budënnovsk	Russia
2365	Herten	Germany
2366	Granby	Canada
2367	Carrara	Italy
2368	Shiroi	Japan
2369	Nago	Japan
2370	Chełm	Poland
2371	Medicine Hat	Canada
2372	Volsk	Russia
2373	Novaya Balakhna	Russia
2374	Grande Prairie	Canada
2375	Łomża	Poland
2376	Çaldıran	Turkey
2377	Palmela	Portugal
2378	Mut	Turkey
2379	Rossosh	Russia
2380	Revda	Russia
2381	Borisoglebsk	Russia
2382	Kotlas	Russia
2383	Zelenogorsk	Russia
2384	Leninogorsk	Russia
2385	Tendō	Japan
2386	Caltanissetta	Italy
2387	Tarnowskie Góry	Poland
2388	Tuapse	Russia
2389	Figueira da Foz	Portugal
2390	Benevento	Italy
2391	Bergheim	Germany
2392	Chistopol	Russia
2393	Itoman	Japan
2394	Naro-Fominsk	Russia
2395	Viareggio	Italy
2396	Mielec	Poland
2397	Polevskoy	Russia
2398	Derik	Turkey
2399	Aisai	Japan
2400	Lysva	Russia
2401	Friedrichshafen	Germany
2402	Schwäbisch Gmünd	Germany
2403	St. Thomas	Canada
2404	Sibay	Russia
2405	Airdrie	Canada
2406	Uzunköprü	Turkey
2407	Garbsen	Germany
2408	Fano	Italy
2409	Zamora	Spain
2410	Hürth	Germany
2411	Halton Hills	Canada
2412	Acerra	Italy
2413	Stralsund	Germany
2414	Wesel	Germany
2415	Koga	Japan
2416	Bełchatów	Poland
2417	Savona	Italy
2418	Matera	Italy
2419	Greifswald	Germany
2420	Kumertau	Russia
2421	Rzhev	Russia
2422	Molfetta	Italy
2423	San Vicente del Raspeig	Spain
2424	Olbia	Italy
2425	Offenburg	Germany
2426	Sayanogorsk	Russia
2427	Bor	Turkey
2428	Langenfeld	Germany
2429	Belebey	Russia
2430	Labinsk	Russia
2431	Shimotsuke	Japan
2432	Urus-Martan	Russia
2433	Hardenberg	Netherlands
2434	Shuya	Russia
2435	Alcoy	Spain
2436	Jōsō	Japan
2437	Saint-Hyacinthe	Canada
2438	Agrigento	Italy
2439	Hua Hin	Thailand
2440	Neu-Ulm	Germany
2441	Tahara	Japan
2442	Unna	Germany
2443	Chichibu	Japan
2444	Faenza	Italy
2445	Motril	Spain
2446	Lac-Brome	Canada
2447	Cerignola	Italy
2448	Kaş	Turkey
2449	Ávila	Spain
2450	Felgueiras	Portugal
2451	Göppingen	Germany
2452	Moncalieri	Italy
2453	Euskirchen	Germany
2454	Barneveld	Netherlands
2455	Frankfurt (Oder)	Germany
2456	Fredericton	Canada
2457	Heerhugowaard	Netherlands
2458	Roermond	Netherlands
2459	Hameln	Germany
2460	Będzin	Poland
2461	Biała Podlaska	Poland
2462	Linares	Spain
2463	Khlong Luang	Thailand
2464	Sankt Augustin	Germany
2465	Stolberg	Germany
2466	Tivoli	Italy
2467	Foligno	Italy
2468	Görlitz	Germany
2469	Paços de Ferreira	Portugal
2470	Eschweiler	Germany
2471	Langenhagen	Germany
2472	Manfredonia	Italy
2473	Meerbusch	Germany
2474	Bagheria	Italy
2475	Cuneo	Italy
2476	Waiblingen	Germany
2477	Trani	Italy
2478	Hassa	Turkey
2479	Oosterhout	Netherlands
2480	Blainville	Canada
2481	Bisceglie	Italy
2482	Portimão	Portugal
2483	Den Helder	Netherlands
2484	Avellino	Italy
2485	Schweinfurt	Germany
2486	Baden-Baden	Germany
2487	Hoogeveen	Netherlands
2488	San Remo	Italy
2489	Aurora	Canada
2490	Bitonto	Italy
2491	Hattingen	Germany
2492	Bad Homburg	Germany
2493	Pombal	Portugal
2494	Pulheim	Germany
2495	Ostrołęka	Poland
2496	Lingen	Germany
2497	Modica	Italy
2498	Teramo	Italy
2499	Cuenca	Spain
2500	Bad Salzuflen	Germany
2501	Cava de’ Tirreni	Italy
2502	Siena	Italy
2503	Huesca	Spain
2504	Pinto	Spain
2505	Kampen	Netherlands
2506	Elda	Spain
2507	Nordhorn	Germany
2508	Marco de Canavezes	Portugal
2509	Wetzlar	Germany
2510	Velletri	Italy
2511	Frechen	Germany
2512	Neustadt	Germany
2513	Anzio	Italy
2514	Acireale	Italy
2515	San Bartolomé	Spain
2516	Passau	Germany
2517	San Severo	Italy
2518	Torrelavega	Spain
2519	Ahlen	Germany
2520	Wolfenbüttel	Germany
2521	Pordenone	Italy
2522	Ibbenbüren	Germany
2523	Kleve	Germany
2524	Civitavecchia	Italy
2525	Welland	Canada
2526	Villareal	Spain
2527	Colmenar Viejo	Spain
2528	Caldas da Rainha	Portugal
2529	Battipaglia	Italy
2530	Covilhã	Portugal
2531	Bad Kreuznach	Germany
2532	Pola de Siero	Spain
2533	Woerden	Netherlands
2534	Mazara del Vallo	Italy
2535	Chieti	Italy
2536	Rovigo	Italy
2537	Speyer	Germany
2538	North Bay	Canada
2539	Granadilla de Abona	Spain
2540	Scandicci	Italy
2541	Böblingen	Germany
2542	Montijo	Portugal
2543	Willich	Germany
2544	Misterbianco	Italy
2545	Gummersbach	Germany
2546	Ravensburg	Germany
2547	Goslar	Germany
2548	Utrera	Spain
2549	Fafe	Portugal
2550	Puławy	Poland
2551	Beloeil	Canada
2552	Houten	Netherlands
2553	Belleville	Canada
2554	Kulu	Turkey
2555	Rastatt	Germany
2556	Sittard	Netherlands
2557	Starogard Gdański	Poland
2558	Lörrach	Germany
2559	Rincón de la Victoria	Spain
2560	Mirabel	Canada
2561	Amora	Portugal
2562	Peine	Germany
2563	Emden	Germany
2564	Ardea	Italy
2565	Rivoli	Italy
2566	Erftstadt	Germany
2567	Mantova	Italy
2568	Sesto Fiorentino	Italy
2569	Shawinigan	Canada
2570	Heidenheim	Germany
2571	Nettuno	Italy
2572	Bergkamen	Germany
2573	Sesimbra	Portugal
2574	Leonberg	Germany
2575	IJmuiden	Netherlands
2576	Chioggia	Italy
2577	Adeje	Spain
2578	Bad Oeynhausen	Germany
2579	Empoli	Italy
2580	Monopoli	Italy
2581	Lecco	Italy
2582	San Benedetto del Tronto	Italy
2583	Freising	Germany
2584	Starachowice	Poland
2585	Ascoli Piceno	Italy
2586	Rheda-Wiedenbrück	Germany
2587	Martina Franca	Italy
2588	Bornheim	Germany
2589	Brandon	Canada
2590	Dachau	Germany
2591	Kozlu	Turkey
2592	Gronau	Germany
2593	Settimo Torinese	Italy
2594	Rimouski	Canada
2595	Cuxhaven	Germany
2596	Gavá	Spain
2597	Rumia	Poland
2598	Harderwijk	Netherlands
2599	Corato	Italy
2600	Kołobrzeg	Poland
2601	Zutphen	Netherlands
2602	Alsdorf	Germany
2603	Straubing	Germany
2604	Tarnobrzeg	Poland
2605	Campi Bisenzio	Italy
2606	Beypazarı	Turkey
2607	Finike	Turkey
2608	Paterno	Italy
2609	Vila Verde	Portugal
2610	Ridderkerk	Netherlands
2611	Skierniewice	Poland
2612	Soest	Germany
2613	Stade	Germany
2614	Lousada	Portugal
2615	Herzogenrath	Germany
2616	Rieti	Italy
2617	Kutno	Poland
2618	Ban Plai Bua Phatthana	Thailand
2619	Fellbach	Germany
2620	Ban Bang Mae Nang	Thailand
2621	Oberursel	Germany
2622	Puertollano	Spain
2623	Landau	Germany
2624	Schwerte	Germany
2625	Nysa	Poland
2626	Neunkirchen	Germany
2627	Frosinone	Italy
2628	Filderstadt	Germany
2629	Dülmen	Germany
2630	Vercelli	Italy
2631	Hof	Germany
2632	Veldhoven	Netherlands
2633	Melle	Germany
2634	Terracina	Italy
2635	Cornwall	Canada
2636	Zwijndrecht	Netherlands
2637	Gotha	Germany
2638	Capannori	Italy
2639	Lodi	Italy
2640	Marino	Italy
2641	Bünde	Germany
2642	Wittenberg	Germany
2643	Weinheim	Germany
2644	Ourém	Portugal
2645	Erkrath	Germany
2646	Haymana	Turkey
2647	Rodgau	Germany
2648	Stouffville	Canada
2649	Cascina	Italy
2650	Olhão	Portugal
2651	Albstadt	Germany
2652	Brühl	Germany
2653	Alcamo	Italy
2654	Georgina	Canada
2655	Alcira	Spain
2656	Victoriaville	Canada
2657	Dębica	Poland
2658	Biella	Italy
2659	Bruchsal	Germany
2660	Senigallia	Italy
2661	Yatağan	Turkey
2662	Kaufbeuren	Germany
2663	Medemblik	Netherlands
2664	Falkensee	Germany
2665	Singhanakhon	Thailand
2666	Oranienburg	Germany
2667	Manacor	Spain
2668	Ban Pet	Thailand
2669	Seferhisar	Turkey
2670	Vernon	Canada
2671	Kaarst	Germany
2672	Etten-Leur	Netherlands
2673	Vlissingen	Netherlands
2674	Bietigheim-Bissingen	Germany
2675	Memmingen	Germany
2676	Neustadt am Rübenberge	Germany
2677	Bassano del Grappa	Italy
2678	Lehrte	Germany
2679	Rheden	Netherlands
2680	Dikili	Turkey
2681	Zevenaar	Netherlands
2682	Alghero	Italy
2683	Saint-Eustache	Canada
2684	Kamen	Germany
2685	Gravina in Puglia	Italy
2686	Erkelenz	Germany
2687	Of	Turkey
2688	Otwock	Poland
2689	Santa Cruz	Portugal
2690	Çeşme	Turkey
2691	Ponte de Lima	Portugal
2692	Venray	Netherlands
2693	Noordwijk	Netherlands
2694	Quinte West	Canada
2695	Wismar	Germany
2696	Denia	Spain
2697	Germering	Germany
2698	Kemer	Turkey
2699	Civitanova Marche	Italy
2700	Siegburg	Germany
2701	Tiel	Netherlands
2702	Ciechanów	Poland
2703	Huizen	Netherlands
2704	Albano Laziale	Italy
2705	Nettetal	Germany
2706	Sieradz	Poland
2707	Gifhorn	Germany
2708	Dreieich	Germany
2709	Lucena	Spain
2710	Borken	Germany
2711	Amberg	Germany
2712	Eisenach	Germany
2713	Avezzano	Italy
2714	Laatzen	Germany
2715	Charlottetown	Canada
2716	Ban Na Pa	Thailand
2717	Mikołów	Poland
2718	Mascouche	Canada
2719	West Vancouver	Canada
2720	Salaberry-de-Valleyfield	Canada
2721	Heinsberg	Germany
2722	Uden	Netherlands
2723	La Orotava	Spain
2724	Rouyn-Noranda	Canada
2725	San Donà di Piave	Italy
2726	Imperia	Italy
2727	Homburg	Germany
2728	Ansbach	Germany
2729	Macerata	Italy
2730	Aurich	Germany
2731	Nordhausen	Germany
2732	Monterotondo	Italy
2733	Coburg	Germany
2734	Su-ngai Kolok	Thailand
2735	Barcellona-Pozzo di Gotto	Italy
2736	Merano	Italy
2737	Nürtingen	Germany
2738	Puerto del Rosario	Spain
2739	Wunstorf	Germany
2740	Puerto Real	Spain
2741	Seevetal	Germany
2742	Sassuolo	Italy
2743	Kwidzyn	Poland
2744	Chojnice	Poland
2745	Schwabach	Germany
2746	Timmins	Canada
2747	Königswinter	Germany
2748	Freiberg	Germany
2749	Świnoujście	Poland
2750	Yakacık	Turkey
2751	Alhaurín de la Torre	Spain
2752	Cantù	Italy
2753	Sorel-Tracy	Canada
2754	Ladispoli	Italy
2755	Nowa Sól	Poland
2756	Wijchen	Netherlands
2757	Kirchheim unter Teck	Germany
2758	Erzin	Turkey
2759	New Tecumseth	Canada
2760	Leinfelden-Echterdingen	Germany
2761	Antequera	Spain
2762	Chaves	Portugal
2763	Hellevoetsluis	Netherlands
2764	Bensheim	Germany
2765	Bolesławiec	Poland
2766	Marcianise	Italy
2767	Lemgo	Germany
2768	Eberswalde	Germany
2769	Pirmasens	Germany
2770	Ostfildern	Germany
2771	Maarssen	Netherlands
2772	Dronten	Netherlands
2773	Woodstock	Canada
2774	Ílhavo	Portugal
2775	Schwäbisch Hall	Germany
2776	Tomar	Portugal
2777	Weißenfels	Germany
2778	Boucherville	Canada
2779	Sciacca	Italy
2780	Corigliano Calabro	Italy
2781	Buxtehude	Germany
2782	Bayındır	Turkey
2783	Heemskerk	Netherlands
2784	Rovereto	Italy
2785	Iesi	Italy
2786	Hückelhoven	Germany
2787	San Fernando de Henares	Spain
2788	Halberstadt	Germany
2789	Maintal	Germany
2790	Neumarkt	Germany
2791	Hofheim	Germany
2792	Freital	Germany
2793	Löhne	Germany
2794	Eboli	Italy
2795	Oświęcim	Poland
2796	Schorndorf	Germany
2797	Ban Bang Khu Lat	Thailand
2798	Maddaloni	Italy
2799	Fondi	Italy
2800	Plasencia	Spain
2801	Ettlingen	Germany
2802	Fasano	Italy
2803	Völklingen	Germany
2804	Écija	Spain
2805	Lloret de Mar	Spain
2806	Würselen	Germany
2807	Buchholz in der Nordheide	Germany
2808	Mettmann	Germany
2809	Sama	Spain
2810	Narón	Spain
2811	Santa Eulalia del Río	Spain
2812	Stendal	Germany
2813	Trofa	Portugal
2814	Ahaus	Germany
2815	Vendrell	Spain
2816	Landgraaf	Netherlands
2817	Los Palacios y Villafranca	Spain
2818	Mission	Canada
2819	Żary	Poland
2820	Jarosław	Poland
2821	Veghel	Netherlands
2822	Venlo	Netherlands
2823	Moncada	Spain
2824	Villagarcía de Arosa	Spain
2825	Teijlingen	Netherlands
2826	Vaudreuil-Dorion	Canada
2827	Goes	Netherlands
2828	Geleen	Netherlands
2829	Marratxi	Spain
2830	Lluchmayor	Spain
2831	Emirdağ	Turkey
2832	Mieres	Spain
2833	Chrzanów	Poland
2834	Oleiros	Spain
2835	Lębork	Poland
2836	Don Benito	Spain
2837	Tudela	Spain
2838	Silves	Portugal
2839	Olot	Spain
2840	Villajoyosa	Spain
2841	Gorinchem	Netherlands
2842	Torres Novas	Portugal
2843	Brant	Canada
2844	Torre-Pacheco	Spain
2845	Andújar	Spain
2846	Lakeshore	Canada
2847	Innisfil	Canada
2848	Selçuk	Turkey
2849	Castricum	Netherlands
2850	Jasło	Poland
2851	Tomelloso	Spain
2852	Ban Mueang Na Tai	Thailand
2853	Miranda de Ebro	Spain
2854	Hellendoorn	Netherlands
2855	Onteniente	Spain
2856	Prince Albert	Canada
2857	Águilas	Spain
2858	Pak Chong	Thailand
2859	Burriana	Spain
2860	Teruel	Spain
2861	Cambrils	Spain
2862	Cieszyn	Poland
2863	Gürpınar	Turkey
2864	Câmara de Lobos	Portugal
2865	Kilimli	Turkey
2866	Cha-am	Thailand
2867	Kraśnik	Poland
2868	Yayladağı	Turkey
2869	Angra do Heroísmo	Portugal
2870	Cieza	Spain
2871	Langford Station	Canada
2872	Bradford West Gwillimbury	Canada
2873	Campbell River	Canada
2874	Iława	Poland
2875	Dzierżoniów	Poland
2876	Ban Ang Sila	Thailand
2877	Phra Phutthabat	Thailand
2878	IJsselstein	Netherlands
2879	Esposende	Portugal
2880	Villena	Spain
2881	Inca	Spain
2882	Nowy Targ	Poland
2883	Spruce Grove	Canada
2884	Almendralejo	Spain
2885	Sneek	Netherlands
2886	Tynaarlo	Netherlands
2887	Moose Jaw	Canada
2888	Ban Pak Phun	Thailand
2889	Santa Pola	Spain
2890	Ronda	Spain
2891	Penticton	Canada
2892	Belen	Turkey
2893	Ayvacık	Turkey
2894	Tortosa	Spain
2895	San Javier	Spain
2896	Port Moody	Canada
2897	Aranda de Duero	Spain
2898	Police	Poland
2899	Zgorzelec	Poland
2900	Oldenzaal	Netherlands
2901	Espinho	Portugal
2902	Arteijo	Spain
2903	Sarıkaya	Turkey
2904	Leamington	Canada
2905	Arroyomolinos	Spain
2906	Mazarrón	Spain
2907	Rosmalen	Netherlands
2908	Manises	Spain
2909	East Kelowna	Canada
2910	Aalsmeer	Netherlands
2911	Totana	Spain
2912	Deurne	Netherlands
2913	Castro-Urdiales	Spain
2914	Grodzisk Mazowiecki	Poland
2915	Ribeira Grande	Portugal
2916	Lonneker	Netherlands
2917	Vall de Uxó	Spain
2918	San Pedro de Ribas	Spain
2919	Val-d’Or	Canada
2920	Owen Sound	Canada
2921	Chum Phae	Thailand
2922	San Roque	Spain
2923	Níjar	Spain
2924	Łowicz	Poland
2925	Mae Sot	Thailand
2926	Carballo	Spain
2927	Ban Chang	Thailand
2928	Stratford	Canada
2929	Bielsk Podlaski	Poland
2930	Valkenswaard	Netherlands
2931	Alacuás	Spain
2932	Lloydminster	Canada
2933	Coria del Río	Spain
2934	Pointe-Claire	Canada
2935	Łuków	Poland
2936	Boxtel	Netherlands
2937	Lagos	Portugal
2938	Culleredo	Spain
2939	Orillia	Canada
2940	Diemen	Netherlands
2941	Bochnia	Poland
2942	Bielawa	Poland
2943	San Andrés del Rabanedo	Spain
2944	Alma	Canada
2945	Arcos de la Frontera	Spain
2946	Alcázar de San Juan	Spain
2947	Orangeville	Canada
2948	Fort Erie	Canada
2949	Puerto de la Cruz	Spain
2950	Mława	Poland
2951	Thung Song	Thailand
2952	Leusden	Netherlands
2953	Salou	Spain
2954	Galdácano	Spain
2955	Valdepeñas	Spain
2956	Augustów	Poland
2957	Sitges	Spain
2958	Bergen	Netherlands
2959	LaSalle	Canada
2960	Brodnica	Poland
2961	Puente-Genil	Spain
2962	Sainte-Julie	Canada
2963	Heesch	Netherlands
2964	Leduc	Canada
2965	Kınık	Turkey
2966	Oosterend	Netherlands
2967	Mahón	Spain
2968	Crevillente	Spain
2969	Redondela	Spain
2970	Brunssum	Netherlands
2971	North Cowichan	Canada
2972	Rota	Spain
2973	Sint-Michielsgestel	Netherlands
2974	Culemborg	Netherlands
2975	Campello	Spain
2976	Boxmeer	Netherlands
2977	Anadia	Portugal
2978	Vinaroz	Spain
2979	Ban Phai	Thailand
2980	Chambly	Canada
2981	Winterswijk	Netherlands
2982	Benavente	Portugal
2983	Langedijk	Netherlands
2984	Luboń	Poland
2985	Krotoszyn	Poland
2986	Candelaria	Spain
2987	Calafell	Spain
2988	Éibar	Spain
2989	Okotoks	Canada
2990	Heerenveen	Netherlands
2991	Biłgoraj	Poland
2992	Tha Yang	Thailand
2993	Sept-Îles	Canada
2994	Gorlice	Poland
2995	Jávea	Spain
2996	Warin Chamrap	Thailand
2997	Kłodzko	Poland
2998	Centre Wellington	Canada
2999	Nallıhan	Turkey
3000	Lepe	Spain
3001	Algemesí	Spain
3002	Chíos	Greece
3003	Benicarló	Spain
3004	Sueca	Spain
3005	Zaltbommel	Netherlands
3006	Zakopane	Poland
3007	Havran	Turkey
3008	Morón de la Frontera	Spain
3009	Lebrija	Spain
3010	Santa Perpetua de Moguda	Spain
3011	Molíns de Rey	Spain
3012	Almazora	Spain
3013	İpsala	Turkey
3014	Kathu	Thailand
3015	Drimmelen	Netherlands
3016	Saint-Constant	Canada
3017	Ban Phonla Krang	Thailand
3018	Vícar	Spain
3019	Grimsby	Canada
3020	La Oliva	Spain
3021	Aalten	Netherlands
3022	Cangas	Spain
3023	Estarreja	Portugal
3024	Santa Eugenia	Spain
3025	Ermelo	Netherlands
3026	Werkendam	Netherlands
3027	San Pedro del Pinatar	Spain
3028	Wałcz	Poland
3029	Pınarbaşı	Turkey
3030	Cártama	Spain
3031	Dongen	Netherlands
3032	Boisbriand	Canada
3033	Brzozów	Poland
3034	Lamego	Portugal
3035	Rijssen	Netherlands
3036	Sliedrecht	Netherlands
3037	Betong	Thailand
3038	Maçka	Turkey
3039	Wassenaar	Netherlands
3040	Paracuellos de Jarama	Spain
3041	Oisterwijk	Netherlands
3042	Beuningen	Netherlands
3043	Jarocin	Poland
3044	Cuart de Poblet	Spain
3045	Kluczbork	Poland
3046	Montemor-o-Velho	Portugal
3047	Elefsína	Greece
3048	Almuñécar	Spain
3049	Świecie	Poland
3050	Tavira	Portugal
3051	Conception Bay South	Canada
3052	Lice	Turkey
3053	Muchamiel	Spain
3054	Saint-Bruno-de-Montarville	Canada
3055	Odemira	Portugal
3056	Novelda	Spain
3057	Stein	Netherlands
3058	Duiven	Netherlands
3059	Renedo	Spain
3060	Jumilla	Spain
3061	Salamína	Greece
3062	Marmara Ereğlisi	Turkey
3063	Wągrowiec	Poland
3064	Cochrane	Canada
3065	Hasköy	Turkey
3066	Thetford Mines	Canada
3067	Veenoord	Netherlands
3068	Courtenay	Canada
3069	Oud-Beijerland	Netherlands
3070	Skawina	Poland
3071	Albergaria-a-Velha	Portugal
3072	Cuijk	Netherlands
3073	Magog	Canada
3074	Kościerzyna	Poland
3075	Whitehorse	Canada
3076	Białogard	Poland
3077	Sandomierz	Poland
3078	Woolwich	Canada
3079	Vizela	Portugal
3080	Takhli	Thailand
3081	Heiloo	Netherlands
3082	Hoensbroek	Netherlands
3083	Clarence-Rockland	Canada
3084	Pýrgos	Greece
3085	Putten	Netherlands
3086	Porto de Mós	Portugal
3087	Goirle	Netherlands
3088	Bieruń Stary	Poland
3089	Schijndel	Netherlands
3090	Fort Saskatchewan	Canada
3091	Sattahip	Thailand
3092	Borne	Netherlands
3093	Ban Phru	Thailand
3094	Konstancin-Jeziorna	Poland
3095	East Gwillimbury	Canada
3096	Jawor	Poland
3097	Si Racha	Thailand
3098	Mirandela	Portugal
3099	Oldebroek	Netherlands
3100	Ostrów Mazowiecka	Poland
3101	Lincoln	Canada
3102	Loon op Zand	Netherlands
3103	Ayancık	Turkey
3104	Lubartów	Poland
3105	Mégara	Greece
3106	Caniço	Portugal
3107	Ban Bang Rin	Thailand
3108	La Prairie	Canada
3109	Oliveira do Bairro	Portugal
3110	Oud-Zuilen	Netherlands
3111	Koło	Poland
3112	Tecumseh	Canada
3113	Kilkís	Greece
3114	Wichian Buri	Thailand
3115	Grajewo	Poland
3116	Vale de Cambra	Portugal
3117	Steenwijk	Netherlands
3118	Mount Pearl Park	Canada
3119	Thebes	Greece
3120	Arcos de Valdevez	Portugal
3121	Działdowo	Poland
3122	Losser	Netherlands
3123	Beek en Donk	Netherlands
3124	Lefkáda	Greece
3125	Goleniów	Poland
3126	Zeewolde	Netherlands
3127	Nieuwerkerk aan den IJssel	Netherlands
3128	Ban Piang Luang	Thailand
3129	Geertruidenberg	Netherlands
3130	Łęczna	Poland
3131	Świedbodzin	Poland
3132	Woensdrecht	Netherlands
3133	Łaziska Górne	Poland
3134	Póvoa de Lanhoso	Portugal
3135	Opoczno	Poland
3136	Wieliczka	Poland
3137	Amherstburg	Canada
3138	Chełmno	Poland
3139	Poortugaal	Netherlands
3140	Azambuja	Portugal
3141	Brockville	Canada
3142	Collingwood	Canada
3143	Zundert	Netherlands
3144	Gökçebey	Turkey
3145	Yenice	Turkey
3146	Entroncamento	Portugal
3147	Leerdam	Netherlands
3148	Scugog	Canada
3149	Nang Rong	Thailand
3150	Hajnówka	Poland
3151	Kingsville	Canada
3152	Áno Sýros	Greece
3153	Baie-Comeau	Canada
3154	Livadeiá	Greece
3155	Wang Nam Yen	Thailand
3156	Prudnik	Poland
3157	Tubbergen	Netherlands
3158	Paradise	Canada
3159	Gryfino	Poland
3160	Alfena	Portugal
3161	Rio Maior	Portugal
3162	Sadao	Thailand
3163	Uxbridge	Canada
3164	Praia da Vitória	Portugal
3165	Essa	Canada
3166	Winschoten	Netherlands
3167	Candiac	Canada
3168	Oro-Medonte	Canada
3169	Varennes	Canada
3170	Mae Sai	Thailand
3171	Urk	Netherlands
3172	Strathroy-Caradoc	Canada
3173	Na Klang	Thailand
3174	Elvas	Portugal
3175	Cranendonck	Netherlands
3176	Arhavi	Turkey
3177	Wasaga Beach	Canada
3178	Ban Tha Pha	Thailand
3179	Baião	Portugal
3180	Pak Phanang	Thailand
3181	New Glasgow	Canada
3182	Chodzież	Poland
3183	Wilmot	Canada
3184	Pleszew	Poland
3185	Cinfães	Portugal
3186	Gostyń	Poland
3187	Rhenen	Netherlands
3188	Edam	Netherlands
3189	Bladel	Netherlands
3190	Essex	Canada
3191	Kęty	Poland
3192	Celorico de Basto	Portugal
3193	Vriezenveen	Netherlands
3194	Wisch	Netherlands
3195	Toprakkale	Turkey
3196	Fort St. John	Canada
3197	Tegelen	Netherlands
3198	L’Assomption	Canada
3199	Ban Tha Kham	Thailand
3200	Dęblin	Poland
3201	Ban Na San	Thailand
3202	Saint-Lazare	Canada
3203	Chestermere	Canada
3204	Huntsville	Canada
3205	Corner Brook	Canada
3206	Helden	Netherlands
3207	Nakło nad Notecią	Poland
3208	Riverview	Canada
3209	Lloydminster	Canada
3210	Ban Bueng	Thailand
3211	Joliette	Canada
3212	Meerssen	Netherlands
3213	Jasien	Poland
3214	Yellowknife	Canada
3215	Someren	Netherlands
3216	Kos	Greece
3217	Squamish	Canada
3218	Lichtenvoorde	Netherlands
3219	Echt	Netherlands
3220	Kantharalak	Thailand
3221	Vila Real de Santo António	Portugal
3222	Łańcut	Poland
3223	Rivière-du-Loup	Canada
3224	Cobourg	Canada
3225	Krasnystaw	Poland
3226	Pułtusk	Poland
3227	Eersel	Netherlands
3228	Ban Mae Hia Nai	Thailand
3229	Monção	Portugal
3230	Soure	Portugal
3231	Groesbeek	Netherlands
3232	Cranbrook	Canada
3233	Druten	Netherlands
3234	Tak Bai	Thailand
3235	Klaeng	Thailand
3236	Amares	Portugal
3237	Beaconsfield	Canada
3238	Gostynin	Poland
3239	Ban Na Yang	Thailand
3240	Préveza	Greece
3241	Rawa Mazowiecka	Poland
3242	Zuidhorn	Netherlands
3243	Springwater	Canada
3244	Dorval	Canada
3245	Hardinxveld-Giessendam	Netherlands
3246	Drunen	Netherlands
3247	Bemmel	Netherlands
3248	Oirschot	Netherlands
3249	Thorold	Canada
3250	Ban Mai	Thailand
3251	Camrose	Canada
3252	Ban Thum	Thailand
3253	Bergeijk	Netherlands
3254	South Frontenac	Canada
3255	Orestiáda	Greece
3256	Pitt Meadows	Canada
3257	Międzyrzecz	Poland
3258	Tha Bo	Thailand
3259	Sam Phran	Thailand
3260	Kostrzyn nad Odrą	Poland
3261	Elst	Netherlands
3262	Kobyłka	Poland
3263	Bodegraven	Netherlands
3264	Garwolin	Poland
3265	Braniewo	Poland
3266	Middelharnis	Netherlands
3267	Sikhio	Thailand
3268	Port Colborne	Canada
3269	Quispamsis	Canada
3270	San Kamphaeng	Thailand
3271	Łask	Poland
3272	Mont-Saint-Hilaire	Canada
3273	Sint-Oedenrode	Netherlands
3274	Bathurst	Canada
3275	Saint-Augustin-de-Desmaures	Canada
3276	Oak Bay	Canada
3277	Rypin	Poland
3278	Waalre	Netherlands
3279	Oborniki	Poland
3280	Międzyrzec Podlaski	Poland
3281	Ustka	Poland
3282	Złotoryja	Poland
3283	Ommen	Netherlands
3284	Naarden	Netherlands
3285	Ban Song	Thailand
3286	Ban Pong	Thailand
3287	Lousã	Portugal
3288	Salmon Arm	Canada
3289	Alcochete	Portugal
3290	Port Alberni	Canada
3291	Ban Phe	Thailand
3292	Milanówek	Poland
3293	Miramichi	Canada
3294	Son en Breugel	Netherlands
3295	Niagara-on-the-Lake	Canada
3296	Saint-Lin--Laurentides	Canada
3297	Montemor-o-Novo	Portugal
3298	Gennep	Netherlands
3299	Beaumont	Canada
3300	Zandvoort	Netherlands
3301	Rattaphum	Thailand
3302	Ban Thung Tam Sao	Thailand
3303	Łęczyca	Poland
3304	Peso da Régua	Portugal
3305	Sawankhalok	Thailand
3306	Middlesex Centre	Canada
3307	Inverness	Canada
3308	Kozienice	Poland
3309	Condeixa-a-Nova	Portugal
3310	Stony Plain	Canada
3311	Petawawa	Canada
3312	Brzesko	Poland
3313	Gubin	Poland
3314	Lam Luk Ka	Thailand
3315	Staphorst	Netherlands
3316	Pelham	Canada
3317	Ban Cho Ho	Thailand
3318	Selwyn	Canada
3319	Bytów	Poland
3320	Osowa	Poland
3321	Spárti	Greece
3322	Grójec	Poland
3323	Loyalist	Canada
3324	Krapkowice	Poland
3325	Pran Buri	Thailand
3326	Didam	Netherlands
3327	Asten	Netherlands
3328	Fındıklı	Turkey
3329	São Pedro do Sul	Portugal
3330	Heumen	Netherlands
3331	Midland	Canada
3332	Colwood	Canada
3333	Westervoort	Netherlands
3334	Strzegom	Poland
3335	Central Saanich	Canada
3336	Cabeceiras de Basto	Portugal
3337	Sainte-Catherine	Canada
3338	Port Hope	Canada
3339	Ponte de Sôr	Portugal
3340	Saint-Basile-le-Grand	Canada
3341	Chełmża	Poland
3342	Beek	Netherlands
3343	Gryfice	Poland
3344	Swift Current	Canada
3345	Olecko	Poland
3346	Edmundston	Canada
3347	Quarteira	Portugal
3348	Bayat	Turkey
3349	Ban Lam Narai	Thailand
3350	Huissen	Netherlands
3351	Russell	Canada
3352	Harenkarspel	Netherlands
3353	Harlingen	Netherlands
3354	North Grenville	Canada
3355	Eibergen	Netherlands
3356	Vlijmen	Netherlands
3357	Przeworsk	Poland
3358	Divriği	Turkey
3359	Bang Phae	Thailand
3360	Yorkton	Canada
3361	Ustroń	Poland
3362	Aranyaprathet	Thailand
3363	Thérmi	Greece
3364	Chai Prakan	Thailand
3365	Zevenbergen	Netherlands
3366	Tracadie	Canada
3367	Sassenheim	Netherlands
3368	Ban Dung	Thailand
3369	Bracebridge	Canada
3370	Boskoop	Netherlands
3371	Sertã	Portugal
3372	Greater Napanee	Canada
3373	Tillsonburg	Canada
3374	Steinbach	Canada
3375	Macedo de Cavaleiros	Portugal
3376	Si Satchanalai	Thailand
3377	Hanover	Canada
3378	Terrace	Canada
3379	Serpa	Portugal
3380	Jędrzejów	Poland
3381	Ban Na Kham	Thailand
3382	Bunnik	Netherlands
3383	Ban Duea	Thailand
3384	Siemiatycze	Poland
3385	Khao Yoi	Thailand
3386	Limanowa	Poland
3387	Hilvarenbeek	Netherlands
3388	Taphan Hin	Thailand
3389	Jelcz-Laskowice	Poland
3390	Głuchołazy	Poland
3391	Thoen	Thailand
3392	Castro Daire	Portugal
3393	Den Ham	Netherlands
3394	Springfield	Canada
3395	Nazaré	Portugal
3396	Penacova	Portugal
3397	IJsselmuiden	Netherlands
3398	Choszczno	Poland
3399	Moura	Portugal
3400	Gaspé	Canada
3401	Ban Bang Muang	Thailand
3402	Sultandağı	Turkey
3403	Kenora	Canada
3404	Horta	Portugal
3405	Alexándreia	Greece
3406	Breukelen	Netherlands
3407	Człuchów	Poland
3408	Cold Lake	Canada
3409	Paianía	Greece
3410	Gafanha da Nazaré	Portugal
3411	Phra Samut Chedi	Thailand
3412	Grodzisk Wielkopolski	Poland
3413	Sai Buri	Thailand
3414	Summerside	Canada
3415	Comox	Canada
3416	Sylvan Lake	Canada
3417	Çiçekdağı	Turkey
3418	Bang Racham	Thailand
3419	Wschowa	Poland
3420	Raamsdonk	Netherlands
3421	Ban Kaeng	Thailand
3422	Lopik	Netherlands
3423	Darłowo	Poland
3424	Náfplio	Greece
3425	Cadaval	Portugal
3426	Néa Alikarnassós	Greece
3427	Scheemda	Netherlands
3428	West Lincoln	Canada
3429	Ulchin	South Korea
3430	Matane	Canada
3431	Brooks	Canada
3432	Gorssel	Netherlands
3433	Haaren	Netherlands
3434	Sainte-Anne-des-Plaines	Canada
3435	Pazar	Turkey
3436	Det Udom	Thailand
3437	Pak Thong Chai	Thailand
3438	West Nipissing / Nipissing Ouest	Canada
3439	Estremoz	Portugal
3440	Bua Yai	Thailand
3441	Ban Mae Kaluang	Thailand
3442	Sines	Portugal
3443	Rosemère	Canada
3444	Lubsko	Poland
3445	Mistassini	Canada
3446	Valença	Portugal
3447	Golub-Dobrzyń	Poland
3448	Maasbracht	Netherlands
3449	Beilen	Netherlands
3450	Náfpaktos	Greece
3451	Uitgeest	Netherlands
3452	Grand Falls	Canada
3453	Clearview	Canada
3454	Nelas	Portugal
3455	Eynesil	Turkey
3456	Bergschenhoek	Netherlands
3457	Gouveia	Portugal
3458	St. Clair	Canada
3459	Aleksandrów Kujawski	Poland
3460	Canmore	Canada
3461	Ban Bang Non	Thailand
3462	Beesel	Netherlands
3463	Ban Bang Sai	Thailand
3464	Nidzica	Poland
3465	Valburg	Netherlands
3466	North Battleford	Canada
3467	Pembroke	Canada
3468	Ban Tha Luang Lang	Thailand
3469	Arcozelo	Portugal
3470	Włodawa	Poland
3471	Mont-Laurier	Canada
3472	Gołdap	Poland
3473	Strathmore	Canada
3474	Schoonhoven	Netherlands
3475	Saugeen Shores	Canada
3476	Margraten	Netherlands
3477	Winsum	Netherlands
3478	Thompson	Canada
3479	Lavaltrie	Canada
3480	Głubczyce	Poland
3481	Kastoriá	Greece
3482	Wolsztyn	Poland
3483	High River	Canada
3484	Arruda dos Vinhos	Portugal
3485	Reeuwijk	Netherlands
3486	Halsteren	Netherlands
3487	Dok Kham Tai	Thailand
3488	Woudenberg	Netherlands
3489	Ban Chorakhe Samphan	Thailand
3490	Maasbree	Netherlands
3491	Severn	Canada
3492	Schinnen	Netherlands
3493	Mijdrecht	Netherlands
3494	Gmunden	Austria
3495	Ribeira Brava	Portugal
3496	Sainte-Sophie	Canada
3497	Ubach over Worms	Netherlands
3498	Nong Khae	Thailand
3499	Saint-Charles-Borromée	Canada
3500	Portage La Prairie	Canada
3501	Trzebnica	Poland
3502	Bergen	Netherlands
3503	Ban Tat	Thailand
3504	Odoorn	Netherlands
3505	Vila Pouca de Aguiar	Portugal
3506	Ansião	Portugal
3507	Miranda do Corvo	Portugal
3508	Thames Centre	Canada
3509	Mississippi Mills	Canada
3510	Powell River	Canada
3511	Song Phi Nong	Thailand
3512	Vieira do Minho	Portugal
3513	Alcácer do Sal	Portugal
3514	Huai Yot	Thailand
3515	Chaiyo	Thailand
3516	Brzeg Dolny	Poland
3517	Franeker	Netherlands
3518	Ulubey	Turkey
3519	Borger	Netherlands
3520	Grave	Netherlands
3521	Vöcklabruck	Austria
3522	Kapelle	Netherlands
3523	Brzeziny	Poland
3524	Ban Laem	Thailand
3525	Lubaczów	Poland
3526	Kaeng Khoi	Thailand
3527	Costa de Caparica	Portugal
3528	Ban Tom Klang	Thailand
3529	Sankt Veit an der Glan	Austria
3530	Ban Muang Ngam	Thailand
3531	Chok Chai	Thailand
3532	Leibnitz	Austria
3533	Hattem	Netherlands
3534	Kantang	Thailand
3535	Wieringerwerf	Netherlands
3536	Rong Kwang	Thailand
3537	Lienz	Austria
3538	Beydağ	Turkey
3539	Neerijnen	Netherlands
3540	Mira	Portugal
3541	Brzeszcze	Poland
3542	Goor	Netherlands
3543	Sátão	Portugal
3544	Dokkum	Netherlands
3545	Axel	Netherlands
3546	Sever do Vouga	Portugal
3547	Niepołomice	Poland
3548	Kálymnos	Greece
3549	Rankweil	Austria
3550	Lom Sak	Thailand
3551	Ried im Innkreis	Austria
3552	Budel	Netherlands
3553	Heythuysen	Netherlands
3554	Oosterbroek	Netherlands
3555	Enns	Austria
3556	Götzis	Austria
3557	Na Wa	Thailand
3558	Węgorzewo	Poland
3559	Suchanino	Poland
3560	Ban Bo Luang	Thailand
3561	Bad Vöslau	Austria
3562	Tábua	Portugal
3563	Brwinów	Poland
3564	Laren	Netherlands
3565	Ban Bang Yai	Thailand
3566	Weiz	Austria
3567	Erfelek	Turkey
3568	Wang Saphung	Thailand
3569	Ardanuç	Turkey
3570	Opmeer	Netherlands
3571	Don Sak	Thailand
3572	Nong Bua	Thailand
3573	Blaricum	Netherlands
3574	Doesburg	Netherlands
3575	Alijó	Portugal
3576	Janów Lubelski	Poland
3577	Çüngüş	Turkey
3578	Nowe Miasto Lubawskie	Poland
3579	Eijsden	Netherlands
3580	Vendas Novas	Portugal
3581	Ban Phan Don	Thailand
3582	Ban Bang Lamung	Thailand
3583	Ban Bang Toei	Thailand
3584	Kuchinarai	Thailand
3585	Ban Wiang Phan	Thailand
3586	Wormer	Netherlands
3587	Óbidos	Portugal
3588	Phon	Thailand
3589	Gänserndorf	Austria
3590	Hollabrunn	Austria
3591	Góra	Poland
3592	Deutschlandsberg	Austria
3593	Sint Anthonis	Netherlands
3594	Hazerswoude-Dorp	Netherlands
3595	Salaya	Thailand
3596	Drawsko Pomorskie	Poland
3597	Mistelbach	Austria
3598	Krynica	Poland
3599	Doornspijk	Netherlands
3600	Anatolí	Greece
3601	Calheta	Portugal
3602	Den Chai	Thailand
3603	Diepenveen	Netherlands
3604	Ciechocinek	Poland
3605	Satuek	Thailand
3606	Prinsenbeek	Netherlands
3607	Zierikzee	Netherlands
3608	Schipluiden	Netherlands
3609	Nieuwenhagen	Netherlands
3610	Gerasdorf bei Wien	Austria
3611	Phanat Nikhom	Thailand
3612	Ban Bo Phlap	Thailand
3613	Resende	Portugal
3614	Waidhofen an der Ybbs	Austria
3615	Kiáto	Greece
3616	Sankt Johann im Pongau	Austria
3617	Vila Franca do Campo	Portugal
3618	Lang Suan	Thailand
3619	Bang Ban	Thailand
3620	Neede	Netherlands
3621	Bleiswijk	Netherlands
3622	Groß-Enzersdorf	Austria
3623	Zelhem	Netherlands
3624	Krosno Odrzańskie	Poland
3625	Kaset Wisai	Thailand
3626	Tha Chang	Thailand
3627	Ulrum	Netherlands
3628	Týrnavos	Greece
3629	Trofaiach	Austria
3630	Ebreichsdorf	Austria
3631	Si Wilai	Thailand
3632	Miastko	Poland
3633	Wisła	Poland
3634	Khlung	Thailand
3635	Warka	Poland
3636	Aydıncık	Turkey
3637	Fao Rai	Thailand
3638	Gleisdorf	Austria
3639	Völkermarkt	Austria
3640	Akyaka	Turkey
3641	Wiener Neudorf	Austria
3642	Phibun Mangsahan	Thailand
3643	Phrai Bueng	Thailand
3644	Sultanhanı	Turkey
3645	Zwettl	Austria
3646	Ban Lueak	Thailand
3647	Pua	Thailand
3648	Boekel	Netherlands
3649	Krzeszowice	Poland
3650	Kranuan	Thailand
3651	Koronowo	Poland
3652	Sam Ko	Thailand
3653	Strasshof an der Nordbahn	Austria
3654	Lauterach	Austria
3655	Reguengos de Monsaraz	Portugal
3656	Ban Ko	Thailand
3657	Diavatá	Greece
3658	Mae Ai	Thailand
3659	Wang Sombun	Thailand
3660	Kolno	Poland
3661	Bischofshofen	Austria
3662	São Brás de Alportel	Portugal
3663	Murtosa	Portugal
3664	Aver-o-Mar	Portugal
3665	Borculo	Netherlands
3666	Monnickendam	Netherlands
3667	Biskupiec	Poland
3668	Imst	Austria
3669	Scherpenzeel	Netherlands
3670	Doorn	Netherlands
3671	Ban Bang Phlap	Thailand
3672	Ban Thung Khao Phuang	Thailand
3673	Prakhon Chai	Thailand
3674	Vaals	Netherlands
3675	Phai Sali	Thailand
3676	Maria Enzersdorf	Austria
3677	Karkamış	Turkey
3678	Phon Charoen	Thailand
3679	Ban Klang	Thailand
3680	Tha Muang	Thailand
3681	Köflach	Austria
3682	Kut Chap	Thailand
3683	Oostzaan	Netherlands
3684	Sobral de Monte Agraço	Portugal
3685	Ban Bong Tai	Thailand
3686	Tha Mai	Thailand
3687	Nieuw-Lekkerland	Netherlands
3688	Haelen	Netherlands
3689	Rum	Austria
3690	Moimenta da Beira	Portugal
3691	Eumseong	South Korea
3692	Nong Ki	Thailand
3693	Phak Hai	Thailand
3694	Kokoszki	Poland
3695	Assendelft	Netherlands
3696	Ban Bu Sung	Thailand
3697	Laakirchen	Austria
3698	Sung Noen	Thailand
3699	Ozimek	Poland
3700	Judenburg	Austria
3701	Kamalasai	Thailand
3702	Wiang Sa	Thailand
3703	Ban Ratchakrut	Thailand
3704	Hoek van Holland	Netherlands
3705	Sankt Andrä	Austria
3706	Heteren	Netherlands
3707	Purkersdorf	Austria
3708	Non Sung	Thailand
3709	Vlist	Netherlands
3710	Liesveld	Netherlands
3711	Néa Moudaniá	Greece
3712	Zell am See	Austria
3713	Pórto Ráfti	Greece
3714	Carregal do Sal	Portugal
3715	Altmünster	Austria
3716	Trancoso	Portugal
3717	Nong Wua So	Thailand
3718	Néa Artáki	Greece
3719	Vries	Netherlands
3720	Bueng Khong Long	Thailand
3721	Photharam	Thailand
3722	Chom Thong	Thailand
3723	Ban Krot	Thailand
3724	Wamel	Netherlands
3725	Chiang Klang	Thailand
3726	Thap Khlo	Thailand
3727	Guntramsdorf	Austria
3728	Mae Rim	Thailand
3729	Argostóli	Greece
3730	Voitsberg	Austria
3731	Idanha-a-Nova	Portugal
3732	Attnang-Puchheim	Austria
3733	Stary Sącz	Poland
3734	Pinhel	Portugal
3735	Sierning	Austria
3736	Ubbergen	Netherlands
3737	Kanchanadit	Thailand
3738	Sankt Johann in Tirol	Austria
3739	Bang Khla	Thailand
3740	Lwówek Śląski	Poland
3741	Sankt Valentin	Austria
3742	Ban Tha Phra	Thailand
3743	Síndos	Greece
3744	Olst	Netherlands
3745	Fársala	Greece
3746	Ter Aar	Netherlands
3747	Spáta	Greece
3748	Lidzbark	Poland
3749	Groenlo	Netherlands
3750	Argoncilhe	Portugal
3751	Eemnes	Netherlands
3752	Elsloo	Netherlands
3753	Néa Péramos	Greece
3754	Siteía	Greece
3755	Nieuwleusen	Netherlands
3756	Smilde	Netherlands
3757	Nakhon Thai	Thailand
3758	Nong Kung Si	Thailand
3759	Holten	Netherlands
3760	Suwannaphum	Thailand
3761	Didymóteicho	Greece
3762	Castelões de Cepeda	Portugal
3763	Wolfurt	Austria
3764	Melgaço	Portugal
3765	Pong Nam Ron	Thailand
3766	Ziębice	Poland
3767	Kamień Pomorski	Poland
3768	Almargem	Portugal
3769	Żychlin	Poland
3770	Akat Amnuai	Thailand
3771	Oudover	Netherlands
3772	Kaeng Khro	Thailand
3773	Velden am Wörthersee	Austria
3774	Thung Sai	Thailand
3775	Kosum Phisai	Thailand
3776	Epanomí	Greece
3777	Tha Luang	Thailand
3778	Vinhais	Portugal
3779	Hoevelaken	Netherlands
3780	Chrysoúpoli	Greece
3781	Swalmen	Netherlands
3782	Abcoude	Netherlands
3783	Wervershoof	Netherlands
3784	Thap Than	Thailand
3785	Engerwitzdorf	Austria
3786	Kui Buri	Thailand
3787	Deutsch-Wagram	Austria
3788	Eceabat	Turkey
3789	Takua Pa	Thailand
3790	Połaniec	Poland
3791	Langenzersdorf	Austria
3792	Kolbuszowa	Poland
3793	Loenen	Netherlands
3794	Bang Mun Nak	Thailand
3795	Ponta do Sol	Portugal
3796	Pa Sang	Thailand
3797	Dinxperlo	Netherlands
3798	Phimai	Thailand
3799	Zoeterwoude	Netherlands
3800	Mürzzuschlag	Austria
3801	Kumphawapi	Thailand
3802	Yang Talat	Thailand
3803	Ban Na	Thailand
3804	Nam Som	Thailand
3805	Heel	Netherlands
3806	Stainz	Austria
3807	Ban Buak Khang	Thailand
3808	Kościelisko	Poland
3809	Fürstenfeld	Austria
3810	Perg	Austria
3811	Nakhon Chai Si	Thailand
3812	Ferreira do Zêzere	Portugal
3813	Bang Len	Thailand
3814	Sawang Daen Din	Thailand
3815	Wattens	Austria
3816	Torre de Moncorvo	Portugal
3817	Joane	Portugal
3818	Non Sang	Thailand
3819	Chumsaeng	Thailand
3820	Mourniés	Greece
3821	Freistadt	Austria
3822	Campo Maior	Portugal
3823	Brętowo	Poland
3824	Tha Maka	Thailand
3825	Neulengbach	Austria
3826	U Thong	Thailand
3827	Phayakkhaphum Phisai	Thailand
3828	Kitzbühel	Austria
3829	Damnoen Saduak	Thailand
3830	Höchst	Austria
3831	Neusiedl am See	Austria
3832	Khanu Woralaksaburi	Thailand
3833	Vila Viçosa	Portugal
3834	Proença-a-Nova	Portugal
3835	Kalampáka	Greece
3836	Giánnouli	Greece
3837	Zirl	Austria
3838	Chonnabot	Thailand
3839	Prabuty	Poland
3840	Seiersberg	Austria
3841	Ron Phibun	Thailand
3842	Liezen	Austria
3843	Sawang Wirawong	Thailand
3844	Bruck an der Leitha	Austria
3845	Landeck	Austria
3846	Pasching	Austria
3847	Kindberg	Austria
3848	Tarouca	Portugal
3849	Gratkorn	Austria
3850	Sankt Andrä vor dem Hagenthale	Austria
3851	Kottingbrunn	Austria
3852	Lagkadás	Greece
3853	Penalva do Castelo	Portugal
3854	Zeltweg	Austria
3855	Almyrós	Greece
3856	Koufália	Greece
3857	Herzogenburg	Austria
3858	Völs	Austria
3859	Chaiya	Thailand
3860	Olsztyn	Poland
3861	São João da Pesqueira	Portugal
3862	Nong Phai	Thailand
3863	Trzemeszno	Poland
3864	Altach	Austria
3865	Thung Saliam	Thailand
3866	Fohnsdorf	Austria
3867	Khon Buri	Thailand
3868	Santana	Portugal
3869	Mattighofen	Austria
3870	Alpiarça	Portugal
3871	Oberwart	Austria
3872	Reszel	Poland
3873	Ebensee	Austria
3874	Gallneukirchen	Austria
3875	Celorico da Beira	Portugal
3876	Langenlois	Austria
3877	Pressbaum	Austria
3878	Vösendorf	Austria
3879	Sieghartskirchen	Austria
3880	Vorchdorf	Austria
3881	Mattersburg	Austria
3882	Jenbach	Austria
3883	Strasswalchen	Austria
3884	Grödig	Austria
3885	Mondim de Basto	Portugal
3886	Néa Kallikráteia	Greece
3887	Fehring	Austria
3888	Himberg	Austria
3889	Bad Goisern	Austria
3890	Miranda do Douro	Portugal
3891	Nisa	Portugal
3892	Almodôvar	Portugal
3893	Kuchl	Austria
3894	Kalsdorf bei Graz	Austria
3895	Elassóna	Greece
3896	Arraiolos	Portugal
3897	Poiares	Portugal
3898	Santa Marta de Penaguião	Portugal
3899	Wolkersdorf im Weinviertel	Austria
3900	Chalástra	Greece
3901	Zbąszyń	Poland
3902	Lávrio	Greece
3903	Alvaiázere	Portugal
3904	Vila Nova da Barquinha	Portugal
3905	Vila Nova de Foz Côa	Portugal
3906	Karpenísi	Greece
3907	Castro Verde	Portugal
3908	Hitzendorf	Austria
3909	Mértola	Portugal
3910	Terras de Bouro	Portugal
3911	Głuszyca	Poland
3912	Sędziszów Małopolski	Poland
3913	Almeida	Portugal
3914	Absam	Austria
3915	Pottendorf	Austria
3916	Ferlach	Austria
3917	Marathónas	Greece
3918	Arnoldstein	Austria
3919	Polýkastro	Greece
3920	Feldkirchen bei Graz	Austria
3921	Bełżyce	Poland
3922	Káto Achaḯa	Greece
3923	Sobótka	Poland
3924	Eugendorf	Austria
3925	Gryfów Śląski	Poland
3926	Oberndorf bei Salzburg	Austria
3927	Hörbranz	Austria
3928	Redondo	Portugal
3929	Aígina	Greece
3930	Litóchoro	Greece
3931	Néo Karlovási	Greece
3932	Aridaía	Greece
3933	Piława Górna	Poland
3934	Ovacık	Turkey
3935	Bad Hofgastein	Austria
3936	Hartberg	Austria
3937	Néoi Epivátes	Greece
3938	Kórnik	Poland
3939	Gniew	Poland
3940	Yeniceoba	Turkey
3941	Garsten	Austria
3942	Hainburg an der Donau	Austria
3943	Celeiroz	Portugal
3944	Reutte	Austria
3945	Castro Marim	Portugal
3946	Eggersdorf bei Graz	Austria
3947	Asten	Austria
3948	Kremsmünster	Austria
3949	Frohnleiten	Austria
3950	Wilhelmsburg	Austria
3951	Horn	Austria
3952	Schladming	Austria
3953	Soúda	Greece
3954	Kounoupidianá	Greece
3955	Neuhofen an der Krems	Austria
3956	Anávyssos	Greece
3957	Ribeira de Pena	Portugal
3958	Seeboden	Austria
3959	Agriá	Greece
3960	Eibiswald	Austria
3961	São Martinho	Portugal
3962	Neumarkt am Wallersee	Austria
3963	Portel	Portugal
3964	Gogolin	Poland
3965	Mszczonów	Poland
3966	Sabrosa	Portugal
3967	Tabuaço	Portugal
3968	Carrazeda de Anciães	Portugal
3969	Grybów	Poland
3970	Povoação	Portugal
3971	Traismauer	Austria
3972	Laa an der Thaya	Austria
3973	Hörsching	Austria
3974	Armamar	Portugal
3975	Matarnia	Poland
3976	Messíni	Greece
3977	Olival	Portugal
3978	Mýrina	Greece
3979	Axams	Austria
3980	Markt Sankt Florian	Austria
3981	Wagna	Austria
3982	Jedlicze	Poland
3983	Lochau	Austria
3984	Nenzing	Austria
3985	Unterpremstätten	Austria
3986	Dąbrowa Białostocka	Poland
3987	Figueira de Castelo Rodrigo	Portugal
3988	Kirchbichl	Austria
3989	Gloggnitz	Austria
3990	Gunskirchen	Austria
3991	Polýgyros	Greece
3992	Pöllau	Austria
3993	Gnas	Austria
3994	Wildon	Austria
3995	Wilhering	Austria
3996	Megalópoli	Greece
3997	Alkoven	Austria
3998	Filiatrá	Greece
3999	Madalena	Portugal
4000	Breitenfurth bei Wien	Austria
4001	Çıralı	Turkey
4002	Monchique	Portugal
4003	Thalgau	Austria
4004	Penela	Portugal
4005	Timelkam	Austria
4006	Nerokoúros	Greece
4007	Pinkafeld	Austria
4008	Murça	Portugal
4009	Micheldorf in Oberösterreich	Austria
4010	Kazimierza Wielka	Poland
4011	Diónysos	Greece
4012	Vidigueira	Portugal
4013	Eberndorf	Austria
4014	Psachná	Greece
4015	Xylókastro	Greece
4016	Aljezur	Portugal
4017	Radenthein	Austria
4018	Ybbs an der Donau	Austria
4019	Paternion	Austria
4020	Abtenau	Austria
4021	Alandroal	Portugal
4022	Fílyro	Greece
4023	Thalheim bei Wels	Austria
4024	Kremastí	Greece
4025	Leopoldsdorf	Austria
4026	Fischamend	Austria
4027	Wernberg	Austria
4028	Riachos	Portugal
4029	Tamsweg	Austria
4030	Viana do Alentejo	Portugal
4031	Melk	Austria
4032	Bergheim	Austria
4033	Ebbs	Austria
4034	Oleiros	Portugal
4035	Hopfgarten im Brixental	Austria
4036	Penamacor	Portugal
4037	Schwertberg	Austria
4038	Elsbethen	Austria
4039	Haag	Austria
4040	Spielberg bei Knittelfeld	Austria
4041	Waidhofen an der Thaya	Austria
4042	Lenzing	Austria
4043	Gmünd	Austria
4044	Poysdorf	Austria
4045	Vila do Porto	Portugal
4046	Siátista	Greece
4047	Golegã	Portugal
4048	Lieboch	Austria
4049	Féres	Greece
4050	Śmigiel	Poland
4051	Sollenau	Austria
4052	Tympáki	Greece
4053	Aguiar da Beira	Portugal
4054	Feldkirchen an der Donau	Austria
4055	Schrems	Austria
4056	Dzierzgoń	Poland
4057	Pregarten	Austria
4058	Vila de Porto Santo	Portugal
4059	Zistersdorf	Austria
4060	Bad Gleichenberg	Austria
4061	Vrontádos	Greece
4062	Velas	Portugal
4063	Archángelos	Greece
4064	Sankt Ruprecht an der Raab	Austria
4065	Grieskirchen	Austria
4066	Skýdra	Greece
4067	Schärding	Austria
4068	Mittersill	Austria
4069	Bad Hall	Austria
4070	Ourique	Portugal
4071	Ohlsdorf	Austria
4072	Stadl-Paura	Austria
4073	Pettenbach	Austria
4074	Krieglach	Austria
4075	Kyparissía	Greece
4076	Terrujem	Portugal
4077	Żołynia	Poland
4078	Andorf	Austria
4079	Kirchberg in Tirol	Austria
4080	Vila do Bispo	Portugal
4081	Néa Anchiálos	Greece
4082	Rottenmann	Austria
4083	Orchomenós	Greece
4084	Gramastetten	Austria
4085	Vila Nova de Paiva	Portugal
4086	Sankt Peter in der Au Markt	Austria
4087	Böheimkirchen	Austria
4088	Vomp	Austria
4089	Bierutów	Poland
4090	Alfândega da Fé	Portugal
4091	Gargaliánoi	Greece
4092	Sousel	Portugal
4093	Admont	Austria
4094	Hafendorf	Austria
4095	Grytviken	South Georgia And South Sandwich Islands
4096	Melbourne	Australia
4097	Perth	Australia
4098	Austria	Austria
4099	ASEAN	U.S. Mission to ASEAN
4100	Union	U.S. Mission to the African Union
4101	Nassau	Bahamas
4102	Grenada	Barbados
4103	City	Benin
4104	Recife	Brazil
4105	Rio de Janeiro	Brazil
4106	Brasilia	Brazil
4107	Sarajevo	Bosnia & Herzegovina
4108	Sao Paulo	Brazil
4109	Rangoon	Burma
4110	Porto Alegre	Brazil
4111	Yaounde	Cameroon
4112	Montreal	Canada
4113	Vancouver	Canada
4114	Quebec	Canada
4115	Ottawa	Canada
4116	Calgary	Canada
4117	Halifax	Canada
4118	Winnipeg	Canada
4119	Ndjamena	Chad
4120	Wuhan	China
4121	Guangzhou	China
4122	Shenyang	China
4123	Bogota	Colombia
4124	San Jose	Costa Rica
4125	Abidjan	Côte d’Ivoire
4126	Curacao	Curacao
4127	Prague	Czech Republic
4128	Kinshasa	Democratic Republic of the Congo
4129	Alexandria	Egypt
4130	Mbabane	Eswatini
4131	EU	U.S. Mission to the EU
4132	Finland	Finland
4133	Bordeaux	France
4134	Rennes	France
4135	Lyon	France
4136	Strasbourg	France
4137	Marseille	France
4138	Toulouse	France
4139	Frankfurt	Germany
4140	Düsseldorf	Germany
4141	Hamburg	Germany
4142	Munich	Germany
4143	Leipzig	Germany
4144	Thessaloniki	Greece
4145	Guinea-Bissau	Guinea-Bissau
4146	Banjul	The Gambia
4147	See	Italy
4148	Reykjavik	Iceland
4149	Kolkata	India
4150	Chennai	India
4151	Hyderabad	India
4152	Mumbai	India
4153	Medan	Indonesia
4154	Surabaya	Indonesia
4155	Bali	Indonesia
4156	Florence	Italy
4157	Milan	Italy
4158	Naples	Italy
4159	ICAO	U.S. Mission to the ICAO
4160	Nagoya	Japan
4161	Sapporo	Japan
4162	Osaka	Japan
4163	Fukuoka	Japan
4164	Astana	Kazakhstan
4165	Bishkek	Kyrgyz Republic
4166	Antananarivo	Madagascar & Comoros
4167	Post–Comoros	Madagascar & Comoros
4168	Maldives	Maldives
4169	Guadalajara	Mexico
4170	Hermosillo	Mexico
4171	Merida	Mexico
4172	Tijuana	Mexico
4173	Nogales	Mexico
4174	Kolonia	Micronesia
4175	Curacao	Netherlands Antilles
4176	Skopje	North Macedonia
4177	NATO	U.S. Mission to NATO
4178	OAS	U.S. Mission to the OAS
4179	OECD	U.S. Mission to the OECD
4180	Peshawar	Pakistan
4181	Lahore	Pakistan
4182	Koror	Palau
4183	Asuncion	Paraguay
4184	Krakow	Poland
4185	Poznan	Poland
4186	Azores	Portugal
4187	Dhahran	Saudi Arabia
4188	Jeddah	Saudi Arabia
4189	Somalia	Somalia
4190	U.S. Consulate General in Durban	South Africa
4191	Barcelona	Spain
4192	Liechtenstein	Switzerland
4193	Office	American Institute in Taiwan
4194	Taiwan	American Institute in Taiwan
4195	Mai	Thailand
4196	Lome	Togo
4197	Tonga	Tonga
4198	Port of Spain	Trinidad & Tobago
4199	Adana	Turkey
4200	Mission-Geneva	U.S. Mission to the UN-Geneva
4201	Rome	U.S. Mission to the UN-Rome
4202	America	United Kingdom
4203	Belfast	United Kingdom
4204	Edinburgh	United Kingdom
4205	Sana’a	Yemen
4206	Ponta Delgada	Azores
4207	St. John's	Antigua and Barbuda
4208	St. George	Bermuda
4209	Belo Horizonte	Brazil
4210	Rio De Janeiro	Brazil
4211	Douala	Cameroon
4212	Seven Mile Beach	Cayman Islands
4213	N'Djamena	Chad
4214	Chongqing	China
4215	Cartagena	Colombia
4216	Dar Es Salaam	Tanzania
4217	Kinshasa	Democratic Republic of Congo (Kinshasa)
4218	Guardalavaca	Cuba
4219	Punta Cana	Dominican Republic
4220	Puerto Plata	Dominican Republic
4221	Nice	France
4222	Stuttgart	Germany
4223	Pointe-à-Pitre	Guadeloupe
4224	Pohnpei	Micronesia (FSM)
4225	Hong Kong	China
4226	Bengaluru (formerly Bangalore)	India
4227	Chandigarh	India
4228	Kolkata (formerly Calcutta)	India
4229	Mumbai (Formerly Bombay)	India
4230	Erbil	Iraq
4231	Tel Aviv	Israel, the West Bank and the Gaza Strip
4232	Ramallah	Israel, the West Bank and the Gaza Strip
4233	Abidjan	Côte d'Ivoire (Ivory Coast)
4234	Montego Bay	Jamaica
4235	Hiroshima	Japan
4236	Busan	South Korea
4237	Penang	Malaysia
4238	Rabat-Souissi	Morocco
4239	Acapulco	Mexico
4240	Cancún	Mexico
4241	Mazatlán	Mexico
4242	Monterrey	Mexico
4243	Playa Del Carmen	Mexico
4244	Yangon	Myanmar
4245	Nauru	Nauru
4246	Port Harcourt	Nigeria
4247	Stavanger	Norway
4248	Panama	Panama
4249	Cebu	Philippines
4250	Faro	Portugal
4251	Miami	United States
4252	Vladivostok	Russia
4253	Saint-Pierre	Saint-Pierre-et-Miquelon
4254	Málaga	Spain
4255	Gothenburg	Sweden
4256	Geneva	Switzerland
4257	Chiang Mai	Thailand
4258	Phuket	Thailand
4259	Nuku'alofa	Tonga
4260	Port of Spain	Trinidad and Tobago
4261	Providenciales	Turks and Caicos Islands
4262	Lviv	Ukraine
4263	Cardiff	United Kingdom
4264	Atlanta	United States
4265	Boston	United States
4266	Chicago	United States
4267	Dallas	United States
4268	Denver	United States
4269	Detroit	United States
4270	Honolulu	United States
4271	Los Angeles	United States
4272	Minneapolis	United States
4273	San Francisco	United States
4274	Seattle	United States
4275	Port Vila	Vanuatu
4276	Sint Maarten	Sint Maarten
4277	Dili	Timor-Leste (East Timor)
4278	Goma	Democratic Republic of the Congo
4279	Abidjan	Ivory Coast
4280	Kaduna	Nigeria
4281	Enugu	Nigeria
4282	Kano	Nigeria
4283	Hargeisa	Somalia
4284	St.John's	Antigua and Barbuda
4285	St.George's	Grenada
4286	Port au Prince	Haiti
4287	Cancun	Mexico
4288	Kingstown	St. Vincent & Grenadines
4289	Port Of Spain	Trinidad and Tobago
4290	Houston	United States
4291	Orlando	United States
4292	Raleigh	United States
4293	San Diego	United States
4294	Brisbane	Australia
4295	Bandar Seri Begawan	Brunei Darussalam
4296	Hong Kong SAR	China
4297	Pyongyang	Democratic People's Republic of Korea
4298	Yangon	Myanmar (Burma)
4299	Atyrau	Kazakhstan
4300	St. Petersburg	Russia
4301	Yekaterinburg	Russia
4302	Banja Luka	Bosnia and Herzegovina
4303	Sarajevo	Bosnia and Herzegovina
4304	Split	Croatia
4305	Marseilles	France
4306	Dusseldorf	Germany
4307	Corfu	Greece
4308	Zakynthos	Greece
4309	Rhodes	Greece
4310	Heraklion	Greece
4311	Vatican City	Holy See
4312	Portimao	Portugal
4313	Bilbao	Spain
4314	Palma	Spain
4315	Alicante	Spain
4316	Malaga	Spain
4317	Santa Cruz de Tenerife	Spain
4318	Las Palmas	Spain
4319	Berne	Switzerland
4320	Izmir	Turkey
4321	Antalya	Turkey
4322	Manama/Bahrain	Bahrain
4323	Tel Aviv	Israel
4324	Kuwait	Kuwait
4325	Jerusalem	Occupied Palestinian territories
4326	Gaza	Occupied Palestinian territories
4327	Al-Khobar	Saudi Arabia
4328	Sana'a	Yemen
4329	Anguilla	Anguilla
4330	Ascension Island	Ascension Island
4331	Tortola	British Virgin Islands
4332	Stanley	Falkland Islands
4333	Brades	Montserrat
4334	Jamestown	Saint Helena
4335	Tristan Da Cunha	Tristan Da Cunha 
4336	Grand Turk	Turks and Caicos Islands
4337	Pune	India
4338	Goa	India
4339	Bengaluru	India
4340	Ahmedabad	India
\.


--
-- Data for Name: embassies; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.embassies (embassy_id, home_country, latitude, longitude, address, website, dest_id) FROM stdin;
1	United States	69.19371818005794	34.53752004403598	\N	\N	134
2	United States	19.82707	41.320471	Rruga e Elbasanit No. 103 Tirana, ALBANIA	\N	410
3	United States	3.021801240845189	36.753424531614456	05 Chemin Cheikh Bachir Ibrahimi El-Biar 16030 Alger Algerie	\N	145
4	United States	13.244469090775446	-8.809720967521883	R. Houari Boumediene 32, Luanda, Angola, C.P. 6468	\N	27
5	United States	-58.42101148534582	-34.5766049804666	Av. Colombia 4300 (C1425GMN) Buenos Aires Argentina	\N	15
6	United States	44.47928465065334	40.16526737871782	1 American Avenue Yerevan 0082, Republic of Armenia	\N	364
7	United States	-37.8469056	144.9802442	553 St. Kilda Road Melbourne, VIC 3004	\N	4096
8	United States	-35.3076255	149.1175268	Moonah Place Yarralumla, ACT 2600	\N	411
9	United States	-33.868669	151.2090347	Level 10, MLC Centre 19-29 Martin Place Sydney, NSW 2000	\N	64
10	United States	-31.9568503	115.8644221	16 St. George’s Terrace Perth, WA 6000	\N	4097
11	United States	16.354499215758217	48.22291345319236	Boltzmanngasse 16 1090 Vienna, Austria	\N	4098
12	United States	19.82707	41.320471	111 Azadlig avenue AZ1007 Baku, Azerbaijan	\N	230
13	United States	-6.181252	106.830187	Jl. Medan Merdeka Selatan 5 Jakarta 10110, Indonesia	\N	4099
14	United States	9.0699281	38.7606274	Entoto Street Addis Ababa, Ethiopia	\N	4100
15	United States	-77.34896624969824	25.077164483873396	42 Queen St. Nassau, the Bahamas	\N	4101
16	United States	50.538771	26.237461	Bldg. 979, Road 3119, Block 331, Zinj P.O. Box 26431 Manama – Kingdom of Bahrain	\N	440
17	United States	23.7980828	90.42211569999999	Madani Avenue, Baridhara, Dhaka -1212, Bangladesh	\N	16
18	United States	-59.58767188544566	13.093218815741189	Wildey Business Park St. Michael BB 14006 Barbados, W.I.	\N	450
19	United States	-61.760287273189775	12.010290496280286	Lance Aux Epines St. George’s Grenada	\N	4102
20	United States	27.556450815687707	53.912943639820504	46 Starovilenskaya St. Minsk 220002, Belarus	\N	247
21	United States	4.365151650990838	50.84451007943123	Regentlaan 27 Boulevard du Régent, B-1000 Brussels	\N	271
22	United States	-88.7746408500989	17.257409411026316	Floral Park Road Belmopan, Cayo Belize	\N	482
23	United States	2.3962361978393565	6.3507944803280525	Marina Avenue, 01 BP 2012, Cotonou, Benin	\N	4103
24	United States	-64.77029974967265	32.29539498102744	16 Middle Road Devonshire, DV 03 Bermuda	\N	461
25	United States	-68.121301	-16.512683	Avenida Arce 2780 Casilla 425 La Paz, Bolivia	\N	184
26	United States	-34.89513298604406	-8.057479794198347	Rua Gonçalves Maia, 163 – Boa Vista 50070-060 – Recife, PE	\N	4104
27	United States	-43.17603538580082	-22.9114962850094	Av. Presidente Wilson, 147 – CasSTOPo 20030-020 – Rio de Janeiro, RJ	\N	4105
28	United States	4.920613599999999	114.9549133	Simpang 336-52-16-9, Jalan Duta Bandar Seri Begawan BC4115 Brunei	\N	462
29	United States	23.310085350655804	42.66685437906526	16, Kozyak Street Sofia 1408, Bulgaria	\N	314
30	United States	-1.5370534984062096	12.251802140547836	Secteur 15, Ouaga 2000 Avenue Sembène Ousmane, Rue 15.873 Ouagadougou, Burkina Faso	\N	280
31	United States	-47.87494718594563	-15.80437338904502	SES – Av. das Nações, Quadra 801, Lote 03 70403-900 – Brasília, DF	\N	4106
32	United States	18.398199750701693	43.856664479012416	1 Robert C. Frasure Street, 71000 SARAJEVO	\N	4107
33	United States	-46.71500176726864	-23.629400686822922	Rua Henri Dunant, 500, Chácara Santo Antônio, São Paulo- SP, 04709-110	\N	4108
34	United States	16.8253686	96.1444142	110 University Ave Kamayut Township Rangoon, Burma	\N	4109
35	United States	25.90648851606914	-24.661260909013087	Embassy Drive Government Enclave Gaborone, Botswana	\N	430
36	United States	-51.170603185102486	-30.012005881894144	Av. Assis Brasil, 1889 Passo d’Areia Porto Alegre – RS	\N	4110
37	United States	29.380263715846144	-3.368231542392924	B.P. 1720 Avenue Des Etats-Unis Bujumbura, Burundi	\N	395
38	United States	-23.50859068535588	14.92113557314168	Rua Abilio Macedo 6 Praia, Cape Verde	\N	447
39	United States	11.501709352318809	3.8991557297769273	Avenue Rosa Parks Yaounde, Cameroon	\N	4111
40	United States	-73.57542628444138	45.49943997910136	1134 Saint-Catherine St W Montreal, QC H3B 5K2	\N	4112
41	United States	49.2875786	-123.119728	1075 West Pender Street Vancouver, British Columbia V6E 2M6	\N	4113
42	United States	-71.20693568487476	46.81061277913991	2, rue de la Terrasse-Dufferin Quebec, Quebec G1R 4T9 Canada	\N	4114
43	United States	-75.69805418493372	45.42795027910043	490 Sussex Drive Ottawa, Ontario K1N 1G8 Canada	\N	4115
44	United States	51.0466528	-114.0586221	615 MacLeod Trail S.E. 10th Floor Rocky Mountain Plaza Building Calgary, Alberta T2G 4T8	\N	4116
45	United States	-79.39009958500738	43.65277537912137	360 University Avenue Toronto, Ontario M5G 1S4	\N	58
46	United States	-63.576402884196376	44.652399295261674	1969 Upper Water Street Suite 904, Purdy’s Wharf Tower II B3J 3R7	\N	4117
47	United States	49.8957545	-97.13925449999999	201 Portage Avenue, Suite 860 Winnipeg, Manitoba R3B 3K6 Canada	\N	4118
48	United States	18.57692871459369	4.360147295730762	Avenue David Dacko P.O. Box 924 Bangui Central African Republic	\N	381
49	United States	12.10201	15.0478635	U.S. Embassy N’Djamena B.P. 413 N’Djamena, Chad	\N	4119
50	United States	-70.6065827848723	-33.411839902917684	Av. Andrés Bello 2800 Las Condes Santiago, Chile	\N	32
51	United States	30.59414	114.264253	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	\N	4120
52	United States	23.119397	113.321208	Huaxia Road, Zhujiang New Town (near Exit B1 of the Zhujiang New Town subway station, Line 3 and Line 5) Tianhe District Guangzhou, China	\N	4121
53	United States	43.8266299	87.61688	1469 Huai Hai Zhong Road (Near Wulumuqi Nan Lu) 200031 Shanghai China	\N	6
54	United States	30.59414	114.264253	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	\N	4120
55	United States	41.7839499	123.4220099	52, 14th Wei Road, Heping District 110003 China	\N	4122
56	United States	30.59414	114.264253	New World International Trade Tower I No. 568, Jianshe Avenue Hankou, Wuhan 430022	\N	4120
57	United States	-74.10426791435547	4.636952574881353	Carrera 45 No. 24B-27 Bogotá, D.C. Colombia	\N	4123
58	United States	-84.12636725016975	9.942651776713493	Calle 98 Vía 104, Pavas San José, Costa Rica	\N	4124
59	United States	-3.978233386063633	5.3350398961299375	Cocody Riviéra Golf, 01 BP 1712 Abidjan 01, Abidjan, Côte d’Ivoire	\N	4125
60	United States	15.992423565160433	45.74087723720738	Ulica Thomasa Jeffersona 2 10010 Zagreb Croatia	\N	386
61	United States	-82.39025868531266	23.145848517518314	Calzada between L & M Streets, Vedado Havana, Cuba	\N	236
62	United States	-68.92806705015425	12.108160536469793	P.O. Box 158 J.B. Gorsiraweg 1	\N	4126
859	United Kingdom	31.94	35.89	Irbid St 33, Amman, Jordan	\N	123
63	United States	33.34222775039067	35.165829780221046	Metochiou & Ploutarchou Street 2407, Engomi Nicosia, Cyprus	\N	420
64	United States	14.4013251	50.087334199999994	Tržiště 15 118 01 Praha 1 – Malá Strana Czech Republic	\N	4127
65	United States	15.311121414556926	-4.30045134755232	310 Avenue des Aviateurs Kinshasa, Gombe Democratic Republic of the Congo	\N	4128
66	United States	43.164265285710535	11.564571439167759	Lot 350-B Haramouss B.P. 185 Djibouti	\N	405
67	United States	-69.96556585638002	18.505791773516865	Av. Republica de Colombia # 57 Santo Domingo, Dominican Republic	\N	201
68	United States	-79.94002108545662	-2.190321437897651	Santa Ana St. and Jose Eduardo Rodriguez Bonin Ave. San Eduardo Sector Guayaquil	\N	190
69	United States	-78.46992368546607	-0.1387366354893353	E12-170 Avigiras Ave. and Eloy Alfaro Ave. Quito, Ecuador	\N	246
70	United States	30.017697	31.24555	3 Pharaana Street, Azarita Alexandria, Egypt	\N	4129
71	United States	31.230139821101467	30.040062177118504	5 Tawfik Diab Street Garden City, Cairo Egypt	\N	11
72	United States	-89.257115	13.664472	Final Boulevard Santa Elena Antiguo Cuscatlán, La Libertad	\N	404
73	United States	8.67950404719766	3.709944052732674	Malabo II highway Malabo, Guinea Ecuatorial	\N	435
74	United States	38.93054880356809	15.326481749328192	179 Alaa Street Asmara, Eritrea	\N	378
75	United States	24.749452351387053	59.43049458160451	Kentmanni 20 15099 Tallinn Estonia	\N	407
76	United States	31.146070000000005	-26.326799	7th Floor, Central Bank Building Mahlokohla Street P.O. Box 199 Mbabane, Swaziland	\N	4130
77	United States	38.7616351507037	9.058503490987626	Entoto Street P.O. Box 1014 Addis Ababa Embassy	\N	166
78	United States	4.367529	50.844269	Zinnerstraat – 13 – Rue Zinner B-1000 Brussels, Belgium	\N	4131
79	United States	-18.1165602	178.4407101	“158 Princes Road, Tamavua P.O. Box 218 Suva, Fiji	\N	456
80	United States	24.95848845142241	60.15712498186756	Itäinen Puistotie 14 B 00140 Helsinki Finland	\N	4132
81	United States	-0.56857998497452	44.85410907909841	89 Quai des Chartrons 33300 Bordeaux	\N	4133
82	United States	-1.684267	48.110242	P30, Quai Duguay-Trouin 35000 Rennes	\N	4134
83	United States	4.835858715064013	45.76289927910563	1, quai Jules Courmont 69002 Lyon	\N	4135
84	United States	7.7593509151874125	48.58696377926187	15, Avenue d’Alsace 67082 Strasbourg Cedex France	\N	4136
85	United States	2.318520215199972	48.867738979288355	2 avenue Gabriel 75008 Paris France	\N	23
86	United States	5.364160330718974	43.288518314649394	Place Varian Fry 13286 Marseille Cedex 6 France	\N	4137
87	United States	1.4471725149736492	43.606616779122874	25, allées Jean Jaurès 31000 Toulouse	\N	4138
88	United States	9.392872314599318	0.48322636388167084	Sablière B.P. 4000 Libreville, Gabon	\N	385
89	United States	44.773192550622554	41.78923347912738	11 George Balanchine Street Tbilisi, Georgia, 0131	\N	362
90	United States	8.693728900000002	50.141435099999995	Gießener Str. 30 60435 Frankfurt am Main Federal Republic of Germany	\N	4139
91	United States	13.264519717898615	52.45235417354004	Clayallee 170 14191 Berlin Federal Republic of Germany	\N	136
92	United States	6.795993399999999	51.2187464	Willi-Becker-Allee 10 40227 Düsseldorf Federal Republic of Germany	\N	4140
93	United States	9.99703	53.56216	Alsterufer 27/28 20354 Hamburg Federal Republic of Germany	\N	4141
94	United States	11.58361	48.14519000000001	Königinstraße 5 80539 München Federal Republic of Germany	\N	4142
95	United States	12.367720000000002	51.333890000000004	Wilhelm-Seyfferth-Straße 4 04107 Leipzig Federal Republic of Germany	\N	4143
96	United States	-0.17835773036791813	5.575553206061542	No. 24, Fourth Circular Rd., Cantonments, Accra P.O. Box GP 2288 Accra, Ghana	\N	222
97	United States	22.940211115308642	40.633251679340525	43 Tsimiski, 7th Floor 546 23 Thessaloniki GREECE	\N	4144
98	United States	23.74669424133668	37.982039334998994	91 Vasilisis Sophias Avenue 10160 Athens, Greece	\N	394
99	United States	14.6058227	-90.5150208	Avenida Reforma 7-01, Zona 10 Guatemala	\N	212
100	United States	-13.658754775644615	9.583353848528475	P.O. Box 603 Transversale No. 2 Centre Administratif de Koloma Commune de Ratoma Conakry, Republic of Guinea	\N	277
101	United States	-17.516996741291123	14.704710009473104	Route des Almadies – BP 49 Dakar, Senegal	\N	4145
102	United States	-58.16315469996067	6.823080095044522	100 Young and Duke Streets, Kingston Georgetown, Guyana	\N	434
103	United States	-16.689075085172696	13.461991890535506	Kairaba Avenue, Fajara P.M.B. 19 Banjul, The Gambia	\N	4146
104	United States	-72.25316678538026	18.564203472684127	Tabarre 41 Route de Tabarre Port-au-Prince, Haiti	\N	373
105	United States	12.489165014904835	41.906075279219905	Via Sallustiana, 49 00187 Rome, Italy	\N	4147
106	United States	-87.19214498442403	14.103078392854044	Avenida La Paz Tegucigalpa M.D.C. Honduras	\N	360
107	United States	22.2782104	114.1587519	26 Garden Road, Central Hong Kong	\N	30
108	United States	19.049127950848646	47.50447497907593	Szabadság tér 12 H-1054 Budapest Hungary	\N	272
109	United States	-21.940093284008785	64.14460802302551	Laufásvegur 21 101 Reykjavík	\N	4148
110	United States	88.3473489502395	22.551000939374266	38A, J.L.Nehru Road Kolkata 700 071, West Bengal, India	\N	4149
111	United States	77.18614975035345	28.59275369254548	Shantipath, Chanakyapuri New Delhi – 110021	\N	443
112	United States	80.24973505012338	13.052359116588155	Gemini Circle Chennai 600 006	\N	4150
113	United States	78.47482025016731	17.442523805745555	Paigah Palace 1-8-323, Chiran Fort Lane Begumpet Secunderabad 500 003	\N	4151
114	United States	72.8661483501878	19.065034557208715	C-49, G-Block, Bandra Kurla Complex Bandra East, Mumbai 400051	\N	4152
115	United States	3.5860499	98.6823189	Uni Plaza Building 4th Floor (West Tower) Jl. Let. Jend. MT Haryono A-1 Medan 20231, Indonesia	\N	4153
116	United States	-7.2836544	112.6479534	Jl. Citra Raya Niaga No. 2 Surabaya, Indonesia	\N	4154
117	United States	-8.6722475	115.2444518	Jl. Hayam Wuruk 310, Denpasar Bali, Indonesia	\N	4155
118	United States	-6.1810602	106.8303286	Jl. Medan Merdeka Selatan No. 3 – 5 Jakarta 10110, Indonesia	\N	3
119	United States	51.46297835054143	35.77150833252614	Embassy of Switzerland Foreign Interests Section No. 39, Shahid Mousavi (Golestan 5th) Corner of Paidarfard St. (ex-Amir Ebrahimi St.) Pasdaran, Tehran	\N	20
120	United States	-6.235819384753993	53.33027878361655	42 Elgin Road Ballsbridge Dublin 4	\N	346
121	United States	35.22292081605138	31.748239681294894	14 David Flusser Street Jerusalem 9378322	\N	380
122	United States	11.238509414763548	43.77365535265248	Lungarno Vespucci, 38 50123 Firenze	\N	4156
123	United States	9.191923814832595	45.47510094073826	via Principe Amedeo, 2/10 20121 MILANO	\N	4157
124	United States	12.488580514690454	41.90658577161134	via Vittorio Veneto 121 00187 Roma	\N	183
125	United States	14.223740714649724	40.83118183825395	Piazza della Repubblica 80122 NAPOLI	\N	4158
126	United States	-73.56562254934164	45.4997256789988	999 Robert-Bourassa Blvd. Montreal, (Quebec), Canada H3C 5J9	\N	4159
127	United States	-76.76704555003995	18.01845898764298	142 Old Hope Road Kingston 6 Jamaica, West Indies	\N	401
128	United States	35.1728083	136.8901895	Nagoya International Center Bldg. 6F 1-47-1 Nagono, Nakamura-ku, Nagoya 450-0001	\N	4160
129	United States	35.6688048	139.743326	1-10-5 Akasaka Minato-ku, Tokyo 107-8420 JAPAN	\N	2
130	United States	43.056348	141.313697	Kita 1-jo Nishi 28-chome, Chuo-ku Sapporo 064-0821, Japan	\N	4161
131	United States	26.2528989	127.7386313	U.S. Consulate General Naha 2-1-1 Toyama, Urasoe City, Okinawa	\N	540
132	United States	34.69680330000001	135.501877	2-11-5, Nishitenma Kita-ku, Osaka 530-8543	\N	4162
133	United States	33.5881047	130.3730286	5-26 Ohori 2-chome Chuo-ku Fukuoka 810-0052	\N	4163
134	United States	35.87836691444528	31.945183933239388	Abdoun, Al-Umawyeen St. Amman – Jordan	\N	123
135	United States	71.46579625065156	51.1294235459901	Rakhymzhan Koshkarbayev Avenue, No. 3. Astana, Kazakhstan, 010010	\N	4164
136	United States	76.95201335031406	43.233638987376175	Samal-2, 97 Zholdasbekov Street, Almaty, Kazakhstan, 050051	\N	255
137	United States	36.80837041539531	-1.2339764990999562	United Nations Avenue Nairobi P. O. Box 606 Village Market 00621 Nairobi, Kenya	\N	50
138	United States	21.150551	42.661995	Arberia/Dragodan, Nazim Hikmet 30 Pristina, Kosovo	\N	433
139	United States	48.046873	29.291608	P. O. Box 77 Safat 13001 Kuwait	\N	172
140	United States	74.582561	42.827776	171 Prospect Mira Bishkek 720016 Kyrgyz Republic	\N	4165
141	United States	17.8979735	102.6387695	Ban Somvang Thai Thadeua Road, Km 9 Hatsayfong district	\N	390
142	United States	24.02705041558279	56.93049718088476	1 Samnera Velsa St. (former Remtes) Riga LV-1510 Latvia	\N	399
143	United States	33.9346943	35.5978345	Awkar-Facing the Municipality, Main Street Beirut, Lebanon	\N	413
144	United States	27.4716083825458	-29.310221109186767	P.O. Box 333 Maseru 100 Lesotho	\N	419
145	United States	-10.81559835039078	6.316462995406253	502 Benson Street Monrovia	\N	372
146	United States	10.267989315205188	36.85042547993822	Please direct inquiries regarding U.S. citizens in Libya	\N	361
147	United States	25.248973383902904	54.68340487076181	Akmenų g. 6 Vilnius, Lithuania	\N	403
148	United States	6.129033	49.618971	22 Boulevard Emmanuel Servais L-2535 Luxembourg	\N	448
149	United States	47.475350450205234	-18.852531787153804	Lot 207 A – Andranoro – Antehiroka 105 Antananarivo – Madagascar	\N	4166
150	United States	47.47535581475583	-18.852526710574914	Lot 207 A – Andranoro – Antehiroka 105 Antananarivo – Madagascar	\N	4167
151	United States	33.78358595013342	-13.962459990163342	P.O Box 30016 16 Jomo Kenyatta Road, Lilongwe 3, Malawi	\N	388
152	United States	3.1556223	101.7229636	376 Jalan Tun Razak 50400 Kuala Lumpur	\N	28
153	United States	79.848618	6.913233	210 Galle Road Colombo 03 Sri Lanka	\N	4168
154	United States	-8.021094985993539	12.629849291080781	ACI 2000 Rue 243, Porte 297 Bamako, Mali	\N	245
155	United States	14.424656115526965	35.89065722606469	Ta’ Qali National Park Attard, ATD 4000	\N	487
156	United States	7.066667	171.266667	Mejen Weto, Ocean Side Majuro, Marshall Islands	\N	473
157	United States	-15.992307828442954	18.087209723782	288, rue 42-100, (rue Abdallaye) BP 222, Nouakchott, Mauritania	\N	366
158	United States	57.49828105022801	-20.161990586407807	4th Floor, Rogers House John Kennedy Avenue P.O. Box 544 Port Louis Republic of Mauritius	\N	441
159	United States	19.428387	-99.1663299	Paseo de la Reforma 305 Colonia Cuauhtemoc 06500 Mexico, D.F.	\N	9
160	United States	20.6734316	-103.3669868	Progreso 175 Col. Americana Codigo Postal 44160 Guadalajara, Jalisco, Mexico	\N	4169
161	United States	29.0785051	-110.958953	141 Monterey Street Col. Esqueda, C.P. 83000 Hermosillo, Sonora, Mexico	\N	4170
162	United States	25.8867588	-97.5031726	Calle Constitución No. 1 Colonia Jardín Matamoros, Tamaulipas 87330	\N	1333
163	United States	-89.619838	20.9870725	Calle 60 No. 338-K x 29 y 31 Col. Alcala Martin Merida, Yucatan, Mexico	\N	4171
164	United States	32.5257154	-116.9552129	Paseo de las Culturas s/n Mesa de Otay Delegación Centenario C.P. 22425 Tijuana, Baja California	\N	4172
165	United States	27.4652804	-99.50001859999999	Paseo Colon 1901 Colonia Madero Nuevo Laredo, Tamaulipas 88260	\N	520
166	United States	31.2886516	-110.9400018	Calle San José s/n Fraccionamiento los Alamos C. P. 84065 Nogales, Sonora	\N	4173
167	United States	6.9641667	158.2083333	P.O. Box 1286 Kolonia, Pohnpei FSM 96941	\N	4174
168	United States	28.818999	47.021521	103 Mateevici street Chisinau MD-2009 Republic of Moldova	\N	398
169	United States	19.24739101507193	42.43683063824326	Dzona Dzeksona 2 81000 Podgorica Montenegro	\N	439
170	United States	-7.626588	33.590838	8, Bd Moulay Youssef Casablanca	\N	106
171	United States	-6.824677	33.955802	Km 5.7, Avenue Mohamed VI Souissi, Rabat 10170, Morocco	\N	402
172	United States	32.59812465034629	-25.95961148346652	Av. Kenneth Kaunda, 193 Caixa Postal, 783	\N	343
173	United States	17.08486131483526	-22.57561503181287	14 Lossen Street Windhoek, Namibia	\N	421
174	United States	85.33419511592635	27.7381749307414	Embassy of the United States of America Maharajgunj, Kathmandu, Nepal	\N	375
175	United States	4.882063	52.356181	Museumplein 19 1071 DJ Amsterdam The Netherlands	\N	383
176	United States	4.882063	52.356181	Museumplein 19 1071 DJ Amsterdam The Netherlands	\N	383
177	United States	-68.92806705015425	12.108160536469793	P.O. Box 158 J.B. Gorsiraweg 1	\N	4175
178	United States	-41.27268919999999	174.7788378	29 Fitzherbert Terrace Thorndon Wellington 6011 New Zealand	\N	412
179	United States	-36.8451345	174.7675626	Level 3, 23 Customs Street East Auckland 1010 New Zealand	\N	296
180	United States	-86.31586246301268	12.128777470319303	Kilometer 5.5 Carretera Sur Managua, Nicaragua	\N	371
181	United States	2.070800850759912	13.526350006074725	BP 11201 Niamey, Niger	\N	370
182	United States	6.4410754	3.4069013	2 Walter Carrington Crescent, Victoria Island, Lagos STOP(234)-1- 460-3600 or (234)-1- 460-3400	\N	17
183	United States	7.474317950082293	9.040513693481035	Plot 1075 Diplomatic Drive Central District Area, Abuja, Nigeria	\N	339
184	United States	21.354850713788924	41.99919648679228	Str. “Samoilova” Nr.21 1000 Skopje Republic of North Macedonia	\N	4176
185	United States	10.668108116097063	59.93978108187661	Morgedalsvegen 36 0378 Oslo Norway	\N	393
186	United States	4.3820756509457235	50.85828708481113	Boulevard Leopold III 1110 Brussels, Belgium	\N	4177
187	United States	23.5994813	58.45443629999999	P.C. 115 Madinat Al Sultan Qaboos Muscat, Oman	\N	304
188	United States	-77.05170868456409	38.89443515472371	U.S. Department of State 2201 C Street, NW Room 5914 Washington, D.C. 20515	\N	4178
189	United States	2.314880050761391	48.86830080786213	18, avenue Gabriel 75008 Paris	\N	4179
190	United States	71.53478281438282	34.00574362762821	11, Hospital Road, Peshawar, Pakistan	\N	4180
191	United States	73.1158063143739	33.72392364240929	Diplomatic Enclave, Ramna 5 Islamabad, Pakistan	\N	374
192	United States	67.00740971413214	24.84119765214914	Plot 3, 4, 5, New TPX Area Mai Kolachi Road, Karachi	\N	19
193	United States	74.33401361430799	31.5601682523353	50, Shahrah-e-Abdul Hameed Bin Badees, (Old Empress Road) near Shimla Hill, Lahore, Pakistan	\N	4181
194	United States	7.364184199999999	134.5360667	Airai State, in an area known as Omsangel (no street address) P.O. Box 6028 Koro, Palau	\N	4182
195	United States	-79.56283808497368	8.998702891939903	Building 783, Demetrio Basilio Lakas Avenue Clayton, Panama	\N	382
196	United States	-9.443800399999999	147.1802671	Embassy of the United States of America P.O. Box 1492 Port Moresby, Papua New Guinea	\N	417
197	United States	-57.62816948465239	-25.28548103339301	1776 Mariscal Lopez Avenue Asunción, Paraguay	\N	4183
198	United States	-76.97117538535889	-12.100416646195017	Avenida La Encalada cdra. 17 s/n Surco, Lima 33, Peru	\N	25
199	United States	14.5791844	120.9781407	1201 Roxas Boulevard Manila, Philippines	\N	5
200	United States	19.939102899999998	50.060064399999995	ul. Stolarska 9 31-043 Krakow	\N	4184
201	United States	16.927380015922793	52.407795452290735	ul. Paderewskiego 8 61-770 Poznan	\N	4185
202	United States	21.023320999999996	52.224495	Aleje Ujazdowskie 29/31 00-540 Warsaw Poland	\N	266
203	United States	-25.71346686956659	37.74504219110972	Avenida Príncipe do Mónaco, 6-2 F 9500 Ponta Delgada	\N	4186
204	United States	-9.16557018495388	38.74412016357007	Avenida das Forças Armadas 1600-081 Lisboa	\N	406
205	United States	51.471328	25.303604000000004	22nd February Street Al Luqta District P.O. Box 2399 Doha, Qatar	\N	320
206	United States	-13.8309477	-171.7699055	5th Floor ACC Building Matafele Apia, Samoa	\N	466
207	United States	12.490769	41.906582	Lungarno Amerigo Vespucci, 38 50123 Florence, Italy	\N	495
208	United States	46.61878331499943	24.68122498413883	P.O. Box 94309 Riyadh 11693 Saudi Arabia	\N	33
209	United States	50.15211701444141	26.304454792343083	P.O. Box 38955 Dhahran Airport 31942 Saudi Arabia	\N	4187
210	United States	39.16193271434716	21.526284675984353	Falastin Al-Hamra’a Jeddah 23323, Saudi Arabia	\N	4188
211	United States	-17.516996741291123	14.704710009473104	Route des Almadies Dakar, Senegal	\N	353
212	United States	20.45105495060411	44.77249378724876	92 Bulevar kneza Aleksandra Karadjordjevica 11040 Belgrade, Serbia	\N	310
213	United States	-13.23203054992229	8.451653993892794	Southridge – Hill Station Freetown, Sierra Leone	\N	379
214	United States	1.3052732	103.820494	27 Napier Road Singapore	\N	46
215	United States	17.10578371527176	48.141287658882085	814 99 Bratislava Slovak Republic	\N	409
216	United States	14.496689950651993	46.05241020192026	Prešernova 31 1000 Ljubljana Slovenia	\N	425
217	United States	45.23645220478228	2.0591992551702303	Mogadishu, Somalia	\N	4189
218	United States	18.431694999999998	-34.0752867	2 Reddam Ave Westlake 7945	\N	408
219	United States	28.223374	-25.745777999999998	877 Pretorius St Arcadia, Pretoria	\N	392
220	United States	28.0516737	-26.111556899999997	1 Sandton Drive Sandhurst	\N	102
221	United States	31.01125499999999	-29.843728000000002	303 Dr. Pixley KaSeme Street 31st Floor Delta Towers Durban 4001	\N	4190
222	United States	37.5731872	126.9780536	188 Sejong-daero, Jongno-gu, Seoul, Korea 03141	\N	8
223	United States	31.58386391452658	4.855650541647085	Kololo Road adjacent to the European Union’s compound Juba, South Sudan	\N	416
224	United States	2.1152034151191756	41.397786603313826	Paseo Reina Elisenda de Montcada, 23 08034 Barcelona, España	\N	4191
225	United States	-3.6889362849103784	40.434621362475525	Calle de Serrano, 75 28006 Madrid, Spain	\N	39
226	United States	79.848618	6.913233	210 Galle Road Colombo 03 Sri Lanka	\N	391
227	United States	32.60541621518638	15.526150789218434	P.O. Box 699 Kilo 10, Soba Khartoum, Sudan	\N	31
228	United States	-84.36444565058818	21.403015973191792	Kristalstraat 165 Paramaribo, Suriname	\N	431
229	United States	18.10333961607249	59.33347178166029	Dag Hammarskjölds Väg 31, SE-115 89 Stockholm	\N	377
230	United States	7.438283	46.943433	Sulgeneckstrasse 19 CH-3007 Bern, Switzerland	\N	444
231	United States	7.438283	46.943433	In Care Of: Sulgeneckstrasse 19 CH-3007 Bern, Switzerland	\N	4192
232	United States	36.280863	33.521751	Abou Roumaneh, 2 Al Mansour Street Damascus, Syria	\N	269
233	United States	22.6048844	120.3017528	5F, No.88, Chenggong 2nd Road Qianzhen Dist.,Kaohsiung 80661 Taiwan	\N	4193
234	United States	25.0807732	121.5982727	No. 100, Jinhu Road, Neihu District 11461, Taipei City, Taiwan	\N	4194
235	United States	68.70998205039008	38.579469073127456	109-A, Ismoili Somoni Avenue (Zarafshon district) Dushanbe, Tajikistan	\N	387
236	United States	39.26846387313328	-6.774595980412405	686 Old Bagamoyo Road, Msasani Dar es Salaam, Tanzania	\N	34
237	United States	18.8160541	98.9848536	387 Witchayanond Road Chiang Mai 50300, Thailand	\N	4195
238	United States	13.7359432	100.5472008	95 Wireless Road Bangkok 10330, Thailand	\N	14
239	United States	-8.5483237	125.568763	Avenida de Portugal Praia dos Coqueiros Dili, Timor-Leste	\N	432
240	United States	-56.219030065505436	21.555755676518146	Boulevard Eyadema B.P. 852, Lomé STOP(+228) 2261 5470 Fax:(+228) 2261 5501	\N	4196
241	United States	-18.1440472	178.4244407	31 Loftus Street Suva, Fiji	\N	4197
242	United States	-61.516947	10.665985	15 Queen’s Park West Port of Spain Trinidad and Tobago	\N	4198
243	United States	10.267989315205188	36.85042547993822	Les Berges du Lac 1053 TUNIS Tunisia	\N	367
244	United States	29.0443211154174	41.11749587928979	İstinye Mahallesi, Üç Şehitler Sokak No.2 İstinye 34460 – Istanbul / Turkey	\N	18
245	United States	32.8539583150804	39.908225094332444	110 Atatürk Blvd. Kavaklıdere, 06100 Ankara – Turkey	\N	52
246	United States	35.3848218149961	36.98352556505883	Girne Bulvari No:212 Guzelevler Mah. Yuregir, Adana – TÜRKİYE	\N	4199
247	United States	58.389301	37.901274	9 1984 Street (formerly Pushkin Street) Ashgabat, Turkmenistan	\N	369
248	United States	6.135919716184857	46.23200668990151	111 Route de Pregny 1292 Geneva, Switzerland	\N	4200
249	United States	12.489735615141493	41.907876971529674	via Boncompagni 2 Rome, Italy	\N	4201
250	United States	55.30697651471662	25.258485535410205	Corner of Al Seef Rd. and Sheikh Khalifa bin Zayed Rd. Dubai, U.A.E	\N	207
251	United States	54.43151831470147	24.424386568611762	Airport Road at Rabdan (29th) Street Embassies District, Plot 38, Sector W59-02, Street No. 4 Abu Dhabi, U.A.E.	\N	376
252	United States	-0.13292556417568116	51.482433064228786	33 Nine Elms Lane London SW11 7US (mailing postcode) or SW8 5DB (driving/GPS postcode) United Kingdom	\N	4202
253	United States	-56.178309884825005	-34.91348698146105	Lauro Müller 1776 Montevideo, Uruguay	\N	317
254	United States	-5.9422437	54.5705791	Danesfort House 223 Stranmillis Road Belfast BT9 5GR	\N	4203
255	United States	-3.1778503	55.954306900000006	3 Regent Terrace Edinburgh EH7 5BW	\N	4204
256	United States	-66.87527058414291	10.477699892524667	F St. and Suapure St. Urb . Colinas de Valle Arriba Caracas, Venezuela	\N	252
257	United States	44.22766864987787	15.373056861749312	Address: Sa’awan Street P.O. Box 22347	\N	4205
258	United States	28.336325609106442	-15.419044901073296	Eastern end of Kabulonga Road Ibex Hill Lusaka, Zambia	\N	274
259	United States	31.05263	-17.83151	172 Herbert Chitepo Ave Harare, Zimbabwe	\N	234
260	Canada	37.74324	-25.66968	Rua D’Agua, 28, 9500-016 Ponta Delgada, São Miguel, Azores, Portugal	\N	4206
261	Canada	38.72104	-9.1458	Avenida da Liberdade 196-200, 3rd Floor, 1269-121 Lisbon, Portugal	http://www.portugal.gc.ca	406
262	Canada	41.327546	19.818698	Rr. Ibrahim Rugova,  ND 41, H7, Kati5, Tirana, Albania	http://www.portugal.gc.ca	410
263	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	183
264	Canada	36.76148	3.0166	18 Mustapha Khalef St., Ben Aknoun, Algiers, Algeria	http://www.algeria.gc.ca	145
265	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	39
266	Canada	-8.819391	13.244298	Rua Rei Katyavala 113, Luanda, Angola	http://www.spain.gc.ca	27
267	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	234
268	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
269	Canada	17.131657	-61.836037	#12 Village Walk Commercial Center, Friars Hill Road, St. John’s, Antigua	http://www.barbados.gc.ca	4207
270	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
271	Canada	-34.58005	-58.3978	Tagle 2828, C1425EEH Buenos Aires, Argentina	http://www.argentina.gc.ca	15
272	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	13
273	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
274	Canada	-33.86164	151.2071	Level 5, Quay West Building, 111 Harrington Street, Sydney, NSW 2000, Australia	http://www.australia.gc.ca	64
275	Canada	48.21076	16.37836	Laurenzenberg 2, A-1010, Vienna, Austria	http://www.austria.gc.ca	256
276	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	52
277	Canada	25.06	-77.345	Shirley Street Plaza, Nassau, Bahamas	http://www.turkey.gc.ca	4101
278	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	401
279	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	33
280	Canada	23.79979	90.4185	United Nations Road, Baridhara, Dhaka, Bangladesh	http://www.bangladesh.gc.ca	16
281	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
282	Canada	52.22477	21.02602	ul. Jana Matejki 1/5, 00-481, Warsaw, Poland	http://www.poland.gc.ca	266
283	Canada	50.84003	4.39781	Avenue des Arts 58, 1000, Brussels, Belgium	http://www.belgium.gc.ca	271
284	Canada	14.59704	-90.50452	Edyma Plaza Building, 8th Floor, 13 Calle 8-44, Zona 10, Guatemala City, Guatemala	http://www.guatemala.gc.ca	212
285	Canada	12.369416	-1.516655	316 Professeur Ki-Zerbo Street, Ouagadougou, Burkina Faso	http://www.burkinafaso.gc.ca	280
286	Canada	32.381695	-64.677982	Stewart Hall, 5 Queen Street, St. George, GE 05, Bermuda	https://www.canada.ca/Canada-In-New-York	4208
287	Canada	40.75368	-73.974423	466 Lexington Avenue, 20th Floor, New York, New York, U.S.A., 10017	https://www.canada.ca/Canada-In-New-York	12
288	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	443
289	Canada	-17.46667	-68.93333	2678, Calle Victor Sanjinez, Edificio Barcelona, 2nd Floor, Plaza España (Sopocachi), La Paz, Bolivia	http://www.canada.ca/CanadaAndIndia	184
290	Canada	-12.120851	-77.035953	Calle Bolognesi 228, Miraflores, Lima 15074, Peru	http://www.peru.gc.ca	25
291	Canada	48.21076	16.37836	Laurenzenberg 2, A-1010, Vienna, Austria	http://www.austria.gc.ca	256
292	Canada	-24.67857	25.927319	9th floor, iTowers North, Lot 54368 Gaborone	http://www.austria.gc.ca	430
293	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	234
294	Canada	-15.815613	-47.878642	SES - Av. das Nações, Quadra 803, Lote 16, 70410-900 Brasília, DF, Brazil	http://www.brazil.gc.ca	4106
295	Canada	-19.93679	-43.92222	SES - Av. das Nações, Quadra 803, Lote 16, 70410-900 Brasília, DF, Brazil	http://www.brazil.gc.ca	4209
296	Canada	-22.964916	-43.173957	Av. Atlântica 1130, 13º andar, Copacabana, 22021-000 Rio de Janeiro - RJ, Brazil	http://www.brazil.gc.ca	4210
297	Canada	-23.609325	-46.697676	Centro Empresarial Nações Unidas - Torre Norte, Av. das Nações Unidas, 12901, 16º andar, 04578-000 São Paulo - SP, Brazil	http://www.brazil.gc.ca	7
298	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
299	Canada	4.887292	114.943692	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.brunei.gc.ca	462
300	Canada	42.696228	23.316952	7 Pozitano Street, Block #3, 1st Floor, Office #4, 1000 Sofia, Bulgaria	http://www.brunei.gc.ca	314
301	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	259
302	Canada	12.369416	-1.516655	316 Professeur Ki-Zerbo Street, Ouagadougou, Burkina Faso	http://www.burkinafaso.gc.ca	280
303	Canada	-3.37166	29.3565	Hôtel Club du Lac Tanganyika, Chaussée d’Uvira, Bujumbura, Burundi	http://www.burkinafaso.gc.ca	395
304	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	50
305	Canada	11.579752	104.912604	27-29 Street 75, Sangkat Srah Chak, Khan Daun Penh, Phnom Penh, Cambodia	http://www.canadainternational.gc.ca/kenya/	237
306	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	14
307	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	213
308	Canada	4.04749	9.70637	90 Avenue Douala Manga Bell, Bonanjo, Douala	http://www.canadainternational.gc.ca/cameroon-cameroun/	4211
309	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	353
310	Canada	19.332905	-81.37997	1st Floor Landmark Square, 64 Earth Close, Seven Mile Beach, Cayman Islands	http://www.senegal.gc.ca	4212
311	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	401
312	Canada	4.3617	18.55598	Cabinet ARC, Bangui, Central African Republic	http://www.jamaica.gc.ca	381
313	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	213
314	Canada	12.134846	15.055741	3602, Avenue Ngarta Tombalbaye, door 586, N'Djamena, Chad	http://www.canadainternational.gc.ca/cameroon-cameroun/	4213
315	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	213
316	Canada	-33.416678	-70.605389	Nueva Tajamar 481, Torre Norte, 12th Floor, Las Condes, Santiago, Chile	http://www.chile.gc.ca	32
317	Canada	39.94164	116.44616	Consular Section, 19 Dongzhimenwai Dajie, Chaoyang District, Beijing 100600, China	http://www.china.gc.ca	10
318	Canada	29.55725	106.57394	Room 1705, Metropolitan Tower, Wu Yi Lu, Yu Zhong District, Chongqing 400010, China	www.china.gc.ca	4214
319	Canada	23.14033	113.26022	26/F, TaiKoo Hui Tower 1, 385 Tianhe Road, Tianhe District, Guangzhou, China, 510620	http://www.china.gc.ca	4121
320	Canada	31.222252	121.44395	ECO City Building, 8th floor, 1788 Nanjing Xi Lu - Jing An District, Shanghai, 200040, China	http://www.china.gc.ca	6
321	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	26
322	Canada	10.403862	-75.553888	Edificio Centro Ejecutivo Bocagrande, Carrera 3, No. 8-129, Oficina No. 1103, Cartagena, Colombia	http://www.colombia.gc.ca	4215
323	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	4216
324	Canada	-4.315966	15.276362	17, avenue Pumbu, Commune de Gombe, Kinshasa, Congo (Kinshasa)	http://www.canadainternational.gc.ca/congo/	4217
325	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	424
326	Canada	45.81723	15.95733	Prilaz Gjure Dezelica 4, 10000 Zagreb, Croatia	http://www.croatia.gc.ca	386
327	Canada	23.11783	-82.423445	Calle 30, No. 518 esquina a 7ma, Miramar, Havana, Cuba	www.cuba.gc.ca	236
328	Canada	21.125	-75.82889	Hotel Atlantico, Suite 1, Guardalavaca, Holguín, Cuba	www.cuba.gc.ca	4218
329	Canada	35.166503	33.358065	15 Themistocles Dervis Street, 1066 Nicosia, Cyprus	www.cuba.gc.ca	420
330	Canada	37.97739	23.749223	48 Ethnikis Antistaseos Street, Chalandri, 152 31, Athens, Greece	http://www.greece.gc.ca	394
331	Canada	50.09847	14.40626	Ve Struhach 95/2, 160 00 Prague 6, Czech Republic	http://www.czechrepublic.gc.ca	4127
332	Canada	55.67977	12.58216	Kristen Bernikowsgade 1, 1105 Copenhagen K., Denmark	http://www.denmark.gc.ca	400
333	Canada	11.82514	42.59028	Place Lagarde, Djibouti	http://www.canadainternational.gc.ca/ethiopia-ethiopie/index.aspx?lang=eng	405
334	Canada	8.995726	38.73621	Old Airport Area, Nefas Silk Lafto Sub City, Kebele 04, House No.122, Addis Ababa, Ethiopia	http://www.canadainternational.gc.ca/ethiopia-ethiopie/	166
335	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
336	Canada	18.469616	-69.939394	Av. Winston Churchill 1099, Torre Citigroup en Acropólis Center,  18th Floor, Ensanche Piantini, Santo Domingo, Dominican Republic	www.dominicanrepublic.gc.ca	201
337	Canada	18.613468	-68.403969	Carretera Veron- Bavaro Km. 2,5, Amstar Business Center, Building 5, Suite 521, Punta Cana, Dominican Republic	www.dominicanrepublic.gc.ca	4219
338	Canada	19.796819	-70.690316	Calle Villanueva No. 8, Edificio Abraxas, Puerto Plata, Dominican Republic	www.dominicanrepublic.gc.ca	4220
339	Canada	-0.173957	-78.48547	Av. Amazonas N37-29 and Union Nacional de Periodistas, Eurocenter Building, 3rd Floor (one block north of the Supreme Court Building, near Amazonas and United Nations), Quito, Ecuador	http://www.ecuador.gc.ca	246
340	Canada	-2.166869	-79.896377	Avenida Francisco de Orellana, Number 234, Blue Towers Building, 6th Floor, Office 604, Guayaquil, Ecuador	http://www.ecuador.gc.ca	190
341	Canada	30.072131	31.227967	Nile City Towers, 2005 (A) Corniche El Nile, South Tower, 18th floor 11221	https://www.Canada.ca/Canada-And-Egypt	11
342	Canada	13.731	-89.161	Centro Financiero Gigante, Tower A, Lobby 2, Alameda Roosevelt and 63 Avenue S, Colonia Escalón, San Salvador, El Salvador	http://www.elsalvador.gc.ca	404
343	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	339
344	Canada	15.333333	38.933333	Abeneh Street 745, House No. 152/154, Tiravolo, Asmara, Eritrea	http://www.canadainternational.gc.ca/nigeria/	378
345	Canada	15.59715	32.537652	29 Africa Road, Block 56, Khartoum 1, Sudan	http://www.canadainternational.gc.ca/sudan-soudan/	31
346	Canada	59.436744	24.737378	Toom Kooli 13, 2nd Floor, 15186 Tallinn, Estonia	https://www.Canada.ca/Canada-And-Estonia	407
347	Canada	8.995726	38.73621	Old Airport Area, Nefas Silk Lafto Sub City, Kebele 04, House No.122, Addis Ababa, Ethiopia	http://www.canadainternational.gc.ca/ethiopia-ethiopie/	166
348	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
349	Canada	60.1679	24.94848	Pohjoisesplanadi 25B, 00100 Helsinki, Finland	http://www.finland.gc.ca	396
350	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
351	Canada	45.764962	4.836703	3, place de la Bourse 69002 Lyon, France	http://www.france.gc.ca	4135
352	Canada	43.700804	7.269396	37, boulevard Dubouchage – 1st floor, 06000 Nice, France	http://www.france.gc.ca	4221
353	Canada	48.862725	2.287592	59, allées Jean-Jaurès, 31000 Toulouse, France	http://www.france.gc.ca	4138
354	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
355	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
356	Canada	-22.27055	166.4426	Immeuble Norwich, Level 2, 11 Georges Baudoux Street, Artillerie, Noumea, New Caledonia	http://www.france.gc.ca	454
357	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
358	Canada	0.39084	9.45364	Quartier Batterie IV, Pont de Gué-Gué (1st street behind the European Union office), Libreville, Gabon	http://www.newzealand.gc.ca	385
359	Canada	3.899147	11.5100673	Les Colonnades building, Bastos, Yaoundé, Cameroon	http://www.cameroon.gc.ca	213
360	Canada	13.47402	-16.69271	48 Atlantic Road, Fajara, Banjul, The Gambia	http://www.cameroon.gc.ca	471
361	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	353
362	Canada	41.701391	44.794189	34 Rustaveli Avenue, Third Floor, Tbilisi, Georgia, 0108	http://www.senegal.gc.ca	362
363	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	52
364	Canada	52.51044	13.3776	Leipziger Platz 17, 10117 Berlin, Germany	http://www.germany.gc.ca	136
365	Canada	51.22327	6.77467	Benrather Strasse 8, 40213 Düsseldorf, Germany	http://www.germany.gc.ca	4140
366	Canada	48.13569	11.58082	Tal 29, 80331 Munich, Germany	http://www.germany.gc.ca	4142
367	Canada	48.81332	9.17843	Leitzstrasse 45, 70469 Stuttgart, Germany	http://www.germany.gc.ca	4222
368	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	222
369	Canada	37.97739	23.749223	48 Ethnikis Antistaseos Street, Chalandri, 152 31, Athens, Greece	http://www.greece.gc.ca	394
370	Canada	40.63401	22.9369	19, N. Kountouriotou Street, 546 25, Thessaloniki, Greece	http://www.greece.gc.ca	4144
371	Canada	64.1755	-51.74619	Tuapannguit 48, 3900 Nuuk, Greenland	http://www.greece.gc.ca	481
372	Canada	55.67977	12.58216	Kristen Bernikowsgade 1, 1105 Copenhagen K., Denmark	http://www.denmark.gc.ca	400
373	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
374	Canada	16.265	-61.551	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	4223
375	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
376	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.france.gc.ca	4224
377	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
378	Canada	14.59704	-90.50452	Edyma Plaza Building, 8th Floor, 13 Calle 8-44, Zona 10, Guatemala City, Guatemala	http://www.guatemala.gc.ca	212
379	Canada	9.53298	-13.69048	Residence Micheline Bloc B 1er Étage Apt 202, Camayenne, Commune de Dixinn, Conakry, Republic of Guinea	http://www.guatemala.gc.ca	277
380	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	353
381	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	353
382	Canada	6.82328	-58.15962	High and Young Streets, Georgetown, Guyana	http://www.guyana.gc.ca	434
383	Canada	18.540347	-72.297276	Delmas Road, between Delmas 75 and 71, Port-au-Prince	http://www.haiti.gc.ca	373
384	Canada	22.287647	114.213278	9th Floor, 25 Westlands Road, Quarry Bay, Hong Kong SAR, China	http://www.hongkong.gc.ca	4225
385	Canada	14.088764587915215	-87.1787828207016	Plaza Ficohsa, 3rd Floor, Boulevard San Juan Bosco, Colonia Payaquí, Tegucigalpa, Honduras	http://www.hongkong.gc.ca	360
386	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	424
387	Canada	47.5109	19.036961	Ganz utca 12-14, 1027 Budapest, Hungary	http://www.hungary.gc.ca	272
388	Canada	64.147899	-21.945141	14 Tungata, 101 Reykjavik, Iceland	https://www.canadainternational.gc.ca/iceland-islande/	4148
389	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	443
390	Canada	13.012526	77.556032	World Trade Center, 22nd Floor, 26/1, Dr. Rajkumar Road, Malleshwaram West, Yeshwantpur, Bangalore 560055, Karnataka, India	http://www.canada.ca/CanadaAndIndia	4226
391	Canada	30.743959	76.784088	C413-C416, 4th Floor, Elante Office Complex, Plot No. 178-178A,  Industrial & Business Park, Phase 1, Chandigarh 160002, India	http://www.canada.ca/CanadaAndIndia	4227
392	Canada	22.579376	88.349845	Duncan House, 31 Netaji Subhas Road, Kolkata 700 001, India	http://www.canada.ca/CanadaAndIndia	4228
393	Canada	19.00987	72.83558	One International Centre, Tower 2, 21st Floor, Senapati Bapat Marg, Elphinstone Road West, Mumbai 400 013, India	http://www.canada.ca/CanadaAndIndia	4229
394	Canada	-6.21516	106.8204	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	3
395	Canada	-8.67006	115.22838	Jalan Tantular No. 32, Renon, Denpasar, Bali, Indonesia	https://bali.indonesia.embassy.gov.au/	4155
396	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	52
397	Canada	33.312	44.395	British Embassy Compound, International Zone, Baghdad, Iraq	https://www.Canada.ca/Canada-And-Iraq	44
398	Canada	36.187525	43.973936	Rotana Hotel, Gulan Street, Erbil, Iraq	https://www.canada.ca/Canada-And-Iraq	4230
399	Canada	53.333536	-6.248976	7-8 Wilton Terrace, Dublin 2, Ireland	https://www.Canada.ca/Canada-And-Ireland	346
400	Canada	32.06242	34.79066	Canada House, 3/5 Nirim Street, 4th Floor, Tel Aviv 67060, Israel	http://www.israel.gc.ca	4231
401	Canada	31.899636	35.204223	12 Elias Odeh Street, Ramallah, West Bank	http://www.westbankandgaza.gc.ca	4232
402	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	183
403	Canada	45.4728864	9.1948976	3, Piazza Cavour, 6th floor, 20121 Milan, Italy	http://www.italy.gc.ca	4157
404	Canada	5.31778	-4.0161	Immeuble Trade Centre, 23 avenue Noguès, Le Plateau, Abidjan, Côte d'Ivoire	http://www.canadainternational.gc.ca/cotedivoire/	4233
405	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	401
406	Canada	18.48212	-77.92932	29 Gloucester Street, Montego Bay	http://www.jamaica.gc.ca	4234
407	Canada	35.673609	139.728174	3-38 Akasaka 7-chome, Minato-ku, Tokyo, Japan, 107-8503	http://www.japan.gc.ca	2
408	Canada	33.583544	130.404485	c/o Kyushu Electric Power Co., Inc. 1-82 Watanabe-dori 2-chome, Chuo-ku, Fukuoka, Japan, 810-8720	japan.gc.ca	4163
409	Canada	34.388594	132.45584	c/o Chugoku Electric Power Co. Inc., 4-33 Komachi, Naka-ku, Hiroshima-shi, Hiroshima-ken, Japan, 730-8701	http://www.japan.gc.ca	4235
410	Canada	35.175289	136.905632	Nakato Marunouchi Building, 6F, 3-17-6 Marunouchi, Naka-ku, Nagoya-shi, Aichi-ken, Japan, 460-0002	http://www.japan.gc.ca	4160
411	Canada	34.616354	135.447783	c/o Tsuda Sangyo Co. Ltd., 1-8-19 Hirabayashi Minami, Suminoe-ku, Osaka, 559-8550, Japan	japan.gc.ca	4162
412	Canada	43.055789	141.318457	Canada Place, Poseidon Maruyama 2F, 26-1-3 Odori Nishi, Chuo-ku, Sapporo, Japan 064-0820	http://www.japan.gc.ca	4161
413	Canada	31.960588	35.881015	133 Zahran Street, Amman, Jordan	https://www.Canada.ca/Canada-And-Jordan	123
414	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	365
415	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	50
416	Canada	1.32905	172.97905	Bairiki, Tarawa, Kiribati	http://www.kiribati.embassy.gov.au/twaa/home.html	474
417	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
418	Canada	39.03031	125.80072	Munsu-dong, Taehak Street, Taedonggang District, Pyongyang, Democratic People’s Republic of Korea	https://www.swedenabroad.se/en/embassies/north-korea-pyongyang/	185
419	Canada	37.56694	126.97079	21 Jeongdong-gil (Jeong-dong), Jung-gu, Seoul (04518), Republic of Korea	http://www.korea.gc.ca	8
420	Canada	37.56694	126.97079	21 Jeongdong-gil (Jeong-dong), Jung-gu, Seoul (04518), Republic of Korea	http://www.korea.gc.ca	8
421	Canada	35.10442	128.97471	c/o Dongsung Chemical Corporation, 99 Sinsan-ro (472 Shinpyung-dong), Saha-gu, Busan, 49421, Republic of Korea	http://www.korea.gc.ca	4236
422	Canada	45.81723	15.95733	Prilaz Gjure Dezelica 4, 10000 Zagreb, Croatia	http://www.croatia.gc.ca	386
423	Canada	29.3294	48.00393	Villa 24, Block 4, 24 Al-Mutawakkal Street, Da'aiyah, Kuwait City, Kuwait	http://www.kuwait.gc.ca	172
424	Canada	42.87116	74.58326	299/5, Chingiz Aitmatov Avenue, Bishkek, 720016, Kyrgyz Republic	http://www.kuwait.gc.ca	368
425	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	365
426	Canada	17.96277	102.61443	KM4, Thadeua Road, Watnak Village,  Sisattanak District, Vientiane, Laos	http://www.kazakhstan.gc.ca	390
427	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	14
428	Canada	56.957612	24.121325	20/22 Baznicas Street, 6th Floor, Riga LV-1010, Latvia	https://www.Canada.ca/Canada-And-Latvia	399
429	Canada	33.909298	35.578156	First Floor, Coolrite Building, 43 Jal El Dib Highway (seaside), Beirut, Lebanon	http://www.lebanon.gc.ca	413
430	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	392
431	Canada	5.31778	-4.0161	Immeuble Trade Centre, 23 avenue Noguès, Le Plateau, Abidjan, Côte d'Ivoire	http://www.canadainternational.gc.ca/cotedivoire/	4233
432	Canada	36.847113	10.276961	Lot 24, rue de la Feuille d’Érable, Cité des Pins, Tunis, Tunisia	http://www.tunisia.gc.ca	367
433	Canada	46.94036	7.45753	Kirchenfeldstrasse 88, CH-3005 Bern, Switzerland	http://www.switzerland.gc.ca	444
434	Canada	54.686371	25.27891	Business Centre 2000, Jogailos St. 4, 7th Floor, Vilnius 01116, Lithuania	https://www.Canada.ca/Canada-And-Lithuania	403
435	Canada	49.37008	6.10068	51 rue Raoul Follereau, L-1529 Luxembourg	http://www.belgium.gc.ca	448
436	Canada	50.84003	4.39781	Avenue des Arts 58, 1000, Brussels, Belgium	http://www.belgium.gc.ca	271
437	Canada	22.287647	114.213278	9th Floor, 25 Westlands Road, Quarry Bay, Hong Kong SAR, China	http://www.hongkong.gc.ca	4225
438	Canada	-18.868517	47.524364	Ivandry Business Center (ex-pullman), 5th floor, Velo Rainimangalahy Street, Ivandry, Antananarivo 101	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	198
439	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	392
440	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	343
441	Canada	3.14468	101.70825	17th Floor, Menara Tan & Tan, 207 Jalan Tun Razak, 50400 Kuala Lumpur, Malaysia	http://www.malaysia.gc.ca	28
442	Canada	5.35441	100.40908	3007, Tingkat Perusahaan 5, Prai Industrial Park, 13600 Prai, Penang, Malaysia	http://www.malaysia.gc.ca	4237
443	Canada	6.9049	79.85555	33-A 5th Lane, Colombo 03, Sri Lanka	http://www.srilanka.gc.ca	391
444	Canada	12.659541	-7.962958	Immeuble Séméga, Route de Koulikoro, Commune II, Bamako, Mali	http://www.mali.gc.ca	245
445	Canada	35.899888	14.513605	Demajo House, 103 Archbishop Street (Triq L-Arcisqof), Valletta VLT 09, Malta	http://www.mali.gc.ca	487
446	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	183
447	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.italy.gc.ca	4224
448	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
449	Canada	18.09507	-15.975503	Al Khayma city center, 10 Mamadou Konaté street, 3rd floor, Nouakchott, Mauritania	http://www.france.gc.ca	366
450	Canada	33.99335	-6.8485	66 Mehdi Ben Barka Avenue, Rabat-Souissi, Morocco	http://www.morocco.gc.ca	4238
451	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	392
452	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	310
453	Canada	42.000408	21.417712	Bul. Partizanski odredi 70b, Third floor, 1000 Skopje, North Macedonia	http://www.serbia.gc.ca	4176
454	Canada	19.428712	-99.185908	Calle Schiller No. 529, Colonia Polanco, 11560 México, D.F., México	http://www.mexico.gc.ca	9
455	Canada	16.859705	-99.873603	Pasaje Diana, Avenida Costera Miguel Alemán 121, L-16, Fracc. Magallanes, 39670 Acapulco, Guerrero, México	http://www.mexico.gc.ca	4239
456	Canada	22.901506	-109.899599	Carretera Transpeninsular Km. 0.5, Local 82, Col. El Tezal, 23454 Cabo San Lucas, Baja California Sur, México	http://www.mexico.gc.ca	1110
457	Canada	21.106841	-86.764022	Centro Empresarial, Oficina E7, Blvd. Kukulcan Km. 12, Zona Hotelera, 77599 Cancún, Quintana Roo, México	http://www.mexico.gc.ca	4240
458	Canada	20.655751	-103.389528	World Trade Center, Av. Mariano Otero 1249, Torre Pacifico Piso 8, Col. Rinconada del Bosque, 44530 Guadalajara, Jalisco, México	http://www.mexico.gc.ca	4169
459	Canada	23.274546	-106.454229	Centro Comercial La Marina Business and Life, Blvd. Marina Mazatlán 2302, Office 41, Col. Marina Mazatlán, 82103 Mazatlán, Sinaloa, Mexico	http://www.mexico.gc.ca	4241
460	Canada	25.644956	-100.3603	Torre Gomez Morin 955, Ave. Gomez Morin No. 955, Suite 404, Col. Montebello, 66279 San Pedro Garza Garcia, Nuevo Léon, México	http://www.mexico.gc.ca	4242
461	Canada	20.620746	-87.078264	Plaza Paraíso Caribe, Modulo C, Planta 2, Oficina C21 - 24, Av. 10 Sur entre Calle 3 y 5 Sur, M-35, Lote 1, Colonia Centro, 77710 Playa del Carmen, Quintana Roo, México	http://www.mexico.gc.ca	4243
462	Canada	20.646788	-105.239151	Plaza Peninsula, Local Sub F, Boulevard Francisco Medina Ascencio 2485, Zona Hotelera Norte, 48300 Puerto Vallarta, Jalisco, México	http://www.mexico.gc.ca	624
463	Canada	32.520393	-117.012578	Germán Gedovius No.10411-101, Condominio del Parque, Zona Río, 22320 Tijuana, Baja California Norte, México	http://www.mexico.gc.ca	4172
464	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.mexico.gc.ca	4224
465	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
466	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	259
467	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
468	Canada	43.728344	7.413862	Le Mercator, 7, rue de l'Industrie (9th floor), 98000, Monaco	http://www.france.gc.ca	463
469	Canada	47.918157	106.920625	Sukhbaatar Square 2, Central Tower, Suite 608, Sukhbaatar District, Horoo 8, Ulaanbaatar, Mongolia	http://www.mongolia.gc.ca	308
470	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	310
471	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
472	Canada	33.99335	-6.8485	66 Mehdi Ben Barka Avenue, Rabat-Souissi, Morocco	http://www.morocco.gc.ca	4238
473	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	343
474	Canada	23.61	58.54	7th Floor, Getco Tower, Muscat, Oman	http://www.canadainternational.gc.ca/mozambique/	304
475	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	33
476	Canada	16.772558	96.158467	9th Floor, Centrepoint Towers, 65 Sule Pagoda Road, Yangon, Myanmar	https://www.Canada.ca/Canada-And-Myanmar	4244
477	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	392
478	Canada	-0.53	166.911667	MQ45 NPC OE, Aiwo District, Nauru	http://nauru.highcommission.gov.au	4245
479	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
480	Canada	27.717731	85.306019	Kaldhara Marg 20356, Khusibu, Kathmandu, Nepal	http://www.australia.gc.ca	375
481	Canada	28.58976	77.18475	7/8 Shantipath, Chanakyapuri, New Delhi 110 021, India	http://www.canada.ca/CanadaAndIndia	443
482	Canada	52.08552	4.30372	Sophialaan 7, 2514 JP The Hague, The Netherlands	http://www.netherlands.gc.ca	307
483	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
484	Canada	12.139515	-86.279466	De Los Pipitos, 2 Blocks West, El Nogal Street No. 25, Bolonia, Managua, Nicaragua	http://www.newzealand.gc.ca	371
485	Canada	9.9308209336995	-84.10252511501312	La Sabana Executive Business Centre, Building No. 5, 3rd Floor, behind the Contraloría General de la República, San José, Costa Rica	http://www.costarica.gc.ca	424
486	Canada	13.32056	2.04247	Rue KK 41 Kouara Kano, Porte 335, Niamey, Niger	http://www.costarica.gc.ca	370
487	Canada	12.659541	-7.962958	Immeuble Séméga, Route de Koulikoro, Commune II, Bamako, Mali	http://www.mali.gc.ca	245
488	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	339
489	Canada	6.434491	3.414936	4 Anifowoshe Street, Victoria Island, Lagos, Nigeria	http://www.canadainternational.gc.ca/nigeria/	17
490	Canada	4.845686	7.050609	15 Ahoada Street, Rumuibekwe Housing Estate, Port Harcourt, Nigeria	http://www.canadainternational.gc.ca/nigeria/	4246
491	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
492	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.newzealand.gc.ca	4224
493	Canada	59.91891	10.7316	Wergelandsveien 7, 0244 Oslo, Norway	http://www.norway.gc.ca	393
494	Canada	58.915001	5.729692	Olav Kyrres gate 21, Stavanger, Norway	http://www.norway.gc.ca	4247
495	Canada	33.72311	73.1039	Diplomatic Enclave, Sector G-5, Islamabad, Pakistan	http://www.pakistan.gc.ca	374
496	Canada	24.893194	67.028061	c/o Beach Luxury Hotel, Moulvi Tamiz Khan Road, Karachi, Sindh, Pakistan 74000	http://www.pakistan.gc.ca	19
497	Canada	31.54505	74.34068	102-A, Siddique Trade Centre, 72 Main Boulevard, Gulberg 111, Lahore, Punjab, Pakistan 54660	http://www.pakistan.gc.ca	4181
498	Canada	6.9608	158.2088	H & E Enterprises Building, 2nd Floor, Kolonia, Pohnpei, Micronesia	http://www.pakistan.gc.ca	4224
499	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
500	Canada	8.97683	-79.50765	Torres de Las Americas, Tower A, 11th Floor, Punta Pacifica, Panama City, Panama	http://www.panama.gc.ca	4248
501	Canada	-9.438	147.18953	Godwit Road, Waigani NCD, Port Moresby, Papua New Guinea	http://www.png.embassy.gov.au	417
502	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
503	Canada	-25.294754	-57.579378	Edificio Citicenter, Avenida Mariscal Francisco Solano López 3794 (Cruz del Chaco entrance), 5th floor, Asunción, Paraguay	http://www.australia.gc.ca	262
504	Canada	-34.58005	-58.3978	Tagle 2828, C1425EEH Buenos Aires, Argentina	http://www.argentina.gc.ca	15
505	Canada	-12.120851	-77.035953	Calle Bolognesi 228, Miraflores, Lima 15074, Peru	http://www.peru.gc.ca	25
506	Canada	14.56075	121.016443	8th Floor, Tower 2, RCBC Plaza, 6819 Ayala Avenue, Makati City, Manila, Philippines 0707	http://www.philippines.gc.ca	5
507	Canada	10.345649	123.912861	RD Corporate Center, 96 Gov. M.C. Cuenco Avenue, Cebu City 6000, Philippines	http://www.philippines.gc.ca	4249
508	Canada	52.22477	21.02602	ul. Jana Matejki 1/5, 00-481, Warsaw, Poland	http://www.poland.gc.ca	266
509	Canada	38.72104	-9.1458	Avenida da Liberdade 196-200, 3rd Floor, 1269-121 Lisbon, Portugal	http://www.portugal.gc.ca	406
510	Canada	37.021647	-7.934266	Rua Frei Lourenço de Santa Maria No. 1, 1st Floor, Apartado 79, 8000-352 Faro, Portugal	http://www.portugal.gc.ca	4250
511	Canada	37.74324	-25.66968	Rua D’Agua, 28, 9500-016 Ponta Delgada, São Miguel, Azores, Portugal	http://www.portugal.gc.ca	4206
512	Canada	18.4250387	-66.0579801	Hato Rey Center, 268 Ponce de Leon, Suite 1111, San Juan (Hato Rey), Puerto Rico, U.S.A., 00918	http://www.portugal.gc.ca	541
513	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	4251
514	Canada	25.319303	51.527986	Tornado Tower, 30th Floor, Majlis Al Taawon Street, Doha	http://www.canadainternational.gc.ca/qatar/	320
515	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
516	Canada	44.46099	26.0828	1-3 Tuberozelor Street, 011411 Bucharest, Sector 1, Romania	http://www.romania.gc.ca	259
517	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	13
518	Canada	43.127337	131.907132	707-59 Krasnogo Znameni prospekt, Vladivostok 690002, Russia	http://www.russia.gc.ca	4252
519	Canada	-1.9542	30.07272	59 KN16 Avenue, Kiyovu, Kigali, Rwanda	http://www.russia.gc.ca	355
520	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
521	Canada	14.0101	-60.99	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	457
522	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
523	Canada	46.783038	-56.172751	19, rue Docteur Dunan, 97500, Saint-Pierre, Saint-Pierre et Miquelon	http://www.France.gc.ca	4253
524	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
525	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
526	Canada	41.91534	12.50891	Via Zara 30, Rome 00198, Italy	http://www.italy.gc.ca	183
527	Canada	9.078804	7.498289	13010G, Palm close, Diplomatic drive, Central Business District, Abuja, Nigeria	http://www.canadainternational.gc.ca/nigeria/	339
528	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	33
529	Canada	21.54349	39.17299	Ali Reza Tower, 12th Floor, Medinah Road, Jeddah, Saudi Arabia	http://www.saudiarabia.gc.ca	4188
530	Canada	14.661546	-17.437567	corner of Galliéni and Amadou Cissé Dia Streets, Dakar, Senegal	http://www.senegal.gc.ca	353
531	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	4216
532	Canada	8.459018	-13.252692	1 Lewis Drive, Hill Station, Freetown, Sierra Leone	http://www.tanzania.gc.ca	379
533	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	222
534	Canada	1.28566	103.84781	One George Street, #11-01 Singapore 049145	http://www.singapore.gc.ca	46
535	Canada	48.14119	17.10945	Carlton Savoy Building, Mostova 2, 811 02 Bratislava, Slovakia	www.kanada.at	409
536	Canada	46.06758	14.524	Linhartova cesta 49a., 1000 Ljubljana, Slovenia	www.kanada.at	425
537	Canada	47.5109	19.036961	Ganz utca 12-14, 1027 Budapest, Hungary	http://www.hungary.gc.ca	272
538	Canada	-9.43038	159.94832	Corner Hibiscus Avenue and Mud Alley, Honiara, Solomon Islands	http://www.solomonislands.embassy.gov.au/honi/home.html	455
539	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
540	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	50
541	Canada	-25.74789	28.23544	1103 Arcadia Street, Hatfield, Pretoria, 0083, South Africa	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	392
542	Canada	-33.857825	18.60683	12, 2nd Avenue, Boston, Bellville, Cape Town, 7530	http://www.canadainternational.gc.ca/southafrica-afriquedusud/	408
543	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	39
544	Canada	41.38698	2.16911	Plaça de Catalunya, 9, 1º, 2ª - 08002, Barcelona, Spain	http://www.spain.gc.ca	4191
545	Canada	36.73047	-4.40021	Horizonte Building, Plaza de la Malagueta 2, 1st Floor, 29016 Málaga, Spain	http://www.spain.gc.ca	4254
546	Canada	6.9049	79.85555	33-A 5th Lane, Colombo 03, Sri Lanka	http://www.srilanka.gc.ca	391
547	Canada	15.59715	32.537652	29 Africa Road, Block 56, Khartoum 1, Sudan	http://www.canadainternational.gc.ca/sudan-soudan/	31
548	Canada	5.8139165	-55.1688636	VSH United, Van’t Hogerhuysstraat 9 – 11, Paramaribo, Suriname	http://www.canadainternational.gc.ca/sudan-soudan/	431
549	Canada	6.82328	-58.15962	High and Young Streets, Georgetown, Guyana	http://www.guyana.gc.ca	434
550	Canada	-25.95486	32.59268	Kenneth Kaunda Avenue 1138, Maputo, Mozambique	http://www.canadainternational.gc.ca/mozambique/	343
551	Canada	59.33213	18.06284	23 Klarabergsgatan, Stockholm, Sweden	http://www.sweden.gc.ca	377
552	Canada	57.698179	11.98713	Mässans gata 10, 7th floor, Gothenburg, Sweden	http://www.sweden.gc.ca	4255
553	Canada	46.94036	7.45753	Kirchenfeldstrasse 88, CH-3005 Bern, Switzerland	http://www.switzerland.gc.ca	444
554	Canada	46.22536	6.13523	5, de l'Ariana Avenue, CH-1202 Geneva, Switzerland	http://www.switzerland.gc.ca	4256
555	Canada	33.909298	35.578156	First Floor, Coolrite Building, 43 Jal El Dib Highway (seaside), Beirut, Lebanon	http://www.lebanon.gc.ca	413
556	Canada	25.038478	121.565854	6F, Hua-Hsin (Citibank building), No. 1 SongZhi Road, Xinyi District, Taipei 11047, Taiwan	https://www.canada.ca/Canada-and-Taiwan	193
557	Canada	51.136817	71.414067	Kabanbay, Batyr Street 13/1, Nur-Sultan, 010000, Kazakhstan	http://www.kazakhstan.gc.ca	365
558	Canada	-6.81345	39.29166	38 Mirambo street / Garden Avenue, Dar es Salaam, Tanzania	http://www.tanzania.gc.ca	4216
559	Canada	13.727427	100.539319	15th Floor, Abdulrahim Place, 990 Rama IV, Bangrak, Bangkok, 10500, Thailand	http://www.thailand.gc.ca	14
560	Canada	18.76743	99.02394	151 Super Highway, Tambon Tahsala, Amphur Muang, Chiang Mai, 50000, Thailand	http://www.thailand.gc.ca	4257
561	Canada	7.91045	98.367121	6th Floor CCM Complex, 77/77 Chalermprakiat Rama 9 Road (Bypass Road), Muang Phuket, Thailand	http://www.thailand.gc.ca	4258
562	Canada	5.570976	-0.190592	42 Independence Avenue, Accra, Ghana	http://www.canadainternational.gc.ca/ghana/	222
563	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
564	Canada	-21.13664	-175.19579	Salote Road, Nuku'alofa, Tonga	http://www.tonga.embassy.gov.au/nkfa/home.html	4259
565	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
566	Canada	10.67072	-61.5209	3-3A Sweet Briar Road, Maple House, St. Clair, Port of Spain, Trinidad and Tobago	http://www.trinidadandtobago.gc.ca	4260
567	Canada	36.847113	10.276961	Lot 24, rue de la Feuille d’Érable, Cité des Pins, Tunis, Tunisia	http://www.tunisia.gc.ca	367
568	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	52
569	Canada	41.08207	29.00933	209 Buyukdere Caddesi, Tekfen Tower - 16th Floor, Levent 4, Istanbul, Turkey	http://www.turkey.gc.ca	18
570	Canada	39.89212	32.85599	Cinnah Caddesi No. 58, Çankaya 06690, Ankara, Turkey	http://www.turkey.gc.ca	52
571	Canada	21.782597802984256	-72.24716070323575	#11 Caribbean Place, 1254 Leeward Highway, TKCS 1ZZ	http://www.turkey.gc.ca	4261
572	Canada	18.02169	-76.78732	3 West Kings House Road, Kingston 10, Jamaica	http://www.jamaica.gc.ca	401
573	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
574	Canada	0.31334	32.58652	Jubilee Insurance Centre, 14 Parliament Avenue, Kampala, Uganda	http://www.newzealand.gc.ca	278
575	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	50
576	Canada	50.45335	30.50647	13A Kostelna Street, Kyiv 01901, Ukraine	http://www.ukraine.gc.ca	174
577	Canada	49.83741	24.03533	2 / 4 Academika Bohomoltsia Street, Lviv 79005, Ukraine	http://www.ukraine.gc.ca	4262
578	Canada	24.497012	54.382067	Abu Dhabi Trade Towers (Abu Dhabi Mall), West Tower, 9th Floor, Abu Dhabi, United Arab Emirates	http://www.canadainternational.gc.ca/uae-eau/	376
579	Canada	25.05946	55.12781	19th Floor, Jumeirah Emirates Towers, Sheikh Zayed Road, Dubai, United Arab Emirates	http://www.canadainternational.gc.ca/uae-eau/	207
580	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	24
581	Canada	54.597285	-5.93012	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	4203
582	Canada	51.47497	-3.15195	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	4263
583	Canada	55.934225	-3.202224	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	4204
584	Canada	38.89268	-77.01848	501 Pennsylvania Avenue, N.W., Washington, D.C., U.S.A., 20001	https://www.canada.ca/Canada-In-Washington	60
585	Canada	33.7869	-84.38273	1175 Peachtree Street N.E., 100 Colony Square, Suite 1700, Atlanta, Georgia, U.S.A., 30361-6205	https://www.canada.ca/Canada-In-Atlanta	4264
586	Canada	42.34749	-71.07855	3 Copley Place, Suite 400, Boston, Massachusetts, U.S.A., 02116	https://www.canada.ca/Canada-In-Boston	4265
587	Canada	41.88517	-87.6223	Two Prudential Plaza, 180 North Stetson Avenue, Suite 2400, Chicago, Illinois, U.S.A., 60601	https://www.canada.ca/Canada-In-Chicago	4266
588	Canada	32.78432	-96.80022	500 N. Akard Street, Suite 2900, Dallas, Texas, U.S.A., 75201	https://www.canada.ca/Canada-In-Dallas	4267
589	Canada	39.74236	-104.98814	1625 Broadway, Suite 2600, Denver, Colorado, U.S.A., 80202	https://www.canada.ca/Canada-In-Denver	4268
590	Canada	42.33079	-83.03782	600 Renaissance Center, Suite 1100, Detroit, Michigan, U.S.A., 48243-1798	https://www.canada.ca/Canada-In-Detroit	4269
591	Canada	21.30889	-157.86139	Penthouse Suite, 1000 Bishop Street, Honolulu, Hawaii, U.S.A., 96813-4299	https://www.canada.ca/Canada-In-Detroit	4270
592	Canada	34.04972	-118.25565	550 South Hope Street, 9th Floor, Los Angeles, California, U.S.A., 90071-2327	https://www.canada.ca/Canada-In-Los-Angeles	4271
593	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	4251
594	Canada	44.97427	-93.26676	701 Fourth Avenue South, Suite 900, Minneapolis, Minnesota, U.S.A., 55415-1899	https://www.canada.ca/Canada-In-Minneapolis	4272
595	Canada	40.75368	-73.974423	466 Lexington Avenue, 20th Floor, New York, New York, U.S.A., 10017	https://www.canada.ca/Canada-In-New-York	12
596	Canada	37.79287	-122.40424	580 California Street, 14th Floor, San Francisco, California, U.S.A., 94104	https://www.canada.ca/Canada-In-San-Francisco	4273
597	Canada	47.610246	-122.336819	1501 4th Ave, Suite 600, Seattle, Washington, U.S.A., 98101	https://www.canada.ca/Canada-In-Seattle	4274
598	Canada	-34.905893	-56.199923	Plaza Independencia 749, oficina 102, 11100, Montevideo, Uruguay	http://www.uruguay.gc.ca	317
599	Canada	55.746664	37.595059	23 Starokonyushenny Pereulok, Moscow, 119002, Russia	http://www.russia.gc.ca	13
600	Canada	41.275287	69.258272	58A, Bobur Street, Yakkasaroy district, Tashkent, 100022	http://www.russia.gc.ca	217
601	Canada	-17.74061	168.31618	Winston Churchill Avenue, Port Vila	http://www.vanuatu.highcommission.gov.au/pvla/home.html	4275
602	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
603	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	26
604	Canada	21.034662	105.835017	31 Hung Vuong Street, Hanoi, Vietnam	http://www.vietnam.gc.ca	29
605	Canada	10.778558	106.699895	9th Floor, The Metropolitan, 235 Dong Khoi Street, District 1, Ho Chi Minh City, Vietnam	http://www.vietnam.gc.ca	22
606	Canada	25.77228	-80.18792	200 South Biscayne Boulevard, Suite 1600, Miami, Florida, U.S.A., 33131	https://www.canada.ca/Canada-In-Miami	4251
607	Canada	-13.83282	-171.76462	Beach Road, Apia, Samoa	http://www.samoa.embassy.gov.au/apia/home.html	466
608	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
609	Canada	24.67783	46.62227	Diplomatic Quarter, Riyadh, Saudi Arabia	http://www.saudiarabia.gc.ca	33
610	Canada	-4.315966	15.276362	17, avenue Pumbu, Commune de Gombe, Kinshasa, Congo (Kinshasa)	http://www.canadainternational.gc.ca/congo/	4217
611	Canada	-15.42307	28.31042	5210 Independence Avenue, Lusaka, Zambia	http://www.tanzania.gc.ca	274
612	Canada	-17.820705	31.043559	45 Baines Avenue, Harare, Zimbabwe	http://www.zimbabwe.gc.ca	234
613	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
614	Canada	18.054761	-63.02711	Dawn Beach Estate, Sint Maarten	http://www.france.gc.ca	4276
615	Canada	13.09511	-59.59998	Bishop's Court Hill, St. Michael, P.O. Box 404, Bridgetown, Barbados BB11113	http://www.barbados.gc.ca	450
616	Canada	-22.27055	166.4426	Immeuble Norwich, Level 2, 11 Georges Baudoux Street, Artillerie, Noumea, New Caledonia	http://www.barbados.gc.ca	454
617	Canada	-35.30299	149.125	Commonwealth Avenue, Canberra ACT, Australia 2600	http://www.australia.gc.ca	411
618	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
619	Canada	12.11125	-68.897167	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	442
620	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	26
621	Canada	-8.553508	125.558134	Rua Mártires da Pátria, Dili, Timor-Leste	http://www.timorleste.embassy.gov.au/dili/home.html	4277
622	Canada	-6.21516	106.8204	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	3
623	Canada	12.11125	-68.897167	World Trade Centre I, 6th Floor, Jl. Jend Sudirman, Kav. 29, Jakarta 12920, Indonesia	http://www.indonesia.gc.ca	442
624	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	26
625	Canada	12.11125	-68.897167	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	442
626	Canada	4.69251	-74.03376	Cra. 7, No. 114-33, Piso 14, Bogotá, Colombia	http://www.colombia.gc.ca	26
627	Canada	44.802088	20.456221	Kneza Milosa 75, 111711 Belgrade, Serbia	http://www.serbia.gc.ca	310
628	Canada	40.479094	-3.686115	Torre Espacio, Paseo de la Castellana 259D, 28046 Madrid, Spain	http://www.spain.gc.ca	39
629	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	24
630	Canada	51.51142	-0.149	Canada House, Trafalgar Square, London, SW1Y 5BJ, England, United Kingdom	http://www.unitedkingdom.gc.ca	24
631	Canada	4.855807	31.609267	Joint Embassy Compound, opposite to New Sudan Palace Hotel, Airport Avenue, Juba, South Sudan	http://www.canadainternational.gc.ca/south_sudan-soudan_du_sud/	416
632	Canada	-1.241846	36.813004	Limuru Road, Gigiri, Nairobi, Kenya	http://www.canadainternational.gc.ca/kenya/	50
633	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
634	Canada	-13.83282	-171.76462	Beach Road, Apia, Samoa	http://www.samoa.embassy.gov.au/apia/home.html	466
635	Canada	-41.283551	174.774821	Level 11, 125 The Terrace, Wellington 6011, New Zealand	http://www.newzealand.gc.ca	412
636	Canada	48.86685	2.30556	130, rue du Faubourg Saint-Honoré, 75008 Paris	http://www.france.gc.ca	23
637	United Kingdom	-8.81	13.22	Unnamed Road, Luanda, Angola	\N	27
638	United Kingdom	-24.65	25.91	3171 Morupule, Gaborone, Botswana	\N	430
639	United Kingdom	-3.38	29.36	Ave du Stade, Bujumbura, Burundi	\N	395
640	United Kingdom	3.87	11.51	VGC5+2X Yaoundé, Cameroon	\N	4111
641	United Kingdom	12.11	15.05	4352+J8F, N'Djamena, Chad	\N	4213
642	United Kingdom	-4.3	15.27	78 Av. Des Nations Unies, Kinshasa, Democratic Republic of the Congo	\N	4128
643	United Kingdom	-1.69	29.24	866Q+4JJ, Goma, Democratic Republic of the Congo	\N	4278
644	United Kingdom	15.33	38.92	Mereb St, Asmara, Eritrea	\N	378
645	United Kingdom	-26.41	31.18	H5RH+FCH, Lobamba, Eswatini	\N	4130
646	United Kingdom	9.03	38.78	2QHH+QQW, Addis Ababa, Ethiopia	\N	166
647	United Kingdom	13.48	-16.67	F8HJ+WCX, Bakau, The Gambia	\N	4146
648	United Kingdom	5.56	-0.19	2 Asafoanye O. Broni Cir, Accra, Ghana	\N	222
649	United Kingdom	9.52	-13.68	Corniche S, Conakry, Guinea	\N	277
650	United Kingdom	5.33	-3.99	82H5+XX Abidjan, Côte d'Ivoire	\N	4279
651	United Kingdom	-1.29	36.81	Integrity Center, Nairobi, Kenya	\N	50
652	United Kingdom	-29.31	27.48	243 Constitution Rd, Foso, Lesotho	\N	419
653	United Kingdom	6.29	-10.78	Jasmin Compound Warner Ave, Monrovia, Liberia	\N	372
654	United Kingdom	-18.91	47.53	121 Lalana Rainandriamampandry, Antananarivo, Madagascar	\N	198
655	United Kingdom	-13.95	33.78	M1, Lilongwe, Malawi	\N	388
656	United Kingdom	12.63	-7.96	Route sans nom, Bamako, Mali	\N	245
657	United Kingdom	-20.16	57.5	RGR2+22 Port Louis, Mauritius	\N	441
658	United Kingdom	-25.97	32.57	484 Av. Karl Marx, Maputo, Mozambique	\N	343
659	United Kingdom	-22.56	17.08	3 Pavlov Street, Windhoek, Namibia	\N	421
660	United Kingdom	13.52	2.07	Route sans nom, Niamey, Niger	\N	370
661	United Kingdom	9.08	7.48	3FHH+XX Abuja, Nigeria	\N	339
662	United Kingdom	6.43	3.4	121 Louis Solomon Cl, Victoria Island 106104, Lagos, Nigeria	\N	17
663	United Kingdom	4.81	7	4 Wonodi Street, Elechi 500101, Port Harcourt, Nigeria	\N	4246
664	United Kingdom	10.52	7.43	5 Ahmadu Bello Way, Sabon Gari 800283, Kaduna, Nigeria	\N	4280
665	United Kingdom	6.44	7.48	CFQH+XX Enugu, Nigeria	\N	4281
666	United Kingdom	11.99	8.54	Sky Line, Nassarawa 700213, Kano, Nigeria	\N	4282
667	United Kingdom	-1.94	30.09	336Q+2XP, Kigali, Rwanda	\N	355
668	United Kingdom	14.65	-17.43	Rte de la Corniche Estate, Dakar, Senegal	\N	353
669	United Kingdom	-4.62	55.45	9CHX+XX Victoria, Seychelles	\N	476
670	United Kingdom	8.47	-13.27	Spur Rd, Freetown, Sierra Leone	\N	379
671	United Kingdom	2.03	45.33	طريق بدون اسم، مقديشو‎، Somalia	\N	238
672	United Kingdom	9.52	44.07	AfBarwaaqo Rd, Hargeisa, Somalia	\N	4283
673	United Kingdom	-33.91	18.42	ERF158581 W Quay Rd, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa	\N	408
674	United Kingdom	-26.13	28.03	95 Rutland Ave, Craighall Park, Randburg, 2196, South Africa	\N	102
675	United Kingdom	-25.74	28.22	813 Government Ave, Eastwood, Pretoria, 0083, South Africa	\N	392
676	United Kingdom	4.85	31.58	RHXJ+X2 Juba, South Sudan	\N	416
677	United Kingdom	15.6	32.53	HGXJ+X2 Khartoum, Sudan	\N	31
678	United Kingdom	0.33	32.58	14 Kyaddondo Rd, Kampala, Uganda	\N	278
679	United Kingdom	-6.81	39.29	Ghana St, Dar es Salaam, Tanzania	\N	4216
680	United Kingdom	-15.42	28.31	Pandit Nehru Rd, Lusaka, Zambia	\N	274
681	United Kingdom	-17.76	31.03	62RJ+22 Harare, Zimbabwe	\N	234
682	United Kingdom	17.15	-61.85	Unnamed Road, Antigua and Barbuda	\N	4284
683	United Kingdom	-34.58	-58.39	Cam. del Trabajo 202, Buenos Aires, Argentina	\N	15
684	United Kingdom	25.07	-77.39	W Bay St, Nassau, The Bahamas	\N	4101
685	United Kingdom	13.09	-59.6	20 Chapel Pl., Bridgetown, Barbados	\N	450
686	United Kingdom	17.25	-88.77	66XJ+V8J, Belmopan, Belize	\N	482
687	United Kingdom	-16.51	-68.12	FVRJ+75Q, La Paz, Bolivia	\N	184
688	United Kingdom	-8.06	-34.89	R. da Soledade, 44 - Boa Vista, Recife - PE, 50070-040, Brazil	\N	4104
689	United Kingdom	-23.56	-46.69	R. Mourato Coelho, 884 - Pinheiros, São Paulo - SP, 05417-001, Brazil	\N	4108
690	United Kingdom	-22.93	-43.17	Av. Infante Dom Henrique, 1000 - Flamengo, Rio de Janeiro - RJ, 20021-060, Brazil	\N	4210
691	United Kingdom	-19.93	-43.94	R. Espírito Santo, 1757 - Centro, Belo Horizonte - MG, 30160-030, Brazil	\N	4209
692	United Kingdom	-15.8	-47.87	642H+2X Brasilia, Federal District, Brazil	\N	4106
693	United Kingdom	51.04	-114.06	Nuera 1.0, 211 13 Ave SE, Calgary, AB T2G 1E1, Canada	\N	4116
694	United Kingdom	49.28	-123.12	882-874 BC-99, Vancouver, BC V6B, Canada	\N	4113
695	United Kingdom	45.5	-73.57	1153 Rue Metcalfe, Montréal, QC H3B 2V6, Canada	\N	4112
696	United Kingdom	45.42	-75.69	108 Lisgar St #103, Ottawa, ON K2P 1E1, Canada	\N	4115
697	United Kingdom	43.66	-79.38	40 Gerrard St E, Toronto, ON M5B 2M2, Canada	\N	58
698	United Kingdom	-33.41	-70.6	Luz 2967, Las Condes, Región Metropolitana, Chile	\N	32
699	United Kingdom	4.66	-74.05	Cra. 5 #79-26, Bogotá, Colombia	\N	4123
700	United Kingdom	9.93	-84.09	WWJ6+22 San José Province, San José, Costa Rica	\N	4124
701	United Kingdom	23.11	-82.42	4H5J+936, Havana, Cuba	\N	236
702	United Kingdom	18.46	-69.92	UASD, Santo Domingo 10105, Dominican Republic	\N	201
703	United Kingdom	-0.17	-78.47	Av. Eloy Alfaro N40-153, Quito 170138, Ecuador	\N	246
704	United Kingdom	13.7	-89.24	MQX5+WV2, San Salvador, El Salvador	\N	404
705	United Kingdom	12	-61.76	Prickly Bay, St. George, Grenada	\N	4285
706	United Kingdom	14.59	-90.51	20 calle 10-30, Cdad. de Guatemala, Guatemala	\N	212
707	United Kingdom	6.81	-58.16	146 Regent St, Georgetown, Guyana	\N	434
708	United Kingdom	18.53	-72.29	GPJ6+22 Port-au-Prince, Haiti	\N	4286
709	United Kingdom	18	-76.78	5 Swallowfield Rd, Kingston, Jamaica	\N	401
710	United Kingdom	19.43	-99.16	Reforma I, Juárez, 06600 Ciudad de México, CDMX, Mexico	\N	9
711	United Kingdom	21.1	-86.76	Tepen, Zona Hotelera, 77500 Cancún, Q.R., Mexico	\N	4287
712	United Kingdom	20.67	-103.37	MJCJ+22 Guadalajara, Jalisco, Mexico	\N	4169
713	United Kingdom	25.64	-100.35	Mallorca 114, San Patricio 1er Sector, 66270 San Pedro Garza García, N.L., Mexico	\N	4242
714	United Kingdom	8.98	-79.51	XFJR+22 Panama City, Panama	\N	382
715	United Kingdom	-25.29	-57.57	PC5J+V25, Asunción, Paraguay	\N	4183
716	United Kingdom	-12.13	-77.02	Av. 28 de Julio 1269, Miraflores 15047, Peru	\N	25
717	United Kingdom	13.13	-61.2	Windward Highway, Arnos Vale, St Vincent and the Grenadines	\N	4288
718	United Kingdom	14.01	-60.99	1 Peynier St, Castries, St Lucia	\N	457
719	United Kingdom	10.66	-61.52	28 French St, Port of Spain, Trinidad and Tobago	\N	4289
720	United Kingdom	47.61	-122.33	JM6C+22 Seattle, WA, USA	\N	4274
721	United Kingdom	42.36	-71.08	Dr Paul Dudley White Bike Path, Cambridge, MA 02142, USA	\N	4265
722	United Kingdom	41.89	-87.62	303 E Illinois St, Chicago, IL 60611, USA	\N	4266
723	United Kingdom	40.75	-73.96	Four Freedoms Park, New York, NY 10044, USA	\N	12
724	United Kingdom	39.74	-104.98	571 E Colfax Ave, Denver, CO 80203, USA	\N	4268
725	United Kingdom	38.92	-77.06	3003 Massachusetts Ave NW, Washington, DC 20008, USA	\N	60
726	United Kingdom	37.79	-122.4	555 Market St, San Francisco, CA 94105, USA	\N	4273
727	United Kingdom	34.05	-118.41	2HXR+X2 Los Angeles, CA, USA	\N	4271
728	United Kingdom	33.75	-84.38	298 Decatur St SE, Atlanta, GA 30312, USA	\N	4264
729	United Kingdom	29.75	-95.36	1836 Polk St, Houston, TX 77010, USA	\N	4290
730	United Kingdom	25.76	-80.18	749 Brickell Key Dr, Miami, FL 33131, USA	\N	4251
731	United Kingdom	28.43	-81.3	Terminal B, Orlando, FL 32827, USA	\N	4291
732	United Kingdom	44.94	-93.09	1 W Water St, St Paul, MN 55107, USA	\N	4272
733	United Kingdom	35.77	-78.63	505 Martin Luther King Jr Blvd, Raleigh, NC 27601, USA	\N	4292
734	United Kingdom	32.71	-117.16	449 Fifth Ave, San Diego, CA 92101, USA	\N	4293
735	United Kingdom	-34.9	-56.13	Av. Gral. Rivera 3850, 11300 Montevideo, Departamento de Montevideo, Uruguay	\N	317
736	United Kingdom	10.49	-66.85	1 Av. Ávila, Caracas 1060, Miranda, Venezuela	\N	252
737	United Kingdom	-37.81	144.97	Exhibition St/Lonsdale St, Melbourne VIC 3000, Australia	\N	4096
738	United Kingdom	-35.3	149.12	200 Alexandrina Dr, Yarralumla ACT 2600, Australia	\N	411
739	United Kingdom	-33.86	151.2	45RX+2X Barangaroo NSW, Australia	\N	64
740	United Kingdom	-31.95	115.86	51 James Street Mall, Perth WA 6000, Australia	\N	4097
741	United Kingdom	-27.46	153.03	97A School St, Fortitude Valley QLD 4006, Australia	\N	4294
742	United Kingdom	4.88	114.94	VWHQ+XX Bandar Seri Begawan, Brunei	\N	4295
743	United Kingdom	11.58	104.91	HWJ6+749, Phnom Penh, Cambodia	\N	237
744	United Kingdom	39.91	116.44	WC5Q+XX Chaoyang, Beijing, China	\N	10
745	United Kingdom	31.22	121.45	6C9X+XX Jing'An, Shanghai, China	\N	6
746	United Kingdom	29.55	106.57	GHX9+XX Yuzhong District, Chongqing, China	\N	4214
747	United Kingdom	23.11	113.32	Unnamed Road, 二沙岛 Yue Xiu Qu, Guang Zhou Shi, Guang Dong Sheng, China, 510310	\N	4121
748	United Kingdom	22.27	114.16	Hong Kong, The Peak, 施勳道	\N	4296
749	United Kingdom	30.6	114.31	Yan Jiang Da Dao, Jiang An Qu, Wu Han Shi, Hu Bei Sheng, China, 430014	\N	4120
750	United Kingdom	39.02	125.79	2Q9Q+QX9, Pyongyang, North Korea	\N	4297
751	United Kingdom	-18.14	178.42	Civic House, Victoria Parade, Suva, Fiji	\N	456
752	United Kingdom	-6.23	106.83	Jl. Denpasar II No.49, RT.1/RW.2, Kuningan, Kuningan Tim., Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12950, Indonesia	\N	3
753	United Kingdom	-8.7	115.25	Jl. Kutat Lestari No.120, Sanur Kauh, Denpasar Selatan, Kota Denpasar, Bali 80228, Indonesia	\N	4155
754	United Kingdom	35.68	139.74	2-chōme-7-7 Hirakawachō, Chiyoda City, Tokyo 102-0093, Japan	\N	2
755	United Kingdom	34.67	135.5	2-chōme-3-5 Nishishinsaibashi, Chuo Ward, Osaka, 542-0086, Japan	\N	4162
756	United Kingdom	17.97	102.62	Patuxay, Vientiane, Laos	\N	390
757	United Kingdom	3.15	101.71	86, Jalan Raja Chulan, Kuala Lumpur, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia	\N	28
758	United Kingdom	47.91	106.94	WW5Q+XFR, Ulaanbaatar, Mongolia	\N	308
759	United Kingdom	16.76	96.16	Min Tan Rd, Yangon, Myanmar (Burma)	\N	4298
760	United Kingdom	-41.27	174.77	Te Ahumairangi Hill loops, Wellington 6012, New Zealand	\N	412
761	United Kingdom	-36.84	174.76	161 Halsey Street, Auckland CBD, Auckland 1010, New Zealand	\N	296
762	United Kingdom	-9.43	147.19	Melanesian Way, Port Moresby, Papua New Guinea	\N	417
763	United Kingdom	14.54	121.05	G3Q2+X2 Taguig, Metro Manila, Philippines	\N	5
764	United Kingdom	1.3	103.82	18 Chatsworth Rd, Singapore 249780	\N	46
765	United Kingdom	-9.43	159.96	Mendana Ave, Honiara, Solomon Islands	\N	455
766	United Kingdom	37.56	126.97	HX69+2X Seoul, South Korea	\N	8
767	United Kingdom	25.03	121.56	No. 15號, Alley 26, Lane 118, Wuxing St, Xinyi District, Taipei City, Taiwan 110	\N	193
768	United Kingdom	13.74	100.54	St Regis Bangkok, 159 Ratchadamri Rd, Khwaeng Lumphini, Khet Pathum Wan, Krung Thep Maha Nakhon 10330, Thailand	\N	14
769	United Kingdom	-17.73	168.31	40 Kumul Hwy, Port Vila, Vanuatu	\N	4275
770	United Kingdom	21.02	105.85	55b Bà Triệu, Hàng Bài, Hoàn Kiếm, Hà Nội, Vietnam	\N	29
771	United Kingdom	10.78	106.7	8 Đường Nguyễn Văn Bình, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Vietnam	\N	22
772	United Kingdom	40.19	44.5	5GQ2+X2 Yerevan, Armenia	\N	364
773	United Kingdom	40.37	49.85	9RCX+2X Baku, Azerbaijan	\N	230
774	United Kingdom	53.9	27.56	vulica Lienina 9, Minsk, Belarus	\N	247
775	United Kingdom	41.67	44.81	MR96+X2 Tbilisi, Georgia	\N	362
776	United Kingdom	51.14	71.42	Ulitsa Karasakal Yerimbet 39, Nur-Sultan 020000, Kazakhstan	\N	365
777	United Kingdom	47.1	51.91	211а, Atyrau, Kazakhstan	\N	4299
778	United Kingdom	42.87	74.57	VH99+QXR, Bishkek, Kyrgyzstan	\N	368
779	United Kingdom	47.02	28.82	Strada Alexei Mateevici 87, Chișinău, Moldova	\N	398
780	United Kingdom	59.94	30.39	Novgorodskaya Ulitsa, 19, Sankt-Peterburg, Russia, 191124	\N	4300
781	United Kingdom	56.83	60.61	Ulitsa Karla Marksa, 8-208, Yekaterinburg, Sverdlovskaya oblast', Russia, 620026	\N	4301
782	United Kingdom	55.75	37.57	5/3к2, Kutuzovsky Ave, Moskva, Russia, 121248	\N	13
783	United Kingdom	38.58	68.79	HQHQ+XX Dushanbe, Tajikistan	\N	387
784	United Kingdom	37.95	58.36	Mäti Kösäýew köçesi 85, Aşgabat, Turkmenistan	\N	369
785	United Kingdom	50.45	30.51	Ivana Franka St, 1, Kyiv, Ukraine, 01030	\N	174
786	United Kingdom	41.3	69.28	872J+22 Tashkent, Uzbekistan	\N	217
787	United Kingdom	41.33	19.8	8RH2+X2 Tirana, Albania	\N	410
788	United Kingdom	48.19	16.38	Prinz Eugen-Straße 66, 1040 Wien, Austria	\N	256
789	United Kingdom	50.84	4.38	Chau. d'Etterbeek 154, 1040 Etterbeek, Belgium	\N	271
790	United Kingdom	44.76	17.18	Kozarska 33, Banja Luka 78000, Bosnia and Herzegovina	\N	4302
791	United Kingdom	43.85	18.39	Behdžeta Mutevelića bb, Sarajevo 71000, Bosnia and Herzegovina	\N	4303
792	United Kingdom	42.69	23.32	ul. "Neofit Rilski" 36, 1000 Old City Center, Sofia, Bulgaria	\N	314
793	United Kingdom	45.79	15.97	Obala dr. Savke Dabčević Kučar, 10000, Zagreb, Croatia	\N	386
794	United Kingdom	43.5	16.43	Sustipanski put 60, 21000, Croatia	\N	4304
795	United Kingdom	35.18	33.34	Ι. Ψυχάρη 33, Nicosia 1107	\N	420
796	United Kingdom	50.08	14.4	3CJ2+22 Prague, Czechia	\N	4127
797	United Kingdom	55.69	12.58	Vej uden navn, 2100 København, Denmark	\N	400
798	United Kingdom	59.43	24.73	Koidu 46, 10142 Tallinn, Estonia	\N	407
799	United Kingdom	60.15	24.96	Nimetön tie, Helsinki, Finland	\N	396
800	United Kingdom	48.86	2.31	36 Bd de la Tour-Maubourg, 75007 Paris, France	\N	23
801	United Kingdom	45.76	4.85	21 Rue François Garcin, 69003 Lyon, France	\N	4135
802	United Kingdom	44.85	-0.59	31 Rue Rosa Bonheur, 33000 Bordeaux, France	\N	4133
803	United Kingdom	43.28	5.38	17 Rue Notre Dame des Anges, 13008 Marseille, France	\N	4305
804	United Kingdom	52.51	13.38	Leipziger Str. 133, 10117 Berlin, Germany	\N	136
805	United Kingdom	51.22	6.78	Bahnstraße 2, Königsallee 92, 40212 Düsseldorf, Germany	\N	4306
806	United Kingdom	48.14	11.59	Tattenbachstraße 8, 80538 München, Germany	\N	4142
807	United Kingdom	39.62	19.91	Miltiadou Margariti 92, Kerkira 491 00, Greece	\N	4307
808	United Kingdom	37.97	23.74	Irodou Attikou 1, Athina 106 74, Greece	\N	394
809	United Kingdom	37.78	20.89	QVJQ+2X Zakynthos, Greece	\N	4308
810	United Kingdom	36.44	28.22	Komninon 71, Rodos 851 00, Greece	\N	4309
811	United Kingdom	35.34	25.13	Apokoronou 7, Iraklio 712 02, Greece	\N	4310
812	United Kingdom	41.9	12.5	Via Giovanni Amendola, 32, 00185 Roma RM, Italy	\N	4311
813	United Kingdom	47.49	19.05	F3R2+22 Budapest, Hungary	\N	272
814	United Kingdom	64.14	-21.93	Sjúkrahótel, Reykjavík, Iceland	\N	4148
815	United Kingdom	53.32	-6.22	Embassy of Pakistan Residence, Ailesbury Rd, Ballsbridge, Dublin 4, Ireland	\N	346
816	United Kingdom	45.47	9.21	Via Carlo Poerio, 15, 20129 Milano MI, Italy	\N	4157
817	United Kingdom	41.9	12.5	Via Giovanni Amendola, 32, 00185 Roma RM, Italy	\N	183
818	United Kingdom	42.66	21.15	149 Ahmet Krasniqi, Prishtinë 10000	\N	433
819	United Kingdom	56.95	24.11	Zirgu iela 1, Centra rajons, Rīga, LV-1050, Latvia	\N	399
820	United Kingdom	54.69	25.3	T. Kosciuškos g. 5, Vilnius 01100, Lithuania	\N	403
821	United Kingdom	49.6	6.12	106 Rte d'Esch, 1470 Luxembourg	\N	448
822	United Kingdom	35.89	14.49	31 Triq L-Orsolini, Tal-Pietà, Malta	\N	487
823	United Kingdom	42.44	19.27	32 IV Proleterske, Podgorica, Montenegro	\N	439
824	United Kingdom	52.35	4.86	Cornelis Krusemanstraat 75 b, 1075 NJ Amsterdam, Netherlands	\N	383
825	United Kingdom	52.08	4.31	Kneuterdijk 2, 2514 EN Den Haag, Netherlands	\N	307
826	United Kingdom	41.97	21.42	Rrugë pa emër, 1000, North Macedonia	\N	4176
827	United Kingdom	59.91	10.7	Frognerstranda 2, 0250 Oslo, Norway	\N	393
828	United Kingdom	52.21	21.03	Aleksandra Sulkiewicza 5, 00-758 Warszawa, Poland	\N	266
829	United Kingdom	38.71	-9.15	Travessa do Terreiro a Santa Catarina 48, 1200-343 Lisboa, Portugal	\N	406
830	United Kingdom	37.13	-8.53	Ac. Porto Comercial de Portimão, 8500 Portimão, Portugal	\N	4312
831	United Kingdom	44.44	26.1	Bd. Nicolae Balcescu, Bulevardul Nicolae Bălcescu, București, Romania	\N	259
832	United Kingdom	44.8	20.45	RC2X+2X Belgrade, Serbia	\N	310
833	United Kingdom	48.14	17.1	Nábrežie armádneho generála Ludvíka Svobodu, 811 02 Bratislava, Slovakia	\N	409
834	United Kingdom	46.05	14.49	Škrabčeva ulica 11, 1000 Ljubljana, Slovenia	\N	425
835	United Kingdom	43.26	-2.92	Mallona Galtzada, 15B, 48006 Bilbo, Bizkaia, Spain	\N	4313
836	United Kingdom	41.39	2.14	Passatge de les Cinc Torres, 4, 08029 Barcelona, Spain	\N	4191
837	United Kingdom	40.47	-3.68	C. Levante, 36, 28036 Madrid, Spain	\N	39
838	United Kingdom	39.57	2.65	Carrer dels Paners, 9, 07001 Palma, Illes Balears, Spain	\N	4314
839	United Kingdom	38.9	1.42	C. de Carles Roman Ferrer, 17, 07800 Eivissa, Illes Balears, Spain	\N	1336
840	United Kingdom	38.34	-0.48	Mlle. Levante, 8, 03001 Alicante (Alacant), Alicante, Spain	\N	4315
841	United Kingdom	36.71	-4.43	C. Fernán Núñez, 6, 29002 Málaga, Spain	\N	4316
842	United Kingdom	28.46	-16.25	Av. Víctor Zurita Soler, s/n, 38003 Santa Cruz de Tenerife, Spain	\N	4317
843	United Kingdom	28.14	-15.43	Pl. Comandante Ramón Franco, 1, 35007 Las Palmas de Gran Canaria, Las Palmas, Spain	\N	4318
844	United Kingdom	59.33	18.1	83HX+XX Stockholm, Sweden	\N	377
845	United Kingdom	46.94	7.45	Kirchenfeldstrasse 24, 3005 Bern, Switzerland	\N	4319
846	United Kingdom	41.03	28.97	Bedrettin, Ambar Arkası Sk. No:25, 34440 Beyoğlu/İstanbul, Turkey	\N	18
847	United Kingdom	39.89	32.85	Aziziye, Portakal Çiçeği Sk. 17/A, 06690 Çankaya/Ankara, Turkey	\N	52
848	United Kingdom	38.43	27.14	Kültür, Şevket Özçelik Sk. NO:35, 35220 Konak/İzmir, Turkey	\N	4320
849	United Kingdom	36.85	30.62	Liman, 3. Sk. No:4, 07130 Konyaaltı/Antalya, Turkey	\N	4321
850	United Kingdom	36.62	29.1	Karagözler, 27. Sk. 11/5, 48300 Fethiye/Muğla, Turkey	\N	724
851	United Kingdom	36.85	28.27	Turkey	\N	2090
852	United Kingdom	36.75	3.04	Q22Q+2X Hydra, Algeria	\N	145
853	United Kingdom	26.23	50.58	6HJH+2X Manama, Bahrain	\N	4322
854	United Kingdom	30.03	31.23	26HH+QJ8, Old Cairo, Cairo Governorate, Egypt	\N	11
855	United Kingdom	35.69	51.41	Tehran, Jami St, Iran	\N	20
856	United Kingdom	36.32	44.15	Erbil Hwy, Iraq	\N	4230
857	United Kingdom	33.31	44.39	14th of July St, Baghdad, Iraq	\N	44
858	United Kingdom	32.08	34.77	Ben Yehuda St 72, Tel Aviv-Yafo, Israel	\N	4323
860	United Kingdom	29.39	47.99	1 شارع 132، Al Kuwayt, Kuwait	\N	4324
861	United Kingdom	33.89	35.5	VGR2+22 Beirut, Lebanon	\N	413
862	United Kingdom	32.89	13.16	Libya	\N	361
863	United Kingdom	18.09	-15.98	32QC+Q4R, Nouakchott, Mauritania	\N	366
864	United Kingdom	33.97	-6.84	X5C5+6GP, Rabat, Morocco	\N	402
865	United Kingdom	33.55	-7.62	G9XH+XX Casablanca, Morocco	\N	106
866	United Kingdom	31.79	35.23	Q6QH+XX Jerusalem, Israel	\N	4325
867	United Kingdom	31.52	34.45	Al-Thawra	\N	4326
868	United Kingdom	23.6	58.43	Thaqafah St, Muscat, Oman	\N	304
869	United Kingdom	25.34	51.51	Tabariya St، Doha, Qatar	\N	320
870	United Kingdom	24.68	46.62	8564 Al Sarat St, Al Safarat, Riyadh 12523, Saudi Arabia	\N	33
871	United Kingdom	21.61	39.11	J456+X2 Ash Shati, Jeddah Saudi Arabia	\N	4188
872	United Kingdom	26.33	50.2	4449 7ا، حي الجوهرة، Al Khobar 34431 8988, Saudi Arabia	\N	4327
873	United Kingdom	33.27	36.51	Route sans nom, Syria	\N	269
874	United Kingdom	36.83	10.24	Les Berges Du Lac Walkway, Tunis, Tunisia	\N	367
875	United Kingdom	25.25	55.3	Obaidullah Building - 11B St - Al Mankhool - Dubai - United Arab Emirates	\N	207
876	United Kingdom	24.48	54.35	F8JX+2X Abu Dhabi - United Arab Emirates	\N	376
877	United Kingdom	15.36	44.23	965H+XX Sana'a, Yemen	\N	4328
878	United Kingdom	18.21	-63.05	6W5X+CJJ, The Quarter 2640, Anguilla	\N	4329
879	United Kingdom	-7.92	-14.41	Unnamed Road, Georgetown ASCN 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	4330
880	United Kingdom	32.3	-64.78	4 Union St, Hamilton, Bermuda	\N	461
881	United Kingdom	18.41	-64.61	Waterfront Dr, Road Town, British Virgin Islands	\N	4331
882	United Kingdom	19.29	-81.37	Crewe Rd, George Town, Cayman Islands	\N	475
883	United Kingdom	-51.69	-57.87	Ross Rd, Stanley FIQQ 1ZZ, Falkland Islands (Islas Malvinas)	\N	4332
884	United Kingdom	36.13	-5.35	3 Engineer Rd, Gibraltar GX11 1AA, Gibraltar	\N	436
885	United Kingdom	16.79	-62.21	QQQQ+XX Brades, Montserrat	\N	4333
886	United Kingdom	-25.06	-130.1	Unnamed Road, Adamstown PCRN 1ZZ, Pitcairn Islands	\N	516
887	United Kingdom	-15.95	-5.72	Redgate, STHL 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	4334
888	United Kingdom	-37.06	-12.3	M1, TDCU 1ZZ, St Helena, Ascension and Tristan da Cunha	\N	4335
889	United Kingdom	21.43	-71.14	Unnamed Road, TKCA 1ZZ, Turks and Caicos Islands	\N	4336
890	United Kingdom	34.53	69.17	G5JC+22 Kabul, Afghanistan	\N	134
891	United Kingdom	23.79	90.41	Bureau Veritas (Bangladesh) Private Limited, Nur Empori, Plot: 77 (Floor-10), Road: 11, Block-M,, Rd No. 11, Dhaka 1213, Bangladesh	\N	16
892	United Kingdom	28.59	77.19	H5RQ+2X New Delhi, Delhi, India	\N	443
893	United Kingdom	22.54	88.34	UCM Building, Debendra Lal Khan Rd, S S K M Hospital, Bhowanipore, Kolkata, West Bengal 700020, India	\N	4149
894	United Kingdom	19.06	72.86	Bank of India, G Block BKC, Bandra Kurla Complex, Bandra East, Mumbai, Maharashtra 400051, India	\N	4152
895	United Kingdom	18.52	73.85	GRCX+3WG, Shaniwar Peth, Pune, Maharashtra 411030, India	\N	4337
896	United Kingdom	17.41	78.45	201 A ,2 Floor Maheshwari Towers, 3 rd Lane From Karachi Bakery After Care Hospital, Rd Number 1, Shyam Rao Nagar, Banjara Hills, Hyderabad, Telangana 500034, India	\N	4151
897	United Kingdom	15.48	73.8	Sharda Mandir School Pedestrian Opas, Miramar, Panaji, Goa 403001, India	\N	4338
898	United Kingdom	13.06	80.24	10/18, Deivanayagam St, Pushpa Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India	\N	4150
899	United Kingdom	12.97	77.59	XH9R+X2 Bengaluru, Karnataka, India	\N	4339
900	United Kingdom	30.7	76.8	140/24, Industrial Area Phase I, Chandigarh, 160002, India	\N	4227
901	United Kingdom	27.72	85.31	Nirmal Lama Marg 12, Kathmandu 44600, Nepal	\N	375
902	United Kingdom	33.72	73.11	P4C5+283, Ramna 5 Diplomatic Enclave, Islamabad, Islamabad Capital Territory, Pakistan	\N	374
903	United Kingdom	31.55	74.31	20 Bahawalpur Rd, Al Hamad Colony Mozang Chungi, Lahore, Punjab 54000, Pakistan	\N	4181
904	United Kingdom	24.81	67.02	Plot COM 2/6/1, Block 3 Clifton, Karachi, Karachi City, Sindh, Pakistan	\N	19
905	United Kingdom	6.9	79.87	15/3 Malalasekara Pl, Colombo 00700, Sri Lanka	\N	391
906	United Kingdom	23.02	72.56	Embrald 3 Residency Parimal Garden Road, Ellisbridge, Ahmedabad, Gujarat 380006, India	\N	4340
\.


--
-- Data for Name: travelplanners; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.travelplanners (tp_id, name, user_id, dest_id, date) FROM stdin;
1	test_user1's Travel_planner test 1	1	3848	\N
2	test_user1's Travel_planner test 2	1	754	\N
3	test_user1's Travel_planner test 3	1	4164	\N
4	test_user2's Travel_planner test 1	2	649	\N
5	test_user2's Travel_planner test 2	2	2886	\N
6	test_user3's Travel_planner test 1	3	2820	\N
7	test_user3's Travel_planner test 2	3	2108	\N
8	test_user3's Travel_planner test 3	3	3823	\N
9	test_user4's Travel_planner test 1	4	1779	\N
10	test_user5's Travel_planner test 1	5	3470	\N
11	test_user5's Travel_planner test 2	5	1173	\N
12	test_user5's Travel_planner test 3	5	4256	\N
13	test_user6's Travel_planner test 1	6	1621	\N
14	test_user7's Travel_planner test 1	7	4071	\N
15	test_user7's Travel_planner test 2	7	3064	\N
16	test_user7's Travel_planner test 3	7	2244	\N
17	test_user8's Travel_planner test 1	8	1261	\N
18	test_user8's Travel_planner test 2	8	3238	\N
19	test_user9's Travel_planner test 1	9	454	\N
20	test_user9's Travel_planner test 2	9	2187	\N
21	test_user10's Travel_planner test 1	10	2785	\N
22	test_user10's Travel_planner test 2	10	2265	\N
23	test_user10's Travel_planner test 3	10	3646	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hackbright
--

COPY public.users (user_id, fname, lname, email, password, home_country) FROM stdin;
1	test_user1	Test	test_user1@test.com	test	Canada
2	test_user2	Test	test_user2@test.com	test	United States
3	test_user3	Test	test_user3@test.com	test	United States
4	test_user4	Test	test_user4@test.com	test	Canada
5	test_user5	Test	test_user5@test.com	test	Canada
6	test_user6	Test	test_user6@test.com	test	United States
7	test_user7	Test	test_user7@test.com	test	United States
8	test_user8	Test	test_user8@test.com	test	United States
9	test_user9	Test	test_user9@test.com	test	United States
10	test_user10	Test	test_user10@test.com	test	Canada
\.


--
-- Name: destinations_dest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.destinations_dest_id_seq', 4340, true);


--
-- Name: embassies_embassy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.embassies_embassy_id_seq', 906, true);


--
-- Name: travelplanners_tp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.travelplanners_tp_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackbright
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


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
-- Name: travelplanners travelplanners_name_key; Type: CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners
    ADD CONSTRAINT travelplanners_name_key UNIQUE (name);


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
-- Name: travelplanners travelplanners_dest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners
    ADD CONSTRAINT travelplanners_dest_id_fkey FOREIGN KEY (dest_id) REFERENCES public.destinations(dest_id);


--
-- Name: travelplanners travelplanners_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hackbright
--

ALTER TABLE ONLY public.travelplanners
    ADD CONSTRAINT travelplanners_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

