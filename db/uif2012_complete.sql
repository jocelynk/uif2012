--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: allergies; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE allergies (
    id integer NOT NULL,
    name character varying(255),
    warning_text text,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.allergies OWNER TO profh;

--
-- Name: allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allergies_id_seq OWNER TO profh;

--
-- Name: allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE allergies_id_seq OWNED BY allergies.id;


--
-- Name: allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('allergies_id_seq', 20, true);


--
-- Name: attendances; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE attendances (
    id integer NOT NULL,
    student_id integer,
    event_id integer,
    exempt boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attendances OWNER TO profh;

--
-- Name: attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE attendances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendances_id_seq OWNER TO profh;

--
-- Name: attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE attendances_id_seq OWNED BY attendances.id;


--
-- Name: attendances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('attendances_id_seq', 1, false);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    description text,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO profh;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO profh;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('departments_id_seq', 3, true);


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE enrollments (
    id integer NOT NULL,
    student_id integer,
    section_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.enrollments OWNER TO profh;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO profh;

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE enrollments_id_seq OWNED BY enrollments.id;


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('enrollments_id_seq', 220, true);


--
-- Name: events; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    date date,
    program_id integer,
    start_time time without time zone,
    end_time time without time zone,
    location_id integer,
    gospel_shared boolean,
    meals_served integer DEFAULT 0,
    bibles_distributed integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO profh;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO profh;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('events_id_seq', 20, true);


--
-- Name: guardians; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE guardians (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    household_id integer,
    guardian_type character varying(255),
    cell_phone character varying(255),
    can_text boolean,
    email character varying(255),
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.guardians OWNER TO profh;

--
-- Name: guardians_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE guardians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardians_id_seq OWNER TO profh;

--
-- Name: guardians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE guardians_id_seq OWNED BY guardians.id;


--
-- Name: guardians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('guardians_id_seq', 138, true);


--
-- Name: households; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE households (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    street2 character varying(255),
    city character varying(255),
    zip character varying(255),
    insurance_company character varying(255),
    insurance_number character varying(255),
    church character varying(255),
    lat double precision,
    lon double precision,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.households OWNER TO profh;

--
-- Name: households_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE households_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.households_id_seq OWNER TO profh;

--
-- Name: households_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE households_id_seq OWNED BY households.id;


--
-- Name: households_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('households_id_seq', 100, true);


--
-- Name: locations; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    city character varying(255),
    zip character varying(255),
    lat double precision,
    lon double precision,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO profh;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO profh;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('locations_id_seq', 4, true);


--
-- Name: notes; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    user_id integer,
    date date,
    contents text,
    notable_type character varying(255),
    notable_id integer,
    priority integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE public.notes OWNER TO profh;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO profh;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('notes_id_seq', 1, true);


--
-- Name: programs; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    department_id integer,
    min_grade integer,
    max_grade integer,
    max_capacity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean,
    start_date date,
    end_date date,
    scan_by_absence boolean DEFAULT false
);


ALTER TABLE public.programs OWNER TO profh;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO profh;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('programs_id_seq', 13, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO profh;

--
-- Name: section_events; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE section_events (
    id integer NOT NULL,
    section_id integer,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.section_events OWNER TO profh;

--
-- Name: section_events_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE section_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_events_id_seq OWNER TO profh;

--
-- Name: section_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE section_events_id_seq OWNED BY section_events.id;


--
-- Name: section_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('section_events_id_seq', 20, true);


--
-- Name: sections; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    name character varying(255),
    max_capacity integer,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    program_id integer
);


ALTER TABLE public.sections OWNER TO profh;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO profh;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('sections_id_seq', 22, true);


--
-- Name: student_allergies; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE student_allergies (
    id integer NOT NULL,
    student_id integer,
    allergy_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.student_allergies OWNER TO profh;

--
-- Name: student_allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE student_allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_allergies_id_seq OWNER TO profh;

--
-- Name: student_allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE student_allergies_id_seq OWNED BY student_allergies.id;


--
-- Name: student_allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('student_allergies_id_seq', 100, true);


--
-- Name: students; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE students (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    barcode_number character varying(255),
    household_id integer,
    is_male boolean,
    grade integer,
    date_of_birth date,
    cell_phone character varying(255),
    can_text boolean,
    email character varying(255),
    status character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_visitor boolean DEFAULT false,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.students OWNER TO profh;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO profh;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('students_id_seq', 147, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    username character varying(255),
    role character varying(255),
    department_id integer,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    authentication_token character varying(255)
);


ALTER TABLE public.users OWNER TO profh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO profh;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY allergies ALTER COLUMN id SET DEFAULT nextval('allergies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY attendances ALTER COLUMN id SET DEFAULT nextval('attendances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY enrollments ALTER COLUMN id SET DEFAULT nextval('enrollments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY guardians ALTER COLUMN id SET DEFAULT nextval('guardians_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY households ALTER COLUMN id SET DEFAULT nextval('households_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY section_events ALTER COLUMN id SET DEFAULT nextval('section_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY student_allergies ALTER COLUMN id SET DEFAULT nextval('student_allergies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: allergies; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY allergies (id, name, warning_text, active, created_at, updated_at) FROM stdin;
1	Laboriosam	Omnis quia similique et modi hic tempore nihil repellendus nam omnis	t	2012-12-12 22:59:05.811447	2012-12-12 22:59:05.811451
2	Non	Consequatur ut autem quasi minus quasi repellendus doloribus aut ratione voluptatibus dolor voluptas quis necessitatibus consequuntur	t	2012-12-12 22:59:05.811685	2012-12-12 22:59:05.811687
3	Perspiciatis Itaque	Pariatur veniam tempore similique ea voluptatibus odio amet itaque dolorem praesentium blanditiis veniam nisi aperiam. Aperiam pariatur aspernatur asperiores voluptatibus in dolorem minus voluptatem voluptas beatae et facilis pariatur voluptas et vero. Temporibus voluptatibus perspiciatis libero corporis consequatur et ex doloremque consequatur nisi esse omnis recusandae distinctio voluptatem occaecati ipsam	t	2012-12-12 22:59:05.81181	2012-12-12 22:59:05.811812
4	Ipsum Nostrum Fugit	Id at cumque sunt illum tempora et quia eius	t	2012-12-12 22:59:05.811985	2012-12-12 22:59:05.811988
5	Ea	Accusamus facere sit magni cumque mollitia quia quibusdam maxime fugiat repellendus perspiciatis modi numquam delectus veniam molestiae. Enim illum reiciendis ut rerum soluta eos neque voluptatibus	t	2012-12-12 22:59:05.812123	2012-12-12 22:59:05.812125
6	Quae Optio	Rerum ad id illum pariatur molestiae autem et	t	2012-12-12 22:59:05.812254	2012-12-12 22:59:05.812256
7	Expedita In	Et sed molestiae dolor enim omnis commodi	t	2012-12-12 22:59:05.812379	2012-12-12 22:59:05.812381
8	Ut Voluptate Cumque	Voluptas est recusandae sunt rem dolores recusandae similique sunt perferendis fugiat accusamus consequatur. Et quae voluptatem quam omnis qui eum odio facilis vero rerum dolor commodi esse ut fuga numquam ipsa veniam	t	2012-12-12 22:59:05.812502	2012-12-12 22:59:05.812504
9	Earum Autem	Voluptatem quam sapiente aut numquam aut voluptas. Vel error reiciendis natus ipsam porro eligendi voluptates eligendi voluptates	t	2012-12-12 22:59:05.81265	2012-12-12 22:59:05.812652
10	Quasi Aut Dolores	Aut quaerat dolor aut laboriosam et minus laborum. Cupiditate voluptatem dolor odio commodi sed non consequatur consequuntur minima tempora	t	2012-12-12 22:59:05.812783	2012-12-12 22:59:05.812785
11	Modi Voluptatem Quibusdam	Dignissimos molestiae nemo cumque id totam magnam fugit nostrum reiciendis non tempora laudantium numquam qui quia nisi illo neque odit. Temporibus dicta et velit nemo velit ad velit qui rem aperiam vero voluptas rerum quaerat neque	t	2012-12-12 22:59:05.812924	2012-12-12 22:59:05.812926
12	Esse Pariatur Accusamus	Et laborum quis ex voluptatem iusto maxime quidem ducimus provident veritatis et cum ipsum odio eum esse ipsa quasi. In quidem minima consequatur totam est voluptatem veritatis enim labore fugit quasi quia enim soluta culpa	t	2012-12-12 22:59:05.813077	2012-12-12 22:59:05.813079
13	Ducimus Similique	Amet sit quasi perferendis voluptatem consequatur quas ducimus delectus dolorum. Aut at deserunt blanditiis sit ea dolorem nihil atque voluptate vitae	t	2012-12-12 22:59:05.813225	2012-12-12 22:59:05.813227
14	Natus Doloribus	Voluptatibus illum voluptates error dicta dignissimos perferendis cum omnis ipsam enim praesentium alias omnis veritatis eum tempore adipisci. Et nulla sint officiis hic facilis voluptas officia non quia itaque nisi perspiciatis natus neque aut pariatur vel qui	t	2012-12-12 22:59:05.813361	2012-12-12 22:59:05.813363
15	Iure Qui	Quasi voluptatibus vel sit velit dolores omnis doloremque adipisci sint perferendis aliquid in unde. Odio sit eius explicabo repellendus pariatur aspernatur libero dolorem occaecati enim dolorum provident ipsam. Sed aut quidem voluptatem velit ducimus sint ut enim sit vel hic veniam	t	2012-12-12 22:59:05.813506	2012-12-12 22:59:05.813508
16	Ut Ipsum	Atque quaerat adipisci rerum possimus aliquam. Illum dolor vel aliquam maiores quo vero aliquam nam ducimus consectetur architecto id soluta sapiente. Reprehenderit quam tempora quod accusantium quam sequi totam eos	t	2012-12-12 22:59:05.813656	2012-12-12 22:59:05.813658
17	Modi Dolorem Sint	Quidem nam dolorem quidem et ex voluptatem ut voluptas deserunt iure. Corporis amet temporibus exercitationem incidunt minima cumque suscipit non eaque mollitia et odio est. Et reprehenderit eum quidem eos odio eum numquam praesentium nostrum magnam voluptate reiciendis provident itaque cum et distinctio accusantium repudiandae	t	2012-12-12 22:59:05.8138	2012-12-12 22:59:05.813802
18	Quo	Distinctio et aut nostrum et et voluptate aspernatur doloremque ipsam. Harum iure sed reiciendis ipsa vitae voluptatem perferendis repudiandae est qui dolore consequuntur totam ut	t	2012-12-12 22:59:05.813956	2012-12-12 22:59:05.813958
19	Ut	Id aut laboriosam quis dolore alias commodi quas et velit eos. Eum quia dolor quia dolore delectus repellat accusantium dicta rerum et sit molestiae sunt voluptas et et occaecati	t	2012-12-12 22:59:05.814082	2012-12-12 22:59:05.814084
20	Fuga Accusantium	Quod aut eos sit inventore. Cupiditate modi maiores sequi expedita cumque quia voluptatem distinctio laboriosam esse consequuntur quas nulla sint rerum fugit. Aut quos dolorem suscipit molestiae deserunt hic aut	t	2012-12-12 22:59:05.814209	2012-12-12 22:59:05.814211
\.


--
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY attendances (id, student_id, event_id, exempt, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY departments (id, name, description, active, created_at, updated_at) FROM stdin;
1	Performing Arts	The Performing Arts Program gives children, middle school and high school youth the opportunity to share their talents by singing, dancing, and acting in venues across the country.	t	2012-12-12 22:59:03.738442	2012-12-12 22:59:03.738442
2	Athletics	Depending on the night of the week and the time of the year, chances are there is a sports program going on where kids are having fun and learning about the Lord.	t	2012-12-12 22:59:03.748215	2012-12-12 22:59:03.748215
3	Academic Assistance	Urban Impact offers academic remediation both during the school year and throughout the summer. Program directors encourage youth to stop by for a visit after school for homework help, while highschoolers may attend the SAT Prep Class.	t	2012-12-12 22:59:03.754147	2012-12-12 22:59:03.754147
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY enrollments (id, student_id, section_id, created_at, updated_at) FROM stdin;
1	1	3	2012-12-12 22:59:05.369137	2012-12-12 22:59:05.36914
2	1	6	2012-12-12 22:59:05.369204	2012-12-12 22:59:05.369206
3	2	5	2012-12-12 22:59:05.372247	2012-12-12 22:59:05.372249
4	3	18	2012-12-12 22:59:05.373955	2012-12-12 22:59:05.373957
5	4	11	2012-12-12 22:59:05.375544	2012-12-12 22:59:05.375547
6	5	4	2012-12-12 22:59:05.377117	2012-12-12 22:59:05.37712
7	5	4	2012-12-12 22:59:05.377162	2012-12-12 22:59:05.377165
8	6	6	2012-12-12 22:59:05.378943	2012-12-12 22:59:05.378946
9	7	12	2012-12-12 22:59:05.38145	2012-12-12 22:59:05.381454
10	7	1	2012-12-12 22:59:05.381501	2012-12-12 22:59:05.381502
11	8	14	2012-12-12 22:59:05.383204	2012-12-12 22:59:05.383206
12	8	13	2012-12-12 22:59:05.383248	2012-12-12 22:59:05.383251
13	9	3	2012-12-12 22:59:05.384939	2012-12-12 22:59:05.384942
14	10	4	2012-12-12 22:59:05.386641	2012-12-12 22:59:05.386643
15	11	6	2012-12-12 22:59:05.388461	2012-12-12 22:59:05.388465
16	11	8	2012-12-12 22:59:05.388516	2012-12-12 22:59:05.388518
17	12	16	2012-12-12 22:59:05.390422	2012-12-12 22:59:05.390425
18	13	14	2012-12-12 22:59:05.39188	2012-12-12 22:59:05.391882
19	14	8	2012-12-12 22:59:05.395207	2012-12-12 22:59:05.39521
20	14	22	2012-12-12 22:59:05.39526	2012-12-12 22:59:05.395262
21	15	2	2012-12-12 22:59:05.397201	2012-12-12 22:59:05.397204
22	15	20	2012-12-12 22:59:05.397253	2012-12-12 22:59:05.397255
23	16	7	2012-12-12 22:59:05.399333	2012-12-12 22:59:05.399335
24	16	5	2012-12-12 22:59:05.399379	2012-12-12 22:59:05.399381
25	17	22	2012-12-12 22:59:05.401263	2012-12-12 22:59:05.401265
26	18	5	2012-12-12 22:59:05.402906	2012-12-12 22:59:05.402909
27	18	2	2012-12-12 22:59:05.40295	2012-12-12 22:59:05.402952
28	19	10	2012-12-12 22:59:05.406663	2012-12-12 22:59:05.406666
29	20	15	2012-12-12 22:59:05.40844	2012-12-12 22:59:05.408442
30	21	4	2012-12-12 22:59:05.410103	2012-12-12 22:59:05.410105
31	22	22	2012-12-12 22:59:05.411713	2012-12-12 22:59:05.411716
32	23	8	2012-12-12 22:59:05.413289	2012-12-12 22:59:05.413291
33	24	4	2012-12-12 22:59:05.415419	2012-12-12 22:59:05.415422
34	24	13	2012-12-12 22:59:05.415467	2012-12-12 22:59:05.415469
35	25	10	2012-12-12 22:59:05.417547	2012-12-12 22:59:05.41755
36	26	16	2012-12-12 22:59:05.419188	2012-12-12 22:59:05.419191
37	27	15	2012-12-12 22:59:05.421063	2012-12-12 22:59:05.421065
38	27	2	2012-12-12 22:59:05.421105	2012-12-12 22:59:05.421107
39	28	3	2012-12-12 22:59:05.422885	2012-12-12 22:59:05.422887
40	29	19	2012-12-12 22:59:05.4259	2012-12-12 22:59:05.425903
41	29	15	2012-12-12 22:59:05.425964	2012-12-12 22:59:05.425966
42	30	2	2012-12-12 22:59:05.428011	2012-12-12 22:59:05.428014
43	30	20	2012-12-12 22:59:05.428058	2012-12-12 22:59:05.42806
44	31	12	2012-12-12 22:59:05.429729	2012-12-12 22:59:05.429731
45	32	20	2012-12-12 22:59:05.431354	2012-12-12 22:59:05.431357
46	32	7	2012-12-12 22:59:05.431394	2012-12-12 22:59:05.431396
47	33	15	2012-12-12 22:59:05.43415	2012-12-12 22:59:05.434152
48	34	3	2012-12-12 22:59:05.435784	2012-12-12 22:59:05.435787
49	34	3	2012-12-12 22:59:05.435828	2012-12-12 22:59:05.43583
50	35	22	2012-12-12 22:59:05.437954	2012-12-12 22:59:05.437956
51	35	10	2012-12-12 22:59:05.437997	2012-12-12 22:59:05.437999
52	36	6	2012-12-12 22:59:05.439848	2012-12-12 22:59:05.43985
53	36	3	2012-12-12 22:59:05.439888	2012-12-12 22:59:05.43989
54	37	2	2012-12-12 22:59:05.44249	2012-12-12 22:59:05.442492
55	38	21	2012-12-12 22:59:05.444055	2012-12-12 22:59:05.444057
56	38	9	2012-12-12 22:59:05.444097	2012-12-12 22:59:05.444098
57	39	9	2012-12-12 22:59:05.446442	2012-12-12 22:59:05.446445
58	40	4	2012-12-12 22:59:05.449854	2012-12-12 22:59:05.449858
59	40	12	2012-12-12 22:59:05.449911	2012-12-12 22:59:05.449913
60	41	10	2012-12-12 22:59:05.451946	2012-12-12 22:59:05.45195
61	41	21	2012-12-12 22:59:05.451991	2012-12-12 22:59:05.451993
62	42	9	2012-12-12 22:59:05.454235	2012-12-12 22:59:05.454237
63	42	9	2012-12-12 22:59:05.454278	2012-12-12 22:59:05.454279
64	43	12	2012-12-12 22:59:05.455977	2012-12-12 22:59:05.45598
65	44	10	2012-12-12 22:59:05.459815	2012-12-12 22:59:05.459818
66	44	20	2012-12-12 22:59:05.459868	2012-12-12 22:59:05.45987
67	45	16	2012-12-12 22:59:05.461976	2012-12-12 22:59:05.461979
68	45	14	2012-12-12 22:59:05.462026	2012-12-12 22:59:05.462027
69	46	4	2012-12-12 22:59:05.465087	2012-12-12 22:59:05.46509
70	47	4	2012-12-12 22:59:05.467306	2012-12-12 22:59:05.467308
71	47	20	2012-12-12 22:59:05.467356	2012-12-12 22:59:05.467358
72	48	10	2012-12-12 22:59:05.469251	2012-12-12 22:59:05.469253
73	49	12	2012-12-12 22:59:05.471172	2012-12-12 22:59:05.471175
74	49	5	2012-12-12 22:59:05.471217	2012-12-12 22:59:05.471219
75	50	5	2012-12-12 22:59:05.473115	2012-12-12 22:59:05.473117
76	50	14	2012-12-12 22:59:05.47316	2012-12-12 22:59:05.473162
77	51	18	2012-12-12 22:59:05.476038	2012-12-12 22:59:05.476041
78	51	18	2012-12-12 22:59:05.476092	2012-12-12 22:59:05.476094
79	52	15	2012-12-12 22:59:05.478137	2012-12-12 22:59:05.478143
80	53	1	2012-12-12 22:59:05.479944	2012-12-12 22:59:05.479946
81	53	9	2012-12-12 22:59:05.479991	2012-12-12 22:59:05.479993
82	54	22	2012-12-12 22:59:05.483842	2012-12-12 22:59:05.483845
83	54	2	2012-12-12 22:59:05.483919	2012-12-12 22:59:05.483922
84	55	14	2012-12-12 22:59:05.486342	2012-12-12 22:59:05.486344
85	56	10	2012-12-12 22:59:05.488005	2012-12-12 22:59:05.488007
86	57	4	2012-12-12 22:59:05.491064	2012-12-12 22:59:05.491067
87	58	3	2012-12-12 22:59:05.493231	2012-12-12 22:59:05.493234
88	58	8	2012-12-12 22:59:05.493279	2012-12-12 22:59:05.493281
89	59	17	2012-12-12 22:59:05.495776	2012-12-12 22:59:05.495778
90	59	21	2012-12-12 22:59:05.495822	2012-12-12 22:59:05.495824
91	60	15	2012-12-12 22:59:05.497738	2012-12-12 22:59:05.49774
92	60	1	2012-12-12 22:59:05.497783	2012-12-12 22:59:05.497785
93	61	22	2012-12-12 22:59:05.500755	2012-12-12 22:59:05.500758
94	61	14	2012-12-12 22:59:05.500807	2012-12-12 22:59:05.500809
95	62	7	2012-12-12 22:59:05.502916	2012-12-12 22:59:05.502918
96	62	18	2012-12-12 22:59:05.502965	2012-12-12 22:59:05.502967
97	63	11	2012-12-12 22:59:05.505371	2012-12-12 22:59:05.505374
98	64	18	2012-12-12 22:59:05.507365	2012-12-12 22:59:05.507368
99	65	7	2012-12-12 22:59:05.509258	2012-12-12 22:59:05.509261
100	65	11	2012-12-12 22:59:05.5093	2012-12-12 22:59:05.509302
101	66	11	2012-12-12 22:59:05.511596	2012-12-12 22:59:05.511598
102	66	21	2012-12-12 22:59:05.511644	2012-12-12 22:59:05.511646
103	67	6	2012-12-12 22:59:05.513778	2012-12-12 22:59:05.51378
104	67	10	2012-12-12 22:59:05.513823	2012-12-12 22:59:05.513825
105	68	7	2012-12-12 22:59:05.516996	2012-12-12 22:59:05.516998
106	68	21	2012-12-12 22:59:05.51704	2012-12-12 22:59:05.517042
107	69	5	2012-12-12 22:59:05.518998	2012-12-12 22:59:05.519001
108	70	1	2012-12-12 22:59:05.520992	2012-12-12 22:59:05.520994
109	70	20	2012-12-12 22:59:05.521034	2012-12-12 22:59:05.521036
110	71	15	2012-12-12 22:59:05.523734	2012-12-12 22:59:05.523736
111	72	15	2012-12-12 22:59:05.525423	2012-12-12 22:59:05.525425
112	72	4	2012-12-12 22:59:05.525467	2012-12-12 22:59:05.525469
113	73	3	2012-12-12 22:59:05.527574	2012-12-12 22:59:05.527577
114	74	18	2012-12-12 22:59:05.529466	2012-12-12 22:59:05.529468
115	75	7	2012-12-12 22:59:05.533389	2012-12-12 22:59:05.533392
116	75	11	2012-12-12 22:59:05.533444	2012-12-12 22:59:05.533445
117	76	19	2012-12-12 22:59:05.535642	2012-12-12 22:59:05.535645
118	76	7	2012-12-12 22:59:05.535687	2012-12-12 22:59:05.535689
119	77	8	2012-12-12 22:59:05.537678	2012-12-12 22:59:05.537681
120	78	2	2012-12-12 22:59:05.540305	2012-12-12 22:59:05.540308
121	79	22	2012-12-12 22:59:05.542096	2012-12-12 22:59:05.542098
122	79	18	2012-12-12 22:59:05.542138	2012-12-12 22:59:05.54214
123	80	5	2012-12-12 22:59:05.544145	2012-12-12 22:59:05.544147
124	81	19	2012-12-12 22:59:05.545945	2012-12-12 22:59:05.545948
125	82	9	2012-12-12 22:59:05.548785	2012-12-12 22:59:05.548787
126	83	19	2012-12-12 22:59:05.550515	2012-12-12 22:59:05.550517
127	84	20	2012-12-12 22:59:05.552368	2012-12-12 22:59:05.55237
128	85	5	2012-12-12 22:59:05.554332	2012-12-12 22:59:05.554335
129	86	3	2012-12-12 22:59:05.557318	2012-12-12 22:59:05.557321
130	87	4	2012-12-12 22:59:05.559347	2012-12-12 22:59:05.55935
131	88	10	2012-12-12 22:59:05.561485	2012-12-12 22:59:05.561487
132	89	19	2012-12-12 22:59:05.563275	2012-12-12 22:59:05.563277
133	89	3	2012-12-12 22:59:05.563321	2012-12-12 22:59:05.563323
134	90	5	2012-12-12 22:59:05.566178	2012-12-12 22:59:05.56618
135	91	2	2012-12-12 22:59:05.568105	2012-12-12 22:59:05.568107
136	92	12	2012-12-12 22:59:05.57026	2012-12-12 22:59:05.570263
137	93	2	2012-12-12 22:59:05.57203	2012-12-12 22:59:05.572032
138	93	14	2012-12-12 22:59:05.572075	2012-12-12 22:59:05.572077
139	94	5	2012-12-12 22:59:05.574846	2012-12-12 22:59:05.574848
140	95	22	2012-12-12 22:59:05.576742	2012-12-12 22:59:05.576744
141	95	20	2012-12-12 22:59:05.576784	2012-12-12 22:59:05.576792
142	96	21	2012-12-12 22:59:05.578822	2012-12-12 22:59:05.578824
143	97	11	2012-12-12 22:59:05.58164	2012-12-12 22:59:05.581643
144	97	18	2012-12-12 22:59:05.581687	2012-12-12 22:59:05.581688
145	98	22	2012-12-12 22:59:05.584064	2012-12-12 22:59:05.584067
146	99	9	2012-12-12 22:59:05.58622	2012-12-12 22:59:05.586223
147	100	20	2012-12-12 22:59:05.588163	2012-12-12 22:59:05.588165
148	101	2	2012-12-12 22:59:05.590909	2012-12-12 22:59:05.590912
149	101	13	2012-12-12 22:59:05.590959	2012-12-12 22:59:05.59096
150	102	5	2012-12-12 22:59:05.593055	2012-12-12 22:59:05.593058
151	102	17	2012-12-12 22:59:05.593104	2012-12-12 22:59:05.593105
152	103	5	2012-12-12 22:59:05.595294	2012-12-12 22:59:05.595296
153	104	10	2012-12-12 22:59:05.598418	2012-12-12 22:59:05.598421
154	104	10	2012-12-12 22:59:05.59847	2012-12-12 22:59:05.598472
155	105	10	2012-12-12 22:59:05.600767	2012-12-12 22:59:05.60077
156	106	3	2012-12-12 22:59:05.602791	2012-12-12 22:59:05.602794
157	107	14	2012-12-12 22:59:05.60476	2012-12-12 22:59:05.604762
158	107	18	2012-12-12 22:59:05.604804	2012-12-12 22:59:05.604806
159	108	17	2012-12-12 22:59:05.607661	2012-12-12 22:59:05.607664
160	108	15	2012-12-12 22:59:05.607708	2012-12-12 22:59:05.607709
161	109	13	2012-12-12 22:59:05.60986	2012-12-12 22:59:05.609863
162	109	21	2012-12-12 22:59:05.609905	2012-12-12 22:59:05.609907
163	110	11	2012-12-12 22:59:05.611989	2012-12-12 22:59:05.611991
164	110	22	2012-12-12 22:59:05.612033	2012-12-12 22:59:05.612035
165	111	22	2012-12-12 22:59:05.615796	2012-12-12 22:59:05.615799
166	111	13	2012-12-12 22:59:05.615842	2012-12-12 22:59:05.615844
167	112	21	2012-12-12 22:59:05.618274	2012-12-12 22:59:05.618277
168	112	8	2012-12-12 22:59:05.618322	2012-12-12 22:59:05.618323
169	113	9	2012-12-12 22:59:05.620423	2012-12-12 22:59:05.620426
170	113	5	2012-12-12 22:59:05.620468	2012-12-12 22:59:05.62047
171	114	22	2012-12-12 22:59:05.623081	2012-12-12 22:59:05.623083
172	115	8	2012-12-12 22:59:05.625121	2012-12-12 22:59:05.625123
173	115	12	2012-12-12 22:59:05.625164	2012-12-12 22:59:05.625166
174	116	10	2012-12-12 22:59:05.627546	2012-12-12 22:59:05.627549
175	116	3	2012-12-12 22:59:05.6276	2012-12-12 22:59:05.627601
176	117	6	2012-12-12 22:59:05.629851	2012-12-12 22:59:05.629854
177	117	17	2012-12-12 22:59:05.629898	2012-12-12 22:59:05.6299
178	118	4	2012-12-12 22:59:05.632542	2012-12-12 22:59:05.632544
179	118	22	2012-12-12 22:59:05.632586	2012-12-12 22:59:05.632588
180	119	22	2012-12-12 22:59:05.634899	2012-12-12 22:59:05.634901
181	120	14	2012-12-12 22:59:05.636963	2012-12-12 22:59:05.636965
182	120	10	2012-12-12 22:59:05.637005	2012-12-12 22:59:05.637007
183	121	19	2012-12-12 22:59:05.640593	2012-12-12 22:59:05.640596
184	122	20	2012-12-12 22:59:05.642756	2012-12-12 22:59:05.642759
185	122	1	2012-12-12 22:59:05.642804	2012-12-12 22:59:05.642806
186	123	5	2012-12-12 22:59:05.64514	2012-12-12 22:59:05.645142
187	124	4	2012-12-12 22:59:05.648109	2012-12-12 22:59:05.648112
188	125	1	2012-12-12 22:59:05.650461	2012-12-12 22:59:05.650464
189	126	8	2012-12-12 22:59:05.652842	2012-12-12 22:59:05.652844
190	126	14	2012-12-12 22:59:05.652887	2012-12-12 22:59:05.652889
191	127	3	2012-12-12 22:59:05.655014	2012-12-12 22:59:05.655017
192	128	8	2012-12-12 22:59:05.65775	2012-12-12 22:59:05.657752
193	129	13	2012-12-12 22:59:05.660466	2012-12-12 22:59:05.660468
194	129	8	2012-12-12 22:59:05.660517	2012-12-12 22:59:05.660519
195	130	20	2012-12-12 22:59:05.663606	2012-12-12 22:59:05.663608
196	130	12	2012-12-12 22:59:05.663655	2012-12-12 22:59:05.663656
197	131	13	2012-12-12 22:59:05.666029	2012-12-12 22:59:05.666031
198	131	14	2012-12-12 22:59:05.666074	2012-12-12 22:59:05.666076
199	132	20	2012-12-12 22:59:05.668135	2012-12-12 22:59:05.668137
200	132	1	2012-12-12 22:59:05.668178	2012-12-12 22:59:05.66818
201	133	16	2012-12-12 22:59:05.670427	2012-12-12 22:59:05.670429
202	134	21	2012-12-12 22:59:05.673699	2012-12-12 22:59:05.673702
203	135	8	2012-12-12 22:59:05.675858	2012-12-12 22:59:05.67586
204	136	18	2012-12-12 22:59:05.678032	2012-12-12 22:59:05.678034
205	137	22	2012-12-12 22:59:05.682455	2012-12-12 22:59:05.682458
206	138	17	2012-12-12 22:59:05.684786	2012-12-12 22:59:05.684788
207	138	10	2012-12-12 22:59:05.684839	2012-12-12 22:59:05.684841
208	139	1	2012-12-12 22:59:05.687279	2012-12-12 22:59:05.687283
209	139	8	2012-12-12 22:59:05.687363	2012-12-12 22:59:05.687365
210	140	20	2012-12-12 22:59:05.690294	2012-12-12 22:59:05.690297
211	141	6	2012-12-12 22:59:05.779445	2012-12-12 22:59:05.779449
212	142	6	2012-12-12 22:59:05.782208	2012-12-12 22:59:05.782211
213	143	12	2012-12-12 22:59:05.784468	2012-12-12 22:59:05.78447
214	143	19	2012-12-12 22:59:05.78452	2012-12-12 22:59:05.784522
215	144	2	2012-12-12 22:59:05.787151	2012-12-12 22:59:05.787154
216	145	14	2012-12-12 22:59:05.789493	2012-12-12 22:59:05.789495
217	145	16	2012-12-12 22:59:05.789542	2012-12-12 22:59:05.789544
218	146	19	2012-12-12 22:59:05.792706	2012-12-12 22:59:05.792709
219	146	6	2012-12-12 22:59:05.79276	2012-12-12 22:59:05.792762
220	147	3	2012-12-12 22:59:05.795844	2012-12-12 22:59:05.795847
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY events (id, date, program_id, start_time, end_time, location_id, gospel_shared, meals_served, bibles_distributed, created_at, updated_at) FROM stdin;
1	2012-08-22	2	13:00:00	16:00:00	2	t	46	16	2012-12-12 22:59:04.06427	2012-12-12 22:59:04.064273
2	2011-11-07	9	16:00:00	19:00:00	3	t	4	42	2012-12-12 22:59:04.082137	2012-12-12 22:59:04.082139
3	2012-04-14	8	14:00:00	17:00:00	4	t	8	45	2012-12-12 22:59:04.082842	2012-12-12 22:59:04.082844
4	2012-02-03	10	15:00:00	18:00:00	2	t	11	15	2012-12-12 22:59:04.083271	2012-12-12 22:59:04.083273
5	2012-08-10	2	11:00:00	14:00:00	1	t	28	27	2012-12-12 22:59:04.083842	2012-12-12 22:59:04.083844
6	2012-10-02	4	13:00:00	16:00:00	1	t	57	11	2012-12-12 22:59:04.084179	2012-12-12 22:59:04.084181
7	2011-12-29	12	18:00:00	21:00:00	3	t	33	0	2012-12-12 22:59:04.08451	2012-12-12 22:59:04.084512
8	2012-08-12	6	12:00:00	15:00:00	1	t	33	36	2012-12-12 22:59:04.085028	2012-12-12 22:59:04.08503
9	2011-12-19	6	11:00:00	14:00:00	2	t	10	14	2012-12-12 22:59:04.08553	2012-12-12 22:59:04.085532
10	2012-11-13	12	11:00:00	14:00:00	3	t	15	15	2012-12-12 22:59:04.086005	2012-12-12 22:59:04.086007
11	2012-12-09	2	14:00:00	17:00:00	1	t	46	55	2012-12-12 22:59:04.08652	2012-12-12 22:59:04.086522
12	2011-05-14	10	17:00:00	20:00:00	4	t	52	18	2012-12-12 22:59:04.086867	2012-12-12 22:59:04.086868
13	2012-01-24	3	16:00:00	19:00:00	2	t	2	50	2012-12-12 22:59:04.087426	2012-12-12 22:59:04.087428
14	2012-09-11	4	18:00:00	21:00:00	4	t	21	36	2012-12-12 22:59:04.087858	2012-12-12 22:59:04.08786
15	2012-10-10	7	13:00:00	16:00:00	2	t	19	38	2012-12-12 22:59:04.088183	2012-12-12 22:59:04.088185
16	2012-07-08	12	15:00:00	18:00:00	1	t	46	34	2012-12-12 22:59:04.088521	2012-12-12 22:59:04.088522
17	2012-08-26	13	18:00:00	21:00:00	1	t	10	17	2012-12-12 22:59:04.089022	2012-12-12 22:59:04.089024
18	2012-10-09	4	14:00:00	17:00:00	2	t	27	51	2012-12-12 22:59:04.089454	2012-12-12 22:59:04.089456
19	2012-09-02	8	11:00:00	14:00:00	2	t	36	31	2012-12-12 22:59:04.089781	2012-12-12 22:59:04.089783
20	2012-08-07	12	12:00:00	15:00:00	1	t	15	49	2012-12-12 22:59:04.090192	2012-12-12 22:59:04.090194
\.


--
-- Data for Name: guardians; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY guardians (id, first_name, last_name, household_id, guardian_type, cell_phone, can_text, email, active, created_at, updated_at) FROM stdin;
1	Milan	Rempel	1	Custodial	4122723494	t	milan.rempel@example.com	t	2012-12-12 22:59:05.891607	2012-12-12 22:59:05.891611
2	Chadrick	Rempel	1	Father	4122632914	t	chadrick.rempel@example.com	t	2012-12-12 22:59:05.891871	2012-12-12 22:59:05.891874
3	Jaida	Wisozk	2	Mother	4122509083	t	jaida.wisozk@example.com	t	2012-12-12 22:59:05.895199	2012-12-12 22:59:05.895202
4	Eden	Wisozk	2	Uncustodial	4125938019	t	eden.wisozk@example.com	t	2012-12-12 22:59:05.895393	2012-12-12 22:59:05.895395
5	Bailey	Rohan	3	Custodial	4126959566	f	bailey.rohan@example.com	t	2012-12-12 22:59:05.897773	2012-12-12 22:59:05.897776
6	Natalie	Rohan	3	Grandparent	4123847449	t	natalie.rohan@example.com	t	2012-12-12 22:59:05.897944	2012-12-12 22:59:05.897946
7	Felicita	Grant	4	Uncustodial	4126651444	f	felicita.grant@example.com	t	2012-12-12 22:59:05.899969	2012-12-12 22:59:05.899971
8	Noemy	Grant	4	Mother	4126683740	t	noemy.grant@example.com	t	2012-12-12 22:59:05.900134	2012-12-12 22:59:05.900136
9	Evelyn	Ziemann	5	Uncustodial	4123394703	t	evelyn.ziemann@example.com	t	2012-12-12 22:59:05.902261	2012-12-12 22:59:05.902263
10	Roger	Hayes	6	Custodial	4128428599	t	roger.hayes@example.com	t	2012-12-12 22:59:05.905362	2012-12-12 22:59:05.905365
11	Zoe	Hayes	6	Grandparent	4127733205	t	zoe.hayes@example.com	t	2012-12-12 22:59:05.905539	2012-12-12 22:59:05.905541
12	Iliana	Collins	7	Mother	4120304288	t	iliana.collins@example.com	t	2012-12-12 22:59:05.907844	2012-12-12 22:59:05.907847
13	Chanelle	Bosco	8	Father	4127702626	t	chanelle.bosco@example.com	t	2012-12-12 22:59:05.909889	2012-12-12 22:59:05.909892
14	Kyler	Trantow	9	Mother	4129717799	t	kyler.trantow@example.com	t	2012-12-12 22:59:05.91193	2012-12-12 22:59:05.911934
15	Lazaro	Padberg	10	Mother	4129319214	t	lazaro.padberg@example.com	t	2012-12-12 22:59:05.914657	2012-12-12 22:59:05.914661
16	Eve	Dietrich	11	Mother	4129541168	t	eve.dietrich@example.com	t	2012-12-12 22:59:05.919332	2012-12-12 22:59:05.919335
17	Nestor	Howe	12	Custodial	4121636748	t	nestor.howe@example.com	t	2012-12-12 22:59:05.92134	2012-12-12 22:59:05.921343
18	Augusta	Smith	13	Mother	4121445051	t	augusta.smith@example.com	t	2012-12-12 22:59:05.923739	2012-12-12 22:59:05.923742
19	Alvina	Streich	14	Mother	4123227924	t	alvina.streich@example.com	t	2012-12-12 22:59:05.926775	2012-12-12 22:59:05.926779
20	Jarrell	Streich	14	Father	4121603702	f	jarrell.streich@example.com	t	2012-12-12 22:59:05.92697	2012-12-12 22:59:05.926972
21	Macey	Effertz	15	Uncustodial	4120752693	t	macey.effertz@example.com	t	2012-12-12 22:59:05.929451	2012-12-12 22:59:05.929453
22	Lilyan	Lang	16	Grandparent	4122638474	t	lilyan.lang@example.com	t	2012-12-12 22:59:05.931261	2012-12-12 22:59:05.931263
23	Evalyn	Lang	16	Custodial	4126668163	t	evalyn.lang@example.com	t	2012-12-12 22:59:05.931425	2012-12-12 22:59:05.931427
24	Ramon	Blanda	17	Grandparent	4122384441	t	ramon.blanda@example.com	t	2012-12-12 22:59:05.93361	2012-12-12 22:59:05.933612
25	Brendon	Heathcote	18	Uncustodial	4129880043	t	brendon.heathcote@example.com	t	2012-12-12 22:59:05.935588	2012-12-12 22:59:05.93559
26	Mason	Carter	19	Uncustodial	4124970958	t	mason.carter@example.com	t	2012-12-12 22:59:05.938672	2012-12-12 22:59:05.938675
27	Hilario	Carter	19	Custodial	4125671072	t	hilario.carter@example.com	t	2012-12-12 22:59:05.938859	2012-12-12 22:59:05.938861
28	Modesto	Lehner	20	Grandparent	4125991679	t	modesto.lehner@example.com	t	2012-12-12 22:59:05.941206	2012-12-12 22:59:05.941208
29	Maya	Terry	21	Mother	4125730232	f	maya.terry@example.com	t	2012-12-12 22:59:05.944217	2012-12-12 22:59:05.94422
30	Terrance	Terry	21	Custodial	4125863577	t	terrance.terry@example.com	t	2012-12-12 22:59:05.944389	2012-12-12 22:59:05.944391
31	Emmalee	Crooks	22	Custodial	4126055380	t	emmalee.crooks@example.com	t	2012-12-12 22:59:05.946437	2012-12-12 22:59:05.94644
32	Rubye	Crooks	22	Custodial	4129678779	t	rubye.crooks@example.com	t	2012-12-12 22:59:05.946598	2012-12-12 22:59:05.9466
33	Antonette	Hermann	23	Grandparent	4124836730	t	antonette.hermann@example.com	t	2012-12-12 22:59:05.948731	2012-12-12 22:59:05.948733
34	Marcus	Hauck	24	Custodial	4127338312	t	marcus.hauck@example.com	t	2012-12-12 22:59:05.950669	2012-12-12 22:59:05.950671
35	Lilyan	Ritchie	25	Father	4124599521	f	lilyan.ritchie@example.com	t	2012-12-12 22:59:05.954649	2012-12-12 22:59:05.954652
36	Maverick	Ritchie	25	Mother	4120620051	f	maverick.ritchie@example.com	t	2012-12-12 22:59:05.954841	2012-12-12 22:59:05.954843
37	Constance	Simonis	26	Uncustodial	4121164661	t	constance.simonis@example.com	t	2012-12-12 22:59:05.957138	2012-12-12 22:59:05.957141
38	Harmon	Dicki	27	Father	4126980472	t	harmon.dicki@example.com	t	2012-12-12 22:59:05.959378	2012-12-12 22:59:05.95938
39	Billy	Dicki	27	Mother	4129186492	t	billy.dicki@example.com	t	2012-12-12 22:59:05.959554	2012-12-12 22:59:05.959556
40	Harley	Rogahn	28	Uncustodial	4129309450	t	harley.rogahn@example.com	t	2012-12-12 22:59:05.962841	2012-12-12 22:59:05.962844
41	Julio	Rogahn	28	Grandparent	4129350986	f	julio.rogahn@example.com	t	2012-12-12 22:59:05.963041	2012-12-12 22:59:05.963044
42	Meredith	Mitchell	29	Uncustodial	4121008405	f	meredith.mitchell@example.com	t	2012-12-12 22:59:05.96538	2012-12-12 22:59:05.965382
43	Hayden	Volkman	30	Custodial	4124864683	f	hayden.volkman@example.com	t	2012-12-12 22:59:05.967346	2012-12-12 22:59:05.967349
44	Alexane	Adams	31	Uncustodial	4127755822	t	alexane.adams@example.com	t	2012-12-12 22:59:05.969885	2012-12-12 22:59:05.969888
45	Lexie	Adams	31	Uncustodial	4126691818	t	lexie.adams@example.com	t	2012-12-12 22:59:05.970067	2012-12-12 22:59:05.970069
46	Terence	Heathcote	32	Grandparent	4124552186	t	terence.heathcote@example.com	t	2012-12-12 22:59:05.972409	2012-12-12 22:59:05.972411
47	Derick	Purdy	33	Uncustodial	4125547854	t	derick.purdy@example.com	t	2012-12-12 22:59:05.974801	2012-12-12 22:59:05.974803
48	Johnathan	Blanda	34	Father	4126721238	t	johnathan.blanda@example.com	t	2012-12-12 22:59:05.976803	2012-12-12 22:59:05.976805
49	Maxie	Ritchie	35	Mother	4124108969	t	maxie.ritchie@example.com	t	2012-12-12 22:59:05.979701	2012-12-12 22:59:05.979704
50	Violet	Bergstrom	36	Mother	4120278991	t	violet.bergstrom@example.com	t	2012-12-12 22:59:05.983198	2012-12-12 22:59:05.983201
51	Garrick	Kovacek	37	Grandparent	4125308274	t	garrick.kovacek@example.com	t	2012-12-12 22:59:05.985983	2012-12-12 22:59:05.985985
52	Jimmy	Goodwin	38	Father	4127187831	t	jimmy.goodwin@example.com	t	2012-12-12 22:59:05.987988	2012-12-12 22:59:05.987991
53	Gennaro	Bruen	39	Father	4122337976	f	gennaro.bruen@example.com	t	2012-12-12 22:59:05.989754	2012-12-12 22:59:05.989756
54	Frieda	Trantow	40	Custodial	4120113103	t	frieda.trantow@example.com	t	2012-12-12 22:59:05.993087	2012-12-12 22:59:05.99309
55	Sonny	Trantow	40	Uncustodial	4124975338	f	sonny.trantow@example.com	t	2012-12-12 22:59:05.99327	2012-12-12 22:59:05.993272
56	Tatum	Christiansen	41	Uncustodial	4120289282	t	tatum.christiansen@example.com	t	2012-12-12 22:59:05.995823	2012-12-12 22:59:05.995826
57	Brandyn	Hauck	42	Mother	4127630172	t	brandyn.hauck@example.com	t	2012-12-12 22:59:05.999384	2012-12-12 22:59:05.999387
58	Rhianna	Cruickshank	43	Mother	4122378421	t	rhianna.cruickshank@example.com	t	2012-12-12 22:59:06.001433	2012-12-12 22:59:06.001436
59	Ona	Brekke	44	Mother	4122291432	t	ona.brekke@example.com	t	2012-12-12 22:59:06.003327	2012-12-12 22:59:06.00333
60	Marshall	Brekke	44	Custodial	4123007931	t	marshall.brekke@example.com	t	2012-12-12 22:59:06.003497	2012-12-12 22:59:06.003499
61	Madisyn	Tillman	45	Mother	4125632726	t	madisyn.tillman@example.com	t	2012-12-12 22:59:06.005823	2012-12-12 22:59:06.005825
62	Anthony	Abshire	46	Grandparent	4125800486	f	anthony.abshire@example.com	t	2012-12-12 22:59:06.008037	2012-12-12 22:59:06.00804
63	Coby	Powlowski	47	Uncustodial	4124887796	t	coby.powlowski@example.com	t	2012-12-12 22:59:06.010098	2012-12-12 22:59:06.0101
64	Jed	Hayes	48	Mother	4123901095	t	jed.hayes@example.com	t	2012-12-12 22:59:06.013224	2012-12-12 22:59:06.013228
65	Adella	Hayes	48	Custodial	4120724217	t	adella.hayes@example.com	t	2012-12-12 22:59:06.013418	2012-12-12 22:59:06.01342
66	Kyleigh	Fahey	49	Grandparent	4120435611	t	kyleigh.fahey@example.com	t	2012-12-12 22:59:06.016105	2012-12-12 22:59:06.016107
67	Daisy	Schultz	50	Mother	4128832772	f	daisy.schultz@example.com	t	2012-12-12 22:59:06.019107	2012-12-12 22:59:06.01911
68	Derick	Christiansen	51	Custodial	4125899791	t	derick.christiansen@example.com	t	2012-12-12 22:59:06.021188	2012-12-12 22:59:06.021191
69	Everette	O'Keefe	52	Father	4121609654	t	everette.o'keefe@example.com	t	2012-12-12 22:59:06.023227	2012-12-12 22:59:06.023229
70	Marcelo	Gleason	53	Grandparent	4128612441	t	marcelo.gleason@example.com	t	2012-12-12 22:59:06.026977	2012-12-12 22:59:06.026981
71	Omer	Ruecker	54	Uncustodial	4128666335	t	omer.ruecker@example.com	t	2012-12-12 22:59:06.029299	2012-12-12 22:59:06.029301
72	Walker	Connelly	55	Uncustodial	4122921458	t	walker.connelly@example.com	t	2012-12-12 22:59:06.031503	2012-12-12 22:59:06.031506
73	Audreanne	Jones	56	Father	4126318259	t	audreanne.jones@example.com	t	2012-12-12 22:59:06.03341	2012-12-12 22:59:06.033412
74	Tatum	Jones	56	Uncustodial	4124752988	t	tatum.jones@example.com	t	2012-12-12 22:59:06.033575	2012-12-12 22:59:06.033578
75	Gunnar	Jerde	57	Grandparent	4127258340	t	gunnar.jerde@example.com	t	2012-12-12 22:59:06.036058	2012-12-12 22:59:06.036061
76	Gerald	Jerde	57	Mother	4121471686	t	gerald.jerde@example.com	t	2012-12-12 22:59:06.036241	2012-12-12 22:59:06.036243
77	Ana	Ritchie	58	Mother	4124575649	f	ana.ritchie@example.com	t	2012-12-12 22:59:06.038519	2012-12-12 22:59:06.038521
78	Jess	Kuhic	59	Custodial	4129588546	t	jess.kuhic@example.com	t	2012-12-12 22:59:06.040979	2012-12-12 22:59:06.040982
79	Frederique	Macejkovic	60	Uncustodial	4129700496	t	frederique.macejkovic@example.com	t	2012-12-12 22:59:06.043117	2012-12-12 22:59:06.04312
80	Dell	Collier	61	Mother	4124758209	t	dell.collier@example.com	t	2012-12-12 22:59:06.045821	2012-12-12 22:59:06.045824
81	Nicholas	Collier	61	Grandparent	4123379541	t	nicholas.collier@example.com	t	2012-12-12 22:59:06.046006	2012-12-12 22:59:06.046008
82	Madelyn	Dicki	62	Grandparent	4122108759	t	madelyn.dicki@example.com	t	2012-12-12 22:59:06.04853	2012-12-12 22:59:06.048533
83	Tyree	Yost	63	Mother	4120046352	f	tyree.yost@example.com	t	2012-12-12 22:59:06.050795	2012-12-12 22:59:06.050797
84	Nayeli	Cummerata	64	Father	4120258429	t	nayeli.cummerata@example.com	t	2012-12-12 22:59:06.053847	2012-12-12 22:59:06.05385
85	Norwood	Cummerata	64	Father	4128724863	f	norwood.cummerata@example.com	t	2012-12-12 22:59:06.054028	2012-12-12 22:59:06.05403
86	Jackeline	Halvorson	65	Father	4124890232	t	jackeline.halvorson@example.com	t	2012-12-12 22:59:06.056406	2012-12-12 22:59:06.056409
87	Linnea	Halvorson	65	Mother	4126933708	f	linnea.halvorson@example.com	t	2012-12-12 22:59:06.056574	2012-12-12 22:59:06.056576
88	Ryleigh	Green	66	Mother	4128813498	t	ryleigh.green@example.com	t	2012-12-12 22:59:06.05888	2012-12-12 22:59:06.058883
89	Colten	Orn	67	Father	4128694293	t	colten.orn@example.com	t	2012-12-12 22:59:06.062128	2012-12-12 22:59:06.062131
90	Brigitte	Orn	67	Father	4126794937	t	brigitte.orn@example.com	t	2012-12-12 22:59:06.062321	2012-12-12 22:59:06.062323
91	Hannah	Leannon	68	Mother	4124230647	t	hannah.leannon@example.com	t	2012-12-12 22:59:06.065228	2012-12-12 22:59:06.065231
92	Nicole	Leannon	68	Father	4129395855	t	nicole.leannon@example.com	t	2012-12-12 22:59:06.065416	2012-12-12 22:59:06.065418
93	Abigail	Stark	69	Grandparent	4122378211	f	abigail.stark@example.com	t	2012-12-12 22:59:06.068198	2012-12-12 22:59:06.068201
94	Stanford	Ebert	70	Custodial	4123312638	t	stanford.ebert@example.com	t	2012-12-12 22:59:06.070435	2012-12-12 22:59:06.070438
95	Margarita	Hudson	71	Father	4123429425	t	margarita.hudson@example.com	t	2012-12-12 22:59:06.072607	2012-12-12 22:59:06.072609
96	Adrienne	Hudson	71	Mother	4121416894	t	adrienne.hudson@example.com	t	2012-12-12 22:59:06.072761	2012-12-12 22:59:06.072764
97	Marian	Heaney	72	Father	4121765933	f	marian.heaney@example.com	t	2012-12-12 22:59:06.076217	2012-12-12 22:59:06.07622
98	Alanna	Auer	73	Custodial	4129195305	f	alanna.auer@example.com	t	2012-12-12 22:59:06.078196	2012-12-12 22:59:06.078198
99	Dolly	Mante	74	Custodial	4125390426	t	dolly.mante@example.com	t	2012-12-12 22:59:06.080154	2012-12-12 22:59:06.080156
100	Adella	Mante	74	Uncustodial	4123773946	t	adella.mante@example.com	t	2012-12-12 22:59:06.080351	2012-12-12 22:59:06.080353
101	Bernadette	D'Amore	75	Uncustodial	4123221934	t	bernadette.d'amore@example.com	t	2012-12-12 22:59:06.083132	2012-12-12 22:59:06.083135
102	Elisabeth	Fritsch	76	Grandparent	4124307045	t	elisabeth.fritsch@example.com	t	2012-12-12 22:59:06.086763	2012-12-12 22:59:06.086767
103	Everardo	Mann	77	Father	4129766097	t	everardo.mann@example.com	t	2012-12-12 22:59:06.089119	2012-12-12 22:59:06.089122
104	Johnny	Goldner	78	Custodial	4129738943	t	johnny.goldner@example.com	t	2012-12-12 22:59:06.091346	2012-12-12 22:59:06.091348
105	Kenya	Goldner	78	Mother	4125101026	t	kenya.goldner@example.com	t	2012-12-12 22:59:06.091524	2012-12-12 22:59:06.091526
106	Vern	Waters	79	Mother	4129352711	t	vern.waters@example.com	t	2012-12-12 22:59:06.094893	2012-12-12 22:59:06.094895
107	Aimee	Morissette	80	Custodial	4128939487	t	aimee.morissette@example.com	t	2012-12-12 22:59:06.097279	2012-12-12 22:59:06.097282
108	Magdalena	Homenick	81	Father	4126688920	t	magdalena.homenick@example.com	t	2012-12-12 22:59:06.099297	2012-12-12 22:59:06.099299
109	Gay	Homenick	81	Custodial	4127496208	t	gay.homenick@example.com	t	2012-12-12 22:59:06.099465	2012-12-12 22:59:06.099467
110	Erika	Koepp	82	Grandparent	4124526010	t	erika.koepp@example.com	t	2012-12-12 22:59:06.10313	2012-12-12 22:59:06.103132
111	Annabell	Reichert	83	Mother	4123799506	t	annabell.reichert@example.com	t	2012-12-12 22:59:06.105381	2012-12-12 22:59:06.105383
112	Kiarra	Stamm	84	Uncustodial	4128044629	t	kiarra.stamm@example.com	t	2012-12-12 22:59:06.10801	2012-12-12 22:59:06.108013
113	Lonny	Stamm	84	Mother	4123202594	t	lonny.stamm@example.com	t	2012-12-12 22:59:06.108212	2012-12-12 22:59:06.108214
114	Heath	Sauer	85	Uncustodial	4126722444	f	heath.sauer@example.com	t	2012-12-12 22:59:06.112339	2012-12-12 22:59:06.112343
115	Gloria	Sauer	85	Uncustodial	4123208445	t	gloria.sauer@example.com	t	2012-12-12 22:59:06.11256	2012-12-12 22:59:06.112562
116	Kamron	Towne	86	Custodial	4122609701	t	kamron.towne@example.com	t	2012-12-12 22:59:06.115749	2012-12-12 22:59:06.115752
117	Israel	Mitchell	87	Uncustodial	4122251363	f	israel.mitchell@example.com	t	2012-12-12 22:59:06.118765	2012-12-12 22:59:06.118768
118	Ramiro	Mitchell	87	Mother	4127319346	t	ramiro.mitchell@example.com	t	2012-12-12 22:59:06.118945	2012-12-12 22:59:06.118947
119	Blair	Runte	88	Custodial	4121182051	t	blair.runte@example.com	t	2012-12-12 22:59:06.121768	2012-12-12 22:59:06.12177
120	Ward	Runte	88	Custodial	4129911045	f	ward.runte@example.com	t	2012-12-12 22:59:06.121936	2012-12-12 22:59:06.121938
121	Lois	Klein	89	Grandparent	4125661071	t	lois.klein@example.com	t	2012-12-12 22:59:06.124386	2012-12-12 22:59:06.124388
122	Magdalen	Frami	90	Grandparent	4129108976	t	magdalen.frami@example.com	t	2012-12-12 22:59:06.128404	2012-12-12 22:59:06.128408
123	Cassandre	Frami	90	Father	4128665498	t	cassandre.frami@example.com	t	2012-12-12 22:59:06.128636	2012-12-12 22:59:06.128638
124	Marlen	Jones	91	Mother	4127595967	t	marlen.jones@example.com	t	2012-12-12 22:59:06.131259	2012-12-12 22:59:06.131261
125	Gage	Jones	91	Grandparent	4125166376	t	gage.jones@example.com	t	2012-12-12 22:59:06.13143	2012-12-12 22:59:06.131432
126	Delia	Durgan	92	Grandparent	4121573948	t	delia.durgan@example.com	t	2012-12-12 22:59:06.133937	2012-12-12 22:59:06.133939
127	Ettie	Durgan	92	Mother	4123464936	t	ettie.durgan@example.com	t	2012-12-12 22:59:06.134104	2012-12-12 22:59:06.134107
128	Lurline	Carroll	93	Custodial	4127094279	t	lurline.carroll@example.com	t	2012-12-12 22:59:06.136942	2012-12-12 22:59:06.136945
129	Jonas	Carroll	93	Mother	4124070056	t	jonas.carroll@example.com	t	2012-12-12 22:59:06.137148	2012-12-12 22:59:06.13715
130	Sonya	Corkery	94	Uncustodial	4121035523	t	sonya.corkery@example.com	t	2012-12-12 22:59:06.13978	2012-12-12 22:59:06.139783
131	Reina	Corkery	94	Grandparent	4129598792	t	reina.corkery@example.com	t	2012-12-12 22:59:06.139951	2012-12-12 22:59:06.139953
132	Martin	Pfeffer	95	Grandparent	4124305644	t	martin.pfeffer@example.com	t	2012-12-12 22:59:06.142321	2012-12-12 22:59:06.142323
133	Tressie	Swift	96	Mother	4127518173	t	tressie.swift@example.com	t	2012-12-12 22:59:06.145019	2012-12-12 22:59:06.145021
134	Tierra	Swift	96	Custodial	4126583026	t	tierra.swift@example.com	t	2012-12-12 22:59:06.145182	2012-12-12 22:59:06.145184
135	Dell	Cormier	97	Custodial	4120616889	f	dell.cormier@example.com	t	2012-12-12 22:59:06.147862	2012-12-12 22:59:06.147865
136	Mafalda	Schinner	98	Uncustodial	4121884077	t	mafalda.schinner@example.com	t	2012-12-12 22:59:06.150763	2012-12-12 22:59:06.150765
137	Nella	Stokes	99	Grandparent	4123289980	f	nella.stokes@example.com	t	2012-12-12 22:59:06.152936	2012-12-12 22:59:06.152939
138	Dorothea	Williamson	100	Grandparent	4129972320	t	dorothea.williamson@example.com	t	2012-12-12 22:59:06.15558	2012-12-12 22:59:06.155583
\.


--
-- Data for Name: households; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY households (id, name, street, street2, city, zip, insurance_company, insurance_number, church, lat, lon, active, created_at, updated_at) FROM stdin;
1	Rempel	7680 Emmerich Spring	\N	Pittsburgh	15213	Sed	08264800	Itaque	\N	\N	t	2012-12-12 22:59:04.124479	2012-12-12 22:59:04.124482
2	Wisozk	1512 Gayle Brooks	\N	Pittsburgh	15136	Et Est	13517700	Fugiat	\N	\N	t	2012-12-12 22:59:04.59416	2012-12-12 22:59:04.594163
3	Rohan	42984 Jaida Ranch	\N	Pittsburgh	15201	Non	04413054	Ea	\N	\N	t	2012-12-12 22:59:04.598149	2012-12-12 22:59:04.598151
4	Grant	2514 Aidan Unions	\N	Pittsburgh	15204	Labore	12649524	Et	\N	\N	t	2012-12-12 22:59:04.600323	2012-12-12 22:59:04.600325
5	Ziemann	16976 Skylar Road	190 Murazik Pine	Pittsburgh	15214	Temporibus Placeat	15170774	Eum	\N	\N	t	2012-12-12 22:59:04.682759	2012-12-12 22:59:04.682763
6	Hayes	8820 Orn Roads	\N	Pittsburgh	15219	Iure	13099835	Accusamus	\N	\N	t	2012-12-12 22:59:04.685571	2012-12-12 22:59:04.685574
7	Collins	313 Sibyl Divide	\N	Pittsburgh	15214	Aut	10767809	Odit	\N	\N	t	2012-12-12 22:59:04.687937	2012-12-12 22:59:04.687939
8	Bosco	191 Kyra Lakes	\N	Pittsburgh	15136	Magni	03388973	Vitae	\N	\N	t	2012-12-12 22:59:04.690241	2012-12-12 22:59:04.690244
9	Trantow	73788 Jamaal Vista	\N	Pittsburgh	15222	Assumenda Consequatur	14204428	Esse	\N	\N	t	2012-12-12 22:59:04.692458	2012-12-12 22:59:04.69246
10	Padberg	7168 Shaylee Fort	\N	Pittsburgh	15220	Impedit	09969166	Porro	\N	\N	t	2012-12-12 22:59:04.696633	2012-12-12 22:59:04.696635
11	Dietrich	4018 Tromp Isle	\N	Pittsburgh	15214	Doloremque Id	16105484	Cupiditate	\N	\N	t	2012-12-12 22:59:04.698841	2012-12-12 22:59:04.698844
12	Howe	573 Frieda Walk	46206 Collier Turnpike	Pittsburgh	15224	Nemo	02074721	Est	\N	\N	f	2012-12-12 22:59:04.70102	2012-12-12 22:59:04.701022
13	Smith	8307 Gerhold Vista	\N	Pittsburgh	15201	Et Aut	06251596	Totam	\N	\N	t	2012-12-12 22:59:04.703349	2012-12-12 22:59:04.703352
14	Streich	69464 Morissette Roads	464 Collins Prairie	Pittsburgh	15212	Veritatis	03711648	Enim	\N	\N	t	2012-12-12 22:59:04.70549	2012-12-12 22:59:04.705492
15	Effertz	465 Arlene Roads	\N	Pittsburgh	15233	Expedita	02685484	Sapiente	\N	\N	t	2012-12-12 22:59:04.709432	2012-12-12 22:59:04.709434
16	Lang	17375 Ofelia Stravenue	\N	Pittsburgh	15136	Mollitia Corrupti	12398639	Dignissimos	\N	\N	t	2012-12-12 22:59:04.713298	2012-12-12 22:59:04.7133
17	Blanda	80734 Quitzon Station	\N	Pittsburgh	15213	Deserunt Eos	04761508	Voluptates	\N	\N	t	2012-12-12 22:59:04.717351	2012-12-12 22:59:04.717353
18	Heathcote	530 Bernadine Ramp	\N	Pittsburgh	15222	Atque Dolorem	00818254	Sed	\N	\N	t	2012-12-12 22:59:04.719666	2012-12-12 22:59:04.719669
19	Carter	29876 Thompson Causeway	\N	Pittsburgh	15136	Rerum	11590118	Ullam	\N	\N	t	2012-12-12 22:59:04.721834	2012-12-12 22:59:04.721836
20	Lehner	782 Alanna Village	7391 Schulist Squares	Pittsburgh	15214	Occaecati	03476146	Aut	\N	\N	t	2012-12-12 22:59:04.72398	2012-12-12 22:59:04.723982
21	Terry	68499 Destany Crossing	\N	Pittsburgh	15213	Corporis Praesentium	11950652	Quasi	\N	\N	t	2012-12-12 22:59:04.72798	2012-12-12 22:59:04.727982
22	Crooks	24084 Vita Shoals	\N	Pittsburgh	15204	Ipsa	14168383	Laborum	\N	\N	t	2012-12-12 22:59:04.730244	2012-12-12 22:59:04.730246
23	Hermann	8248 Eichmann Avenue	\N	Pittsburgh	15136	Possimus Repellat	10786993	At	\N	\N	t	2012-12-12 22:59:04.73408	2012-12-12 22:59:04.734083
24	Hauck	67952 Larson Mission	\N	Pittsburgh	15204	Neque Quis	02873378	Aliquam	\N	\N	t	2012-12-12 22:59:04.737891	2012-12-12 22:59:04.737894
25	Ritchie	6096 Dwight Skyway	\N	Pittsburgh	15213	Dolores Eius	03421361	Et	\N	\N	t	2012-12-12 22:59:04.740086	2012-12-12 22:59:04.740088
26	Simonis	92134 Treutel Estate	\N	Pittsburgh	15220	Ipsa Velit	10949202	Quam	\N	\N	t	2012-12-12 22:59:04.742182	2012-12-12 22:59:04.742184
27	Dicki	7199 Franecki Points	\N	Pittsburgh	15224	Est Excepturi	01904556	Autem	\N	\N	f	2012-12-12 22:59:04.745982	2012-12-12 22:59:04.745985
28	Rogahn	15616 Cremin Divide	665 Larson Ports	Pittsburgh	15233	Est Rem	08250443	Sit	\N	\N	t	2012-12-12 22:59:04.749888	2012-12-12 22:59:04.74989
29	Mitchell	3784 Quitzon Inlet	443 Margaretta Manor	Pittsburgh	15233	Quasi Quia	06703085	Minus	\N	\N	f	2012-12-12 22:59:04.753942	2012-12-12 22:59:04.753944
30	Volkman	66776 Jennyfer Streets	\N	Pittsburgh	15213	Maxime	05003015	Aperiam	\N	\N	t	2012-12-12 22:59:04.756292	2012-12-12 22:59:04.756295
31	Adams	3270 Ursula Walk	\N	Pittsburgh	15212	Ratione Possimus	03294613	Accusamus	\N	\N	f	2012-12-12 22:59:04.760111	2012-12-12 22:59:04.760113
32	Heathcote	2892 Tromp Junctions	8985 Cremin Heights	Pittsburgh	15212	Et Illo	16139164	Aspernatur	\N	\N	t	2012-12-12 22:59:04.763995	2012-12-12 22:59:04.763998
33	Purdy	64535 Brown Inlet	\N	Pittsburgh	15204	Ut	05354729	Consequatur	\N	\N	f	2012-12-12 22:59:04.768237	2012-12-12 22:59:04.768239
34	Blanda	587 Marc Fall	\N	Pittsburgh	15203	Et Neque	14169949	Voluptates	\N	\N	t	2012-12-12 22:59:04.77046	2012-12-12 22:59:04.770462
35	Ritchie	90313 Bartell Lights	\N	Pittsburgh	15222	Unde Quia	11580009	Vel	\N	\N	t	2012-12-12 22:59:04.774301	2012-12-12 22:59:04.774303
36	Bergstrom	142 Diana Knoll	\N	Pittsburgh	15222	Quia	04162123	Provident	\N	\N	f	2012-12-12 22:59:04.776721	2012-12-12 22:59:04.776723
37	Kovacek	17727 Llewellyn Loop	72158 Brigitte Stravenue	Pittsburgh	15201	Dicta Dignissimos	09911881	Blanditiis	\N	\N	t	2012-12-12 22:59:04.778887	2012-12-12 22:59:04.778889
38	Goodwin	509 Stanton Road	89042 McCullough Streets	Pittsburgh	15233	Occaecati Aut	05186465	Repellat	\N	\N	t	2012-12-12 22:59:04.781251	2012-12-12 22:59:04.781253
39	Bruen	763 Camden Falls	972 Grimes Alley	Pittsburgh	15222	Ratione	10579449	Corporis	\N	\N	t	2012-12-12 22:59:04.867863	2012-12-12 22:59:04.867866
40	Trantow	731 Shakira Gardens	\N	Pittsburgh	15212	Placeat Asperiores	14229012	Laboriosam	\N	\N	f	2012-12-12 22:59:04.872402	2012-12-12 22:59:04.872405
41	Christiansen	460 Williamson Ridge	429 Edwina Fork	Pittsburgh	15214	Consequatur	14542624	Aspernatur	\N	\N	t	2012-12-12 22:59:04.87647	2012-12-12 22:59:04.876473
42	Hauck	51562 Gleason Extensions	9780 Hansen Circles	Pittsburgh	15222	Ut	13550521	Et	\N	\N	f	2012-12-12 22:59:04.878848	2012-12-12 22:59:04.87885
43	Cruickshank	430 Uriel Trace	\N	Pittsburgh	15214	Natus Aut	14608993	Iste	\N	\N	t	2012-12-12 22:59:04.8831	2012-12-12 22:59:04.883102
44	Brekke	411 Auer Springs	\N	Pittsburgh	15136	In	06883203	Quis	\N	\N	t	2012-12-12 22:59:04.887818	2012-12-12 22:59:04.887821
45	Tillman	1709 Murl Green	\N	Pittsburgh	15233	Est	08420736	Nesciunt	\N	\N	t	2012-12-12 22:59:04.890153	2012-12-12 22:59:04.890155
46	Abshire	628 Juwan Villages	\N	Pittsburgh	15220	Est	09417075	Incidunt	\N	\N	t	2012-12-12 22:59:04.894238	2012-12-12 22:59:04.89424
47	Powlowski	3773 Jones Lodge	\N	Pittsburgh	15201	Officiis	15143881	Aut	\N	\N	t	2012-12-12 22:59:04.896407	2012-12-12 22:59:04.896409
48	Hayes	291 Friesen Garden	64736 Ariel Harbors	Pittsburgh	15222	Nihil Ratione	02555032	Molestiae	\N	\N	t	2012-12-12 22:59:04.898533	2012-12-12 22:59:04.898535
49	Fahey	7114 Wintheiser Court	\N	Pittsburgh	15214	Quisquam	03617809	Dolores	\N	\N	t	2012-12-12 22:59:04.902532	2012-12-12 22:59:04.902534
50	Schultz	18544 Rosenbaum Common	\N	Pittsburgh	15201	Ut	11041844	Voluptas	\N	\N	t	2012-12-12 22:59:04.904741	2012-12-12 22:59:04.904743
51	Christiansen	680 Charley Place	\N	Pittsburgh	15214	Provident	05615198	Impedit	\N	\N	t	2012-12-12 22:59:04.906919	2012-12-12 22:59:04.906921
52	O'Keefe	96215 Blaise Ford	\N	Pittsburgh	15212	Aperiam	03567825	Dolores	\N	\N	t	2012-12-12 22:59:04.909002	2012-12-12 22:59:04.909004
53	Gleason	374 Olson Parkways	\N	Pittsburgh	15136	Sed	12113825	Vero	\N	\N	t	2012-12-12 22:59:04.912745	2012-12-12 22:59:04.912747
54	Ruecker	366 Elisabeth Park	\N	Pittsburgh	15233	Molestiae Eos	09830993	Labore	\N	\N	t	2012-12-12 22:59:04.914864	2012-12-12 22:59:04.914866
55	Connelly	804 Mariane Heights	\N	Pittsburgh	15233	Maiores Veritatis	05029441	Accusantium	\N	\N	t	2012-12-12 22:59:04.917008	2012-12-12 22:59:04.91701
56	Jones	14300 Shields Prairie	\N	Pittsburgh	15219	Temporibus	00178265	Explicabo	\N	\N	f	2012-12-12 22:59:04.92076	2012-12-12 22:59:04.920762
57	Jerde	678 Domenico Islands	\N	Pittsburgh	15214	Ad	08869731	Est	\N	\N	t	2012-12-12 22:59:04.924695	2012-12-12 22:59:04.924697
58	Ritchie	8995 Kovacek Forks	435 Myrtice Courts	Pittsburgh	15136	Consectetur	04345731	Qui	\N	\N	t	2012-12-12 22:59:04.928503	2012-12-12 22:59:04.928505
59	Kuhic	8858 Zakary Flats	\N	Pittsburgh	15136	Impedit	03279206	Voluptatem	\N	\N	t	2012-12-12 22:59:04.930796	2012-12-12 22:59:04.930798
60	Macejkovic	529 Zieme Locks	\N	Pittsburgh	15220	Incidunt	03289642	Vel	\N	\N	t	2012-12-12 22:59:04.934589	2012-12-12 22:59:04.934591
61	Collier	51762 Darion Ramp	\N	Pittsburgh	15136	Reprehenderit	11875909	Dolorum	\N	\N	t	2012-12-12 22:59:04.936771	2012-12-12 22:59:04.936773
62	Dicki	70577 Kertzmann Springs	\N	Pittsburgh	15222	Laborum	07941556	Est	\N	\N	t	2012-12-12 22:59:04.940783	2012-12-12 22:59:04.940786
63	Yost	162 Mayert Trail	\N	Pittsburgh	15213	Odio Et	13643332	Nisi	\N	\N	t	2012-12-12 22:59:04.944752	2012-12-12 22:59:04.944754
64	Cummerata	76800 Bode Fork	\N	Pittsburgh	15214	Qui	03576484	Recusandae	\N	\N	f	2012-12-12 22:59:04.94698	2012-12-12 22:59:04.946982
65	Halvorson	7252 Considine Meadow	\N	Pittsburgh	15219	Maxime	12729097	Qui	\N	\N	t	2012-12-12 22:59:04.951004	2012-12-12 22:59:04.951007
66	Green	77049 Ortiz Pass	\N	Pittsburgh	15233	Animi Quisquam	03103342	Odio	\N	\N	t	2012-12-12 22:59:04.953223	2012-12-12 22:59:04.953225
67	Orn	3850 Willms Parks	\N	Pittsburgh	15214	Et	16566382	Cupiditate	\N	\N	t	2012-12-12 22:59:04.957713	2012-12-12 22:59:04.957716
68	Leannon	147 Kolby Loaf	34363 Araceli Mall	Pittsburgh	15219	Voluptatem Eius	08675911	Esse	\N	\N	t	2012-12-12 22:59:04.960091	2012-12-12 22:59:04.960094
69	Stark	6831 Quigley Park	85025 Daniella Wall	Pittsburgh	15212	Et	06933188	Itaque	\N	\N	t	2012-12-12 22:59:04.962553	2012-12-12 22:59:04.962556
70	Ebert	778 Emmerich Circles	\N	Pittsburgh	15233	Impedit Qui	04707890	Sunt	\N	\N	f	2012-12-12 22:59:04.964847	2012-12-12 22:59:04.964849
71	Hudson	275 Monahan Glens	95589 Ward Overpass	Pittsburgh	15136	Odio	00633639	Minus	\N	\N	t	2012-12-12 22:59:05.052617	2012-12-12 22:59:05.052621
72	Heaney	17539 Bergstrom Stravenue	\N	Pittsburgh	15220	Nihil Odit	03041779	Facere	\N	\N	t	2012-12-12 22:59:05.057338	2012-12-12 22:59:05.057341
73	Auer	786 Marjolaine Village	\N	Pittsburgh	15233	Autem Sed	10026983	Ipsa	\N	\N	t	2012-12-12 22:59:05.059749	2012-12-12 22:59:05.059752
74	Mante	1656 Brielle Overpass	\N	Pittsburgh	15220	Aperiam	15954428	Voluptatem	\N	\N	t	2012-12-12 22:59:05.062193	2012-12-12 22:59:05.062197
75	D'Amore	48121 Catharine Corners	\N	Pittsburgh	15214	Aut Ut	06587712	Asperiores	\N	\N	t	2012-12-12 22:59:05.066317	2012-12-12 22:59:05.066319
76	Fritsch	5152 Leannon Causeway	\N	Pittsburgh	15204	Est	10912674	Ex	\N	\N	t	2012-12-12 22:59:05.070241	2012-12-12 22:59:05.070244
77	Mann	167 Gerlach Track	\N	Pittsburgh	15204	Impedit	12937094	Fuga	\N	\N	t	2012-12-12 22:59:05.074145	2012-12-12 22:59:05.074147
78	Goldner	788 Abigayle Drive	69311 Bernhard Islands	Pittsburgh	15233	Eligendi Rerum	10021399	Expedita	\N	\N	t	2012-12-12 22:59:05.076384	2012-12-12 22:59:05.076386
79	Waters	42739 Toby Forks	\N	Pittsburgh	15224	Eius Eum	01185123	Libero	\N	\N	t	2012-12-12 22:59:05.079529	2012-12-12 22:59:05.079533
80	Morissette	4360 Rolfson Loop	5935 Llewellyn Lock	Pittsburgh	15222	Voluptate	07188996	Aut	\N	\N	t	2012-12-12 22:59:05.083798	2012-12-12 22:59:05.083801
81	Homenick	67739 Prudence Ports	\N	Pittsburgh	15214	Repudiandae Voluptate	14190755	Nihil	\N	\N	t	2012-12-12 22:59:05.086149	2012-12-12 22:59:05.086151
82	Koepp	118 Tobin Meadow	\N	Pittsburgh	15233	Nam Fuga	04400505	Et	\N	\N	t	2012-12-12 22:59:05.088428	2012-12-12 22:59:05.088431
83	Reichert	856 Annie Mountain	\N	Pittsburgh	15136	Assumenda Necessitatibus	03327971	Voluptatum	\N	\N	t	2012-12-12 22:59:05.09062	2012-12-12 22:59:05.090624
84	Stamm	792 Bartell Place	\N	Pittsburgh	15212	A	07775149	Tenetur	\N	\N	t	2012-12-12 22:59:05.094569	2012-12-12 22:59:05.094571
85	Sauer	33124 Jordan Ports	\N	Pittsburgh	15219	Perferendis	00978114	Et	\N	\N	t	2012-12-12 22:59:05.098542	2012-12-12 22:59:05.098544
86	Towne	7222 Mariano Islands	5208 Kohler Parkway	Pittsburgh	15222	Est	15720176	Omnis	\N	\N	f	2012-12-12 22:59:05.102439	2012-12-12 22:59:05.102442
87	Mitchell	9808 Maximilian Spur	\N	Pittsburgh	15201	Recusandae	16140023	Aliquam	\N	\N	t	2012-12-12 22:59:05.10477	2012-12-12 22:59:05.104772
88	Runte	43497 Vergie Stream	\N	Pittsburgh	15233	Similique	14065131	Voluptas	\N	\N	t	2012-12-12 22:59:05.108651	2012-12-12 22:59:05.108654
89	Klein	272 Hegmann Ranch	\N	Pittsburgh	15204	Et Aperiam	13038759	Voluptate	\N	\N	t	2012-12-12 22:59:05.112493	2012-12-12 22:59:05.112495
90	Frami	78966 Danial Parkways	\N	Pittsburgh	15214	Corporis	00662509	Sapiente	\N	\N	f	2012-12-12 22:59:05.116588	2012-12-12 22:59:05.116591
91	Jones	8238 Ray Stravenue	270 Norma Estates	Pittsburgh	15204	Iste	00613574	Quos	\N	\N	f	2012-12-12 22:59:05.119198	2012-12-12 22:59:05.1192
92	Durgan	87308 Ratke Gateway	\N	Pittsburgh	15233	Accusantium Aperiam	05494295	Voluptatem	\N	\N	t	2012-12-12 22:59:05.121572	2012-12-12 22:59:05.121575
93	Carroll	35727 Catherine Ridge	7669 Hansen Summit	Pittsburgh	15203	Veniam Quo	14892561	Veritatis	\N	\N	t	2012-12-12 22:59:05.123739	2012-12-12 22:59:05.123741
94	Corkery	6895 Barton River	\N	Pittsburgh	15204	Id	15821346	Velit	\N	\N	f	2012-12-12 22:59:05.12812	2012-12-12 22:59:05.128123
95	Pfeffer	124 Mathew Gateway	\N	Pittsburgh	15233	Enim	16591925	Enim	\N	\N	t	2012-12-12 22:59:05.130342	2012-12-12 22:59:05.130344
96	Swift	915 Alexzander Center	\N	Pittsburgh	15204	Deleniti Aut	07422645	Sit	\N	\N	t	2012-12-12 22:59:05.134156	2012-12-12 22:59:05.134159
97	Cormier	2719 Peter Drives	61769 Ledner Station	Pittsburgh	15136	Deserunt	02902684	Velit	\N	\N	f	2012-12-12 22:59:05.13648	2012-12-12 22:59:05.136482
98	Schinner	2088 Mackenzie Passage	\N	Pittsburgh	15224	Expedita	06710351	Deleniti	\N	\N	f	2012-12-12 22:59:05.13884	2012-12-12 22:59:05.138843
99	Stokes	330 Schmitt Wells	4822 Davon Harbor	Pittsburgh	15219	Eos	06028468	Rerum	\N	\N	t	2012-12-12 22:59:05.14267	2012-12-12 22:59:05.142673
100	Williamson	5878 O'Conner Mountains	93223 Conroy Greens	Pittsburgh	15201	Reiciendis	14422241	Quod	\N	\N	t	2012-12-12 22:59:05.145063	2012-12-12 22:59:05.145065
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY locations (id, name, street, city, zip, lat, lon, active, created_at, updated_at) FROM stdin;
1	UIF - Union Place	801 Union Place	Pittsburgh	15212	\N	\N	t	2012-12-12 22:59:03.777388	2012-12-12 22:59:03.777388
2	Carnegie Mellon	5000 Forbes Avenue	Pittsburgh	15213	\N	\N	t	2012-12-12 22:59:03.783597	2012-12-12 22:59:03.783597
3	Convention Center	1000 Fort Duquesne Blvd	Pittsburgh	15222	\N	\N	t	2012-12-12 22:59:03.788465	2012-12-12 22:59:03.788465
4	Point State Park	101 Commonwealth Place	Pittsburgh	15222	\N	\N	t	2012-12-12 22:59:03.793348	2012-12-12 22:59:03.793348
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY notes (id, user_id, date, contents, notable_type, notable_id, priority, created_at, updated_at, title, active) FROM stdin;
1	1	2012-12-12	It was with himself.  And he lost.  Not good.	Student	68	1	2012-12-12 23:03:08.945227	2012-12-12 23:03:08.945227	Erwin got into a fight	t
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY programs (id, name, description, department_id, min_grade, max_grade, max_capacity, created_at, updated_at, active, start_date, end_date, scan_by_absence) FROM stdin;
1	Performing Arts Academy	Nesciunt vero quia porro enim porro enim qui repudiandae. Sint possimus sunt molestiae est perferendis deserunt consequatur iure explicabo ea et laboriosam qui esse sint ab veritatis expedita. Est sint voluptas harum est numquam qui excepturi magnam aliquam optio libero minus fuga vero et aspernatur nulla ut animi. Quis error voluptas dolore molestias et. Facilis quis nam et ut et deserunt minus porro dignissimos rerum voluptas nam expedita est vel porro	1	1	12	90	2012-12-12 22:59:03.89025	2012-12-12 22:59:03.89025	t	2011-10-10	\N	f
2	Urban Impact Choir	Occaecati dolorem quibusdam vitae adipisci deserunt ducimus aut impedit omnis porro quos omnis suscipit iusto praesentium magni aspernatur. Et mollitia cupiditate eum aut. Et nam consequatur quibusdam cupiditate consequatur rerum iure labore debitis nam quia consequuntur molestiae dolorum iusto. Beatae totam similique aut quis amet officia mollitia et magnam. Qui possimus qui perferendis vel voluptatibus iure placeat aliquam id consequatur tenetur exercitationem qui amet consectetur rem omnis. Quae cum possimus pariatur rem tenetur veritatis ducimus numquam saepe atque nulla. Eaque itaque aut deserunt et tempore est ab facilis. Rerum minus ut ad molestiae quia hic et iste nemo dolorem. Occaecati suscipit voluptatem commodi magnam molestias quia est ab animi pariatur ex mollitia sed voluptas deleniti placeat corporis veritatis beatae. Quod aperiam accusamus sed consequatur odit vel earum at necessitatibus suscipit dolor	1	6	12	75	2012-12-12 22:59:03.898564	2012-12-12 22:59:03.898564	t	2012-07-30	\N	t
3	Urban Impact Children's Choir	Qui molestiae et architecto cumque quos vitae harum totam qui. Suscipit rerum ad ullam qui et et nesciunt et et minima ullam autem quisquam et et in. Laudantium corrupti fugit voluptatem sint dolor qui accusantium omnis est. Quod placeat fugiat voluptas molestiae neque nihil ex nostrum. Aut quis inventore culpa enim suscipit est modi deleniti voluptatem laboriosam eum sunt enim repellat aliquam molestiae et. Cupiditate et est quia est dolores. Est debitis sit blanditiis enim perspiciatis voluptatem enim earum illum et. Provident asperiores modi reprehenderit ut. Cupiditate reiciendis excepturi esse voluptate. Maxime dolorem aut minima aperiam nihil quasi	1	1	5	85	2012-12-12 22:59:03.904646	2012-12-12 22:59:03.904646	t	2012-01-18	\N	t
4	Urban Impact Singers	Ipsa ipsa sapiente praesentium voluptas inventore rerum. Ullam et ipsa aperiam est est non consequatur rerum eos laboriosam repellendus sapiente. Autem velit aut soluta atque asperiores culpa. Dolor nesciunt rerum officiis eius qui voluptas enim a in non	1	8	12	70	2012-12-12 22:59:03.910191	2012-12-12 22:59:03.910191	t	2012-09-03	\N	f
5	Urban Impact Shakes	A quod repellat enim quas repellat voluptatem et laborum quibusdam dolor. Aliquam porro minus aut odit minus consectetur recusandae omnis qui blanditiis quia. Voluptatem veniam dolore atque ut ratione quibusdam hic iste cum et provident labore quis. Dolorem adipisci earum molestiae provident voluptatem qui deserunt rerum at reprehenderit rerum cumque similique reprehenderit enim autem ut adipisci dignissimos. Sint aut est minus asperiores voluptatem tempora. Voluptate qui aut dolorem repudiandae similique quibusdam. Est possimus quia aspernatur blanditiis omnis architecto molestias sequi quis deleniti cupiditate et omnis dolore non animi	1	8	12	65	2012-12-12 22:59:03.916575	2012-12-12 22:59:03.916575	t	2011-06-19	\N	f
6	Intramural Basketball	Dolores nulla qui expedita id voluptate aperiam nostrum voluptatem est iste iusto esse quas. Fugit dolores sed dolorem quia ut. Qui laborum vel fugiat porro laudantium. Voluptatem occaecati et unde vitae et quidem est eum est ut quasi. Inventore deserunt vel accusantium cumque in architecto suscipit nihil debitis animi veritatis explicabo dolorem est atque. Tempora asperiores accusantium iste ut fugiat ullam officia. Voluptates tempora molestiae quos ut cum voluptate corrupti consectetur itaque autem sunt et ut maxime. Nemo dolor quisquam sunt placeat veritatis rem. Modi quia molestiae velit culpa omnis eos rem alias aut facilis quia	2	1	12	60	2012-12-12 22:59:03.922543	2012-12-12 22:59:03.922543	t	2011-09-30	\N	f
7	High School Travel Basketball Teams	Consectetur quo odit sit facilis necessitatibus omnis tempore. Voluptatem libero ipsum tempore sapiente eos voluptatem iusto animi nisi quo iusto voluptas consequatur facere et corrupti atque est quos. Adipisci vel omnis ea sunt. Debitis quo minus itaque saepe et est possimus unde error nihil qui recusandae quia id in sapiente quidem. Magnam quod est adipisci cupiditate delectus aliquid ipsa quia quisquam voluptatum ratione numquam est ducimus. Est vel ratione ullam tenetur quod et sit harum ea voluptatibus	2	9	12	90	2012-12-12 22:59:03.929516	2012-12-12 22:59:03.929516	t	2012-08-10	\N	f
8	Middle School Travel Basketball Teams	Molestiae nobis qui reiciendis autem ut laboriosam dolores iure dolore debitis ut fugit laboriosam alias et nostrum ipsum architecto. Nulla deserunt officiis esse eligendi est enim consequatur ratione vel laudantium nulla rerum inventore laudantium quia. Similique consequatur dicta omnis est aut quae voluptatibus quae nam praesentium fugiat. Atque est sit quia error doloremque ratione neque. In eaque ipsum veritatis est est voluptatem quia repellat accusamus deserunt dolor id sint quisquam. Dolores praesentium et et non nemo. Delectus nihil reiciendis vel eaque aut illo quia maiores distinctio rerum quam voluptatum non eos numquam	2	6	8	60	2012-12-12 22:59:03.935385	2012-12-12 22:59:03.935385	t	2012-03-04	\N	f
9	Boys HS & MS Basketball Leagues	Laborum ducimus quia non blanditiis officia ex enim et asperiores libero tenetur assumenda. Itaque aliquid aliquam molestias nihil non ab ea et aut ut voluptas hic corporis. Dolorem omnis et veritatis et	2	6	12	90	2012-12-12 22:59:03.941634	2012-12-12 22:59:03.941634	t	2011-06-12	\N	f
10	Baseball	Amet saepe adipisci quis et eum eum. Laudantium adipisci libero possimus suscipit nostrum veniam beatae a aut quis sed	2	1	8	85	2012-12-12 22:59:03.947177	2012-12-12 22:59:03.947177	t	2011-04-18	\N	f
11	Soccer	Ullam et voluptatem ipsa iusto. Temporibus dignissimos eum eos quae fugit soluta et doloribus non mollitia esse voluptatibus. Nam facere omnis rerum tenetur	2	1	8	80	2012-12-12 22:59:03.952942	2012-12-12 22:59:03.952942	t	2011-03-03	\N	f
12	SAT Classes	Iste officia voluptas ut ex tenetur est necessitatibus omnis voluptatum omnis aspernatur libero nemo ipsam voluptate deleniti ipsam. Reprehenderit aliquam porro distinctio odit pariatur impedit ipsum repellat adipisci error. Doloribus qui ut deleniti aut accusantium voluptates nihil veniam ad at corrupti dolore nihil officiis qui ipsam. Dolorum beatae optio saepe enim ut commodi alias ea. Reiciendis et et dolor molestiae voluptate voluptatem cupiditate vel iusto veritatis. Qui quo earum molestiae officia eveniet architecto quo officia quo ipsam delectus iusto minima aut ipsam iusto odio sed ut. Aut ut dicta alias fugiat at dolor illum ducimus tempore eaque nesciunt unde quia et est id in. Quidem labore ea labore aut modi aut. Nam numquam praesentium aperiam sed molestiae delectus quam	3	10	12	60	2012-12-12 22:59:03.95928	2012-12-12 22:59:03.95928	t	2011-07-31	\N	f
13	Summer Day Camp	Nihil magnam est similique omnis deserunt blanditiis quidem ipsam numquam perspiciatis sed sed consectetur sint. Et perspiciatis possimus impedit non qui voluptas mollitia aliquam repudiandae porro consequuntur eius in eius expedita eum a. Ex iusto velit deserunt consequatur voluptatem autem et corporis qui soluta non velit dolores consectetur voluptatem voluptatibus. Possimus qui quis velit consequatur doloribus ut voluptatem dicta eum et. Et facere atque magni deserunt numquam qui sed libero. Quia odio nesciunt ullam inventore cum ipsum et perspiciatis quod et rerum quasi ad ut. Magni inventore aperiam sunt reiciendis cumque iure ut iusto sequi voluptatem ullam nostrum odio architecto porro expedita culpa sequi	3	1	12	80	2012-12-12 22:59:03.967832	2012-12-12 22:59:03.967832	t	2012-01-27	\N	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY schema_migrations (version) FROM stdin;
20120930064145
20120930064431
20120930064619
20120930064820
20120930144434
20120930144555
20121004044339
20121004060419
20121004060609
20121004060748
20121004060933
20121011055559
20121023093141
20121030161427
20121030171426
20121120191614
20121121094204
20121130034918
20121202232741
20121205003931
20121205221245
\.


--
-- Data for Name: section_events; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY section_events (id, section_id, event_id, created_at, updated_at) FROM stdin;
1	2	1	2012-12-12 22:59:04.081937	2012-12-12 22:59:04.081941
2	15	2	2012-12-12 22:59:04.082783	2012-12-12 22:59:04.082785
3	13	3	2012-12-12 22:59:04.083213	2012-12-12 22:59:04.083215
4	16	4	2012-12-12 22:59:04.08379	2012-12-12 22:59:04.083792
5	2	5	2012-12-12 22:59:04.084128	2012-12-12 22:59:04.08413
6	7	6	2012-12-12 22:59:04.084459	2012-12-12 22:59:04.084461
7	20	7	2012-12-12 22:59:04.084976	2012-12-12 22:59:04.084978
8	9	8	2012-12-12 22:59:04.085473	2012-12-12 22:59:04.085475
9	9	9	2012-12-12 22:59:04.085954	2012-12-12 22:59:04.085956
10	21	10	2012-12-12 22:59:04.086469	2012-12-12 22:59:04.086471
11	3	11	2012-12-12 22:59:04.086815	2012-12-12 22:59:04.086817
12	16	12	2012-12-12 22:59:04.087368	2012-12-12 22:59:04.08737
13	4	13	2012-12-12 22:59:04.087807	2012-12-12 22:59:04.087809
14	7	14	2012-12-12 22:59:04.088133	2012-12-12 22:59:04.088135
15	11	15	2012-12-12 22:59:04.08847	2012-12-12 22:59:04.088472
16	21	16	2012-12-12 22:59:04.088971	2012-12-12 22:59:04.088973
17	22	17	2012-12-12 22:59:04.089397	2012-12-12 22:59:04.089398
18	5	18	2012-12-12 22:59:04.089724	2012-12-12 22:59:04.089726
19	14	19	2012-12-12 22:59:04.090142	2012-12-12 22:59:04.090144
20	19	20	2012-12-12 22:59:04.090705	2012-12-12 22:59:04.090708
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY sections (id, name, max_capacity, active, created_at, updated_at, program_id) FROM stdin;
1	Basic	25	t	2012-12-12 22:59:03.988205	2012-12-12 22:59:03.988205	1
2	Basic	35	t	2012-12-12 22:59:03.993	2012-12-12 22:59:03.993	2
3	Intermediate	60	t	2012-12-12 22:59:03.99614	2012-12-12 22:59:03.99614	2
4	Basic	40	t	2012-12-12 22:59:03.998846	2012-12-12 22:59:03.998846	3
5	Basic	60	t	2012-12-12 22:59:04.001963	2012-12-12 22:59:04.001963	4
6	Intermediate	60	t	2012-12-12 22:59:04.004781	2012-12-12 22:59:04.004781	4
7	Advanced	40	t	2012-12-12 22:59:04.010165	2012-12-12 22:59:04.010165	4
8	Basic	60	t	2012-12-12 22:59:04.013239	2012-12-12 22:59:04.013239	5
9	Basic	30	t	2012-12-12 22:59:04.01597	2012-12-12 22:59:04.01597	6
10	Intermediate	20	t	2012-12-12 22:59:04.018806	2012-12-12 22:59:04.018806	6
11	Basic	25	t	2012-12-12 22:59:04.021841	2012-12-12 22:59:04.021841	7
12	Basic	40	t	2012-12-12 22:59:04.026	2012-12-12 22:59:04.026	8
13	Intermediate	50	t	2012-12-12 22:59:04.028974	2012-12-12 22:59:04.028974	8
14	Advanced	20	t	2012-12-12 22:59:04.032035	2012-12-12 22:59:04.032035	8
15	Basic	50	t	2012-12-12 22:59:04.034942	2012-12-12 22:59:04.034942	9
16	Basic	40	t	2012-12-12 22:59:04.038956	2012-12-12 22:59:04.038956	10
17	Intermediate	55	t	2012-12-12 22:59:04.041754	2012-12-12 22:59:04.041754	10
18	Basic	30	t	2012-12-12 22:59:04.044473	2012-12-12 22:59:04.044473	11
19	Basic	25	t	2012-12-12 22:59:04.047382	2012-12-12 22:59:04.047382	12
20	Intermediate	35	t	2012-12-12 22:59:04.05044	2012-12-12 22:59:04.05044	12
21	Advanced	45	t	2012-12-12 22:59:04.053301	2012-12-12 22:59:04.053301	12
22	Basic	45	t	2012-12-12 22:59:04.056058	2012-12-12 22:59:04.056058	13
\.


--
-- Data for Name: student_allergies; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY student_allergies (id, student_id, allergy_id, created_at, updated_at) FROM stdin;
1	39	13	2012-12-12 22:59:05.842673	2012-12-12 22:59:05.842676
2	127	1	2012-12-12 22:59:05.842736	2012-12-12 22:59:05.842738
3	112	8	2012-12-12 22:59:05.842768	2012-12-12 22:59:05.84277
4	2	6	2012-12-12 22:59:05.842799	2012-12-12 22:59:05.842801
5	23	7	2012-12-12 22:59:05.842832	2012-12-12 22:59:05.842834
6	142	13	2012-12-12 22:59:05.842864	2012-12-12 22:59:05.842866
7	83	14	2012-12-12 22:59:05.842896	2012-12-12 22:59:05.842898
8	147	5	2012-12-12 22:59:05.842927	2012-12-12 22:59:05.842929
9	18	11	2012-12-12 22:59:05.842958	2012-12-12 22:59:05.84296
10	13	1	2012-12-12 22:59:05.84299	2012-12-12 22:59:05.842992
11	118	6	2012-12-12 22:59:05.84302	2012-12-12 22:59:05.843022
12	78	4	2012-12-12 22:59:05.843051	2012-12-12 22:59:05.843053
13	84	15	2012-12-12 22:59:05.843083	2012-12-12 22:59:05.843085
14	62	5	2012-12-12 22:59:05.843115	2012-12-12 22:59:05.843116
15	129	6	2012-12-12 22:59:05.843146	2012-12-12 22:59:05.843148
16	71	16	2012-12-12 22:59:05.843178	2012-12-12 22:59:05.84318
17	39	2	2012-12-12 22:59:05.843209	2012-12-12 22:59:05.843211
18	138	10	2012-12-12 22:59:05.84324	2012-12-12 22:59:05.843242
19	134	6	2012-12-12 22:59:05.843272	2012-12-12 22:59:05.843274
20	112	7	2012-12-12 22:59:05.843303	2012-12-12 22:59:05.843305
21	52	10	2012-12-12 22:59:05.843336	2012-12-12 22:59:05.843338
22	131	6	2012-12-12 22:59:05.843368	2012-12-12 22:59:05.843369
23	74	5	2012-12-12 22:59:05.8434	2012-12-12 22:59:05.843402
24	22	3	2012-12-12 22:59:05.843433	2012-12-12 22:59:05.843435
25	36	8	2012-12-12 22:59:05.843502	2012-12-12 22:59:05.843504
26	7	17	2012-12-12 22:59:05.843538	2012-12-12 22:59:05.84354
27	16	19	2012-12-12 22:59:05.84357	2012-12-12 22:59:05.843572
28	68	1	2012-12-12 22:59:05.843602	2012-12-12 22:59:05.843603
29	134	20	2012-12-12 22:59:05.843652	2012-12-12 22:59:05.843654
30	142	7	2012-12-12 22:59:05.843686	2012-12-12 22:59:05.843688
31	71	16	2012-12-12 22:59:05.843717	2012-12-12 22:59:05.843719
32	134	12	2012-12-12 22:59:05.843748	2012-12-12 22:59:05.84375
33	44	13	2012-12-12 22:59:05.843779	2012-12-12 22:59:05.843781
34	19	12	2012-12-12 22:59:05.84381	2012-12-12 22:59:05.843812
35	31	15	2012-12-12 22:59:05.843846	2012-12-12 22:59:05.843848
36	5	16	2012-12-12 22:59:05.8439	2012-12-12 22:59:05.843902
37	50	1	2012-12-12 22:59:05.843936	2012-12-12 22:59:05.843937
38	60	10	2012-12-12 22:59:05.843968	2012-12-12 22:59:05.84397
39	32	6	2012-12-12 22:59:05.844	2012-12-12 22:59:05.844001
40	41	6	2012-12-12 22:59:05.844031	2012-12-12 22:59:05.844033
41	106	6	2012-12-12 22:59:05.844062	2012-12-12 22:59:05.844064
42	66	11	2012-12-12 22:59:05.844095	2012-12-12 22:59:05.844097
43	88	9	2012-12-12 22:59:05.844128	2012-12-12 22:59:05.84413
44	106	5	2012-12-12 22:59:05.84416	2012-12-12 22:59:05.844162
45	61	16	2012-12-12 22:59:05.844192	2012-12-12 22:59:05.844194
46	55	12	2012-12-12 22:59:05.844223	2012-12-12 22:59:05.844226
47	56	15	2012-12-12 22:59:05.844254	2012-12-12 22:59:05.844256
48	140	18	2012-12-12 22:59:05.844286	2012-12-12 22:59:05.844288
49	59	2	2012-12-12 22:59:05.844319	2012-12-12 22:59:05.844321
50	15	2	2012-12-12 22:59:05.844351	2012-12-12 22:59:05.844353
51	16	3	2012-12-12 22:59:05.844383	2012-12-12 22:59:05.844385
52	82	15	2012-12-12 22:59:05.844415	2012-12-12 22:59:05.844417
53	126	14	2012-12-12 22:59:05.844447	2012-12-12 22:59:05.844449
54	2	10	2012-12-12 22:59:05.844481	2012-12-12 22:59:05.844483
55	127	10	2012-12-12 22:59:05.844512	2012-12-12 22:59:05.844514
56	113	3	2012-12-12 22:59:05.844543	2012-12-12 22:59:05.844545
57	92	4	2012-12-12 22:59:05.844574	2012-12-12 22:59:05.844576
58	105	8	2012-12-12 22:59:05.844605	2012-12-12 22:59:05.844607
59	136	3	2012-12-12 22:59:05.844639	2012-12-12 22:59:05.844641
60	40	10	2012-12-12 22:59:05.84467	2012-12-12 22:59:05.844672
61	117	20	2012-12-12 22:59:05.844701	2012-12-12 22:59:05.844703
62	144	6	2012-12-12 22:59:05.844732	2012-12-12 22:59:05.844734
63	13	15	2012-12-12 22:59:05.844763	2012-12-12 22:59:05.844765
64	72	3	2012-12-12 22:59:05.844794	2012-12-12 22:59:05.844796
65	27	8	2012-12-12 22:59:05.844825	2012-12-12 22:59:05.844827
66	145	2	2012-12-12 22:59:05.844857	2012-12-12 22:59:05.844859
67	83	18	2012-12-12 22:59:05.844888	2012-12-12 22:59:05.84489
68	34	2	2012-12-12 22:59:05.84492	2012-12-12 22:59:05.844922
69	28	13	2012-12-12 22:59:05.844952	2012-12-12 22:59:05.844954
70	63	1	2012-12-12 22:59:05.844985	2012-12-12 22:59:05.844987
71	135	11	2012-12-12 22:59:05.845017	2012-12-12 22:59:05.845018
72	61	20	2012-12-12 22:59:05.845049	2012-12-12 22:59:05.845051
73	77	1	2012-12-12 22:59:05.845081	2012-12-12 22:59:05.845083
74	115	5	2012-12-12 22:59:05.845113	2012-12-12 22:59:05.845115
75	119	14	2012-12-12 22:59:05.845145	2012-12-12 22:59:05.845147
76	101	3	2012-12-12 22:59:05.845177	2012-12-12 22:59:05.845179
77	38	12	2012-12-12 22:59:05.845209	2012-12-12 22:59:05.845211
78	69	18	2012-12-12 22:59:05.845241	2012-12-12 22:59:05.845243
79	41	16	2012-12-12 22:59:05.845274	2012-12-12 22:59:05.845276
80	51	10	2012-12-12 22:59:05.845307	2012-12-12 22:59:05.845308
81	92	7	2012-12-12 22:59:05.845339	2012-12-12 22:59:05.845341
82	114	9	2012-12-12 22:59:05.845371	2012-12-12 22:59:05.845372
83	116	10	2012-12-12 22:59:05.845403	2012-12-12 22:59:05.845404
84	73	6	2012-12-12 22:59:05.845435	2012-12-12 22:59:05.845437
85	138	12	2012-12-12 22:59:05.845467	2012-12-12 22:59:05.845469
86	144	7	2012-12-12 22:59:05.845499	2012-12-12 22:59:05.845501
87	65	10	2012-12-12 22:59:05.845531	2012-12-12 22:59:05.845533
88	56	4	2012-12-12 22:59:05.845563	2012-12-12 22:59:05.845565
89	58	18	2012-12-12 22:59:05.845595	2012-12-12 22:59:05.845597
90	119	8	2012-12-12 22:59:05.845626	2012-12-12 22:59:05.845628
91	71	3	2012-12-12 22:59:05.845658	2012-12-12 22:59:05.84566
92	120	18	2012-12-12 22:59:05.84569	2012-12-12 22:59:05.845691
93	89	8	2012-12-12 22:59:05.845721	2012-12-12 22:59:05.845723
94	39	10	2012-12-12 22:59:05.845753	2012-12-12 22:59:05.845755
95	83	20	2012-12-12 22:59:05.845784	2012-12-12 22:59:05.845786
96	61	2	2012-12-12 22:59:05.845816	2012-12-12 22:59:05.845818
97	138	4	2012-12-12 22:59:05.845848	2012-12-12 22:59:05.84585
98	69	19	2012-12-12 22:59:05.845879	2012-12-12 22:59:05.845881
99	68	16	2012-12-12 22:59:05.845911	2012-12-12 22:59:05.845913
100	39	15	2012-12-12 22:59:05.845943	2012-12-12 22:59:05.845945
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY students (id, first_name, last_name, barcode_number, household_id, is_male, grade, date_of_birth, cell_phone, can_text, email, status, created_at, updated_at, is_visitor, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
1	Bert	Rempel	176118728425	1	t	1	1994-11-27	\N	t	bert.rempel@example.com	Graduated	2012-12-12 22:59:04.590176	2012-12-12 22:59:04.590179	f	\N	\N	\N	\N
2	Austyn	Rempel	550028087498	1	t	3	1994-12-12	4123336162	t	austyn.rempel@example.com	College	2012-12-12 22:59:04.592323	2012-12-12 22:59:04.592325	f	\N	\N	\N	\N
3	Cecil	Wisozk	696287432304	2	t	9	1991-03-14	\N	t	cecil.wisozk@example.com	Unactive	2012-12-12 22:59:04.594681	2012-12-12 22:59:04.594683	f	\N	\N	\N	\N
4	Deven	Wisozk	393334127116	2	f	5	1992-10-31	4128581121	t	deven.wisozk@example.com	Graduated	2012-12-12 22:59:04.596439	2012-12-12 22:59:04.596447	f	\N	\N	\N	\N
5	Tommie	Rohan	127947684946	3	t	6	1995-05-06	4121013800	t	tommie.rohan@example.com	Missing	2012-12-12 22:59:04.598606	2012-12-12 22:59:04.598608	f	\N	\N	\N	\N
6	Keyon	Grant	852265473635	4	t	6	1991-08-02	4127821275	t	keyon.grant@example.com	Unactive	2012-12-12 22:59:04.600767	2012-12-12 22:59:04.600769	f	\N	\N	\N	\N
7	Cassie	Ziemann	041766008296	5	t	8	1994-05-21	\N	f	cassie.ziemann@example.com	Graduated	2012-12-12 22:59:04.68358	2012-12-12 22:59:04.683582	f	\N	\N	\N	\N
8	Roger	Hayes	666837099045	6	t	12	1992-07-22	4121508613	t	roger.hayes@example.com	Active	2012-12-12 22:59:04.686069	2012-12-12 22:59:04.686071	f	\N	\N	\N	\N
9	Kian	Collins	632239873591	7	f	8	1996-06-12	4127571386	t	kian.collins@example.com	Active	2012-12-12 22:59:04.68841	2012-12-12 22:59:04.688412	f	\N	\N	\N	\N
10	Manuela	Bosco	408421937799	8	t	11	1996-01-23	4121414573	f	manuela.bosco@example.com	College	2012-12-12 22:59:04.6907	2012-12-12 22:59:04.690702	f	\N	\N	\N	\N
11	Hulda	Trantow	803382233361	9	f	7	1992-05-09	4124823332	f	hulda.trantow@example.com	College	2012-12-12 22:59:04.692925	2012-12-12 22:59:04.692927	f	\N	\N	\N	\N
12	Jayda	Trantow	108634307271	9	t	8	1991-10-12	4123816656	t	jayda.trantow@example.com	Unactive	2012-12-12 22:59:04.694843	2012-12-12 22:59:04.694846	f	\N	\N	\N	\N
13	Lauriane	Padberg	708377595390	10	t	9	1994-03-04	4124427076	t	lauriane.padberg@example.com	Missing	2012-12-12 22:59:04.69712	2012-12-12 22:59:04.697122	f	\N	\N	\N	\N
14	Magali	Dietrich	786565144328	11	t	4	1995-02-03	4128759341	t	magali.dietrich@example.com	Graduated	2012-12-12 22:59:04.699299	2012-12-12 22:59:04.699301	f	\N	\N	\N	\N
15	Armani	Howe	474052222365	12	t	11	1992-12-06	4126359678	t	armani.howe@example.com	Active	2012-12-12 22:59:04.701636	2012-12-12 22:59:04.701638	f	\N	\N	\N	\N
16	Kirsten	Smith	595912825874	13	t	9	1994-05-12	4124725407	t	kirsten.smith@example.com	Active	2012-12-12 22:59:04.703796	2012-12-12 22:59:04.703798	f	\N	\N	\N	\N
17	Antonia	Streich	871392240495	14	f	10	1994-02-09	\N	t	antonia.streich@example.com	Unactive	2012-12-12 22:59:04.706086	2012-12-12 22:59:04.706088	f	\N	\N	\N	\N
18	Betsy	Streich	801364111110	14	t	12	1992-10-11	4121966641	f	betsy.streich@example.com	Active	2012-12-12 22:59:04.707744	2012-12-12 22:59:04.707746	f	\N	\N	\N	\N
19	Laurine	Effertz	045311315569	15	f	8	1997-02-24	4127177682	f	laurine.effertz@example.com	Missing	2012-12-12 22:59:04.709882	2012-12-12 22:59:04.709884	f	\N	\N	\N	\N
20	Marty	Effertz	043536902885	15	f	4	1997-04-19	4124581001	t	marty.effertz@example.com	Graduated	2012-12-12 22:59:04.711575	2012-12-12 22:59:04.711578	f	\N	\N	\N	\N
21	Fabiola	Lang	677981835433	16	f	1	1994-08-28	\N	t	fabiola.lang@example.com	Active	2012-12-12 22:59:04.713794	2012-12-12 22:59:04.713796	f	\N	\N	\N	\N
22	Mikayla	Lang	003376889566	16	f	5	1993-11-09	4120417625	t	mikayla.lang@example.com	Missing	2012-12-12 22:59:04.715582	2012-12-12 22:59:04.715585	f	\N	\N	\N	\N
23	Ramona	Blanda	375249407539	17	f	9	1996-08-13	4123662115	t	ramona.blanda@example.com	College	2012-12-12 22:59:04.717852	2012-12-12 22:59:04.717854	f	\N	\N	\N	\N
24	Guadalupe	Heathcote	018208790627	18	f	11	1992-07-28	4122742561	t	guadalupe.heathcote@example.com	Missing	2012-12-12 22:59:04.720129	2012-12-12 22:59:04.720131	f	\N	\N	\N	\N
25	Faustino	Carter	792440906948	19	t	10	1995-10-29	4123103978	t	faustino.carter@example.com	Active	2012-12-12 22:59:04.722279	2012-12-12 22:59:04.722281	f	\N	\N	\N	\N
26	Vada	Lehner	768720509642	20	t	4	1997-06-13	4122127598	t	vada.lehner@example.com	Unactive	2012-12-12 22:59:04.72459	2012-12-12 22:59:04.724592	f	\N	\N	\N	\N
27	Moses	Lehner	689586523821	20	f	10	1991-12-29	4124631130	t	moses.lehner@example.com	Active	2012-12-12 22:59:04.726279	2012-12-12 22:59:04.726281	f	\N	\N	\N	\N
28	Brooklyn	Terry	725407224890	21	t	2	1997-11-09	4121998815	t	brooklyn.terry@example.com	Graduated	2012-12-12 22:59:04.728504	2012-12-12 22:59:04.728507	f	\N	\N	\N	\N
29	Miracle	Crooks	867539958628	22	t	4	1997-03-14	4123019249	t	miracle.crooks@example.com	Graduated	2012-12-12 22:59:04.730689	2012-12-12 22:59:04.730691	f	\N	\N	\N	\N
30	D'angelo	Crooks	292652872517	22	t	2	1995-05-09	4122344326	t	d'angelo.crooks@example.com	Unactive	2012-12-12 22:59:04.732398	2012-12-12 22:59:04.7324	f	\N	\N	\N	\N
31	Theresa	Hermann	088482621679	23	t	5	1992-10-13	\N	t	theresa.hermann@example.com	Graduated	2012-12-12 22:59:04.734548	2012-12-12 22:59:04.73455	f	\N	\N	\N	\N
32	Lyla	Hermann	487831229919	23	t	4	1991-08-15	\N	t	lyla.hermann@example.com	College	2012-12-12 22:59:04.73622	2012-12-12 22:59:04.736223	f	\N	\N	\N	\N
33	Rylee	Hauck	766393584222	24	t	9	1996-06-11	\N	t	rylee.hauck@example.com	Missing	2012-12-12 22:59:04.7384	2012-12-12 22:59:04.738402	f	\N	\N	\N	\N
34	Brando	Ritchie	230610404157	25	f	5	1997-05-24	4120601685	t	brando.ritchie@example.com	Graduated	2012-12-12 22:59:04.740518	2012-12-12 22:59:04.74052	f	\N	\N	\N	\N
35	Dennis	Simonis	698754557192	26	f	5	1991-11-07	\N	t	dennis.simonis@example.com	College	2012-12-12 22:59:04.742622	2012-12-12 22:59:04.742624	f	\N	\N	\N	\N
36	Lilliana	Simonis	807365160062	26	t	4	1997-05-22	4127739059	f	lilliana.simonis@example.com	Active	2012-12-12 22:59:04.744285	2012-12-12 22:59:04.744287	f	\N	\N	\N	\N
37	Telly	Dicki	821704717945	27	t	5	1991-12-01	\N	t	telly.dicki@example.com	Unactive	2012-12-12 22:59:04.746457	2012-12-12 22:59:04.746459	f	\N	\N	\N	\N
38	Caesar	Dicki	732074499742	27	t	4	1997-01-31	4123702087	t	caesar.dicki@example.com	Active	2012-12-12 22:59:04.748178	2012-12-12 22:59:04.74818	f	\N	\N	\N	\N
39	Elnora	Rogahn	808454644172	28	t	7	1992-06-25	\N	t	elnora.rogahn@example.com	Unactive	2012-12-12 22:59:04.750526	2012-12-12 22:59:04.750528	f	\N	\N	\N	\N
40	Gregory	Rogahn	072895292461	28	t	3	1993-07-10	4122541070	f	gregory.rogahn@example.com	Unactive	2012-12-12 22:59:04.752222	2012-12-12 22:59:04.752224	f	\N	\N	\N	\N
41	Rae	Mitchell	503109752419	29	t	7	1996-06-21	4120779081	t	rae.mitchell@example.com	Missing	2012-12-12 22:59:04.754584	2012-12-12 22:59:04.754586	f	\N	\N	\N	\N
42	Edwina	Volkman	016404249237	30	t	7	1993-05-18	4122141855	t	edwina.volkman@example.com	Graduated	2012-12-12 22:59:04.756729	2012-12-12 22:59:04.756731	f	\N	\N	\N	\N
43	Amie	Volkman	336539736140	30	f	7	1995-07-30	4125564599	t	amie.volkman@example.com	Missing	2012-12-12 22:59:04.758419	2012-12-12 22:59:04.758421	f	\N	\N	\N	\N
44	Genoveva	Adams	604264782364	31	t	11	1994-01-22	\N	t	genoveva.adams@example.com	Graduated	2012-12-12 22:59:04.760588	2012-12-12 22:59:04.76059	f	\N	\N	\N	\N
45	Angelita	Adams	053469102535	31	t	2	1992-08-20	4125321694	t	angelita.adams@example.com	Active	2012-12-12 22:59:04.762287	2012-12-12 22:59:04.762289	f	\N	\N	\N	\N
46	Esther	Heathcote	661763241083	32	t	1	1996-12-02	4128457396	t	esther.heathcote@example.com	College	2012-12-12 22:59:04.764736	2012-12-12 22:59:04.764738	f	\N	\N	\N	\N
47	Keven	Heathcote	113161589596	32	t	9	1993-02-05	4122451226	t	keven.heathcote@example.com	Unactive	2012-12-12 22:59:04.766471	2012-12-12 22:59:04.766473	f	\N	\N	\N	\N
48	Birdie	Purdy	147276458095	33	t	3	1991-09-27	\N	t	birdie.purdy@example.com	Graduated	2012-12-12 22:59:04.768712	2012-12-12 22:59:04.768714	f	\N	\N	\N	\N
49	Helga	Blanda	150330111163	34	t	8	1994-12-17	\N	t	helga.blanda@example.com	Missing	2012-12-12 22:59:04.770907	2012-12-12 22:59:04.770909	f	\N	\N	\N	\N
50	Meda	Blanda	031104378605	34	t	7	1997-05-10	\N	t	meda.blanda@example.com	Active	2012-12-12 22:59:04.772605	2012-12-12 22:59:04.772608	f	\N	\N	\N	\N
51	Rhoda	Ritchie	527476227800	35	f	2	1991-11-29	4123916277	f	rhoda.ritchie@example.com	Active	2012-12-12 22:59:04.77476	2012-12-12 22:59:04.774762	f	\N	\N	\N	\N
52	Evert	Bergstrom	453743960294	36	t	3	1997-09-24	4129112058	t	evert.bergstrom@example.com	Graduated	2012-12-12 22:59:04.777169	2012-12-12 22:59:04.77717	f	\N	\N	\N	\N
53	Anissa	Kovacek	029006234736	37	t	1	1992-12-23	4123227419	f	anissa.kovacek@example.com	College	2012-12-12 22:59:04.77952	2012-12-12 22:59:04.779522	f	\N	\N	\N	\N
54	Nathanial	Goodwin	873051082866	38	t	9	1995-01-19	\N	f	nathanial.goodwin@example.com	Unactive	2012-12-12 22:59:04.781936	2012-12-12 22:59:04.781938	f	\N	\N	\N	\N
55	Sherwood	Goodwin	762864944770	38	f	2	1994-05-01	4126257906	t	sherwood.goodwin@example.com	Graduated	2012-12-12 22:59:04.865601	2012-12-12 22:59:04.865605	f	\N	\N	\N	\N
56	Emilio	Bruen	647907114901	39	t	8	1992-01-04	4126861200	t	emilio.bruen@example.com	Active	2012-12-12 22:59:04.86858	2012-12-12 22:59:04.868583	f	\N	\N	\N	\N
57	Misael	Bruen	311614406141	39	t	8	1992-01-19	\N	t	misael.bruen@example.com	Graduated	2012-12-12 22:59:04.870519	2012-12-12 22:59:04.870521	f	\N	\N	\N	\N
58	Kavon	Trantow	851003533697	40	t	5	1996-04-17	4121270165	t	kavon.trantow@example.com	Missing	2012-12-12 22:59:04.872938	2012-12-12 22:59:04.87294	f	\N	\N	\N	\N
59	Kaleigh	Trantow	654014119589	40	t	8	1995-09-28	4123922276	f	kaleigh.trantow@example.com	College	2012-12-12 22:59:04.87476	2012-12-12 22:59:04.874762	f	\N	\N	\N	\N
60	Dasia	Christiansen	529502586710	41	t	6	1996-03-18	4123708796	f	dasia.christiansen@example.com	Missing	2012-12-12 22:59:04.877113	2012-12-12 22:59:04.877115	f	\N	\N	\N	\N
61	Idell	Hauck	873709609756	42	t	1	1992-02-25	4126808662	f	idell.hauck@example.com	Unactive	2012-12-12 22:59:04.879492	2012-12-12 22:59:04.879494	f	\N	\N	\N	\N
62	Bria	Hauck	391151290431	42	t	6	1996-10-07	\N	t	bria.hauck@example.com	Missing	2012-12-12 22:59:04.881328	2012-12-12 22:59:04.88133	f	\N	\N	\N	\N
63	Houston	Cruickshank	291962487625	43	t	11	1994-06-06	\N	t	houston.cruickshank@example.com	Graduated	2012-12-12 22:59:04.883616	2012-12-12 22:59:04.883619	f	\N	\N	\N	\N
64	Kimberly	Cruickshank	591172760120	43	t	10	1995-04-15	4125270514	t	kimberly.cruickshank@example.com	Graduated	2012-12-12 22:59:04.88536	2012-12-12 22:59:04.885363	f	\N	\N	\N	\N
65	Clotilde	Brekke	146496320718	44	t	9	1994-08-30	\N	t	clotilde.brekke@example.com	Unactive	2012-12-12 22:59:04.888351	2012-12-12 22:59:04.888353	f	\N	\N	\N	\N
66	Nellie	Tillman	689641048089	45	t	8	1995-12-13	4125111382	t	nellie.tillman@example.com	Unactive	2012-12-12 22:59:04.890606	2012-12-12 22:59:04.890608	f	\N	\N	\N	\N
67	Reuben	Tillman	357099196371	45	t	6	1994-04-23	\N	t	reuben.tillman@example.com	Graduated	2012-12-12 22:59:04.892512	2012-12-12 22:59:04.892514	f	\N	\N	\N	\N
68	Erwin	Abshire	332598727071	46	t	5	1997-07-14	4123656352	t	erwin.abshire@example.com	College	2012-12-12 22:59:04.894713	2012-12-12 22:59:04.894715	f	\N	\N	\N	\N
69	Carolyn	Powlowski	860723149367	47	t	4	1993-06-20	4122684773	f	carolyn.powlowski@example.com	College	2012-12-12 22:59:04.896846	2012-12-12 22:59:04.896848	f	\N	\N	\N	\N
70	Zack	Hayes	839378868109	48	t	11	1997-05-23	4122909693	t	zack.hayes@example.com	Graduated	2012-12-12 22:59:04.899158	2012-12-12 22:59:04.89916	f	\N	\N	\N	\N
71	Cleve	Hayes	189144367668	48	t	1	1992-04-09	4123939575	t	cleve.hayes@example.com	Unactive	2012-12-12 22:59:04.900861	2012-12-12 22:59:04.900863	f	\N	\N	\N	\N
72	Napoleon	Fahey	306883448874	49	f	12	1991-01-18	4123518015	t	napoleon.fahey@example.com	Unactive	2012-12-12 22:59:04.902977	2012-12-12 22:59:04.902979	f	\N	\N	\N	\N
73	Ezequiel	Schultz	857810207431	50	t	9	1994-07-20	\N	t	ezequiel.schultz@example.com	Missing	2012-12-12 22:59:04.905218	2012-12-12 22:59:04.90522	f	\N	\N	\N	\N
74	Russ	Christiansen	191250005569	51	t	9	1997-10-10	\N	t	russ.christiansen@example.com	Graduated	2012-12-12 22:59:04.907353	2012-12-12 22:59:04.907355	f	\N	\N	\N	\N
75	Rebekah	O'Keefe	145037606324	52	t	1	1995-12-22	4128044531	f	rebekah.o'keefe@example.com	Active	2012-12-12 22:59:04.909429	2012-12-12 22:59:04.90943	f	\N	\N	\N	\N
76	Efrain	O'Keefe	342621579489	52	t	9	1995-07-23	\N	t	efrain.o'keefe@example.com	Active	2012-12-12 22:59:04.911093	2012-12-12 22:59:04.911095	f	\N	\N	\N	\N
77	Conrad	Gleason	855754283192	53	t	3	1991-08-16	4123182713	f	conrad.gleason@example.com	College	2012-12-12 22:59:04.913201	2012-12-12 22:59:04.913203	f	\N	\N	\N	\N
78	Frederic	Ruecker	130754689921	54	t	2	1994-05-15	4128892991	f	frederic.ruecker@example.com	Graduated	2012-12-12 22:59:04.915319	2012-12-12 22:59:04.915321	f	\N	\N	\N	\N
79	Katelin	Connelly	870380489177	55	t	6	1991-12-18	4123507829	t	katelin.connelly@example.com	Unactive	2012-12-12 22:59:04.917456	2012-12-12 22:59:04.917458	f	\N	\N	\N	\N
80	Petra	Connelly	464867953797	55	t	5	1996-09-07	\N	t	petra.connelly@example.com	Active	2012-12-12 22:59:04.919128	2012-12-12 22:59:04.91913	f	\N	\N	\N	\N
81	Mitchel	Jones	476623587650	56	t	2	1996-04-15	4128345328	t	mitchel.jones@example.com	Active	2012-12-12 22:59:04.921207	2012-12-12 22:59:04.921209	f	\N	\N	\N	\N
82	Vallie	Jones	237106145851	56	t	9	1994-07-17	4125539044	t	vallie.jones@example.com	Active	2012-12-12 22:59:04.92296	2012-12-12 22:59:04.922963	f	\N	\N	\N	\N
83	Otilia	Jerde	377276864371	57	f	9	1992-05-14	\N	t	otilia.jerde@example.com	College	2012-12-12 22:59:04.925176	2012-12-12 22:59:04.925178	f	\N	\N	\N	\N
84	Frank	Jerde	227751628517	57	t	5	1997-07-11	4121095843	t	frank.jerde@example.com	Unactive	2012-12-12 22:59:04.926834	2012-12-12 22:59:04.926836	f	\N	\N	\N	\N
85	Glennie	Ritchie	736589668931	58	t	10	1993-09-08	4127192655	t	glennie.ritchie@example.com	Active	2012-12-12 22:59:04.92913	2012-12-12 22:59:04.929132	f	\N	\N	\N	\N
86	Ezra	Kuhic	513468242306	59	t	8	1992-04-21	4122434141	t	ezra.kuhic@example.com	Graduated	2012-12-12 22:59:04.931225	2012-12-12 22:59:04.931227	f	\N	\N	\N	\N
87	Leora	Kuhic	512799535704	59	t	5	1997-06-21	4122699987	t	leora.kuhic@example.com	Missing	2012-12-12 22:59:04.932904	2012-12-12 22:59:04.932906	f	\N	\N	\N	\N
88	Adriel	Macejkovic	807889486804	60	t	1	1994-04-02	\N	t	adriel.macejkovic@example.com	Missing	2012-12-12 22:59:04.935071	2012-12-12 22:59:04.935073	f	\N	\N	\N	\N
89	Asia	Collier	717377845870	61	t	11	1993-09-27	4129691314	t	asia.collier@example.com	Graduated	2012-12-12 22:59:04.937215	2012-12-12 22:59:04.937217	f	\N	\N	\N	\N
90	Sophie	Collier	802434639555	61	f	8	1993-11-14	4126377376	t	sophie.collier@example.com	Active	2012-12-12 22:59:04.938964	2012-12-12 22:59:04.938967	f	\N	\N	\N	\N
91	Demarcus	Dicki	115607274121	62	f	9	1995-11-17	4122327315	t	demarcus.dicki@example.com	Unactive	2012-12-12 22:59:04.941289	2012-12-12 22:59:04.941291	f	\N	\N	\N	\N
92	Araceli	Dicki	298964109688	62	f	7	1996-01-13	4125296192	t	araceli.dicki@example.com	Unactive	2012-12-12 22:59:04.943026	2012-12-12 22:59:04.943029	f	\N	\N	\N	\N
93	Lorna	Yost	453599752303	63	t	8	1993-05-17	4121613201	t	lorna.yost@example.com	Missing	2012-12-12 22:59:04.945234	2012-12-12 22:59:04.945236	f	\N	\N	\N	\N
94	Mikel	Cummerata	418430208726	64	t	5	1992-12-11	4120064677	f	mikel.cummerata@example.com	Missing	2012-12-12 22:59:04.947482	2012-12-12 22:59:04.947485	f	\N	\N	\N	\N
95	Bartholome	Cummerata	401113886307	64	f	12	1995-12-23	\N	f	bartholome.cummerata@example.com	Unactive	2012-12-12 22:59:04.949225	2012-12-12 22:59:04.949227	f	\N	\N	\N	\N
96	Elliott	Halvorson	008490320109	65	t	6	1994-01-31	4123290957	t	elliott.halvorson@example.com	College	2012-12-12 22:59:04.951483	2012-12-12 22:59:04.951485	f	\N	\N	\N	\N
97	Elissa	Green	165588931574	66	t	9	1997-07-19	4120939475	t	elissa.green@example.com	Missing	2012-12-12 22:59:04.953692	2012-12-12 22:59:04.953694	f	\N	\N	\N	\N
98	Jerrell	Green	474973328103	66	t	7	1995-11-13	4127357346	t	jerrell.green@example.com	College	2012-12-12 22:59:04.955387	2012-12-12 22:59:04.955389	f	\N	\N	\N	\N
99	Bertram	Orn	043338195631	67	t	12	1994-10-04	\N	t	bertram.orn@example.com	Active	2012-12-12 22:59:04.958285	2012-12-12 22:59:04.958287	f	\N	\N	\N	\N
100	Abraham	Leannon	185310160925	68	t	6	1993-11-19	4128469160	t	abraham.leannon@example.com	College	2012-12-12 22:59:04.960809	2012-12-12 22:59:04.960812	f	\N	\N	\N	\N
101	Candice	Stark	783644216384	69	t	8	1994-11-08	4129119762	t	candice.stark@example.com	Graduated	2012-12-12 22:59:04.963168	2012-12-12 22:59:04.96317	f	\N	\N	\N	\N
102	Karley	Ebert	525215072923	70	t	3	1993-05-17	4124946457	t	karley.ebert@example.com	Unactive	2012-12-12 22:59:04.96529	2012-12-12 22:59:04.965292	f	\N	\N	\N	\N
103	Saul	Ebert	382940891106	70	t	9	1992-12-15	4129854545	t	saul.ebert@example.com	Unactive	2012-12-12 22:59:04.966945	2012-12-12 22:59:04.966947	f	\N	\N	\N	\N
104	Donald	Hudson	208700299657	71	f	4	1994-11-24	4126809226	t	donald.hudson@example.com	Missing	2012-12-12 22:59:05.053391	2012-12-12 22:59:05.053393	f	\N	\N	\N	\N
105	Palma	Hudson	526568529531	71	f	3	1993-04-16	\N	t	palma.hudson@example.com	College	2012-12-12 22:59:05.055444	2012-12-12 22:59:05.055447	f	\N	\N	\N	\N
106	Cayla	Heaney	261866425443	72	t	3	1994-04-20	4122661098	t	cayla.heaney@example.com	Missing	2012-12-12 22:59:05.057876	2012-12-12 22:59:05.057878	f	\N	\N	\N	\N
107	Jannie	Auer	540089027199	73	t	10	1993-09-19	\N	t	jannie.auer@example.com	Missing	2012-12-12 22:59:05.060219	2012-12-12 22:59:05.060222	f	\N	\N	\N	\N
108	Cassandra	Mante	724152696138	74	t	10	1996-08-25	4128285617	t	cassandra.mante@example.com	College	2012-12-12 22:59:05.062722	2012-12-12 22:59:05.062724	f	\N	\N	\N	\N
109	Elaina	Mante	624078151642	74	t	12	1995-01-08	4127846687	t	elaina.mante@example.com	Unactive	2012-12-12 22:59:05.064549	2012-12-12 22:59:05.064551	f	\N	\N	\N	\N
110	Isaias	D'Amore	430019922782	75	t	1	1997-07-16	4126256116	f	isaias.d'amore@example.com	Unactive	2012-12-12 22:59:05.066805	2012-12-12 22:59:05.066807	f	\N	\N	\N	\N
111	Corine	D'Amore	874761940081	75	t	1	1991-02-19	4120738559	t	corine.d'amore@example.com	Missing	2012-12-12 22:59:05.068521	2012-12-12 22:59:05.068523	f	\N	\N	\N	\N
112	Janiya	Fritsch	227720738071	76	t	6	1995-12-06	4125099885	f	janiya.fritsch@example.com	Graduated	2012-12-12 22:59:05.07071	2012-12-12 22:59:05.070712	f	\N	\N	\N	\N
113	Veda	Fritsch	295586803068	76	t	4	1995-09-18	\N	f	veda.fritsch@example.com	Graduated	2012-12-12 22:59:05.072431	2012-12-12 22:59:05.072433	f	\N	\N	\N	\N
114	Wilfrid	Mann	692914840927	77	t	5	1996-09-26	4129800932	t	wilfrid.mann@example.com	Active	2012-12-12 22:59:05.074626	2012-12-12 22:59:05.074628	f	\N	\N	\N	\N
115	Aiyana	Goldner	716705494719	78	t	1	1995-08-29	4124954698	t	aiyana.goldner@example.com	Unactive	2012-12-12 22:59:05.077013	2012-12-12 22:59:05.077015	f	\N	\N	\N	\N
116	Mckenna	Waters	117439375633	79	t	4	1995-11-18	4122821776	t	mckenna.waters@example.com	College	2012-12-12 22:59:05.080084	2012-12-12 22:59:05.080086	f	\N	\N	\N	\N
117	Sierra	Waters	309424585767	79	t	2	1994-05-30	\N	t	sierra.waters@example.com	College	2012-12-12 22:59:05.082056	2012-12-12 22:59:05.082058	f	\N	\N	\N	\N
118	Cornelius	Morissette	214872650216	80	f	8	1994-08-21	4122519499	t	cornelius.morissette@example.com	College	2012-12-12 22:59:05.084457	2012-12-12 22:59:05.084459	f	\N	\N	\N	\N
119	Effie	Homenick	285890433949	81	t	1	1992-04-29	\N	t	effie.homenick@example.com	Graduated	2012-12-12 22:59:05.086684	2012-12-12 22:59:05.086687	f	\N	\N	\N	\N
120	Mohammed	Koepp	126101519355	82	t	11	1994-09-20	4129928325	t	mohammed.koepp@example.com	College	2012-12-12 22:59:05.088886	2012-12-12 22:59:05.088889	f	\N	\N	\N	\N
121	Liliane	Reichert	231728665046	83	f	7	1997-11-13	4128326923	f	liliane.reichert@example.com	Graduated	2012-12-12 22:59:05.091149	2012-12-12 22:59:05.091151	f	\N	\N	\N	\N
122	Ciara	Reichert	103275869664	83	f	6	1997-04-10	\N	f	ciara.reichert@example.com	Graduated	2012-12-12 22:59:05.092859	2012-12-12 22:59:05.092861	f	\N	\N	\N	\N
123	Kenneth	Stamm	674522445797	84	t	1	1996-08-17	4122958401	t	kenneth.stamm@example.com	Graduated	2012-12-12 22:59:05.095047	2012-12-12 22:59:05.095054	f	\N	\N	\N	\N
124	Sydnie	Stamm	470608445615	84	t	12	1994-01-09	4121442854	t	sydnie.stamm@example.com	Active	2012-12-12 22:59:05.096788	2012-12-12 22:59:05.09679	f	\N	\N	\N	\N
125	Everardo	Sauer	110428341423	85	t	9	1995-08-17	4127799384	t	everardo.sauer@example.com	College	2012-12-12 22:59:05.099026	2012-12-12 22:59:05.099028	f	\N	\N	\N	\N
126	Leopold	Sauer	831256183538	85	t	7	1991-12-08	4126983305	f	leopold.sauer@example.com	Graduated	2012-12-12 22:59:05.100747	2012-12-12 22:59:05.100749	f	\N	\N	\N	\N
127	Monica	Towne	777881910223	86	f	4	1992-12-27	\N	f	monica.towne@example.com	Unactive	2012-12-12 22:59:05.103085	2012-12-12 22:59:05.103087	f	\N	\N	\N	\N
128	Clinton	Mitchell	583457927395	87	t	7	1993-01-27	4129394147	f	clinton.mitchell@example.com	Missing	2012-12-12 22:59:05.105236	2012-12-12 22:59:05.105239	f	\N	\N	\N	\N
129	Tevin	Mitchell	229738846212	87	t	8	1992-04-04	4129270326	t	tevin.mitchell@example.com	Unactive	2012-12-12 22:59:05.106981	2012-12-12 22:59:05.106983	f	\N	\N	\N	\N
130	Jerrold	Runte	871469285613	88	f	7	1997-04-15	4125747343	t	jerrold.runte@example.com	Missing	2012-12-12 22:59:05.109103	2012-12-12 22:59:05.109104	f	\N	\N	\N	\N
131	Scottie	Runte	886900884680	88	f	12	1997-09-10	4126600403	t	scottie.runte@example.com	Unactive	2012-12-12 22:59:05.110798	2012-12-12 22:59:05.1108	f	\N	\N	\N	\N
132	Glenna	Klein	439664017980	89	t	10	1992-08-22	\N	t	glenna.klein@example.com	College	2012-12-12 22:59:05.112958	2012-12-12 22:59:05.11296	f	\N	\N	\N	\N
133	Maureen	Klein	432703396581	89	t	5	1994-12-09	\N	f	maureen.klein@example.com	Graduated	2012-12-12 22:59:05.114655	2012-12-12 22:59:05.114657	f	\N	\N	\N	\N
134	Emmet	Frami	688632728048	90	t	11	1992-11-08	\N	t	emmet.frami@example.com	Active	2012-12-12 22:59:05.117308	2012-12-12 22:59:05.11731	f	\N	\N	\N	\N
135	Gaylord	Jones	640606700977	91	t	12	1992-10-07	4123538303	t	gaylord.jones@example.com	Active	2012-12-12 22:59:05.119826	2012-12-12 22:59:05.119828	f	\N	\N	\N	\N
136	Hailie	Durgan	471222790194	92	t	7	1993-01-15	4126905863	t	hailie.durgan@example.com	College	2012-12-12 22:59:05.122043	2012-12-12 22:59:05.122046	f	\N	\N	\N	\N
137	Ruthe	Carroll	632759071284	93	t	8	1993-11-02	4120462275	t	ruthe.carroll@example.com	Active	2012-12-12 22:59:05.124617	2012-12-12 22:59:05.124619	f	\N	\N	\N	\N
138	Kelli	Carroll	402440468841	93	f	12	1992-11-22	\N	t	kelli.carroll@example.com	Missing	2012-12-12 22:59:05.126312	2012-12-12 22:59:05.126314	f	\N	\N	\N	\N
139	Aileen	Corkery	000941003698	94	t	12	1997-12-02	4126692043	f	aileen.corkery@example.com	Graduated	2012-12-12 22:59:05.128605	2012-12-12 22:59:05.128607	f	\N	\N	\N	\N
140	Anjali	Pfeffer	235829982486	95	t	9	1994-09-16	4125948698	t	anjali.pfeffer@example.com	Missing	2012-12-12 22:59:05.130775	2012-12-12 22:59:05.130777	f	\N	\N	\N	\N
141	Margarett	Pfeffer	854040477145	95	t	6	1993-06-19	4129126830	t	margarett.pfeffer@example.com	College	2012-12-12 22:59:05.132467	2012-12-12 22:59:05.132469	f	\N	\N	\N	\N
142	Flossie	Swift	475934240288	96	t	2	1993-05-03	4129500412	t	flossie.swift@example.com	College	2012-12-12 22:59:05.134676	2012-12-12 22:59:05.134679	f	\N	\N	\N	\N
143	Donald	Cormier	025299744220	97	t	4	1997-03-16	4120770769	t	donald.cormier@example.com	College	2012-12-12 22:59:05.137132	2012-12-12 22:59:05.137134	f	\N	\N	\N	\N
144	Trycia	Schinner	015686965021	98	t	10	1997-08-31	4122913496	f	trycia.schinner@example.com	Unactive	2012-12-12 22:59:05.139285	2012-12-12 22:59:05.139287	f	\N	\N	\N	\N
145	Mazie	Schinner	216078982429	98	t	11	1997-03-21	\N	t	mazie.schinner@example.com	Unactive	2012-12-12 22:59:05.140951	2012-12-12 22:59:05.140953	f	\N	\N	\N	\N
146	Ezra	Stokes	882955467490	99	f	5	1993-05-01	4129493156	t	ezra.stokes@example.com	College	2012-12-12 22:59:05.14333	2012-12-12 22:59:05.143332	f	\N	\N	\N	\N
147	Carmela	Williamson	857017482028	100	t	11	1997-06-19	4123957831	t	carmela.williamson@example.com	Unactive	2012-12-12 22:59:05.145666	2012-12-12 22:59:05.145668	f	\N	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY users (id, first_name, last_name, username, role, department_id, active, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, authentication_token) FROM stdin;
2	Ed	Glover	ed.glover	admin	\N	t	2012-12-12 22:59:02.917257	2012-12-12 22:59:02.917257	edglover@uif.com	$2a$10$wk7n42ySqUuu3ys2X4zeK.9batmV.JO1J9.w6ZNkUScCnyDLpJrkq	\N	\N	\N	0	\N	\N	\N	\N	NzqrMaSyLgBFkPq3EeLX
1	Professor	Heimann	profh	admin	\N	t	2012-12-12 22:59:02.780309	2012-12-12 23:00:00.245374	profh@cmu.edu	$2a$10$aGhVHKBvSTycupTvF6JHJOq3YklBC34I2jR438VR2OFReTqFkHx.y	\N	\N	\N	1	2012-12-12 23:00:00.243654	2012-12-12 23:00:00.243654	127.0.0.1	127.0.0.1	DPyPoZUGGpmuLs1BSTJc
\.


--
-- Name: allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY allergies
    ADD CONSTRAINT allergies_pkey PRIMARY KEY (id);


--
-- Name: attendences_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT attendences_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY guardians
    ADD CONSTRAINT guardians_pkey PRIMARY KEY (id);


--
-- Name: households_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY households
    ADD CONSTRAINT households_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: section_events_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY section_events
    ADD CONSTRAINT section_events_pkey PRIMARY KEY (id);


--
-- Name: student_allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY student_allergies
    ADD CONSTRAINT student_allergies_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: profh; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: profh; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: profh; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: profh
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM profh;
GRANT ALL ON SCHEMA public TO profh;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

