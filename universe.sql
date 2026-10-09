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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    orbital_period_years numeric(6,2),
    is_dangerous boolean,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    has_life boolean,
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    discovered_year integer,
    is_spherical boolean,
    has_atmosphere boolean,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    distance_from_star numeric(12,2),
    has_life boolean,
    is_spherical boolean,
    description text
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    distance_from_earth numeric(12,2),
    has_planets boolean,
    is_visible_to_naked_eye boolean,
    description text
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

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 940, 4.60, false, 'Planeta anao no cinturao de asteroides.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525, 3.63, false, 'Segundo maior corpo do cinturao de asteroides.');
INSERT INTO public.asteroid VALUES (3, 'Apophis', 1, 1, 0.89, true, 'Asteroide proximo da Terra monitorado por astronomos.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Espiral barrada', 13600, 0.00, true, 'Galaxia que contem o Sistema Solar.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Espiral', 10000, 2537000.00, false, 'Galaxia espiral grande mais proxima da Via Lactea.');
INSERT INTO public.galaxy VALUES (3, 'Triangulo', 'Espiral', 10000, 2730000.00, false, 'Terceira maior galaxia do Grupo Local.');
INSERT INTO public.galaxy VALUES (4, 'Grande Nuvem de Magalhaes', 'Irregular', 13000, 163000.00, false, 'Galaxia satelite da Via Lactea.');
INSERT INTO public.galaxy VALUES (5, 'Redemoinho', 'Espiral', 400, 23000000.00, false, 'Galaxia espiral em interacao com uma companheira menor.');
INSERT INTO public.galaxy VALUES (6, 'Sombreiro', 'Lenticular', 9000, 29000000.00, false, 'Galaxia com grande bojo central e anel de poeira.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', 3, 3474, NULL, true, false, 'Unico satelite natural da Terra.');
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 22, 1877, false, false, 'Maior das duas luas de Marte.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1877, false, false, 'Menor lua de Marte.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1610, true, true, 'Corpo com maior atividade vulcanica do Sistema Solar.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 1610, true, true, 'Possui oceano subterraneo sob crosta de gelo.');
INSERT INTO public.moon VALUES (6, 'Ganimedes', 5, 5268, 1610, true, true, 'Maior lua do Sistema Solar.');
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 4821, 1610, true, true, 'Superficie muito craterizada.');
INSERT INTO public.moon VALUES (8, 'Amalteia', 5, 167, 1892, false, false, 'Lua irregular de Jupiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, 1655, true, true, 'Possui atmosfera densa e lagos de metano.');
INSERT INTO public.moon VALUES (10, 'Encelado', 6, 504, 1789, true, false, 'Emite jatos de agua do polo sul.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, 1789, true, false, 'Tem uma grande cratera de impacto.');
INSERT INTO public.moon VALUES (12, 'Reia', 6, 1527, 1672, true, false, 'Segunda maior lua de Saturno.');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1123, 1684, true, false, 'Lua gelada de Saturno.');
INSERT INTO public.moon VALUES (14, 'Japeto', 6, 1469, 1671, true, false, 'Possui hemisferios de cores muito diferentes.');
INSERT INTO public.moon VALUES (15, 'Tetis', 6, 1062, 1684, true, false, 'Lua gelada com enorme cratera.');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1578, 1787, true, false, 'Maior lua de Urano.');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1523, 1787, true, false, 'Segunda maior lua de Urano.');
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 472, 1948, true, false, 'Lua com terreno muito variado.');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 1851, true, false, 'Lua brilhante de Urano.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 1846, true, true, 'Maior lua de Netuno, com orbita retrograda.');
INSERT INTO public.moon VALUES (21, 'Nereida', 8, 340, 1949, false, false, 'Lua irregular de Netuno com orbita excentrica.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 4879, 57.90, false, true, 'Planeta mais proximo do Sol.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 108.20, false, true, 'Planeta com atmosfera densa e efeito estufa intenso.');
INSERT INTO public.planet VALUES (3, 'Terra', 1, 12742, 149.60, true, true, 'Unico planeta conhecido com vida.');
INSERT INTO public.planet VALUES (4, 'Marte', 1, 6779, 227.90, false, true, 'O planeta vermelho.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, 778.50, false, true, 'Maior planeta do Sistema Solar.');
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 116460, 1434.00, false, true, 'Famoso por seus aneis.');
INSERT INTO public.planet VALUES (7, 'Urano', 1, 50724, 2871.00, false, true, 'Gigante de gelo com rotacao inclinada.');
INSERT INTO public.planet VALUES (8, 'Netuno', 1, 49244, 4495.00, false, true, 'Gigante de gelo mais distante do Sol.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 14000, 7.50, false, true, 'Exoplaneta na zona habitavel de Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Proxima d', 3, 6000, 4.00, false, true, 'Candidato a exoplaneta muito proximo de Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Sirius I', 2, 15000, 120.00, false, true, 'Planeta hipotetico em orbita de Sirius.');
INSERT INTO public.planet VALUES (12, 'Sirius II', 2, 9000, 300.00, false, true, 'Planeta hipotetico distante de Sirius.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 4600, 5772, 0.00, true, true, 'Estrela central do Sistema Solar.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, 8.60, true, true, 'A estrela mais brilhante do ceu noturno.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, 3042, 4.25, true, false, 'Anã vermelha, a estrela mais proxima do Sol.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 3600, 548.00, false, true, 'Supergigante vermelha na constelacao de Orion.');
INSERT INTO public.star VALUES (5, 'Andromeda V1', 2, 100, 6000, 2537000.00, false, false, 'Variavel Cefeida famosa usada por Hubble.');
INSERT INTO public.star VALUES (6, 'Triangulo B1', 3, 200, 7500, 2730000.00, false, false, 'Estrela de exemplo na galaxia do Triangulo.');
INSERT INTO public.star VALUES (7, 'Magalhaes S1', 4, 50, 25000, 163000.00, false, false, 'Estrela quente e jovem na Grande Nuvem de Magalhaes.');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

