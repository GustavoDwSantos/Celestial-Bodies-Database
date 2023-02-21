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
    name character varying(40) NOT NULL,
    size_in_light_years integer,
    distance_from_earth_in_kiloparsecs integer,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(5) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    is_spherical boolean,
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
    name character varying(40) NOT NULL,
    habitable_zone boolean,
    mass_in_earth_mass numeric(6,3),
    surface_gravity numeric(5,2),
    diameter_in_km integer,
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
    name character varying(40) NOT NULL,
    mass_in_solar_mass numeric(6,2),
    age_in_million_of_years integer,
    star_classification_id integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_classification; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_classification (
    name character varying(10) NOT NULL,
    description text,
    star_classification_id integer NOT NULL
);


ALTER TABLE public.star_classification OWNER TO freecodecamp;

--
-- Name: star_classification_star_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_classification_star_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_classification_star_classification_id_seq OWNER TO freecodecamp;

--
-- Name: star_classification_star_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_classification_star_classification_id_seq OWNED BY public.star_classification.star_classification_id;


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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_classification star_classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_classification ALTER COLUMN star_classification_id SET DEFAULT nextval('public.star_classification_star_classification_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 87400, 8, 1);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 152000, 765, 1);
INSERT INTO public.galaxy VALUES (5, 'IC 1101', 500000, 354000, 3);
INSERT INTO public.galaxy VALUES (6, 'Alcyoneus', 242700, 1100000, 3);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 76900, 7100, 8);
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 49000, 9550, 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'B', 'Barred spiral');
INSERT INTO public.galaxy_type VALUES (2, 'D', 'Rotational symmetry without pronounced spiral or elliptical structure');
INSERT INTO public.galaxy_type VALUES (3, 'E', 'Elliptical');
INSERT INTO public.galaxy_type VALUES (4, 'Ep', 'Elliptical with dust absorption');
INSERT INTO public.galaxy_type VALUES (5, 'I', 'Irregular');
INSERT INTO public.galaxy_type VALUES (6, 'L', 'Low surface brightness');
INSERT INTO public.galaxy_type VALUES (7, 'N', 'Small bright nucleus ');
INSERT INTO public.galaxy_type VALUES (8, 'S', 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, false, 6);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, true, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820, true, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3642, true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3120, true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 166, false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 139, false, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 98, false, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 5148, true, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1526, true, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 1496, true, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1122, true, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 1062, true, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', 504, true, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', 396, true, 6);
INSERT INTO public.moon VALUES (18, 'hyperion', 270, false, 6);
INSERT INTO public.moon VALUES (19, 'Phoebe', 212, false, 6);
INSERT INTO public.moon VALUES (20, 'Triton', 2606, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1.000, 9.81, 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 0.055, 3.70, 4880, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 0.815, 8.87, 12103, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 0.107, 3.72, 6779, 1);
INSERT INTO public.planet VALUES (5, 'Jupter', false, 317.890, 24.79, 139820, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 95.160, 10.44, 116464, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 14.540, 8.87, 50724, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 17.150, 11.15, 49, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', true, 1.070, 10.06, NULL, 8);
INSERT INTO public.planet VALUES (10, 'TOI 700 d', true, 1.720, NULL, 10970, 9);
INSERT INTO public.planet VALUES (11, 'TOI 700 b', false, 1.070, NULL, 5829, 9);
INSERT INTO public.planet VALUES (12, 'TOI 700 c', false, 7.480, NULL, 16583, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 4603, 1, NULL);
INSERT INTO public.star VALUES (7, 'Van Maanen 2', 0.67, 3450, 10, 3);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 0.12, 4850, 1, 3);
INSERT INTO public.star VALUES (9, 'TOI 700 ', 0.42, 1500, 1, 3);
INSERT INTO public.star VALUES (10, 'VY Canis Majoris', 17.00, 8, 2, 3);
INSERT INTO public.star VALUES (11, 'Gamma Cygni', 12.11, 12, 4, 3);


--
-- Data for Name: star_classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_classification VALUES ('V', 'Main-sequence stars(Dwarfs)', 1);
INSERT INTO public.star_classification VALUES ('0 or Ia+', 'hypergiants or extremely luminous supergiants', 2);
INSERT INTO public.star_classification VALUES ('Ia', 'luminous supergiants', 3);
INSERT INTO public.star_classification VALUES ('Iab', 'intermediate-size luminous supergiants', 4);
INSERT INTO public.star_classification VALUES ('Ib', 'less luminous supergiants', 5);
INSERT INTO public.star_classification VALUES ('II', 'bright giants', 6);
INSERT INTO public.star_classification VALUES ('III', 'normal giants', 7);
INSERT INTO public.star_classification VALUES ('IV', 'subgiants', 8);
INSERT INTO public.star_classification VALUES ('sd or VI', 'subdwarfs', 9);
INSERT INTO public.star_classification VALUES ('D or VII', 'white dwarfs', 10);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_classification_star_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_classification_star_classification_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: star_classification star_classification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_classification
    ADD CONSTRAINT star_classification_name_key UNIQUE (name);


--
-- Name: star_classification star_classification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_classification
    ADD CONSTRAINT star_classification_pkey PRIMARY KEY (star_classification_id);


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
-- Name: star star_star_classification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_classification_id_fkey FOREIGN KEY (star_classification_id) REFERENCES public.star_classification(star_classification_id);


--
-- PostgreSQL database dump complete
--

