--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

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
-- Name: table1; Type: TABLE; Schema: public; Owner: cyrilvixp
--

CREATE TABLE table1 (
    id bigint NOT NULL,
    name character varying(250),
    type smallint,
    value text
);


ALTER TABLE table1 OWNER TO cyrilvixp;

--
-- Name: table1_id_seq; Type: SEQUENCE; Schema: public; Owner: cyrilvixp
--

CREATE SEQUENCE table1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE table1_id_seq OWNER TO cyrilvixp;

--
-- Name: table1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cyrilvixp
--

ALTER SEQUENCE table1_id_seq OWNED BY table1.id;


--
-- Name: table2; Type: TABLE; Schema: public; Owner: cyrilvixp
--

CREATE TABLE table2 (
    id bigint NOT NULL,
    type smallint,
    options text[]
);


ALTER TABLE table2 OWNER TO cyrilvixp;

--
-- Name: table2_id_seq; Type: SEQUENCE; Schema: public; Owner: cyrilvixp
--

CREATE SEQUENCE table2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE table2_id_seq OWNER TO cyrilvixp;

--
-- Name: table2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cyrilvixp
--

ALTER SEQUENCE table2_id_seq OWNED BY table2.id;


--
-- Name: table1 id; Type: DEFAULT; Schema: public; Owner: cyrilvixp
--

ALTER TABLE ONLY table1 ALTER COLUMN id SET DEFAULT nextval('table1_id_seq'::regclass);


--
-- Name: table2 id; Type: DEFAULT; Schema: public; Owner: cyrilvixp
--

ALTER TABLE ONLY table2 ALTER COLUMN id SET DEFAULT nextval('table2_id_seq'::regclass);


--
-- Data for Name: table1; Type: TABLE DATA; Schema: public; Owner: cyrilvixp
--

COPY table1 (id, name, type, value) FROM stdin;
1	Some name #1	10	Some value text
2	Some name #2	2	Some other value text
3	Some name #3	11	Some new value text
4	Some name #4	10	Some great value text
\.


--
-- Name: table1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cyrilvixp
--

SELECT pg_catalog.setval('table1_id_seq', 4, true);


--
-- Data for Name: table2; Type: TABLE DATA; Schema: public; Owner: cyrilvixp
--

COPY table2 (id, type, options) FROM stdin;
1	10	{new,nice,cool}
2	11	{great,awesome,incredible}
3	5	{cute,great,cool}
4	10	{amazing,outstanding,impressive}
\.


--
-- Name: table2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cyrilvixp
--

SELECT pg_catalog.setval('table2_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

