--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sorts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sorts (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    bubble double precision,
    quick double precision,
    merge double precision,
    input integer,
    name character varying(255),
    insertion double precision
);


--
-- Name: sorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sorts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sorts_id_seq OWNED BY sorts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sorts ALTER COLUMN id SET DEFAULT nextval('sorts_id_seq'::regclass);


--
-- Name: sorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sorts
    ADD CONSTRAINT sorts_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20131007210444');

INSERT INTO schema_migrations (version) VALUES ('20131008110127');

INSERT INTO schema_migrations (version) VALUES ('20131008110151');

INSERT INTO schema_migrations (version) VALUES ('20131008110214');

INSERT INTO schema_migrations (version) VALUES ('20131008192636');

INSERT INTO schema_migrations (version) VALUES ('20131009104136');

INSERT INTO schema_migrations (version) VALUES ('20131009140402');

INSERT INTO schema_migrations (version) VALUES ('20131009140429');

INSERT INTO schema_migrations (version) VALUES ('20131014073615');
