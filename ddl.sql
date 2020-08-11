--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-17 09:29:09

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

--
-- TOC entry 3041 (class 1262 OID 13012)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 3041
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 7 (class 2615 OID 18193)
-- Name: cms; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cms;


ALTER SCHEMA cms OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 248 (class 1259 OID 18927)
-- Name: admin; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.admin (
    username integer NOT NULL,
    password character varying(20) NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE cms.admin OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18761)
-- Name: match; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.match (
    mid integer NOT NULL,
    team_id1 integer NOT NULL,
    team_id2 integer NOT NULL,
    m_status character varying(20),
    stadium_id integer,
    result integer,
    CONSTRAINT match_check CHECK ((team_id2 <> team_id1)),
    CONSTRAINT match_m_status_check CHECK (((m_status)::text = ANY ((ARRAY['OnGoing'::character varying, 'Postpone'::character varying, 'Complete'::character varying, 'Scheduled'::character varying])::text[])))
);


ALTER TABLE cms.match OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18814)
-- Name: match_examine; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.match_examine (
    m_id integer NOT NULL,
    um_id integer NOT NULL
);


ALTER TABLE cms.match_examine OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18829)
-- Name: match_stock; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.match_stock (
    m_id integer NOT NULL,
    eq_id integer NOT NULL,
    q_used integer
);


ALTER TABLE cms.match_stock OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18844)
-- Name: player; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.player (
    pid integer NOT NULL,
    pname character varying(50) NOT NULL,
    jersey_no integer NOT NULL,
    p_rating integer,
    isbatsman boolean,
    isbowler boolean,
    isallrounder boolean,
    iswicketkeeper boolean,
    match_played integer,
    innings_played integer,
    wickets integer,
    bat_run integer,
    total_six integer,
    total_four integer,
    fifty integer,
    hundred integer,
    team_id integer,
    highest_score character varying(5),
    ball_run integer,
    balls integer
);


ALTER TABLE cms.player OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18922)
-- Name: role; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.role (
    role_id integer NOT NULL,
    match boolean,
    schedule boolean,
    scoreboard boolean,
    team boolean
);


ALTER TABLE cms.role OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18794)
-- Name: schedule; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.schedule (
    s_id integer NOT NULL,
    s_date date NOT NULL,
    s_time time without time zone NOT NULL,
    mid integer
);


ALTER TABLE cms.schedule OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18854)
-- Name: scoreboard; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.scoreboard (
    striker integer,
    non_striker integer,
    bowler integer,
    innings integer NOT NULL,
    wicket integer,
    total_run integer NOT NULL,
    batsman_run integer NOT NULL,
    extra_run integer NOT NULL,
    over integer NOT NULL,
    ball integer NOT NULL,
    match_id integer NOT NULL
)
PARTITION BY LIST (match_id);


ALTER TABLE cms.scoreboard OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18871)
-- Name: scoreboard_201901; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.scoreboard_201901 (
    striker integer,
    non_striker integer,
    bowler integer,
    innings integer NOT NULL,
    wicket integer,
    total_run integer NOT NULL,
    batsman_run integer NOT NULL,
    extra_run integer NOT NULL,
    over integer NOT NULL,
    ball integer NOT NULL,
    match_id integer NOT NULL
);
ALTER TABLE ONLY cms.scoreboard ATTACH PARTITION cms.scoreboard_201901 FOR VALUES IN (201901);


ALTER TABLE cms.scoreboard_201901 OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18888)
-- Name: scoreboard_201902; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.scoreboard_201902 (
    striker integer,
    non_striker integer,
    bowler integer,
    innings integer NOT NULL,
    wicket integer,
    total_run integer NOT NULL,
    batsman_run integer NOT NULL,
    extra_run integer NOT NULL,
    over integer NOT NULL,
    ball integer NOT NULL,
    match_id integer NOT NULL
);
ALTER TABLE ONLY cms.scoreboard ATTACH PARTITION cms.scoreboard_201902 FOR VALUES IN (201902);


ALTER TABLE cms.scoreboard_201902 OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18905)
-- Name: scoreboard_201903; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.scoreboard_201903 (
    striker integer,
    non_striker integer,
    bowler integer,
    innings integer NOT NULL,
    wicket integer,
    total_run integer NOT NULL,
    batsman_run integer NOT NULL,
    extra_run integer NOT NULL,
    over integer NOT NULL,
    ball integer NOT NULL,
    match_id integer NOT NULL
);
ALTER TABLE ONLY cms.scoreboard ATTACH PARTITION cms.scoreboard_201903 FOR VALUES IN (201903);


ALTER TABLE cms.scoreboard_201903 OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18749)
-- Name: stadium; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.stadium (
    std_id integer NOT NULL,
    name character varying(100),
    city character varying(50),
    country character varying(50),
    capacity integer,
    area integer
);


ALTER TABLE cms.stadium OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18804)
-- Name: stocks; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.stocks (
    eq_id integer NOT NULL,
    eq_name character varying(20) NOT NULL,
    eq_qty integer
);


ALTER TABLE cms.stocks OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18754)
-- Name: team; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.team (
    team_id integer NOT NULL,
    team_name character varying(30) NOT NULL,
    team_country character varying(20) NOT NULL,
    team_captain character varying(30) NOT NULL,
    team_coach character varying(30) NOT NULL
);


ALTER TABLE cms.team OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18809)
-- Name: umpire; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.umpire (
    u_id integer NOT NULL,
    u_name character varying(30) NOT NULL,
    u_exp integer,
    u_dob date NOT NULL,
    country character varying(20)
);


ALTER TABLE cms.umpire OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18783)
-- Name: weather; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.weather (
    w_date date NOT NULL,
    w_forecast character varying(20),
    mid integer,
    CONSTRAINT weather_w_forecast_check CHECK (((w_forecast)::text = ANY ((ARRAY['sunny'::character varying, 'rainy'::character varying])::text[])))
);


ALTER TABLE cms.weather OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 18927)
-- Dependencies: 248
-- Data for Name: admin; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.admin (username, password, role) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 18761)
-- Dependencies: 235
-- Data for Name: match; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.match (mid, team_id1, team_id2, m_status, stadium_id, result) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 18814)
-- Dependencies: 240
-- Data for Name: match_examine; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.match_examine (m_id, um_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 18829)
-- Dependencies: 241
-- Data for Name: match_stock; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.match_stock (m_id, eq_id, q_used) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 18844)
-- Dependencies: 242
-- Data for Name: player; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.player (pid, pname, jersey_no, p_rating, isbatsman, isbowler, isallrounder, iswicketkeeper, match_played, innings_played, wickets, bat_run, total_six, total_four, fifty, hundred, team_id, highest_score, ball_run, balls) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 18922)
-- Dependencies: 247
-- Data for Name: role; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.role (role_id, match, schedule, scoreboard, team) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 18794)
-- Dependencies: 237
-- Data for Name: schedule; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.schedule (s_id, s_date, s_time, mid) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 18871)
-- Dependencies: 244
-- Data for Name: scoreboard_201901; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.scoreboard_201901 (striker, non_striker, bowler, innings, wicket, total_run, batsman_run, extra_run, over, ball, match_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 18888)
-- Dependencies: 245
-- Data for Name: scoreboard_201902; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.scoreboard_201902 (striker, non_striker, bowler, innings, wicket, total_run, batsman_run, extra_run, over, ball, match_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 18905)
-- Dependencies: 246
-- Data for Name: scoreboard_201903; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.scoreboard_201903 (striker, non_striker, bowler, innings, wicket, total_run, batsman_run, extra_run, over, ball, match_id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 18749)
-- Dependencies: 233
-- Data for Name: stadium; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.stadium (std_id, name, city, country, capacity, area) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 18804)
-- Dependencies: 238
-- Data for Name: stocks; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.stocks (eq_id, eq_name, eq_qty) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 18754)
-- Dependencies: 234
-- Data for Name: team; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.team (team_id, team_name, team_country, team_captain, team_coach) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 18809)
-- Dependencies: 239
-- Data for Name: umpire; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.umpire (u_id, u_name, u_exp, u_dob, country) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 18783)
-- Dependencies: 236
-- Data for Name: weather; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.weather (w_date, w_forecast, mid) FROM stdin;
\.


--
-- TOC entry 2882 (class 2606 OID 18931)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (username);


--
-- TOC entry 2866 (class 2606 OID 18818)
-- Name: match_examine match_examine_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_examine
    ADD CONSTRAINT match_examine_pkey PRIMARY KEY (m_id, um_id);


--
-- TOC entry 2856 (class 2606 OID 18767)
-- Name: match match_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (mid);


--
-- TOC entry 2868 (class 2606 OID 18833)
-- Name: match_stock match_stock_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_stock
    ADD CONSTRAINT match_stock_pkey PRIMARY KEY (m_id, eq_id);


--
-- TOC entry 2870 (class 2606 OID 18848)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (pid);


--
-- TOC entry 2880 (class 2606 OID 18926)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 2860 (class 2606 OID 18798)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (s_id);


--
-- TOC entry 2872 (class 2606 OID 18858)
-- Name: scoreboard scoreboard_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.scoreboard
    ADD CONSTRAINT scoreboard_pkey PRIMARY KEY (innings, over, ball, match_id);


--
-- TOC entry 2874 (class 2606 OID 18875)
-- Name: scoreboard_201901 scoreboard_201901_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.scoreboard_201901
    ADD CONSTRAINT scoreboard_201901_pkey PRIMARY KEY (innings, over, ball, match_id);


--
-- TOC entry 2876 (class 2606 OID 18892)
-- Name: scoreboard_201902 scoreboard_201902_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.scoreboard_201902
    ADD CONSTRAINT scoreboard_201902_pkey PRIMARY KEY (innings, over, ball, match_id);


--
-- TOC entry 2878 (class 2606 OID 18909)
-- Name: scoreboard_201903 scoreboard_201903_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.scoreboard_201903
    ADD CONSTRAINT scoreboard_201903_pkey PRIMARY KEY (innings, over, ball, match_id);


--
-- TOC entry 2850 (class 2606 OID 18753)
-- Name: stadium stadium_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.stadium
    ADD CONSTRAINT stadium_pkey PRIMARY KEY (std_id);


--
-- TOC entry 2862 (class 2606 OID 18808)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (eq_id);


--
-- TOC entry 2852 (class 2606 OID 18758)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2854 (class 2606 OID 18760)
-- Name: team team_team_name_key; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.team
    ADD CONSTRAINT team_team_name_key UNIQUE (team_name);


--
-- TOC entry 2864 (class 2606 OID 18813)
-- Name: umpire umpire_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.umpire
    ADD CONSTRAINT umpire_pkey PRIMARY KEY (u_id);


--
-- TOC entry 2858 (class 2606 OID 18788)
-- Name: weather weather_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.weather
    ADD CONSTRAINT weather_pkey PRIMARY KEY (w_date);


--
-- TOC entry 2883 (class 0 OID 0)
-- Name: scoreboard_201901_pkey; Type: INDEX ATTACH; Schema: cms; Owner: 
--

ALTER INDEX cms.scoreboard_pkey ATTACH PARTITION cms.scoreboard_201901_pkey;


--
-- TOC entry 2884 (class 0 OID 0)
-- Name: scoreboard_201902_pkey; Type: INDEX ATTACH; Schema: cms; Owner: 
--

ALTER INDEX cms.scoreboard_pkey ATTACH PARTITION cms.scoreboard_201902_pkey;


--
-- TOC entry 2885 (class 0 OID 0)
-- Name: scoreboard_201903_pkey; Type: INDEX ATTACH; Schema: cms; Owner: 
--

ALTER INDEX cms.scoreboard_pkey ATTACH PARTITION cms.scoreboard_201903_pkey;


--
-- TOC entry 2891 (class 2606 OID 18819)
-- Name: match_examine match_examine_m_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_examine
    ADD CONSTRAINT match_examine_m_id_fkey FOREIGN KEY (m_id) REFERENCES cms.match(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2892 (class 2606 OID 18824)
-- Name: match_examine match_examine_um_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_examine
    ADD CONSTRAINT match_examine_um_id_fkey FOREIGN KEY (um_id) REFERENCES cms.umpire(u_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 18778)
-- Name: match match_stadium_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match
    ADD CONSTRAINT match_stadium_id_fkey FOREIGN KEY (stadium_id) REFERENCES cms.stadium(std_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2894 (class 2606 OID 18839)
-- Name: match_stock match_stock_eq_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_stock
    ADD CONSTRAINT match_stock_eq_id_fkey FOREIGN KEY (eq_id) REFERENCES cms.stocks(eq_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2893 (class 2606 OID 18834)
-- Name: match_stock match_stock_m_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match_stock
    ADD CONSTRAINT match_stock_m_id_fkey FOREIGN KEY (m_id) REFERENCES cms.match(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2886 (class 2606 OID 18768)
-- Name: match match_team_id1_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match
    ADD CONSTRAINT match_team_id1_fkey FOREIGN KEY (team_id1) REFERENCES cms.team(team_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 18773)
-- Name: match match_team_id2_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.match
    ADD CONSTRAINT match_team_id2_fkey FOREIGN KEY (team_id2) REFERENCES cms.team(team_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2895 (class 2606 OID 18849)
-- Name: player player_team_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.player
    ADD CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES cms.team(team_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2890 (class 2606 OID 18799)
-- Name: schedule schedule_mid_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.schedule
    ADD CONSTRAINT schedule_mid_fkey FOREIGN KEY (mid) REFERENCES cms.match(mid) ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- TOC entry 2898 (class 2606 OID 18865)
-- Name: scoreboard scoreboard_bowler_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE cms.scoreboard
    ADD CONSTRAINT scoreboard_bowler_fkey FOREIGN KEY (bowler) REFERENCES cms.player(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 18868)
-- Name: scoreboard scoreboard_match_id_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE cms.scoreboard
    ADD CONSTRAINT scoreboard_match_id_fkey FOREIGN KEY (match_id) REFERENCES cms.match(mid) ON UPDATE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 18862)
-- Name: scoreboard scoreboard_non_striker_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE cms.scoreboard
    ADD CONSTRAINT scoreboard_non_striker_fkey FOREIGN KEY (non_striker) REFERENCES cms.player(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2896 (class 2606 OID 18859)
-- Name: scoreboard scoreboard_striker_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE cms.scoreboard
    ADD CONSTRAINT scoreboard_striker_fkey FOREIGN KEY (striker) REFERENCES cms.player(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 18789)
-- Name: weather weather_mid_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.weather
    ADD CONSTRAINT weather_mid_fkey FOREIGN KEY (mid) REFERENCES cms.match(mid) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2019-10-17 09:29:13

--
-- PostgreSQL database dump complete
--

