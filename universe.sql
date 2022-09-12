--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    is_spherical boolean,
    distance_from_earth integer,
    radius integer,
    has_life boolean,
    number numeric(4,1) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_universe_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_universe_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    info_id integer NOT NULL,
    name character varying(30),
    amount integer NOT NULL,
    variab integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Name: info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.info_info_id_seq OWNER TO freecodecamp;

--
-- Name: info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.info_info_id_seq OWNED BY public.info.info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    is_spherical boolean,
    distance_from_earth integer,
    radius integer,
    has_life boolean,
    number numeric(4,1) NOT NULL,
    age integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    is_spherical boolean,
    distance_from_earth integer,
    radius integer,
    has_life boolean,
    number numeric(4,1) NOT NULL,
    age integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    is_spherical boolean,
    distance_from_earth integer,
    radius integer,
    has_life boolean,
    number numeric(4,1) NOT NULL,
    age integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_universe_id_seq'::regclass);


--
-- Name: info info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info ALTER COLUMN info_id SET DEFAULT nextval('public.info_info_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, false, 2500000, 220000, false, 101.0, -1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, false, -1, 50000, true, 102.0, -1);
INSERT INTO public.galaxy VALUES (3, 'The Black Eye', NULL, false, 17000000, 40000, false, 103.0, -1);
INSERT INTO public.galaxy VALUES (4, 'Bodes Galaxy', NULL, false, 12000000, 63000, false, 104.0, -1);
INSERT INTO public.galaxy VALUES (5, 'Cygaro', NULL, false, 12000000, -1, false, 106.0, -1);
INSERT INTO public.galaxy VALUES (38, 'The Cart Wheel', NULL, false, 500000000, 75000, false, 107.0, -1);


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES (1, 'First', 1, 1);
INSERT INTO public.info VALUES (2, 'Second', 2, 2);
INSERT INTO public.info VALUES (3, 'Third', 3, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', NULL, true, -1, NULL, false, 401.0, -1, 5);
INSERT INTO public.moon VALUES (2, 'adrastea', NULL, true, -1, NULL, false, 402.0, -1, 5);
INSERT INTO public.moon VALUES (3, 'Amaltea', NULL, true, -1, NULL, false, 403.0, -1, 5);
INSERT INTO public.moon VALUES (4, 'Tebe', NULL, true, -1, NULL, false, 404.0, -1, 5);
INSERT INTO public.moon VALUES (5, 'Io', NULL, true, -1, NULL, false, 405.0, -1, 5);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, true, -1, NULL, false, 406.0, -1, 5);
INSERT INTO public.moon VALUES (7, 'Ganimedes', NULL, true, -1, NULL, false, 407.0, -1, 5);
INSERT INTO public.moon VALUES (8, 'Kallisto', NULL, true, -1, NULL, false, 408.0, -1, 5);
INSERT INTO public.moon VALUES (9, 'Temisto', NULL, true, -1, NULL, false, 409.0, -1, 5);
INSERT INTO public.moon VALUES (10, 'Leda', NULL, true, -1, NULL, false, 410.0, -1, 5);
INSERT INTO public.moon VALUES (11, 'Himalia', NULL, true, -1, NULL, false, 411.0, -1, 5);
INSERT INTO public.moon VALUES (12, 'Ersa', NULL, true, -1, NULL, false, 412.0, -1, 5);
INSERT INTO public.moon VALUES (13, 'Pande', NULL, true, -1, NULL, false, 413.0, -1, 5);
INSERT INTO public.moon VALUES (14, 'Lizytea', NULL, true, -1, NULL, false, 414.0, -1, 5);
INSERT INTO public.moon VALUES (15, 'Elara', NULL, true, -1, NULL, false, 415.0, -1, 5);
INSERT INTO public.moon VALUES (16, 'Dia', NULL, true, -1, NULL, false, 416.0, -1, 5);
INSERT INTO public.moon VALUES (17, 'Karpo', NULL, true, -1, NULL, false, 417.0, -1, 5);
INSERT INTO public.moon VALUES (18, 'Valetudo', NULL, true, -1, NULL, false, 418.0, -1, 5);
INSERT INTO public.moon VALUES (19, 'S/2003 J 12', NULL, true, -1, NULL, false, 419.0, -1, 5);
INSERT INTO public.moon VALUES (20, 'Europie', NULL, true, -1, NULL, false, 420.0, -1, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Merkury', NULL, true, 57, NULL, false, 301.0, -1, 1);
INSERT INTO public.planet VALUES (2, 'Wenus', NULL, true, 108, NULL, false, 302.0, -1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, true, 0, NULL, true, 303.0, -1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, true, 227, NULL, false, 304.0, -1, 2);
INSERT INTO public.planet VALUES (5, 'Jowisz', NULL, true, 778, NULL, false, 305.0, -1, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, true, 1418, NULL, false, 306.0, -1, 3);
INSERT INTO public.planet VALUES (7, 'Uran', NULL, true, 2818, NULL, false, 307.0, -1, 4);
INSERT INTO public.planet VALUES (8, 'Neptun', NULL, true, 4500, NULL, false, 308.0, -1, 4);
INSERT INTO public.planet VALUES (9, 'EOS', NULL, true, -1, NULL, false, 309.0, -1, 5);
INSERT INTO public.planet VALUES (10, 'Havarl', NULL, true, -1, NULL, false, 310.0, -1, 5);
INSERT INTO public.planet VALUES (11, 'Reyer', NULL, true, -1, NULL, false, 311.0, -1, 6);
INSERT INTO public.planet VALUES (12, 'Ryder-I', NULL, true, -1, NULL, false, 312.0, -1, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sirius', NULL, true, -1, 1500, false, 205.0, -1, 3);
INSERT INTO public.star VALUES (1, 'LGGS J004520.67', NULL, true, -1, 2510, false, 201.0, -1, 1);
INSERT INTO public.star VALUES (2, 'LGGS J0044105.97', NULL, true, -1, 2915, false, 202.0, -1, 1);
INSERT INTO public.star VALUES (3, 'LGGS J004539.99', NULL, true, -1, 1792, false, 203.0, -1, 1);
INSERT INTO public.star VALUES (4, 'Sun', NULL, true, 0, 1500, false, 204.0, -1, 2);
INSERT INTO public.star VALUES (6, 'Abcdef', NULL, true, 194748344, 1500, false, 206.0, -1, 5);


--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_universe_id_seq', 38, true);


--
-- Name: info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.info_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_number_key UNIQUE (number);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (info_id);


--
-- Name: info info_variab_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_variab_key UNIQUE (variab);


--
-- Name: moon moon_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_number_key UNIQUE (number);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_number_key UNIQUE (number);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_number_key UNIQUE (number);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

