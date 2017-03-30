--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: album; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE album (
    id integer NOT NULL,
    name character varying,
    release_date date,
    artist_id integer
);


ALTER TABLE album OWNER TO "AAWhite";

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE album_id_seq OWNER TO "AAWhite";

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE album_id_seq OWNED BY album.id;


--
-- Name: artist; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE artist (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE artist OWNER TO "AAWhite";

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artist_id_seq OWNER TO "AAWhite";

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE artist_id_seq OWNED BY artist.id;


--
-- Name: collaborators; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE collaborators (
    id integer NOT NULL,
    album_id integer,
    artist_id integer
);


ALTER TABLE collaborators OWNER TO "AAWhite";

--
-- Name: collaborators_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE collaborators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collaborators_id_seq OWNER TO "AAWhite";

--
-- Name: collaborators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE collaborators_id_seq OWNED BY collaborators.id;


--
-- Name: song; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE song (
    id integer NOT NULL,
    name character varying,
    writer_id integer
);


ALTER TABLE song OWNER TO "AAWhite";

--
-- Name: song_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE song_id_seq OWNER TO "AAWhite";

--
-- Name: song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE song_id_seq OWNED BY song.id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE track (
    id integer NOT NULL,
    duration interval,
    album_id integer,
    song_id integer
);


ALTER TABLE track OWNER TO "AAWhite";

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE track_id_seq OWNER TO "AAWhite";

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE track_id_seq OWNED BY track.id;


--
-- Name: writer; Type: TABLE; Schema: public; Owner: AAWhite
--

CREATE TABLE writer (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE writer OWNER TO "AAWhite";

--
-- Name: writer_id_seq; Type: SEQUENCE; Schema: public; Owner: AAWhite
--

CREATE SEQUENCE writer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE writer_id_seq OWNER TO "AAWhite";

--
-- Name: writer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: AAWhite
--

ALTER SEQUENCE writer_id_seq OWNED BY writer.id;


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY album ALTER COLUMN id SET DEFAULT nextval('album_id_seq'::regclass);


--
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY artist ALTER COLUMN id SET DEFAULT nextval('artist_id_seq'::regclass);


--
-- Name: collaborators id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY collaborators ALTER COLUMN id SET DEFAULT nextval('collaborators_id_seq'::regclass);


--
-- Name: song id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY song ALTER COLUMN id SET DEFAULT nextval('song_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY track ALTER COLUMN id SET DEFAULT nextval('track_id_seq'::regclass);


--
-- Name: writer id; Type: DEFAULT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY writer ALTER COLUMN id SET DEFAULT nextval('writer_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY album (id, name, release_date, artist_id) FROM stdin;
8	Pokey Man	\N	9
7	Chinese Bicycle	2011-12-08	12
3	All Filler	2002-03-16	3
13	Let's C(SS) Where the Night Takes Us	1985-02-08	4
14	Place Your Bets	2016-02-18	\N
10	Best of Toe-Be	1990-02-08	4
16	Coding at Home	1950-02-08	1
17	Best of Toe-be Volume Two	1998-02-08	4
18	I Got Eaten by A Python	1988-03-09	14
1	Toby Or Not Toby	2016-02-08	4
12	Python in My Boots	1999-10-08	4
9	DJ Phone Home	2001-01-18	2
2	Popstar	2010-02-08	6
15	Shabby Road	1968-02-08	8
4	Man on the Sun	2016-02-08	7
6	American Motorcycle	1980-01-08	8
11	Let's Get Javascripted	1978-02-08	4
5	Koi Story	2016-02-08	12
\.


--
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('album_id_seq', 18, true);


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY artist (id, name) FROM stdin;
1	KEY-OR Paddle
2	J-Shaw
3	MC Wrench
4	Toe-Be
5	DJ Keyboard Cat
6	Snoop Cat
7	Aerosmuff
8	The Feetles
9	The Polling Bones
10	EMZ
11	The Hungry Peninsulas
12	Squint 181
13	Teal Week
14	Tawddd
\.


--
-- Name: artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('artist_id_seq', 14, true);


--
-- Data for Name: collaborators; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY collaborators (id, album_id, artist_id) FROM stdin;
1	1	2
2	4	14
3	5	4
4	18	4
5	1	4
6	1	7
7	6	6
8	7	12
9	9	11
10	9	5
11	7	8
12	18	9
13	4	10
22	5	2
\.


--
-- Name: collaborators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('collaborators_id_seq', 22, true);


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY song (id, name, writer_id) FROM stdin;
1	2 Legit 2 Forfeit	1
2	A Wall So Low	2
3	Lilo and Stitch Better Have my Money	2
4	Ripped Pants	3
5	Unconceivable	4
6	Streams of Consciousness	4
7	Caring Whisper	4
8	Flyers	5
9	Doo Wop	6
10	Get Ahead	7
11	Zipper	7
12	Who Let the Cats Out	9
13	Just a Broken Dream	\N
14	Real Mexican	10
15	Saturday	11
\.


--
-- Name: song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('song_id_seq', 15, true);


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY track (id, duration, album_id, song_id) FROM stdin;
7	00:00:02	6	2
11	00:02:07	12	4
16	00:00:01	17	2
12	00:02:09	13	2
19	00:03:02	8	1
17	00:07:07	18	4
1	00:03:08	1	1
21	00:15:02	1	8
18	00:03:03	9	2
13	00:07:04	14	5
6	04:00:05	2	1
20	00:02:07	2	8
2	01:02:05	2	2
8	00:06:02	10	3
5	00:04:02	10	5
9	00:05:02	10	7
14	00:02:08	15	3
3	00:04:00	11	3
10	00:03:05	11	5
4	00:05:02	11	4
15	00:01:07	16	6
\.


--
-- Name: track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('track_id_seq', 21, true);


--
-- Data for Name: writer; Type: TABLE DATA; Schema: public; Owner: AAWhite
--

COPY writer (id, name) FROM stdin;
1	DJ Cooley
2	Skidrow Jeff
3	Quincy Jones
4	Aloof Armadillo
5	Pickle Sanchez
6	Mr. Trololo
7	Mr. Hyde
8	Barbara Walrus
9	Donald Grump
10	Chicken Little
11	Fafoofu
12	Hotmike Sparky
13	Unga
14	Flamin' Taco
15	Kiwi
16	Instant Ramen
17	Easy Mac
18	Doreee Doughs
19	Poolside Pauley
\.


--
-- Name: writer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AAWhite
--

SELECT pg_catalog.setval('writer_id_seq', 19, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: collaborators collaborators_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY collaborators
    ADD CONSTRAINT collaborators_pkey PRIMARY KEY (id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: writer writer_pkey; Type: CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY writer
    ADD CONSTRAINT writer_pkey PRIMARY KEY (id);


--
-- Name: album album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artist(id);


--
-- Name: collaborators album_id; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY collaborators
    ADD CONSTRAINT album_id FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: collaborators artist_id; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY collaborators
    ADD CONSTRAINT artist_id FOREIGN KEY (artist_id) REFERENCES artist(id);


--
-- Name: song song_writer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_writer_id_fkey FOREIGN KEY (writer_id) REFERENCES writer(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: track track_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: AAWhite
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_song_id_fkey FOREIGN KEY (song_id) REFERENCES song(id);


--
-- PostgreSQL database dump complete
--
