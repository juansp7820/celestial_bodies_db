--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    hubble_class character varying(5),
    is_active boolean,
    distance_in_lyrs numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: COLUMN galaxy.hubble_class; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.hubble_class IS 'The Hubble classification of a galaxy; it´s a morphological classification.';


--
-- Name: COLUMN galaxy.distance_in_lyrs; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.distance_in_lyrs IS 'Distance in millions of light years from the Earth.';


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(18) NOT NULL,
    mass numeric,
    mean_radius numeric,
    avg_orbital_speed numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: COLUMN moon.mass; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.mass IS 'An estimation of mass given in exograms (Egs), which is, a quintillion grams.';


--
-- Name: COLUMN moon.mean_radius; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.mean_radius IS 'An estimation of mean radius, given in kilometers.';


--
-- Name: COLUMN moon.avg_orbital_speed; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.avg_orbital_speed IS 'Average orbital speed, in kilometers per second.';


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
-- Name: others; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.others (
    others_id integer NOT NULL,
    name character varying(18) NOT NULL,
    type character varying(18),
    description text
);


ALTER TABLE public.others OWNER TO freecodecamp;

--
-- Name: others_others_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.others_others_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.others_others_id_seq OWNER TO freecodecamp;

--
-- Name: others_others_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.others_others_id_seq OWNED BY public.others.others_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(18) NOT NULL,
    relative_mass numeric,
    orbital_period numeric,
    has_rings boolean,
    how_many_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: COLUMN planet.relative_mass; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.relative_mass IS 'Mass of a given planet relative to the mass of the Earth.';


--
-- Name: COLUMN planet.orbital_period; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.orbital_period IS 'Orbital period given in years.';


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
    name character varying(18) NOT NULL,
    distance_in_lyrs numeric,
    how_many_planets integer,
    is_binary boolean,
    galaxy_id integer DEFAULT 1
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: COLUMN star.distance_in_lyrs; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.distance_in_lyrs IS 'Estimated distance of a given star to the Earth in light years.';


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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: others others_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others ALTER COLUMN others_id SET DEFAULT nextval('public.others_others_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Sb', false, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Sa', false, 2.50);
INSERT INTO public.galaxy VALUES (3, 'NGC 1427A', 'Irr', false, 62);
INSERT INTO public.galaxy VALUES (4, 'MACS 2129-1', 'Disc', NULL, 18000);
INSERT INTO public.galaxy VALUES (5, 'JADES-GS-z7-01-QU', 'LBG', NULL, 650);
INSERT INTO public.galaxy VALUES (6, 'Messier 88', 'Sa', true, 58.66);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 73460, 1738, 1.022, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.011, 11.267, 2.138, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.001, 6.2, 1.351, 4);
INSERT INTO public.moon VALUES (4, 'Io', 89300, 1821.6, 17.334, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 47990, 1560.8, 13.7, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 148150, 2634.1, 10.9, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 107570, 2410.3, 8.2, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 37.51, 198.2, 14.28, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 108.0, 252.1, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 617.5, 533.1, 11.35, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1095, 561.4, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 2306, 763.8, 8.48, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 134520, 2574.73, 5.57, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 5.551, 135, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1805, 735.6, 3.26, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', NULL, 578.9, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', NULL, 584.7, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Titania', NULL, 788.9, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', NULL, 761.4, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', NULL, 235.8, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 21389, 1353.4, 4.39, 8);


--
-- Data for Name: others; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.others VALUES (1, 'Halley Comet', 'Comet', 'A short-period comet that is visible to the naked eye; it appears approximately every 75 years.');
INSERT INTO public.others VALUES (2, 'Gonggong', 'Dwarf planet', 'A dwarf planet in our solar system, orbiting beyond Neptune. Its moon is called "Xiangliu".');
INSERT INTO public.others VALUES (3, 'Oumuamua', 'Object', 'The first interestellar object confirmed to visit our solar system. Relatively small and possibly rocky.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.06, 0.241, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.82, 0.615, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.11, 1.881, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 318, 11.862, false, 115, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95, 29.547, true, 292, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.6, 84.020, true, 29, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.2, 164.8, true, 16, 1);
INSERT INTO public.planet VALUES (9, 'Gliese 876 d', 6.83, 0.0052, false, NULL, 2);
INSERT INTO public.planet VALUES (10, 'TOI-4529 b', 4.9, 0.016, false, NULL, 7);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 7.99, 0.0019, false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-452 b', 3.29, 1.05, false, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 8, false, 1);
INSERT INTO public.star VALUES (2, 'Gliese 876', 15, 4, false, 1);
INSERT INTO public.star VALUES (3, '55 Cancri', 41, 5, true, 1);
INSERT INTO public.star VALUES (4, 'Kepler-452', 1799, 1, false, 1);
INSERT INTO public.star VALUES (5, 'Chara', 28, 0, false, 1);
INSERT INTO public.star VALUES (6, 'Psi Capricorni', 48, 0, false, 1);
INSERT INTO public.star VALUES (7, 'TOI-4529', 92.6, 1, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: others_others_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.others_others_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: others others_others_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others
    ADD CONSTRAINT others_others_id_key UNIQUE (others_id);


--
-- Name: others others_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others
    ADD CONSTRAINT others_pkey PRIMARY KEY (others_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

