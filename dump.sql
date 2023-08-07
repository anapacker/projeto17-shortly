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
    "viSitCount" integer DEFAULT 0,
    "createAt" timestamp without time zone DEFAULT now()
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
-- Name: shortedUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortedUrls" (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitorsCount" integer DEFAULT 0,
    "createAt" timestamp without time zone DEFAULT now(),
    "userId" integer
);


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortedUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortedUrls_id_seq" OWNED BY public."shortedUrls".id;


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
-- Name: shortedUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls" ALTER COLUMN id SET DEFAULT nextval('public."shortedUrls_id_seq"'::regclass);


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
INSERT INTO public.sessions VALUES (5, 4, '57ea2f17-e78d-4155-a89e-e04f0f013a4c', '2023-08-06 18:59:08.473939');
INSERT INTO public.sessions VALUES (6, 5, 'e5ae3aee-3a20-4afb-94d9-cd7d8ec04388', '2023-08-06 19:08:03.536966');
INSERT INTO public.sessions VALUES (7, 6, '34966791-b414-43f8-9110-7485ded23c06', '2023-08-06 19:47:55.43017');
INSERT INTO public.sessions VALUES (9, 7, 'd05b1642-9700-4f72-b1c7-12d2600dff35', '2023-08-06 20:42:15.122188');
INSERT INTO public.sessions VALUES (11, 8, '3812acac-0e76-4065-9183-2373591da0d4', '2023-08-06 20:50:40.752594');
INSERT INTO public.sessions VALUES (12, 9, '6c54d1f2-8b38-4bbc-8f87-cf60f7fbf6d1', '2023-08-06 20:53:41.477409');
INSERT INTO public.sessions VALUES (14, 10, 'd21fbc96-149d-4ab1-ad04-06036bddda1c', '2023-08-07 12:38:40.339762');


--
-- Data for Name: shortedUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortedUrls" VALUES (1, 'https://google.com.br', 'KtTm86WMHq', 0, '2023-08-06 21:35:50.533453', 9);
INSERT INTO public."shortedUrls" VALUES (2, 'https://google.com', 'tZbWAIQ7-j', 0, '2023-08-06 21:38:29.582248', 9);
INSERT INTO public."shortedUrls" VALUES (3, 'https://google.com.algumacoisa', 'zhTvPURV80', 0, '2023-08-06 21:51:30.630183', 9);
INSERT INTO public."shortedUrls" VALUES (4, 'https://google.com.pt', 'E8hCxQFtWm', 0, '2023-08-06 21:56:57.172048', 9);
INSERT INTO public."shortedUrls" VALUES (5, 'https://orkut.com.pt', '1Jl7vYtsZf', 0, '2023-08-06 22:10:55.016366', 9);
INSERT INTO public."shortedUrls" VALUES (6, 'https://orkut.com.br', 'Pcw7f5hDCq', 0, '2023-08-06 23:23:47.364129', 9);
INSERT INTO public."shortedUrls" VALUES (7, 'https://instagrao.com.br', 'NwsunSlg1O', 0, '2023-08-07 12:44:38.203066', 10);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Ana', 'ana@maria.com', '$2b$10$ShY0HiX362yNEJ4rrBrzaO2Raj4k67NPec7iQeDFSf4tZVUNO1pdS', '2023-08-05 15:56:43.452916');
INSERT INTO public.users VALUES (2, 'felype', 'felype@pipipi.com', '$2b$10$.JdQvjCL/ty8pbBLZjyh7eOi2DwMARd3DntooCNa0O0zzKcRp.xd6', '2023-08-05 16:04:57.618156');
INSERT INTO public.users VALUES (3, 'patrick', 'patrick@star.com', '$2b$10$64n0Zmlu382t2ww1vUaTJOaLGigEk/VMK5eyTFcl8gwAj262HYIP.', '2023-08-06 15:31:37.470071');
INSERT INTO public.users VALUES (4, 'lana del rey', 'lanadel@rey.com', '$2b$10$8XK7qabbsroYo51.OKmQu.qiWlrXeo4pNNp.zTg4FvosmmOkrkDPO', '2023-08-06 18:58:35.394586');
INSERT INTO public.users VALUES (5, 'bonnie', 'bonnie@tyler.com', '$2b$10$bUAOTlAaLBA8iPq0vMNy2OCOzf4bVIDh/OunQajm3IOVyYtongpkm', '2023-08-06 19:07:41.574108');
INSERT INTO public.users VALUES (6, 'rosalia', 'rosalia@lia.com', '$2b$10$CzZ5SL6frsRZE3O5I5BuDevAMY//qz84QLq1ihrM6MFebty9BhiOq', '2023-08-06 19:47:33.237944');
INSERT INTO public.users VALUES (7, 'rihana', 'rihana@riri.com', '$2b$10$7Cf7Y4k8xWsjVsh.fs2N0.g7DBLctjQhfxCNIgeYsV3X6iKUncitq', '2023-08-06 20:42:04.644799');
INSERT INTO public.users VALUES (8, 'madonna', 'madona@riri.com', '$2b$10$dAdHQK9leHIG1Ynswnw6neeJTf14vA/M.LoFVT6dtFZX7V2joa8i.', '2023-08-06 20:50:26.083094');
INSERT INTO public.users VALUES (9, 'mario', 'mario@riri.com', '$2b$10$BM8mjj9xcmv41LiihAzkQOoOKIt0ep9Fm3rsD34cqx4.ew88Cf8Fq', '2023-08-06 20:53:21.997422');
INSERT INTO public.users VALUES (10, 'henrique', 'henrique@pink.com', '$2b$10$xlebLWT4wWgHXjEINFZacOKVCUxGNVq6BbomzETjLgW859V80XTZe', '2023-08-07 12:38:30.368481');


--
-- Name: ranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ranking_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 14, true);


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortedUrls_id_seq"', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


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
-- Name: shortedUrls shortedUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_pkey" PRIMARY KEY (id);


--
-- Name: shortedUrls shortedUrls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: shortedUrls shortedUrls_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_url_key" UNIQUE (url);


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
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortedUrls shortedUrls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

