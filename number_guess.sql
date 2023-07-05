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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: player_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player_data (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.player_data OWNER TO freecodecamp;

--
-- Name: player_data_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_data_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_data_user_id_seq OWNER TO freecodecamp;

--
-- Name: player_data_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_data_user_id_seq OWNED BY public.player_data.user_id;


--
-- Name: player_data user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_data ALTER COLUMN user_id SET DEFAULT nextval('public.player_data_user_id_seq'::regclass);


--
-- Data for Name: player_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player_data VALUES (1, 'Adam', 1, 1);
INSERT INTO public.player_data VALUES (3, 'user_1688576542591', 2, 83);
INSERT INTO public.player_data VALUES (2, 'user_1688576542592', 3, 150);
INSERT INTO public.player_data VALUES (4, 'user_1688576821677', 2, 97);
INSERT INTO public.player_data VALUES (5, 'user_1688576821676', 1, 439);
INSERT INTO public.player_data VALUES (7, 'user_1688576851333', 2, 160);
INSERT INTO public.player_data VALUES (6, 'user_1688576851334', 3, 221);


--
-- Name: player_data_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_data_user_id_seq', 7, true);


--
-- Name: player_data player_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_data
    ADD CONSTRAINT player_data_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

