--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: ranking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ranking (
    id integer NOT NULL,
    "userId" integer,
    "linksCount" integer DEFAULT 0,
    "viSitCount" integer DEFAULT 0
);


--
-- Name: ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ranking_id_seq OWNED BY public.ranking.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text,
    "createAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shortlyUrl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortlyUrl" (
    id integer NOT NULL,
    "linkId" text NOT NULL,
    "shortLink" text NOT NULL,
    "visitorsCount" integer DEFAULT 0,
    "createAt" timestamp without time zone DEFAULT now(),
    "userId" integer
);


--
-- Name: shortlyUrl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortlyUrl_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortlyUrl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortlyUrl_id_seq" OWNED BY public."shortlyUrl".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: ranking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking ALTER COLUMN id SET DEFAULT nextval('public.ranking_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shortlyUrl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortlyUrl" ALTER COLUMN id SET DEFAULT nextval('public."shortlyUrl_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ranking; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, '74743f35-0cfe-4536-b9dd-de45658b6d54', '2023-08-05 17:57:32.876032');
INSERT INTO public.sessions VALUES (3, 1, '53a080d9-3c9f-4156-a781-f53e6e90f5c4', '2023-08-06 15:28:05.531298');
INSERT INTO public.sessions VALUES (4, 3, '321e52e9-b19d-4c02-9618-79cde145d502', '2023-08-06 15:32:33.28939');


--
-- Data for Name: shortlyUrl; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Ana', 'ana@maria.com', '$2b$10$ShY0HiX362yNEJ4rrBrzaO2Raj4k67NPec7iQeDFSf4tZVUNO1pdS', '2023-08-05 15:56:43.452916');
INSERT INTO public.users VALUES (2, 'felype', 'felype@pipipi.com', '$2b$10$.JdQvjCL/ty8pbBLZjyh7eOi2DwMARd3DntooCNa0O0zzKcRp.xd6', '2023-08-05 16:04:57.618156');
INSERT INTO public.users VALUES (3, 'patrick', 'patrick@star.com', '$2b$10$64n0Zmlu382t2ww1vUaTJOaLGigEk/VMK5eyTFcl8gwAj262HYIP.', '2023-08-06 15:31:37.470071');


--
-- Name: ranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ranking_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: shortlyUrl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortlyUrl_id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: ranking ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- Name: ranking ranking_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT "ranking_userId_key" UNIQUE ("userId");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_key" UNIQUE ("userId");


--
-- Name: shortlyUrl shortlyUrl_linkId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortlyUrl"
    ADD CONSTRAINT "shortlyUrl_linkId_key" UNIQUE ("linkId");


--
-- Name: shortlyUrl shortlyUrl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortlyUrl"
    ADD CONSTRAINT "shortlyUrl_pkey" PRIMARY KEY (id);


--
-- Name: shortlyUrl shortlyUrl_shortLink_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortlyUrl"
    ADD CONSTRAINT "shortlyUrl_shortLink_key" UNIQUE ("shortLink");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ranking ranking_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT "ranking_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortlyUrl shortlyUrl_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortlyUrl"
    ADD CONSTRAINT "shortlyUrl_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

