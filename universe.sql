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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_sun integer,
    size character varying(20),
    discovery_date date
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_billions_of_years numeric(10,3),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_billions_of_years numeric(10,3),
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
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(10,3),
    distance_from_earth integer,
    description text,
    is_spherical boolean,
    has_life boolean,
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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_billions_of_years numeric(10,3),
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_belt_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 414000000, 'Dwarf Planet', '1801-01-01');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 353000000, 'Asteroid', '1807-03-29');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 414000000, 'Asteroid', '1802-03-28');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 470000000, 'Asteroid', '1849-04-12');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 13.600, 'our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3, 10.100, 'Closest spiral galaxy to Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 5.700, 'Part of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 54, 13.200, 'Located in the Virgo Cluster');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 23, 0.400, 'Known for its spiral structure');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 28, 9.550, 'Distinctive hat-shaped appearance');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 4.500, 2);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460, 0.200, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 9376, 0.200, 3);
INSERT INTO public.moon VALUES (4, 'Andromeda Moon', 250000, 1.800, 4);
INSERT INTO public.moon VALUES (5, 'Triangulum Moon', 300000, 1.800, 5);
INSERT INTO public.moon VALUES (6, 'M87 Moon', 54000000, 0.100, 6);
INSERT INTO public.moon VALUES (7, 'Whirlpool Satellite', 23000000, 0.200, 7);
INSERT INTO public.moon VALUES (8, 'Sombrero Satellite', 28000000, 4.200, 8);
INSERT INTO public.moon VALUES (9, 'Vega Moonlet', 25, 0.300, 9);
INSERT INTO public.moon VALUES (10, 'Sunlit Companion', 150, 2.500, 10);
INSERT INTO public.moon VALUES (11, 'Blue Marble Satellite', 10, 4.600, 11);
INSERT INTO public.moon VALUES (12, 'Twilight Guardian', 35000000, 1.000, 12);
INSERT INTO public.moon VALUES (13, 'Lunar Companion', 384400, 4.500, 2);
INSERT INTO public.moon VALUES (14, 'Martian Moonlet', 23460, 0.200, 3);
INSERT INTO public.moon VALUES (15, 'Andromeda Satellite', 250000, 1.800, 4);
INSERT INTO public.moon VALUES (16, 'Triangulum Satellite', 300000, 1.800, 5);
INSERT INTO public.moon VALUES (17, 'Whirlpool Moonlet', 23000000, 0.200, 7);
INSERT INTO public.moon VALUES (18, 'Sombrero Moonlet', 28000000, 4.200, 8);
INSERT INTO public.moon VALUES (19, 'Vega Satellite', 25, 0.300, 9);
INSERT INTO public.moon VALUES (20, 'Sunlit Moonlet', 150, 2.500, 10);
INSERT INTO public.moon VALUES (21, 'Blue Marble Companion', 10, 4.600, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.500, 57, 'Closest planet to the Sun', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Earth', 4.600, 0, 'Our home planet', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 4.600, 78, 'Red planet with diverse geography', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Andromeda Prime', 3.200, 2500000, 'Planet in the Andromeda system', true, false, 2);
INSERT INTO public.planet VALUES (5, 'Triangulum Alpha', 1.800, 3000000, 'Habitable planet in the Triangulum galaxy', true, true, 3);
INSERT INTO public.planet VALUES (6, 'M87 Exoplanet', 0.100, 54000000, 'Exoplanet in the Messier 87 system', true, false, 4);
INSERT INTO public.planet VALUES (7, 'Whirlpool Oasis', 0.200, 23000000, 'Lush planet in the Whirlpool Galaxy', true, true, 5);
INSERT INTO public.planet VALUES (8, 'Sombrero Paradise', 4.200, 28000000, 'Scenic planet in the Sombrero Galaxy', true, false, 6);
INSERT INTO public.planet VALUES (9, 'Vega Retreat', 0.300, 25, 'Resort planet orbiting Vega', true, false, 6);
INSERT INTO public.planet VALUES (10, 'Sunlit Haven', 2.500, 150, 'Planet with perpetual daylight orbiting the Sun', true, false, 1);
INSERT INTO public.planet VALUES (11, 'Blue Marble', 4.600, 10, 'Earth-like planet with vast oceans', true, false, 1);
INSERT INTO public.planet VALUES (12, 'Eternal Twilight', 1.000, 35000000, 'Planet in perpetual twilight in the Whirlpool Galaxy', true, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 93, 4.600, 1);
INSERT INTO public.star VALUES (2, 'Andromeda Star', 2500000, 13.000, 2);
INSERT INTO public.star VALUES (3, 'Triangulum Star', 3000000, 2.500, 3);
INSERT INTO public.star VALUES (4, 'Messier 87 Star', 54000000, 5.800, 4);
INSERT INTO public.star VALUES (5, 'Whirlpool Star', 23000000, 0.600, 5);
INSERT INTO public.star VALUES (6, 'Sombrero Star', 28000000, 8.100, 6);


--
-- Name: asteroid_belt_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: asteroid name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


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

