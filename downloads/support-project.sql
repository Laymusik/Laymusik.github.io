--
-- PostgreSQL database dump
--

\restrict oUfjAsgARuyI1lbkzG50e847hYnXNcKD1LdhPUXftLHaYnEJzY09qoASvn9E5Hu

-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11 (Debian 17.11-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    title text NOT NULL,
    status text DEFAULT 'new'::text NOT NULL,
    priority integer DEFAULT 3 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    resolved_at timestamp with time zone,
    CONSTRAINT tickets_priority_check CHECK (((priority >= 1) AND (priority <= 4))),
    CONSTRAINT tickets_status_check CHECK ((status = ANY (ARRAY['new'::text, 'in_progress'::text, 'resolved'::text])))
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tickets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tickets (id, title, status, priority, created_at, resolved_at) FROM stdin;
2	Slow database query	in_progress	2	2026-09-18 13:24:23.413176+00	\N
3	Password reset	new	3	2026-09-18 13:24:23.413176+00	\N
1	Website unavailable	resolved	1	2026-09-18 13:24:23.413176+00	2026-09-18 13:27:01.802627+00
\.


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tickets_id_seq', 3, true);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict oUfjAsgARuyI1lbkzG50e847hYnXNcKD1LdhPUXftLHaYnEJzY09qoASvn9E5Hu

