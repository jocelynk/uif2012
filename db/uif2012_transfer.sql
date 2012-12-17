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
-- Name: allergies; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE allergies (
    id integer NOT NULL,
    name character varying(255),
    warning_text text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.allergies OWNER TO urban_impact;

--
-- Name: allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allergies_id_seq OWNER TO urban_impact;

--
-- Name: allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE allergies_id_seq OWNED BY allergies.id;


--
-- Name: allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('allergies_id_seq', 20, true);


--
-- Name: attendances; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE attendances (
    id integer NOT NULL,
    student_id integer,
    event_id integer,
    exempt boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attendances OWNER TO urban_impact;

--
-- Name: attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE attendances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendances_id_seq OWNER TO urban_impact;

--
-- Name: attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE attendances_id_seq OWNED BY attendances.id;


--
-- Name: attendances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('attendances_id_seq', 88, true);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO urban_impact;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO urban_impact;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('departments_id_seq', 3, true);


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE enrollments (
    id integer NOT NULL,
    student_id integer,
    section_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.enrollments OWNER TO urban_impact;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO urban_impact;

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE enrollments_id_seq OWNED BY enrollments.id;


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('enrollments_id_seq', 225, true);


--
-- Name: events; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
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


ALTER TABLE public.events OWNER TO urban_impact;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO urban_impact;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('events_id_seq', 25, true);


--
-- Name: guardians; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
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
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.guardians OWNER TO urban_impact;

--
-- Name: guardians_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE guardians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardians_id_seq OWNER TO urban_impact;

--
-- Name: guardians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE guardians_id_seq OWNED BY guardians.id;


--
-- Name: guardians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('guardians_id_seq', 150, true);


--
-- Name: households; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
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
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.households OWNER TO urban_impact;

--
-- Name: households_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE households_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.households_id_seq OWNER TO urban_impact;

--
-- Name: households_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE households_id_seq OWNED BY households.id;


--
-- Name: households_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('households_id_seq', 100, true);


--
-- Name: locations; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
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


ALTER TABLE public.locations OWNER TO urban_impact;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO urban_impact;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('locations_id_seq', 4, true);


--
-- Name: notes; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    user_id integer,
    date date,
    title character varying(255),
    contents text,
    notable_type character varying(255),
    notable_id integer,
    priority integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notes OWNER TO urban_impact;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO urban_impact;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('notes_id_seq', 4, true);


--
-- Name: programs; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    department_id integer,
    min_grade integer,
    max_grade integer,
    active boolean,
    max_capacity integer,
    start_date date,
    end_date date,
    scan_by_absence boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.programs OWNER TO urban_impact;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO urban_impact;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('programs_id_seq', 13, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO urban_impact;

--
-- Name: section_events; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE section_events (
    id integer NOT NULL,
    section_id integer,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.section_events OWNER TO urban_impact;

--
-- Name: section_events_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE section_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_events_id_seq OWNER TO urban_impact;

--
-- Name: section_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE section_events_id_seq OWNED BY section_events.id;


--
-- Name: section_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('section_events_id_seq', 25, true);


--
-- Name: sections; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    name character varying(255),
    program_id integer,
    max_capacity integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sections OWNER TO urban_impact;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO urban_impact;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('sections_id_seq', 22, true);


--
-- Name: student_allergies; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE student_allergies (
    id integer NOT NULL,
    student_id integer,
    allergy_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.student_allergies OWNER TO urban_impact;

--
-- Name: student_allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE student_allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_allergies_id_seq OWNER TO urban_impact;

--
-- Name: student_allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE student_allergies_id_seq OWNED BY student_allergies.id;


--
-- Name: student_allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('student_allergies_id_seq', 100, true);


--
-- Name: students; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
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
    is_visitor boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.students OWNER TO urban_impact;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO urban_impact;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('students_id_seq', 147, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    username character varying(255),
    role character varying(255),
    department_id integer,
    active boolean DEFAULT true,
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


ALTER TABLE public.users OWNER TO urban_impact;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: urban_impact
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO urban_impact;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban_impact
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban_impact
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY allergies ALTER COLUMN id SET DEFAULT nextval('allergies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY attendances ALTER COLUMN id SET DEFAULT nextval('attendances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY enrollments ALTER COLUMN id SET DEFAULT nextval('enrollments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY guardians ALTER COLUMN id SET DEFAULT nextval('guardians_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY households ALTER COLUMN id SET DEFAULT nextval('households_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY section_events ALTER COLUMN id SET DEFAULT nextval('section_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY student_allergies ALTER COLUMN id SET DEFAULT nextval('student_allergies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: urban_impact
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: allergies; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY allergies (id, name, warning_text, active, created_at, updated_at) FROM stdin;
1	Id	Possimus quaerat quia consequatur corrupti quam quibusdam veniam qui velit voluptatem dicta incidunt quis non et voluptatem. Quisquam perspiciatis reiciendis cum perferendis recusandae ducimus vel tenetur explicabo quidem qui consequatur nesciunt libero ut et. Nulla sit quis dolorem dolore ut nobis maiores ratione provident	t	2012-12-17 10:56:53.688527	2012-12-17 10:56:53.688531
2	Molestias Aperiam Saepe	Qui hic voluptatibus optio libero reprehenderit id impedit ut vel aperiam earum. Iste voluptatem nam aspernatur eos neque ipsa sit omnis. Eligendi amet sint animi nam voluptas	t	2012-12-17 10:56:53.68878	2012-12-17 10:56:53.688782
3	Non Molestiae Placeat	Labore eius asperiores corrupti consequatur veritatis harum non quia error et fugiat. Explicabo cupiditate accusantium quaerat et qui est nostrum laborum facilis ullam aut dolore modi sapiente aut natus eos iure ut	t	2012-12-17 10:56:53.688931	2012-12-17 10:56:53.688933
4	Est	Voluptate cupiditate magnam autem est accusantium praesentium iusto sed eaque. Quos aliquid ratione quis magni sunt ea quam totam. Laborum quae ab pariatur nesciunt omnis aspernatur voluptatem quisquam rerum eum distinctio ducimus voluptatem veritatis molestiae	t	2012-12-17 10:56:53.689083	2012-12-17 10:56:53.689085
5	Sed Deserunt Aperiam	Quas sunt assumenda quia quia dolore molestias delectus atque et facere unde. Quia molestiae numquam qui vitae voluptatem aut at delectus veritatis	t	2012-12-17 10:56:53.689219	2012-12-17 10:56:53.689221
6	Et Quam Inventore	Laboriosam pariatur porro asperiores architecto perferendis	t	2012-12-17 10:56:53.689358	2012-12-17 10:56:53.68936
7	Enim Vero	Sint ut ut excepturi quos ipsa illum exercitationem id ut in facere quisquam	t	2012-12-17 10:56:53.689491	2012-12-17 10:56:53.689493
8	Accusamus Cumque Et	Eaque est amet dolor praesentium doloremque consequuntur nihil qui veniam aliquid autem molestiae vero. Hic fuga dolorum voluptatum et	t	2012-12-17 10:56:53.689612	2012-12-17 10:56:53.689614
9	Aut	Quas minus molestiae non deleniti et consequatur facilis tenetur aperiam est. Hic rem molestiae libero iure rem. Dolor illo explicabo itaque nihil ut maxime explicabo quam iste enim vero voluptates illum ducimus omnis et possimus dolor	t	2012-12-17 10:56:53.689747	2012-12-17 10:56:53.689749
10	Ut	Aut et exercitationem animi aut dolores asperiores quia culpa ea consequatur voluptatibus sunt	t	2012-12-17 10:56:53.689888	2012-12-17 10:56:53.68989
11	Placeat	Illo delectus omnis architecto asperiores modi dignissimos repellendus omnis libero eum aut sunt qui eius. Quos consequuntur dicta sequi officiis omnis doloribus voluptatum quia possimus ipsa sunt eveniet et omnis qui quae	t	2012-12-17 10:56:53.690001	2012-12-17 10:56:53.690003
12	Voluptas Quidem	Odio veniam ut architecto consequatur sunt et maiores et eligendi voluptatibus sit	t	2012-12-17 10:56:53.690128	2012-12-17 10:56:53.69013
13	Ea Laborum	Maiores consequatur quae incidunt nemo incidunt recusandae. Labore in recusandae similique tenetur cupiditate rerum aut tenetur. Et neque eos doloribus aperiam dolorem enim eius ipsum minus dolore et et non possimus consectetur enim	t	2012-12-17 10:56:53.690258	2012-12-17 10:56:53.69026
14	Quia	Hic nesciunt perspiciatis praesentium voluptatem qui animi ut sed et aliquid non repellendus numquam omnis et accusamus. Sed et dolor deleniti omnis odit sint qui dolor	t	2012-12-17 10:56:53.690402	2012-12-17 10:56:53.690404
15	Maiores Dolor	Quos occaecati et et porro nesciunt laborum numquam quae iusto eos velit. Voluptatibus aliquam itaque eos quae ea laborum vero harum	t	2012-12-17 10:56:53.690526	2012-12-17 10:56:53.690528
16	Quis Et	Nemo consectetur autem vel non voluptates modi repellat quia sit nihil optio velit alias omnis illum provident fugiat quis	t	2012-12-17 10:56:53.690666	2012-12-17 10:56:53.690668
17	Saepe	Minus explicabo inventore ab qui quis enim beatae temporibus at. Reiciendis magni nulla animi modi molestias amet	t	2012-12-17 10:56:53.690791	2012-12-17 10:56:53.690793
18	Consequatur Perferendis Nobis	At molestiae laudantium ducimus ut ut non est fugiat id accusamus ea fugit dolor doloremque vero qui deleniti et. Dignissimos molestiae dolorum enim dolorem officia animi eveniet non atque dolores ipsum voluptatem ut quae dicta consequuntur voluptatem dignissimos qui. Iste itaque quam blanditiis dolores ea neque dolor corporis aliquid est dicta quod officia illum vel eos alias	t	2012-12-17 10:56:53.69091	2012-12-17 10:56:53.690912
19	Rerum	Necessitatibus quibusdam dolore blanditiis vero. Voluptatem aut quia tempora vitae suscipit eius in quo possimus quo voluptatem vitae	t	2012-12-17 10:56:53.691081	2012-12-17 10:56:53.691083
20	Velit Dicta	Id dignissimos itaque neque voluptates earum illo nesciunt dolores iure vitae reiciendis facere vel quas excepturi quasi	t	2012-12-17 10:56:53.691202	2012-12-17 10:56:53.691204
\.


--
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY attendances (id, student_id, event_id, exempt, created_at, updated_at) FROM stdin;
1	126	3	\N	2012-12-17 11:00:23.386053	2012-12-17 11:00:23.386053
2	124	3	\N	2012-12-17 11:00:25.162593	2012-12-17 11:00:25.162593
3	119	3	\N	2012-12-17 11:00:26.937512	2012-12-17 11:00:26.937512
4	115	3	\N	2012-12-17 11:00:30.784886	2012-12-17 11:00:30.784886
5	95	3	\N	2012-12-17 11:00:33.002083	2012-12-17 11:00:33.002083
6	74	3	\N	2012-12-17 11:00:35.282012	2012-12-17 11:00:35.282012
7	47	3	\N	2012-12-17 11:00:38.569231	2012-12-17 11:00:38.569231
8	23	3	\N	2012-12-17 11:00:40.89718	2012-12-17 11:00:40.89718
9	76	20	\N	2012-12-17 11:00:55.752367	2012-12-17 11:00:55.752367
10	67	20	\N	2012-12-17 11:00:58.101993	2012-12-17 11:00:58.101993
11	64	20	\N	2012-12-17 11:00:59.679451	2012-12-17 11:00:59.679451
12	46	20	\N	2012-12-17 11:01:01.495099	2012-12-17 11:01:01.495099
13	40	20	\N	2012-12-17 11:01:03.393296	2012-12-17 11:01:03.393296
14	87	20	\N	2012-12-17 11:01:06.287986	2012-12-17 11:01:06.287986
15	145	8	\N	2012-12-17 11:01:37.362285	2012-12-17 11:01:37.362285
16	131	8	\N	2012-12-17 11:01:39.685422	2012-12-17 11:01:39.685422
17	137	8	\N	2012-12-17 11:01:42.012639	2012-12-17 11:01:42.012639
18	44	8	\N	2012-12-17 11:01:44.933787	2012-12-17 11:01:44.933787
19	7	8	\N	2012-12-17 11:01:46.821132	2012-12-17 11:01:46.821132
20	61	8	\N	2012-12-17 11:01:49.115898	2012-12-17 11:01:49.115898
21	93	8	\N	2012-12-17 11:01:52.509012	2012-12-17 11:01:52.509012
22	91	8	\N	2012-12-17 11:01:54.380674	2012-12-17 11:01:54.380674
23	51	8	\N	2012-12-17 11:01:56.245825	2012-12-17 11:01:56.245825
24	62	8	\N	2012-12-17 11:01:58.323391	2012-12-17 11:01:58.323391
25	43	8	\N	2012-12-17 11:02:04.675212	2012-12-17 11:02:04.675212
26	145	5	\N	2012-12-17 11:07:06.9891	2012-12-17 11:07:06.9891
27	137	5	\N	2012-12-17 11:07:11.358343	2012-12-17 11:07:11.358343
28	44	5	\N	2012-12-17 11:07:13.838839	2012-12-17 11:07:13.838839
29	51	5	\N	2012-12-17 11:07:15.910726	2012-12-17 11:07:15.910726
30	61	5	\N	2012-12-17 11:07:19.486933	2012-12-17 11:07:19.486933
31	131	5	\N	2012-12-17 11:07:21.680171	2012-12-17 11:07:21.680171
32	110	5	\N	2012-12-17 11:07:24.349777	2012-12-17 11:07:24.349777
33	7	5	\N	2012-12-17 11:07:26.184389	2012-12-17 11:07:26.184389
34	43	5	\N	2012-12-17 11:07:28.054182	2012-12-17 11:07:28.054182
35	62	5	\N	2012-12-17 11:07:30.550777	2012-12-17 11:07:30.550777
36	113	9	\N	2012-12-17 11:16:33.641566	2012-12-17 11:16:33.641566
37	112	9	\N	2012-12-17 11:16:35.723158	2012-12-17 11:16:35.723158
38	107	9	\N	2012-12-17 11:16:37.318414	2012-12-17 11:16:37.318414
39	55	9	\N	2012-12-17 11:16:40.520139	2012-12-17 11:16:40.520139
40	3	9	\N	2012-12-17 11:16:42.52186	2012-12-17 11:16:42.52186
41	145	9	\N	2012-12-17 11:16:44.056923	2012-12-17 11:16:44.056923
42	80	9	\N	2012-12-17 11:16:45.729928	2012-12-17 11:16:45.729928
43	28	9	\N	2012-12-17 11:16:47.697922	2012-12-17 11:16:47.697922
44	10	9	\N	2012-12-17 11:16:49.160742	2012-12-17 11:16:49.160742
45	79	9	\N	2012-12-17 11:16:51.35333	2012-12-17 11:16:51.35333
46	135	4	\N	2012-12-17 11:17:26.380523	2012-12-17 11:17:26.380523
47	52	4	\N	2012-12-17 11:17:28.359164	2012-12-17 11:17:28.359164
48	34	4	\N	2012-12-17 11:17:30.054116	2012-12-17 11:17:30.054116
49	28	4	\N	2012-12-17 11:17:31.72024	2012-12-17 11:17:31.72024
50	49	4	\N	2012-12-17 11:17:33.885776	2012-12-17 11:17:33.885776
51	110	4	\N	2012-12-17 11:17:35.701717	2012-12-17 11:17:35.701717
52	30	4	\N	2012-12-17 11:17:37.821608	2012-12-17 11:17:37.821608
53	19	4	\N	2012-12-17 11:17:39.573956	2012-12-17 11:17:39.573956
54	8	19	\N	2012-12-17 11:18:32.61098	2012-12-17 11:18:32.61098
55	27	19	\N	2012-12-17 11:18:34.858007	2012-12-17 11:18:34.858007
56	94	19	\N	2012-12-17 11:18:36.457786	2012-12-17 11:18:36.457786
57	61	19	\N	2012-12-17 11:18:38.43541	2012-12-17 11:18:38.43541
58	11	19	\N	2012-12-17 11:18:40.441962	2012-12-17 11:18:40.441962
59	103	19	\N	2012-12-17 11:18:42.24052	2012-12-17 11:18:42.24052
60	16	19	\N	2012-12-17 11:18:43.713489	2012-12-17 11:18:43.713489
61	84	19	\N	2012-12-17 11:18:46.043427	2012-12-17 11:18:46.043427
62	122	19	\N	2012-12-17 11:18:48.852664	2012-12-17 11:18:48.852664
63	137	23	\N	2012-12-17 11:57:38.288104	2012-12-17 11:57:38.288104
64	145	23	\N	2012-12-17 11:57:40.74424	2012-12-17 11:57:40.74424
65	43	23	\N	2012-12-17 11:57:42.632567	2012-12-17 11:57:42.632567
66	91	23	\N	2012-12-17 11:57:44.52057	2012-12-17 11:57:44.52057
67	51	23	\N	2012-12-17 11:57:46.088769	2012-12-17 11:57:46.088769
68	44	23	\N	2012-12-17 11:57:47.808805	2012-12-17 11:57:47.808805
69	61	23	\N	2012-12-17 11:57:49.857105	2012-12-17 11:57:49.857105
70	62	23	\N	2012-12-17 11:57:52.080901	2012-12-17 11:57:52.080901
71	110	23	\N	2012-12-17 11:57:54.264872	2012-12-17 11:57:54.264872
72	131	23	\N	2012-12-17 11:57:56.504347	2012-12-17 11:57:56.504347
73	93	23	\N	2012-12-17 11:57:58.42356	2012-12-17 11:57:58.42356
74	104	24	\N	2012-12-17 12:06:31.694784	2012-12-17 12:06:31.694784
75	33	24	\N	2012-12-17 12:06:33.502813	2012-12-17 12:06:33.502813
76	92	24	\N	2012-12-17 12:06:35.247349	2012-12-17 12:06:35.247349
77	122	24	\N	2012-12-17 12:06:36.998388	2012-12-17 12:06:36.998388
78	147	24	\N	2012-12-17 12:06:38.66271	2012-12-17 12:06:38.66271
79	116	24	\N	2012-12-17 12:06:40.237782	2012-12-17 12:06:40.237782
80	35	24	\N	2012-12-17 12:06:42.470257	2012-12-17 12:06:42.470257
81	122	25	\N	2012-12-17 12:07:56.680448	2012-12-17 12:07:56.680448
82	147	25	\N	2012-12-17 12:07:58.312854	2012-12-17 12:07:58.312854
83	116	25	\N	2012-12-17 12:08:00.097936	2012-12-17 12:08:00.097936
84	33	25	\N	2012-12-17 12:08:01.550564	2012-12-17 12:08:01.550564
85	35	25	\N	2012-12-17 12:08:03.435256	2012-12-17 12:08:03.435256
86	92	25	\N	2012-12-17 12:08:53.615529	2012-12-17 12:08:53.615529
87	78	25	\N	2012-12-17 12:08:55.928007	2012-12-17 12:08:55.928007
88	104	25	\N	2012-12-17 12:08:57.741146	2012-12-17 12:08:57.741146
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY departments (id, name, description, active, created_at, updated_at) FROM stdin;
1	Performing Arts	The Performing Arts Program gives children, middle school and high school youth the opportunity to share their talents by singing, dancing, and acting in venues across the country.	t	2012-12-17 10:56:51.933653	2012-12-17 10:56:51.933653
2	Athletics	Depending on the night of the week and the time of the year, chances are there is a sports program going on where kids are having fun and learning about the Lord.	t	2012-12-17 10:56:51.944185	2012-12-17 10:56:51.944185
3	Academic Assistance	Urban Impact offers academic remediation both during the school year and throughout the summer. Program directors encourage youth to stop by for a visit after school for homework help, while highschoolers may attend the SAT Prep Class.	t	2012-12-17 10:56:51.94975	2012-12-17 10:56:51.94975
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY enrollments (id, student_id, section_id, created_at, updated_at) FROM stdin;
1	1	5	2012-12-17 10:56:53.342206	2012-12-17 10:56:53.34221
2	2	15	2012-12-17 10:56:53.344376	2012-12-17 10:56:53.344379
3	3	7	2012-12-17 10:56:53.345782	2012-12-17 10:56:53.345785
4	4	17	2012-12-17 10:56:53.347241	2012-12-17 10:56:53.347245
5	4	16	2012-12-17 10:56:53.347285	2012-12-17 10:56:53.347287
6	5	10	2012-12-17 10:56:53.348943	2012-12-17 10:56:53.348949
7	5	21	2012-12-17 10:56:53.348988	2012-12-17 10:56:53.348991
8	6	1	2012-12-17 10:56:53.350722	2012-12-17 10:56:53.350726
9	7	4	2012-12-17 10:56:53.352207	2012-12-17 10:56:53.35221
10	8	19	2012-12-17 10:56:53.35546	2012-12-17 10:56:53.355463
11	8	15	2012-12-17 10:56:53.355509	2012-12-17 10:56:53.355512
12	9	3	2012-12-17 10:56:53.357284	2012-12-17 10:56:53.357287
13	10	17	2012-12-17 10:56:53.358907	2012-12-17 10:56:53.358911
14	10	7	2012-12-17 10:56:53.358956	2012-12-17 10:56:53.358959
15	11	19	2012-12-17 10:56:53.360805	2012-12-17 10:56:53.360808
16	12	18	2012-12-17 10:56:53.362338	2012-12-17 10:56:53.362342
17	13	21	2012-12-17 10:56:53.364321	2012-12-17 10:56:53.364324
18	13	18	2012-12-17 10:56:53.364365	2012-12-17 10:56:53.364368
19	14	2	2012-12-17 10:56:53.366983	2012-12-17 10:56:53.366986
20	14	11	2012-12-17 10:56:53.367026	2012-12-17 10:56:53.367028
21	15	15	2012-12-17 10:56:53.368831	2012-12-17 10:56:53.368833
22	16	10	2012-12-17 10:56:53.370343	2012-12-17 10:56:53.370346
23	16	19	2012-12-17 10:56:53.370384	2012-12-17 10:56:53.370386
24	17	8	2012-12-17 10:56:53.372102	2012-12-17 10:56:53.372105
25	18	16	2012-12-17 10:56:53.373565	2012-12-17 10:56:53.373567
26	18	17	2012-12-17 10:56:53.373604	2012-12-17 10:56:53.373606
27	19	7	2012-12-17 10:56:53.375369	2012-12-17 10:56:53.375372
28	19	20	2012-12-17 10:56:53.375409	2012-12-17 10:56:53.375411
29	20	15	2012-12-17 10:56:53.377037	2012-12-17 10:56:53.37704
30	20	11	2012-12-17 10:56:53.377078	2012-12-17 10:56:53.37708
31	21	22	2012-12-17 10:56:53.378839	2012-12-17 10:56:53.378842
32	22	17	2012-12-17 10:56:53.382428	2012-12-17 10:56:53.382432
33	22	9	2012-12-17 10:56:53.382481	2012-12-17 10:56:53.382483
34	23	22	2012-12-17 10:56:53.384302	2012-12-17 10:56:53.384305
35	23	10	2012-12-17 10:56:53.384348	2012-12-17 10:56:53.38435
36	24	13	2012-12-17 10:56:53.386136	2012-12-17 10:56:53.386139
37	24	14	2012-12-17 10:56:53.386178	2012-12-17 10:56:53.38618
38	25	13	2012-12-17 10:56:53.387984	2012-12-17 10:56:53.387987
39	26	12	2012-12-17 10:56:53.390617	2012-12-17 10:56:53.39062
40	27	12	2012-12-17 10:56:53.392196	2012-12-17 10:56:53.392198
41	27	19	2012-12-17 10:56:53.392235	2012-12-17 10:56:53.392237
42	28	20	2012-12-17 10:56:53.394462	2012-12-17 10:56:53.394465
43	28	7	2012-12-17 10:56:53.394505	2012-12-17 10:56:53.394507
44	29	10	2012-12-17 10:56:53.396242	2012-12-17 10:56:53.396245
45	30	20	2012-12-17 10:56:53.39896	2012-12-17 10:56:53.398962
46	31	17	2012-12-17 10:56:53.401501	2012-12-17 10:56:53.401505
47	31	1	2012-12-17 10:56:53.401557	2012-12-17 10:56:53.401559
48	32	10	2012-12-17 10:56:53.403959	2012-12-17 10:56:53.403961
49	32	14	2012-12-17 10:56:53.404001	2012-12-17 10:56:53.404003
50	33	2	2012-12-17 10:56:53.405737	2012-12-17 10:56:53.405739
51	34	11	2012-12-17 10:56:53.407341	2012-12-17 10:56:53.407344
52	34	20	2012-12-17 10:56:53.407381	2012-12-17 10:56:53.407383
53	35	2	2012-12-17 10:56:53.409146	2012-12-17 10:56:53.409149
54	36	13	2012-12-17 10:56:53.411024	2012-12-17 10:56:53.411026
55	37	18	2012-12-17 10:56:53.412503	2012-12-17 10:56:53.412506
56	37	12	2012-12-17 10:56:53.412547	2012-12-17 10:56:53.412549
57	38	18	2012-12-17 10:56:53.414372	2012-12-17 10:56:53.414374
58	39	16	2012-12-17 10:56:53.416092	2012-12-17 10:56:53.416094
59	40	9	2012-12-17 10:56:53.417728	2012-12-17 10:56:53.41773
60	41	11	2012-12-17 10:56:53.419333	2012-12-17 10:56:53.419335
61	41	10	2012-12-17 10:56:53.419376	2012-12-17 10:56:53.419378
62	42	18	2012-12-17 10:56:53.421177	2012-12-17 10:56:53.421179
63	43	16	2012-12-17 10:56:53.423878	2012-12-17 10:56:53.42388
64	43	4	2012-12-17 10:56:53.423917	2012-12-17 10:56:53.423919
65	44	4	2012-12-17 10:56:53.425747	2012-12-17 10:56:53.425749
66	45	5	2012-12-17 10:56:53.427526	2012-12-17 10:56:53.427528
67	45	18	2012-12-17 10:56:53.427565	2012-12-17 10:56:53.427567
68	46	10	2012-12-17 10:56:53.429298	2012-12-17 10:56:53.429301
69	46	9	2012-12-17 10:56:53.429338	2012-12-17 10:56:53.42934
70	47	22	2012-12-17 10:56:53.432123	2012-12-17 10:56:53.432125
71	48	18	2012-12-17 10:56:53.433789	2012-12-17 10:56:53.433792
72	48	14	2012-12-17 10:56:53.433832	2012-12-17 10:56:53.433833
73	49	16	2012-12-17 10:56:53.436055	2012-12-17 10:56:53.436057
74	49	20	2012-12-17 10:56:53.436105	2012-12-17 10:56:53.436107
75	50	11	2012-12-17 10:56:53.440386	2012-12-17 10:56:53.440389
76	51	4	2012-12-17 10:56:53.442362	2012-12-17 10:56:53.442364
77	51	15	2012-12-17 10:56:53.442407	2012-12-17 10:56:53.442409
78	52	20	2012-12-17 10:56:53.444284	2012-12-17 10:56:53.444287
79	52	16	2012-12-17 10:56:53.444325	2012-12-17 10:56:53.444327
80	53	15	2012-12-17 10:56:53.448345	2012-12-17 10:56:53.448348
81	54	15	2012-12-17 10:56:53.450071	2012-12-17 10:56:53.450074
82	55	7	2012-12-17 10:56:53.451819	2012-12-17 10:56:53.451822
83	56	8	2012-12-17 10:56:53.453461	2012-12-17 10:56:53.453463
84	56	17	2012-12-17 10:56:53.453504	2012-12-17 10:56:53.453506
85	57	3	2012-12-17 10:56:53.455982	2012-12-17 10:56:53.455986
86	58	14	2012-12-17 10:56:53.457829	2012-12-17 10:56:53.457832
87	59	17	2012-12-17 10:56:53.459541	2012-12-17 10:56:53.459543
88	60	21	2012-12-17 10:56:53.461206	2012-12-17 10:56:53.461209
89	61	4	2012-12-17 10:56:53.463846	2012-12-17 10:56:53.463849
90	61	19	2012-12-17 10:56:53.463887	2012-12-17 10:56:53.463889
91	62	4	2012-12-17 10:56:53.465738	2012-12-17 10:56:53.46574
92	63	11	2012-12-17 10:56:53.46746	2012-12-17 10:56:53.467462
93	64	9	2012-12-17 10:56:53.469169	2012-12-17 10:56:53.469172
94	65	6	2012-12-17 10:56:53.470886	2012-12-17 10:56:53.470889
95	65	21	2012-12-17 10:56:53.470928	2012-12-17 10:56:53.47093
96	66	13	2012-12-17 10:56:53.473626	2012-12-17 10:56:53.473629
97	67	9	2012-12-17 10:56:53.47541	2012-12-17 10:56:53.475413
98	68	10	2012-12-17 10:56:53.477262	2012-12-17 10:56:53.477264
99	68	21	2012-12-17 10:56:53.477303	2012-12-17 10:56:53.477305
100	69	21	2012-12-17 10:56:53.479293	2012-12-17 10:56:53.479296
101	69	10	2012-12-17 10:56:53.479337	2012-12-17 10:56:53.479339
102	70	10	2012-12-17 10:56:53.481872	2012-12-17 10:56:53.481875
103	71	18	2012-12-17 10:56:53.483505	2012-12-17 10:56:53.483508
104	71	1	2012-12-17 10:56:53.483545	2012-12-17 10:56:53.483546
105	72	15	2012-12-17 10:56:53.486704	2012-12-17 10:56:53.486707
106	73	21	2012-12-17 10:56:53.488541	2012-12-17 10:56:53.488543
107	74	18	2012-12-17 10:56:53.490254	2012-12-17 10:56:53.490257
108	74	22	2012-12-17 10:56:53.490295	2012-12-17 10:56:53.490297
109	75	5	2012-12-17 10:56:53.492226	2012-12-17 10:56:53.492228
110	76	8	2012-12-17 10:56:53.493946	2012-12-17 10:56:53.493949
111	76	9	2012-12-17 10:56:53.493989	2012-12-17 10:56:53.493991
112	77	21	2012-12-17 10:56:53.497982	2012-12-17 10:56:53.497984
113	77	18	2012-12-17 10:56:53.498023	2012-12-17 10:56:53.498025
114	78	2	2012-12-17 10:56:53.499917	2012-12-17 10:56:53.49992
115	79	17	2012-12-17 10:56:53.501931	2012-12-17 10:56:53.501934
116	79	7	2012-12-17 10:56:53.501977	2012-12-17 10:56:53.501979
117	80	7	2012-12-17 10:56:53.50403	2012-12-17 10:56:53.504033
118	81	11	2012-12-17 10:56:53.507444	2012-12-17 10:56:53.507476
119	81	6	2012-12-17 10:56:53.507554	2012-12-17 10:56:53.507556
120	82	1	2012-12-17 10:56:53.510282	2012-12-17 10:56:53.510285
121	82	18	2012-12-17 10:56:53.510327	2012-12-17 10:56:53.510329
122	83	10	2012-12-17 10:56:53.512286	2012-12-17 10:56:53.512289
123	84	19	2012-12-17 10:56:53.51503	2012-12-17 10:56:53.515032
124	85	6	2012-12-17 10:56:53.516789	2012-12-17 10:56:53.516792
125	86	15	2012-12-17 10:56:53.518725	2012-12-17 10:56:53.518727
126	86	14	2012-12-17 10:56:53.518766	2012-12-17 10:56:53.518768
127	87	11	2012-12-17 10:56:53.5221	2012-12-17 10:56:53.522103
128	87	9	2012-12-17 10:56:53.522153	2012-12-17 10:56:53.522155
129	88	3	2012-12-17 10:56:53.524272	2012-12-17 10:56:53.524275
130	88	14	2012-12-17 10:56:53.524322	2012-12-17 10:56:53.524324
131	89	1	2012-12-17 10:56:53.526645	2012-12-17 10:56:53.526647
132	89	12	2012-12-17 10:56:53.526688	2012-12-17 10:56:53.52669
133	90	14	2012-12-17 10:56:53.528724	2012-12-17 10:56:53.528726
134	91	4	2012-12-17 10:56:53.531446	2012-12-17 10:56:53.531449
135	91	11	2012-12-17 10:56:53.531487	2012-12-17 10:56:53.531489
136	92	2	2012-12-17 10:56:53.533444	2012-12-17 10:56:53.533446
137	93	4	2012-12-17 10:56:53.536708	2012-12-17 10:56:53.536712
138	94	21	2012-12-17 10:56:53.539121	2012-12-17 10:56:53.539124
139	94	19	2012-12-17 10:56:53.53917	2012-12-17 10:56:53.539172
140	95	6	2012-12-17 10:56:53.541258	2012-12-17 10:56:53.54126
141	95	22	2012-12-17 10:56:53.5413	2012-12-17 10:56:53.541302
142	96	22	2012-12-17 10:56:53.543351	2012-12-17 10:56:53.543353
143	97	8	2012-12-17 10:56:53.545279	2012-12-17 10:56:53.545282
144	97	16	2012-12-17 10:56:53.545324	2012-12-17 10:56:53.545326
145	98	15	2012-12-17 10:56:53.548069	2012-12-17 10:56:53.548072
146	99	13	2012-12-17 10:56:53.550098	2012-12-17 10:56:53.550101
147	99	3	2012-12-17 10:56:53.550143	2012-12-17 10:56:53.550145
148	100	10	2012-12-17 10:56:53.552143	2012-12-17 10:56:53.552145
149	101	12	2012-12-17 10:56:53.554843	2012-12-17 10:56:53.554846
150	102	12	2012-12-17 10:56:53.556787	2012-12-17 10:56:53.55679
151	103	21	2012-12-17 10:56:53.558659	2012-12-17 10:56:53.558662
152	103	19	2012-12-17 10:56:53.558705	2012-12-17 10:56:53.558707
153	104	2	2012-12-17 10:56:53.560819	2012-12-17 10:56:53.560821
154	105	20	2012-12-17 10:56:53.564217	2012-12-17 10:56:53.56422
155	105	13	2012-12-17 10:56:53.564259	2012-12-17 10:56:53.564261
156	106	13	2012-12-17 10:56:53.566337	2012-12-17 10:56:53.566339
157	107	7	2012-12-17 10:56:53.568282	2012-12-17 10:56:53.568285
158	107	7	2012-12-17 10:56:53.568323	2012-12-17 10:56:53.568325
159	108	3	2012-12-17 10:56:53.571336	2012-12-17 10:56:53.571339
160	108	14	2012-12-17 10:56:53.57138	2012-12-17 10:56:53.571382
161	109	21	2012-12-17 10:56:53.573473	2012-12-17 10:56:53.573476
162	109	14	2012-12-17 10:56:53.573516	2012-12-17 10:56:53.573518
163	110	20	2012-12-17 10:56:53.575575	2012-12-17 10:56:53.575577
164	110	4	2012-12-17 10:56:53.575616	2012-12-17 10:56:53.575618
165	111	8	2012-12-17 10:56:53.577745	2012-12-17 10:56:53.577748
166	111	8	2012-12-17 10:56:53.577792	2012-12-17 10:56:53.577794
167	112	1	2012-12-17 10:56:53.580834	2012-12-17 10:56:53.580836
168	112	7	2012-12-17 10:56:53.580875	2012-12-17 10:56:53.580877
169	113	7	2012-12-17 10:56:53.582988	2012-12-17 10:56:53.58299
170	113	13	2012-12-17 10:56:53.583029	2012-12-17 10:56:53.583031
171	114	6	2012-12-17 10:56:53.585088	2012-12-17 10:56:53.585091
172	115	22	2012-12-17 10:56:53.588941	2012-12-17 10:56:53.588944
173	115	5	2012-12-17 10:56:53.588982	2012-12-17 10:56:53.588984
174	116	2	2012-12-17 10:56:53.590946	2012-12-17 10:56:53.590949
175	116	8	2012-12-17 10:56:53.59099	2012-12-17 10:56:53.590992
176	117	21	2012-12-17 10:56:53.593126	2012-12-17 10:56:53.593129
177	117	6	2012-12-17 10:56:53.593168	2012-12-17 10:56:53.59317
178	118	17	2012-12-17 10:56:53.598245	2012-12-17 10:56:53.598248
179	118	17	2012-12-17 10:56:53.598298	2012-12-17 10:56:53.5983
180	119	22	2012-12-17 10:56:53.600539	2012-12-17 10:56:53.600542
181	120	13	2012-12-17 10:56:53.60246	2012-12-17 10:56:53.602462
182	120	14	2012-12-17 10:56:53.6025	2012-12-17 10:56:53.602502
183	121	15	2012-12-17 10:56:53.605919	2012-12-17 10:56:53.605923
184	122	2	2012-12-17 10:56:53.608334	2012-12-17 10:56:53.608337
185	122	19	2012-12-17 10:56:53.608384	2012-12-17 10:56:53.608386
186	123	12	2012-12-17 10:56:53.610657	2012-12-17 10:56:53.610659
187	124	14	2012-12-17 10:56:53.61412	2012-12-17 10:56:53.614123
188	124	22	2012-12-17 10:56:53.614172	2012-12-17 10:56:53.614174
189	125	12	2012-12-17 10:56:53.616489	2012-12-17 10:56:53.616492
190	125	13	2012-12-17 10:56:53.616533	2012-12-17 10:56:53.616535
191	126	22	2012-12-17 10:56:53.618632	2012-12-17 10:56:53.618635
192	126	1	2012-12-17 10:56:53.618674	2012-12-17 10:56:53.618676
193	127	16	2012-12-17 10:56:53.622142	2012-12-17 10:56:53.622145
194	128	8	2012-12-17 10:56:53.624104	2012-12-17 10:56:53.624107
195	129	15	2012-12-17 10:56:53.626284	2012-12-17 10:56:53.626286
196	130	14	2012-12-17 10:56:53.629377	2012-12-17 10:56:53.629379
197	130	5	2012-12-17 10:56:53.629418	2012-12-17 10:56:53.62942
198	131	19	2012-12-17 10:56:53.631702	2012-12-17 10:56:53.631706
199	131	4	2012-12-17 10:56:53.631754	2012-12-17 10:56:53.631756
200	132	12	2012-12-17 10:56:53.634423	2012-12-17 10:56:53.634426
201	132	5	2012-12-17 10:56:53.634465	2012-12-17 10:56:53.634467
202	133	11	2012-12-17 10:56:53.637755	2012-12-17 10:56:53.637757
203	133	8	2012-12-17 10:56:53.637805	2012-12-17 10:56:53.637807
204	134	14	2012-12-17 10:56:53.639965	2012-12-17 10:56:53.639967
205	135	20	2012-12-17 10:56:53.642026	2012-12-17 10:56:53.642029
206	135	8	2012-12-17 10:56:53.642072	2012-12-17 10:56:53.642074
207	136	17	2012-12-17 10:56:53.644635	2012-12-17 10:56:53.644638
208	136	14	2012-12-17 10:56:53.644683	2012-12-17 10:56:53.644685
209	137	4	2012-12-17 10:56:53.647321	2012-12-17 10:56:53.647324
210	137	5	2012-12-17 10:56:53.647364	2012-12-17 10:56:53.647366
211	138	5	2012-12-17 10:56:53.649551	2012-12-17 10:56:53.649553
212	139	12	2012-12-17 10:56:53.651546	2012-12-17 10:56:53.651548
213	139	17	2012-12-17 10:56:53.651587	2012-12-17 10:56:53.651589
214	140	3	2012-12-17 10:56:53.655161	2012-12-17 10:56:53.655164
215	140	19	2012-12-17 10:56:53.655201	2012-12-17 10:56:53.655203
216	141	6	2012-12-17 10:56:53.657851	2012-12-17 10:56:53.657855
217	142	15	2012-12-17 10:56:53.660115	2012-12-17 10:56:53.660118
218	142	3	2012-12-17 10:56:53.660162	2012-12-17 10:56:53.660164
219	143	16	2012-12-17 10:56:53.663481	2012-12-17 10:56:53.663484
220	144	10	2012-12-17 10:56:53.665548	2012-12-17 10:56:53.665551
221	145	7	2012-12-17 10:56:53.667567	2012-12-17 10:56:53.66757
222	145	4	2012-12-17 10:56:53.667609	2012-12-17 10:56:53.667611
223	146	16	2012-12-17 10:56:53.671792	2012-12-17 10:56:53.671795
224	147	2	2012-12-17 10:56:53.673925	2012-12-17 10:56:53.673927
225	147	10	2012-12-17 10:56:53.673974	2012-12-17 10:56:53.673976
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY events (id, date, program_id, start_time, end_time, location_id, gospel_shared, meals_served, bibles_distributed, created_at, updated_at) FROM stdin;
1	2012-10-09	8	18:00:00	21:00:00	1	t	54	17	2012-12-17 10:56:52.27035	2012-12-17 10:56:52.270353
2	2011-03-30	2	12:00:00	15:00:00	1	t	2	56	2012-12-17 10:56:52.285384	2012-12-17 10:56:52.285387
3	2012-12-06	13	13:00:00	16:00:00	3	t	32	17	2012-12-17 10:56:52.286106	2012-12-17 10:56:52.286108
5	2012-10-30	3	12:00:00	15:00:00	3	t	17	30	2012-12-17 10:56:52.287106	2012-12-17 10:56:52.287108
6	2012-06-12	6	14:00:00	17:00:00	4	t	16	0	2012-12-17 10:56:52.287504	2012-12-17 10:56:52.287506
7	2012-10-27	9	13:00:00	16:00:00	1	t	32	19	2012-12-17 10:56:52.287908	2012-12-17 10:56:52.28791
8	2012-11-11	3	18:00:00	21:00:00	4	t	26	7	2012-12-17 10:56:52.288398	2012-12-17 10:56:52.2884
10	2012-01-12	7	15:00:00	18:00:00	2	t	14	36	2012-12-17 10:56:52.289155	2012-12-17 10:56:52.289157
11	2012-02-29	9	12:00:00	15:00:00	1	t	41	54	2012-12-17 10:56:52.289699	2012-12-17 10:56:52.289701
12	2012-05-05	12	18:00:00	21:00:00	4	t	34	7	2012-12-17 10:56:52.290171	2012-12-17 10:56:52.290173
13	2012-10-31	5	13:00:00	16:00:00	2	t	15	60	2012-12-17 10:56:52.290769	2012-12-17 10:56:52.290771
14	2012-10-07	11	14:00:00	17:00:00	1	t	47	58	2012-12-17 10:56:52.291363	2012-12-17 10:56:52.291365
15	2011-11-05	12	13:00:00	16:00:00	2	t	27	57	2012-12-17 10:56:52.291823	2012-12-17 10:56:52.291825
16	2012-09-13	8	15:00:00	18:00:00	2	t	10	10	2012-12-17 10:56:52.292426	2012-12-17 10:56:52.292428
17	2012-06-07	12	11:00:00	14:00:00	3	t	21	40	2012-12-17 10:56:52.292784	2012-12-17 10:56:52.292786
18	2012-07-04	3	16:00:00	19:00:00	1	t	41	29	2012-12-17 10:56:52.293391	2012-12-17 10:56:52.293394
20	2012-11-24	6	12:00:00	15:00:00	3	t	32	49	2012-12-17 10:56:52.294384	2012-12-17 10:56:52.294386
21	2012-12-18	1	10:00:00	12:00:00	1	f	0	0	2012-12-17 10:59:36.499883	2012-12-17 10:59:36.499883
22	2012-12-18	2	15:00:00	17:00:00	1	f	0	0	2012-12-17 11:00:06.530818	2012-12-17 11:00:06.530818
9	2012-12-04	4	16:00:00	19:00:00	4	t	13	24	2012-12-17 10:56:52.288795	2012-12-17 11:16:28.7823
4	2012-11-30	12	11:00:00	14:00:00	4	t	12	5	2012-12-17 10:56:52.286504	2012-12-17 11:17:21.874649
19	2012-11-23	12	18:00:00	21:00:00	3	t	31	23	2012-12-17 10:56:52.293791	2012-12-17 11:18:28.748893
23	2012-12-06	3	17:00:00	18:00:00	1	f	0	0	2012-12-17 11:57:25.690126	2012-12-17 11:57:25.690126
24	2012-12-07	2	19:00:00	21:00:00	1	f	0	0	2012-12-17 12:06:23.186265	2012-12-17 12:06:23.186265
25	2012-11-29	2	17:00:00	19:00:00	1	f	0	0	2012-12-17 12:07:48.649383	2012-12-17 12:07:48.649383
\.


--
-- Data for Name: guardians; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY guardians (id, first_name, last_name, household_id, guardian_type, cell_phone, can_text, email, active, created_at, updated_at) FROM stdin;
1	Don	Fritsch	1	Uncustodial	4126796879	t	don.fritsch@example.com	t	2012-12-17 10:56:53.847073	2012-12-17 10:56:53.847077
2	Austen	Hills	2	Mother	4122697486	t	austen.hills@example.com	t	2012-12-17 10:56:53.849662	2012-12-17 10:56:53.849665
3	Modesta	Connelly	3	Grandparent	4129935184	f	modesta.connelly@example.com	t	2012-12-17 10:56:53.851473	2012-12-17 10:56:53.851476
4	Merle	Connelly	3	Grandparent	4126589267	t	merle.connelly@example.com	t	2012-12-17 10:56:53.85164	2012-12-17 10:56:53.851642
5	Ariel	Wisoky	4	Grandparent	4120389726	t	ariel.wisoky@example.com	t	2012-12-17 10:56:53.853721	2012-12-17 10:56:53.853724
6	Aric	Wisoky	4	Mother	4120529656	t	aric.wisoky@example.com	t	2012-12-17 10:56:53.853886	2012-12-17 10:56:53.853888
7	Dedric	Wehner	5	Uncustodial	4121113768	t	dedric.wehner@example.com	t	2012-12-17 10:56:53.855775	2012-12-17 10:56:53.855778
8	Lue	Wehner	5	Uncustodial	4120955981	t	lue.wehner@example.com	t	2012-12-17 10:56:53.855939	2012-12-17 10:56:53.855942
9	Valentina	Wehner	6	Custodial	4122346100	t	valentina.wehner@example.com	t	2012-12-17 10:56:53.860346	2012-12-17 10:56:53.86035
10	Charley	Rempel	7	Custodial	4120948436	t	charley.rempel@example.com	t	2012-12-17 10:56:53.862245	2012-12-17 10:56:53.862248
11	Cole	Flatley	8	Grandparent	4127065577	t	cole.flatley@example.com	t	2012-12-17 10:56:53.864073	2012-12-17 10:56:53.864076
12	Sabrina	Flatley	8	Father	4122870127	t	sabrina.flatley@example.com	t	2012-12-17 10:56:53.86423	2012-12-17 10:56:53.864232
13	Dwight	Cormier	9	Uncustodial	4123196133	f	dwight.cormier@example.com	t	2012-12-17 10:56:53.866217	2012-12-17 10:56:53.86622
14	Kaycee	Casper	10	Mother	4125797776	f	kaycee.casper@example.com	t	2012-12-17 10:56:53.86801	2012-12-17 10:56:53.868012
15	Giovanni	Walsh	11	Mother	4120000283	t	giovanni.walsh@example.com	t	2012-12-17 10:56:53.869955	2012-12-17 10:56:53.869958
16	Liana	Walsh	11	Father	4120622208	t	liana.walsh@example.com	t	2012-12-17 10:56:53.870118	2012-12-17 10:56:53.870121
17	Annabel	Ziemann	12	Grandparent	4125360703	t	annabel.ziemann@example.com	t	2012-12-17 10:56:53.873363	2012-12-17 10:56:53.873366
18	Della	Ziemann	12	Grandparent	4122857931	f	della.ziemann@example.com	t	2012-12-17 10:56:53.87356	2012-12-17 10:56:53.873562
19	Madelyn	McLaughlin	13	Father	4123465880	t	madelyn.mclaughlin@example.com	t	2012-12-17 10:56:53.875769	2012-12-17 10:56:53.875772
20	Rusty	McLaughlin	13	Uncustodial	4125468412	t	rusty.mclaughlin@example.com	t	2012-12-17 10:56:53.875935	2012-12-17 10:56:53.875937
21	Elouise	Reichert	14	Grandparent	4122720387	t	elouise.reichert@example.com	t	2012-12-17 10:56:53.877901	2012-12-17 10:56:53.877904
22	Grady	Wisoky	15	Custodial	4128893729	t	grady.wisoky@example.com	t	2012-12-17 10:56:53.879771	2012-12-17 10:56:53.879773
23	Trystan	Klocko	16	Mother	4122704693	f	trystan.klocko@example.com	t	2012-12-17 10:56:53.881564	2012-12-17 10:56:53.881567
24	Naomi	Jast	17	Custodial	4122377603	t	naomi.jast@example.com	t	2012-12-17 10:56:53.883347	2012-12-17 10:56:53.88335
25	Leanna	Barton	18	Grandparent	4129776026	t	leanna.barton@example.com	t	2012-12-17 10:56:53.886996	2012-12-17 10:56:53.886999
26	Alisha	Predovic	19	Uncustodial	4127508241	t	alisha.predovic@example.com	t	2012-12-17 10:56:53.889026	2012-12-17 10:56:53.889029
27	Chet	Predovic	19	Mother	4124429332	f	chet.predovic@example.com	t	2012-12-17 10:56:53.889192	2012-12-17 10:56:53.889195
28	Alessia	O'Connell	20	Father	4128260799	t	alessia.o'connell@example.com	t	2012-12-17 10:56:53.891284	2012-12-17 10:56:53.891287
29	Efrain	Swift	21	Father	4122240440	t	efrain.swift@example.com	t	2012-12-17 10:56:53.893086	2012-12-17 10:56:53.893088
30	River	White	22	Mother	4121166012	t	river.white@example.com	t	2012-12-17 10:56:53.895021	2012-12-17 10:56:53.895024
31	Christiana	Ondricka	23	Uncustodial	4123116101	t	christiana.ondricka@example.com	t	2012-12-17 10:56:53.896884	2012-12-17 10:56:53.896886
32	Daron	Ondricka	23	Custodial	4123546091	t	daron.ondricka@example.com	t	2012-12-17 10:56:53.897039	2012-12-17 10:56:53.897041
33	Gwen	Harvey	24	Uncustodial	4125294062	t	gwen.harvey@example.com	t	2012-12-17 10:56:53.899121	2012-12-17 10:56:53.899124
34	Trenton	Jewess	25	Father	4120658609	f	trenton.jewess@example.com	t	2012-12-17 10:56:53.902755	2012-12-17 10:56:53.902758
35	Jarrell	Homenick	26	Grandparent	4128462121	t	jarrell.homenick@example.com	t	2012-12-17 10:56:53.904771	2012-12-17 10:56:53.904774
36	Elisabeth	Homenick	26	Uncustodial	4121822638	t	elisabeth.homenick@example.com	t	2012-12-17 10:56:53.904939	2012-12-17 10:56:53.904941
37	Therese	Maggio	27	Grandparent	4125269534	f	therese.maggio@example.com	t	2012-12-17 10:56:53.907042	2012-12-17 10:56:53.907045
38	Della	Maggio	27	Custodial	4124545031	f	della.maggio@example.com	t	2012-12-17 10:56:53.907202	2012-12-17 10:56:53.907204
39	Lori	McClure	28	Uncustodial	4121476422	t	lori.mcclure@example.com	t	2012-12-17 10:56:53.910884	2012-12-17 10:56:53.910887
40	Melisa	McClure	28	Uncustodial	4122204502	f	melisa.mcclure@example.com	t	2012-12-17 10:56:53.911043	2012-12-17 10:56:53.911045
41	Korbin	Greenfelder	29	Uncustodial	4124619043	t	korbin.greenfelder@example.com	t	2012-12-17 10:56:53.913152	2012-12-17 10:56:53.913154
42	Shaylee	Greenfelder	29	Mother	4124343199	t	shaylee.greenfelder@example.com	t	2012-12-17 10:56:53.913307	2012-12-17 10:56:53.913309
43	Anais	Nicolas	30	Grandparent	4126613204	t	anais.nicolas@example.com	t	2012-12-17 10:56:53.915389	2012-12-17 10:56:53.915391
44	Hailie	Mayer	31	Custodial	4129895103	t	hailie.mayer@example.com	t	2012-12-17 10:56:53.91816	2012-12-17 10:56:53.918163
45	Ethan	Mayer	31	Grandparent	4127737529	t	ethan.mayer@example.com	t	2012-12-17 10:56:53.918314	2012-12-17 10:56:53.918316
46	Ignatius	Daniel	32	Mother	4125857353	t	ignatius.daniel@example.com	t	2012-12-17 10:56:53.920445	2012-12-17 10:56:53.920447
47	Alford	Daniel	32	Grandparent	4125783178	t	alford.daniel@example.com	t	2012-12-17 10:56:53.920616	2012-12-17 10:56:53.920618
48	Edwina	Hoeger	33	Grandparent	4129678597	f	edwina.hoeger@example.com	t	2012-12-17 10:56:53.923458	2012-12-17 10:56:53.923462
49	Sven	Douglas	34	Grandparent	4126900753	t	sven.douglas@example.com	t	2012-12-17 10:56:53.926673	2012-12-17 10:56:53.926678
50	Kelsie	Douglas	34	Mother	4120632219	t	kelsie.douglas@example.com	t	2012-12-17 10:56:53.926898	2012-12-17 10:56:53.9269
51	Nicklaus	Glover	35	Mother	4123220308	t	nicklaus.glover@example.com	t	2012-12-17 10:56:53.929648	2012-12-17 10:56:53.929652
52	Marc	Glover	35	Grandparent	4121897580	t	marc.glover@example.com	t	2012-12-17 10:56:53.929844	2012-12-17 10:56:53.929846
53	Jarrett	Schinner	36	Custodial	4120814683	t	jarrett.schinner@example.com	t	2012-12-17 10:56:53.93206	2012-12-17 10:56:53.932062
54	Jamar	Heidenreich	37	Custodial	4124880764	t	jamar.heidenreich@example.com	t	2012-12-17 10:56:53.935752	2012-12-17 10:56:53.935754
55	Cathrine	Heidenreich	37	Uncustodial	4122250330	t	cathrine.heidenreich@example.com	t	2012-12-17 10:56:53.935915	2012-12-17 10:56:53.935917
56	Alysa	Zemlak	38	Mother	4129594778	f	alysa.zemlak@example.com	t	2012-12-17 10:56:53.938175	2012-12-17 10:56:53.938178
57	Alysa	Emmerich	39	Uncustodial	4128326801	t	alysa.emmerich@example.com	t	2012-12-17 10:56:53.940087	2012-12-17 10:56:53.94009
58	Korey	Emmerich	39	Grandparent	4120211808	f	korey.emmerich@example.com	t	2012-12-17 10:56:53.940269	2012-12-17 10:56:53.940271
59	Donnie	Stanton	40	Custodial	4128158184	t	donnie.stanton@example.com	t	2012-12-17 10:56:53.943059	2012-12-17 10:56:53.943062
60	Bartholome	Stanton	40	Father	4125941437	t	bartholome.stanton@example.com	t	2012-12-17 10:56:53.943242	2012-12-17 10:56:53.943244
61	Bernard	Jacobi	41	Mother	4122295121	t	bernard.jacobi@example.com	t	2012-12-17 10:56:53.945518	2012-12-17 10:56:53.945521
62	Clair	Bruen	42	Uncustodial	4120687486	t	clair.bruen@example.com	t	2012-12-17 10:56:53.947972	2012-12-17 10:56:53.947975
63	Carlos	Bruen	42	Father	4128784139	t	carlos.bruen@example.com	t	2012-12-17 10:56:53.948132	2012-12-17 10:56:53.948134
64	Eda	Ernser	43	Father	4121225204	t	eda.ernser@example.com	t	2012-12-17 10:56:53.952335	2012-12-17 10:56:53.952338
65	Javon	Kunde	44	Grandparent	4123993423	t	javon.kunde@example.com	t	2012-12-17 10:56:53.954269	2012-12-17 10:56:53.954272
66	Una	Kunde	44	Grandparent	4129020932	t	una.kunde@example.com	t	2012-12-17 10:56:53.954424	2012-12-17 10:56:53.954426
67	Raymond	Champlin	45	Custodial	4123206547	t	raymond.champlin@example.com	t	2012-12-17 10:56:53.956648	2012-12-17 10:56:53.956651
68	Josianne	Jones	46	Mother	4125300603	t	josianne.jones@example.com	t	2012-12-17 10:56:53.960968	2012-12-17 10:56:53.960972
69	Ayden	Mraz	47	Custodial	4129318231	f	ayden.mraz@example.com	t	2012-12-17 10:56:53.963591	2012-12-17 10:56:53.963595
70	Marlin	Mraz	47	Father	4121861452	f	marlin.mraz@example.com	t	2012-12-17 10:56:53.963783	2012-12-17 10:56:53.963785
71	Tyson	Lockman	48	Uncustodial	4124070599	f	tyson.lockman@example.com	t	2012-12-17 10:56:53.966209	2012-12-17 10:56:53.966211
72	Esmeralda	Runte	49	Grandparent	4124009178	t	esmeralda.runte@example.com	t	2012-12-17 10:56:53.969288	2012-12-17 10:56:53.969291
73	Arlo	Runte	49	Mother	4124989407	t	arlo.runte@example.com	t	2012-12-17 10:56:53.969486	2012-12-17 10:56:53.969488
74	Rylan	Haag	50	Custodial	4127635241	t	rylan.haag@example.com	t	2012-12-17 10:56:53.972043	2012-12-17 10:56:53.972046
75	Jamey	Haag	50	Custodial	4127492764	t	jamey.haag@example.com	t	2012-12-17 10:56:53.972237	2012-12-17 10:56:53.972239
76	Kianna	Jacobs	51	Uncustodial	4120156180	t	kianna.jacobs@example.com	t	2012-12-17 10:56:53.977269	2012-12-17 10:56:53.977272
77	Amiya	Friesen	52	Grandparent	4122209991	t	amiya.friesen@example.com	t	2012-12-17 10:56:53.979398	2012-12-17 10:56:53.9794
78	Madelynn	Friesen	52	Uncustodial	4126232806	t	madelynn.friesen@example.com	t	2012-12-17 10:56:53.979561	2012-12-17 10:56:53.979563
79	Florencio	Mante	53	Grandparent	4127857406	f	florencio.mante@example.com	t	2012-12-17 10:56:53.981758	2012-12-17 10:56:53.98176
80	Kris	Mante	53	Mother	4128640627	t	kris.mante@example.com	t	2012-12-17 10:56:53.981916	2012-12-17 10:56:53.981918
81	Eudora	O'Hara	54	Grandparent	4127526868	t	eudora.o'hara@example.com	t	2012-12-17 10:56:53.985737	2012-12-17 10:56:53.98574
82	Adan	Reilly	55	Custodial	4126223750	f	adan.reilly@example.com	t	2012-12-17 10:56:53.9879	2012-12-17 10:56:53.987903
83	Haylee	Metz	56	Grandparent	4126336316	f	haylee.metz@example.com	t	2012-12-17 10:56:53.989853	2012-12-17 10:56:53.989856
84	Letha	Metz	56	Grandparent	4125830472	t	letha.metz@example.com	t	2012-12-17 10:56:53.990019	2012-12-17 10:56:53.990021
85	Britney	Hammes	57	Uncustodial	4126448865	t	britney.hammes@example.com	t	2012-12-17 10:56:53.993556	2012-12-17 10:56:53.993559
86	Bernardo	Hammes	57	Father	4126650142	f	bernardo.hammes@example.com	t	2012-12-17 10:56:53.993713	2012-12-17 10:56:53.993715
87	Mose	Gerhold	58	Custodial	4128494845	f	mose.gerhold@example.com	t	2012-12-17 10:56:53.995977	2012-12-17 10:56:53.995979
88	Athena	Johnson	59	Grandparent	4122427283	f	athena.johnson@example.com	t	2012-12-17 10:56:53.9981	2012-12-17 10:56:53.998102
89	Reva	Johnson	59	Father	4121948144	t	reva.johnson@example.com	t	2012-12-17 10:56:53.998263	2012-12-17 10:56:53.998265
90	Melisa	Hauck	60	Mother	4129440558	t	melisa.hauck@example.com	t	2012-12-17 10:56:54.002262	2012-12-17 10:56:54.002266
91	Luis	Adams	61	Uncustodial	4121082396	t	luis.adams@example.com	t	2012-12-17 10:56:54.004454	2012-12-17 10:56:54.004456
92	Jo	Weissnat	62	Uncustodial	4127796347	t	jo.weissnat@example.com	t	2012-12-17 10:56:54.006514	2012-12-17 10:56:54.006516
93	Zita	Lemke	63	Custodial	4129545601	f	zita.lemke@example.com	t	2012-12-17 10:56:54.009316	2012-12-17 10:56:54.009318
94	Eliseo	Lemke	63	Grandparent	4121227784	t	eliseo.lemke@example.com	t	2012-12-17 10:56:54.009496	2012-12-17 10:56:54.009498
95	Annabell	Gerhold	64	Uncustodial	4128956747	t	annabell.gerhold@example.com	t	2012-12-17 10:56:54.011822	2012-12-17 10:56:54.011824
96	Sterling	Leuschke	65	Grandparent	4120207857	t	sterling.leuschke@example.com	t	2012-12-17 10:56:54.014283	2012-12-17 10:56:54.014285
97	Cara	Leuschke	65	Uncustodial	4122782749	f	cara.leuschke@example.com	t	2012-12-17 10:56:54.014447	2012-12-17 10:56:54.014449
98	Hailie	Dare	66	Custodial	4125341155	t	hailie.dare@example.com	t	2012-12-17 10:56:54.017531	2012-12-17 10:56:54.017533
99	Furman	Hessel	67	Grandparent	4126213057	f	furman.hessel@example.com	t	2012-12-17 10:56:54.019573	2012-12-17 10:56:54.019576
100	Robyn	Hessel	67	Grandparent	4125556488	t	robyn.hessel@example.com	t	2012-12-17 10:56:54.01973	2012-12-17 10:56:54.019732
101	Braeden	Greenholt	68	Uncustodial	4121173090	t	braeden.greenholt@example.com	t	2012-12-17 10:56:54.022385	2012-12-17 10:56:54.022388
102	Cory	Greenholt	68	Uncustodial	4120064028	t	cory.greenholt@example.com	t	2012-12-17 10:56:54.022541	2012-12-17 10:56:54.022543
103	Arnulfo	Kuvalis	69	Uncustodial	4123996073	t	arnulfo.kuvalis@example.com	t	2012-12-17 10:56:54.026153	2012-12-17 10:56:54.026157
104	Richmond	Kuvalis	69	Uncustodial	4121646684	t	richmond.kuvalis@example.com	t	2012-12-17 10:56:54.026351	2012-12-17 10:56:54.026353
105	Kara	Cormier	70	Uncustodial	4125292743	t	kara.cormier@example.com	t	2012-12-17 10:56:54.028876	2012-12-17 10:56:54.028879
106	Candice	Runolfsson	71	Mother	4129553348	t	candice.runolfsson@example.com	t	2012-12-17 10:56:54.03093	2012-12-17 10:56:54.030933
107	General	Runolfsson	71	Custodial	4129385964	t	general.runolfsson@example.com	t	2012-12-17 10:56:54.031088	2012-12-17 10:56:54.03109
108	Clemmie	Rolfson	72	Uncustodial	4126929868	t	clemmie.rolfson@example.com	t	2012-12-17 10:56:54.035159	2012-12-17 10:56:54.035162
109	Bernadine	Rolfson	72	Father	4125502667	f	bernadine.rolfson@example.com	t	2012-12-17 10:56:54.03535	2012-12-17 10:56:54.035352
110	Lesley	Bechtelar	73	Mother	4124909989	t	lesley.bechtelar@example.com	t	2012-12-17 10:56:54.038653	2012-12-17 10:56:54.038656
111	Christopher	Bechtelar	73	Grandparent	4124679493	t	christopher.bechtelar@example.com	t	2012-12-17 10:56:54.038846	2012-12-17 10:56:54.038848
112	Elvera	Hoeger	74	Custodial	4120209677	t	elvera.hoeger@example.com	t	2012-12-17 10:56:54.042559	2012-12-17 10:56:54.042562
113	Golden	Schuppe	75	Mother	4124070017	t	golden.schuppe@example.com	t	2012-12-17 10:56:54.044837	2012-12-17 10:56:54.04484
114	Virginie	Beatty	76	Grandparent	4120305658	t	virginie.beatty@example.com	t	2012-12-17 10:56:54.047273	2012-12-17 10:56:54.047276
115	Freeman	Moore	77	Father	4125783320	t	freeman.moore@example.com	t	2012-12-17 10:56:54.049347	2012-12-17 10:56:54.04935
116	Meta	Koelpin	78	Custodial	4123883171	t	meta.koelpin@example.com	t	2012-12-17 10:56:54.052118	2012-12-17 10:56:54.05212
117	Lacey	Hartmann	79	Custodial	4129750686	f	lacey.hartmann@example.com	t	2012-12-17 10:56:54.054204	2012-12-17 10:56:54.054206
118	Kendra	Hartmann	79	Grandparent	4124376905	t	kendra.hartmann@example.com	t	2012-12-17 10:56:54.054362	2012-12-17 10:56:54.054364
119	Ronaldo	Deckow	80	Uncustodial	4125638578	t	ronaldo.deckow@example.com	t	2012-12-17 10:56:54.056795	2012-12-17 10:56:54.056798
120	Alexis	Hudson	81	Father	4126561584	t	alexis.hudson@example.com	t	2012-12-17 10:56:54.05916	2012-12-17 10:56:54.059163
121	Beverly	Mohr	82	Uncustodial	4126131087	t	beverly.mohr@example.com	t	2012-12-17 10:56:54.061428	2012-12-17 10:56:54.061431
122	Justyn	Zieme	83	Father	4121281402	t	justyn.zieme@example.com	t	2012-12-17 10:56:54.063447	2012-12-17 10:56:54.063449
123	Suzanne	Zieme	83	Father	4122324538	t	suzanne.zieme@example.com	t	2012-12-17 10:56:54.063607	2012-12-17 10:56:54.063609
124	Davonte	DuBuque	84	Custodial	4124203751	t	davonte.dubuque@example.com	t	2012-12-17 10:56:54.066183	2012-12-17 10:56:54.066185
125	Ulises	DuBuque	84	Grandparent	4124344494	t	ulises.dubuque@example.com	t	2012-12-17 10:56:54.066344	2012-12-17 10:56:54.066346
126	Hubert	Schimmel	85	Grandparent	4126862130	f	hubert.schimmel@example.com	t	2012-12-17 10:56:54.068728	2012-12-17 10:56:54.068731
127	Margie	Schimmel	85	Uncustodial	4125653671	t	margie.schimmel@example.com	t	2012-12-17 10:56:54.068894	2012-12-17 10:56:54.068897
128	Kristoffer	Blick	86	Grandparent	4120597082	f	kristoffer.blick@example.com	t	2012-12-17 10:56:54.071245	2012-12-17 10:56:54.071248
129	Dixie	Blick	86	Custodial	4128523735	t	dixie.blick@example.com	t	2012-12-17 10:56:54.071401	2012-12-17 10:56:54.071403
130	Garry	Stamm	87	Grandparent	4129250582	f	garry.stamm@example.com	t	2012-12-17 10:56:54.073721	2012-12-17 10:56:54.073724
131	Shanel	Glover	88	Custodial	4129170178	t	shanel.glover@example.com	t	2012-12-17 10:56:54.075925	2012-12-17 10:56:54.075928
132	Elmore	Glover	88	Mother	4129201104	t	elmore.glover@example.com	t	2012-12-17 10:56:54.076091	2012-12-17 10:56:54.076093
133	Maximo	Quigley	89	Father	4120466876	t	maximo.quigley@example.com	t	2012-12-17 10:56:54.078509	2012-12-17 10:56:54.078512
134	Imogene	Quigley	89	Custodial	4120266481	t	imogene.quigley@example.com	t	2012-12-17 10:56:54.078669	2012-12-17 10:56:54.078671
135	Arnoldo	Prohaska	90	Grandparent	4125064790	t	arnoldo.prohaska@example.com	t	2012-12-17 10:56:54.081	2012-12-17 10:56:54.081003
136	Whitney	Renner	91	Uncustodial	4126365322	t	whitney.renner@example.com	t	2012-12-17 10:56:54.08462	2012-12-17 10:56:54.084622
137	Dusty	Paucek	92	Custodial	4125672291	t	dusty.paucek@example.com	t	2012-12-17 10:56:54.086769	2012-12-17 10:56:54.086772
138	Nola	Paucek	92	Grandparent	4122751126	f	nola.paucek@example.com	t	2012-12-17 10:56:54.086928	2012-12-17 10:56:54.086931
139	Casper	Fritsch	93	Mother	4121828611	t	casper.fritsch@example.com	t	2012-12-17 10:56:54.089277	2012-12-17 10:56:54.08928
140	Prudence	Fritsch	93	Grandparent	4129947474	t	prudence.fritsch@example.com	t	2012-12-17 10:56:54.089437	2012-12-17 10:56:54.089439
141	Jules	Heidenreich	94	Custodial	4121431240	t	jules.heidenreich@example.com	t	2012-12-17 10:56:54.091767	2012-12-17 10:56:54.091769
142	Lyda	Heidenreich	94	Father	4128071832	t	lyda.heidenreich@example.com	t	2012-12-17 10:56:54.091922	2012-12-17 10:56:54.091924
143	Chadrick	Blick	95	Uncustodial	4129861909	f	chadrick.blick@example.com	t	2012-12-17 10:56:54.094383	2012-12-17 10:56:54.094386
144	Ryder	Blick	95	Mother	4123131892	t	ryder.blick@example.com	t	2012-12-17 10:56:54.09455	2012-12-17 10:56:54.094552
145	Lon	Nikolaus	96	Mother	4120971845	t	lon.nikolaus@example.com	t	2012-12-17 10:56:54.096836	2012-12-17 10:56:54.096838
146	Chance	Nikolaus	96	Uncustodial	4127585090	t	chance.nikolaus@example.com	t	2012-12-17 10:56:54.096996	2012-12-17 10:56:54.096998
147	Marta	Renner	97	Grandparent	4126713157	t	marta.renner@example.com	t	2012-12-17 10:56:54.100349	2012-12-17 10:56:54.100352
148	Estell	Reinger	98	Uncustodial	4129527282	t	estell.reinger@example.com	t	2012-12-17 10:56:54.102647	2012-12-17 10:56:54.10265
149	Broderick	Christiansen	99	Custodial	4125766813	f	broderick.christiansen@example.com	t	2012-12-17 10:56:54.106146	2012-12-17 10:56:54.106149
150	Alexander	Fritsch	100	Uncustodial	4123306583	f	alexander.fritsch@example.com	t	2012-12-17 10:56:54.108573	2012-12-17 10:56:54.108576
\.


--
-- Data for Name: households; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY households (id, name, street, street2, city, zip, insurance_company, insurance_number, church, lat, lon, active, created_at, updated_at) FROM stdin;
1	Fritsch	90525 Ethelyn Causeway	\N	Pittsburgh	15222	Ut Fugiat	07221199	Accusamus	\N	\N	f	2012-12-17 10:56:52.310605	2012-12-17 10:56:52.310608
2	Hills	52192 Reichel Harbors	\N	Pittsburgh	15220	Ipsum Est	10910805	Reprehenderit	\N	\N	t	2012-12-17 10:56:52.59647	2012-12-17 10:56:52.596479
3	Connelly	705 Michael Rapid	\N	Pittsburgh	15213	Mollitia	11741689	Officiis	\N	\N	t	2012-12-17 10:56:52.598721	2012-12-17 10:56:52.598723
4	Wisoky	869 Bruen Islands	\N	Pittsburgh	15219	Qui	01319462	Quia	\N	\N	f	2012-12-17 10:56:52.602664	2012-12-17 10:56:52.602666
5	Wehner	21944 Blanda Ferry	70660 Davin Street	Pittsburgh	15203	Illo	08654811	Totam	\N	\N	f	2012-12-17 10:56:52.604831	2012-12-17 10:56:52.604833
6	Wehner	979 Stephen Mount	\N	Pittsburgh	15214	Eum	02719883	Corrupti	\N	\N	f	2012-12-17 10:56:52.609115	2012-12-17 10:56:52.609118
7	Rempel	963 Okuneva Courts	\N	Pittsburgh	15224	Ad	11188891	Dolores	\N	\N	f	2012-12-17 10:56:52.611358	2012-12-17 10:56:52.61136
8	Flatley	4626 Sofia Path	\N	Pittsburgh	15224	Sed Quia	15308708	Dolor	\N	\N	t	2012-12-17 10:56:52.616407	2012-12-17 10:56:52.616412
9	Cormier	68600 Hudson Radial	\N	Pittsburgh	15224	Suscipit	11940485	Qui	\N	\N	f	2012-12-17 10:56:52.618901	2012-12-17 10:56:52.618903
10	Casper	484 Kutch Plaza	3866 Bernier Turnpike	Pittsburgh	15220	A Laudantium	12499787	Minus	\N	\N	t	2012-12-17 10:56:52.699455	2012-12-17 10:56:52.69946
11	Walsh	52577 Krajcik Ramp	\N	Pittsburgh	15219	Corrupti Et	10551636	Ducimus	\N	\N	t	2012-12-17 10:56:52.702252	2012-12-17 10:56:52.702255
12	Ziemann	41706 Lazaro Camp	6984 Cartwright Prairie	Pittsburgh	15222	Ea	04273066	Aliquam	\N	\N	t	2012-12-17 10:56:52.704526	2012-12-17 10:56:52.704528
13	McLaughlin	8391 Matt Manors	\N	Pittsburgh	15214	Impedit	00754331	Amet	\N	\N	t	2012-12-17 10:56:52.70692	2012-12-17 10:56:52.706922
14	Reichert	485 Johnson Via	\N	Pittsburgh	15220	Odit Hic	03491320	Ratione	\N	\N	t	2012-12-17 10:56:52.709235	2012-12-17 10:56:52.709238
15	Wisoky	2664 Cecil Parkway	\N	Pittsburgh	15233	Ut Accusamus	09795805	Dicta	\N	\N	t	2012-12-17 10:56:52.711548	2012-12-17 10:56:52.711551
16	Klocko	728 Dane Forest	\N	Pittsburgh	15213	Eius	05199979	Consectetur	\N	\N	t	2012-12-17 10:56:52.713813	2012-12-17 10:56:52.713816
17	Jast	203 Brakus Ford	\N	Pittsburgh	15219	Consequuntur Dolores	10467019	Laborum	\N	\N	t	2012-12-17 10:56:52.716115	2012-12-17 10:56:52.716118
18	Barton	1807 Roberta Crest	\N	Pittsburgh	15224	Et	08853953	Qui	\N	\N	t	2012-12-17 10:56:52.720118	2012-12-17 10:56:52.720121
19	Predovic	9044 Floyd Key	\N	Pittsburgh	15214	Qui	11491526	Animi	\N	\N	t	2012-12-17 10:56:52.724399	2012-12-17 10:56:52.724403
20	O'Connell	4162 Rylee Plaza	\N	Pittsburgh	15213	Quia	00205323	Est	\N	\N	t	2012-12-17 10:56:52.729116	2012-12-17 10:56:52.729119
21	Swift	9511 Parisian Vista	\N	Pittsburgh	15224	Doloribus Maiores	11244465	Alias	\N	\N	t	2012-12-17 10:56:52.733428	2012-12-17 10:56:52.733431
22	White	734 Hettie Forge	\N	Pittsburgh	15222	Iste Mollitia	01973342	Deserunt	\N	\N	t	2012-12-17 10:56:52.73568	2012-12-17 10:56:52.735682
23	Ondricka	5536 Erica Route	\N	Pittsburgh	15204	Enim Sit	06718059	Rerum	\N	\N	t	2012-12-17 10:56:52.73778	2012-12-17 10:56:52.737783
24	Harvey	1739 Evie Village	\N	Pittsburgh	15222	Saepe	06948020	Consectetur	\N	\N	t	2012-12-17 10:56:52.74156	2012-12-17 10:56:52.741563
25	Jewess	215 Roberts Mount	\N	Pittsburgh	15213	Recusandae	06763901	Ipsam	\N	\N	f	2012-12-17 10:56:52.743739	2012-12-17 10:56:52.743742
26	Homenick	712 Linnie Village	63270 Fay Keys	Pittsburgh	15220	Ut	14119881	Libero	\N	\N	t	2012-12-17 10:56:52.745919	2012-12-17 10:56:52.745922
27	Maggio	36863 Wilderman Shores	\N	Pittsburgh	15212	Magnam	05098512	Veniam	\N	\N	t	2012-12-17 10:56:52.748223	2012-12-17 10:56:52.748226
28	McClure	993 Elvera Turnpike	\N	Pittsburgh	15213	Consequatur Excepturi	05969273	Dolor	\N	\N	t	2012-12-17 10:56:52.750402	2012-12-17 10:56:52.750404
29	Greenfelder	964 Kub Land	95245 Lynch Brooks	Pittsburgh	15222	Repellendus Dignissimos	10625327	Quos	\N	\N	t	2012-12-17 10:56:52.752635	2012-12-17 10:56:52.752637
30	Nicolas	6103 Sporer Knoll	\N	Pittsburgh	15213	Recusandae Ut	04997678	Nostrum	\N	\N	f	2012-12-17 10:56:52.754994	2012-12-17 10:56:52.754996
31	Mayer	4237 King Branch	\N	Pittsburgh	15220	Ipsam	06643311	Qui	\N	\N	f	2012-12-17 10:56:52.758806	2012-12-17 10:56:52.758808
32	Daniel	96804 Stamm Viaduct	\N	Pittsburgh	15214	Blanditiis Numquam	05270499	Et	\N	\N	t	2012-12-17 10:56:52.760939	2012-12-17 10:56:52.760941
33	Hoeger	4732 Leatha Mill	\N	Pittsburgh	15203	Quis Magnam	15122859	Provident	\N	\N	t	2012-12-17 10:56:52.764807	2012-12-17 10:56:52.764809
34	Douglas	132 Spencer Passage	302 Von Spurs	Pittsburgh	15219	Reprehenderit	02937586	Molestias	\N	\N	f	2012-12-17 10:56:52.768565	2012-12-17 10:56:52.768567
35	Glover	414 Runte Centers	\N	Pittsburgh	15219	Eveniet	08394253	Ut	\N	\N	t	2012-12-17 10:56:52.770837	2012-12-17 10:56:52.770839
36	Schinner	8455 Lubowitz Lakes	108 Lelia Lake	Pittsburgh	15136	Quod Ratione	09197966	Et	\N	\N	t	2012-12-17 10:56:52.774711	2012-12-17 10:56:52.774713
37	Heidenreich	39643 Cristina Glen	\N	Pittsburgh	15204	Ad	00455490	Doloremque	\N	\N	t	2012-12-17 10:56:52.779059	2012-12-17 10:56:52.779061
38	Zemlak	71293 Frami Cape	\N	Pittsburgh	15203	Molestiae	15281279	Porro	\N	\N	t	2012-12-17 10:56:52.78301	2012-12-17 10:56:52.783012
39	Emmerich	2921 Cedrick Crossroad	\N	Pittsburgh	15204	Corrupti	10319849	Dolorem	\N	\N	t	2012-12-17 10:56:52.785163	2012-12-17 10:56:52.785165
40	Stanton	976 Strosin Freeway	811 Kyle Mountains	Pittsburgh	15219	Accusamus Qui	04248425	Fugiat	\N	\N	t	2012-12-17 10:56:52.789025	2012-12-17 10:56:52.789027
41	Jacobi	8031 Jadyn Glen	\N	Pittsburgh	15203	Corporis Tempora	00318932	Sint	\N	\N	t	2012-12-17 10:56:52.791336	2012-12-17 10:56:52.791338
42	Bruen	382 Loyce Village	7717 Antwan Camp	Pittsburgh	15224	Quibusdam Vitae	06972768	Eaque	\N	\N	t	2012-12-17 10:56:52.793488	2012-12-17 10:56:52.79349
43	Ernser	876 Precious Ridges	\N	Pittsburgh	15222	Deserunt Provident	11638148	Officia	\N	\N	f	2012-12-17 10:56:52.797571	2012-12-17 10:56:52.797573
44	Kunde	7934 Ashleigh Club	78922 Kulas Viaduct	Pittsburgh	15233	Non	06663444	Aut	\N	\N	t	2012-12-17 10:56:52.799753	2012-12-17 10:56:52.799755
45	Champlin	316 Mills Locks	\N	Pittsburgh	15204	Officiis	09955410	Corporis	\N	\N	t	2012-12-17 10:56:52.881424	2012-12-17 10:56:52.881427
46	Jones	74691 Teagan Coves	\N	Pittsburgh	15214	Reiciendis	09847700	Dicta	\N	\N	t	2012-12-17 10:56:52.885778	2012-12-17 10:56:52.88578
47	Mraz	58630 Teresa Light	\N	Pittsburgh	15224	Perferendis	12418077	Enim	\N	\N	t	2012-12-17 10:56:52.888071	2012-12-17 10:56:52.888074
48	Lockman	9791 Eldred Isle	\N	Pittsburgh	15136	Facere Voluptatem	09037122	Aspernatur	\N	\N	f	2012-12-17 10:56:52.890308	2012-12-17 10:56:52.89031
49	Runte	63157 Asa Wall	\N	Pittsburgh	15212	Quam Explicabo	12703638	Ea	\N	\N	t	2012-12-17 10:56:52.892528	2012-12-17 10:56:52.892531
50	Haag	621 Miller Greens	\N	Pittsburgh	15204	Optio	07830049	Sapiente	\N	\N	t	2012-12-17 10:56:52.896653	2012-12-17 10:56:52.896655
51	Jacobs	38767 Quigley Flat	\N	Pittsburgh	15214	Quia	12218852	Laborum	\N	\N	t	2012-12-17 10:56:52.900962	2012-12-17 10:56:52.900964
52	Friesen	388 Deckow Centers	1286 Vena Tunnel	Pittsburgh	15201	Asperiores Illo	00496021	Nesciunt	\N	\N	t	2012-12-17 10:56:52.904905	2012-12-17 10:56:52.904907
53	Mante	98078 Smitham Mews	228 McKenzie Circles	Pittsburgh	15212	Quia Deleniti	07816262	Dignissimos	\N	\N	t	2012-12-17 10:56:52.908868	2012-12-17 10:56:52.90887
54	O'Hara	54504 Runte Canyon	91166 Fay Estate	Pittsburgh	15136	Repellendus Consequuntur	13845130	Vel	\N	\N	t	2012-12-17 10:56:52.911154	2012-12-17 10:56:52.911156
55	Reilly	67140 Bode Corner	\N	Pittsburgh	15224	Maxime	13135907	Possimus	\N	\N	t	2012-12-17 10:56:52.913446	2012-12-17 10:56:52.913448
56	Metz	27850 Jasmin Field	\N	Pittsburgh	15212	Distinctio	14088493	Ratione	\N	\N	t	2012-12-17 10:56:52.915668	2012-12-17 10:56:52.915671
57	Hammes	11189 Auer Radial	2824 Neal Flats	Pittsburgh	15222	Distinctio	03600955	Exercitationem	\N	\N	t	2012-12-17 10:56:52.917855	2012-12-17 10:56:52.917857
58	Gerhold	9263 Farrell Field	\N	Pittsburgh	15224	Eveniet Possimus	11956180	Voluptates	\N	\N	t	2012-12-17 10:56:52.921884	2012-12-17 10:56:52.921887
59	Johnson	467 Adan Isle	\N	Pittsburgh	15201	Non Modi	03915739	Provident	\N	\N	t	2012-12-17 10:56:52.924056	2012-12-17 10:56:52.924059
60	Hauck	84039 Ryder Keys	\N	Pittsburgh	15233	Officia Ab	12454533	Doloremque	\N	\N	t	2012-12-17 10:56:52.926198	2012-12-17 10:56:52.926201
61	Adams	27370 Thiel Glens	\N	Pittsburgh	15204	Dicta	06741746	Totam	\N	\N	t	2012-12-17 10:56:52.93004	2012-12-17 10:56:52.930043
62	Weissnat	90786 Jaleel Court	6053 Anastacio Fork	Pittsburgh	15222	Veritatis	08142874	Quod	\N	\N	t	2012-12-17 10:56:52.9322	2012-12-17 10:56:52.932203
63	Lemke	275 Feeney Via	\N	Pittsburgh	15224	Distinctio Recusandae	12961376	Reprehenderit	\N	\N	f	2012-12-17 10:56:52.936219	2012-12-17 10:56:52.936221
64	Gerhold	9570 Shanie Trafficway	7243 Ramona Centers	Pittsburgh	15212	Magni	06353226	Est	\N	\N	f	2012-12-17 10:56:52.939992	2012-12-17 10:56:52.939994
65	Leuschke	834 Grady Walk	\N	Pittsburgh	15214	Quasi Aut	05003288	Dolor	\N	\N	t	2012-12-17 10:56:52.943987	2012-12-17 10:56:52.943989
66	Dare	575 Schroeder Squares	\N	Pittsburgh	15212	Et	15998819	Rerum	\N	\N	t	2012-12-17 10:56:52.947854	2012-12-17 10:56:52.947856
67	Hessel	1478 Leilani Plaza	\N	Pittsburgh	15212	Qui	12045256	Occaecati	\N	\N	t	2012-12-17 10:56:52.951679	2012-12-17 10:56:52.951681
68	Greenholt	62567 Delphia View	9189 Spencer Spring	Pittsburgh	15212	Dolores	01196428	Sit	\N	\N	t	2012-12-17 10:56:52.955442	2012-12-17 10:56:52.955444
69	Kuvalis	60947 Mitchell Ways	\N	Pittsburgh	15219	In	02988267	Repellat	\N	\N	t	2012-12-17 10:56:52.959381	2012-12-17 10:56:52.959384
70	Cormier	1343 Mallory Spurs	\N	Pittsburgh	15222	Cupiditate Voluptas	13801642	Nihil	\N	\N	t	2012-12-17 10:56:52.961471	2012-12-17 10:56:52.961473
71	Runolfsson	4749 Craig Skyway	\N	Pittsburgh	15203	Placeat	00346733	Qui	\N	\N	t	2012-12-17 10:56:52.963641	2012-12-17 10:56:52.963644
72	Rolfson	6652 Dare Plains	\N	Pittsburgh	15214	Voluptatem Sed	15170238	Explicabo	\N	\N	t	2012-12-17 10:56:52.967462	2012-12-17 10:56:52.967464
73	Bechtelar	517 Sadye Forest	\N	Pittsburgh	15222	Expedita	13262906	Sequi	\N	\N	t	2012-12-17 10:56:52.971225	2012-12-17 10:56:52.971228
74	Hoeger	764 Macie Ford	\N	Pittsburgh	15222	Doloribus	05032956	Vitae	\N	\N	f	2012-12-17 10:56:52.974985	2012-12-17 10:56:52.974987
75	Schuppe	583 Rutherford Isle	\N	Pittsburgh	15203	Numquam	07443911	Pariatur	\N	\N	f	2012-12-17 10:56:52.97719	2012-12-17 10:56:52.977192
76	Beatty	2809 Strosin Port	86075 Daisha Extensions	Pittsburgh	15222	Accusantium	02603229	Quae	\N	\N	f	2012-12-17 10:56:53.059437	2012-12-17 10:56:53.05944
77	Moore	33739 Schaefer Lock	\N	Pittsburgh	15219	Deserunt	10979933	Quia	\N	\N	t	2012-12-17 10:56:53.063909	2012-12-17 10:56:53.063911
78	Koelpin	74021 Emard Crescent	\N	Pittsburgh	15201	Molestiae	05663405	Ut	\N	\N	t	2012-12-17 10:56:53.066262	2012-12-17 10:56:53.066264
79	Hartmann	5552 Michaela Stravenue	\N	Pittsburgh	15220	Similique Harum	08143088	Nihil	\N	\N	t	2012-12-17 10:56:53.06857	2012-12-17 10:56:53.068572
80	Deckow	661 Runolfsdottir Harbors	\N	Pittsburgh	15203	Est Et	02326297	Ab	\N	\N	t	2012-12-17 10:56:53.070866	2012-12-17 10:56:53.070868
81	Hudson	66533 Lempi Ramp	\N	Pittsburgh	15222	Quis	14600743	Eius	\N	\N	t	2012-12-17 10:56:53.073122	2012-12-17 10:56:53.073124
82	Mohr	2877 Harvey Falls	\N	Pittsburgh	15219	At	03245653	Aut	\N	\N	t	2012-12-17 10:56:53.075366	2012-12-17 10:56:53.075368
83	Zieme	47846 Braun Park	\N	Pittsburgh	15224	Commodi Repellendus	03464505	Voluptate	\N	\N	t	2012-12-17 10:56:53.077535	2012-12-17 10:56:53.077537
84	DuBuque	5602 Asa Shoals	33589 Prosacco Shores	Pittsburgh	15201	Animi Laborum	08251007	Sit	\N	\N	t	2012-12-17 10:56:53.07972	2012-12-17 10:56:53.079722
85	Schimmel	84074 Jacobi Pass	\N	Pittsburgh	15220	Culpa Nemo	13945174	Voluptatem	\N	\N	t	2012-12-17 10:56:53.083876	2012-12-17 10:56:53.083879
86	Blick	626 Cassandra Isle	\N	Pittsburgh	15203	Voluptas Est	11938412	Qui	\N	\N	t	2012-12-17 10:56:53.086069	2012-12-17 10:56:53.086071
87	Stamm	9598 Armand Pike	\N	Pittsburgh	15136	Deleniti Earum	07694834	Corrupti	\N	\N	t	2012-12-17 10:56:53.08824	2012-12-17 10:56:53.088243
88	Glover	507 Bernhard Alley	\N	Pittsburgh	15201	Est	11029702	Et	\N	\N	t	2012-12-17 10:56:53.09211	2012-12-17 10:56:53.092112
89	Quigley	1892 Brakus Plains	4830 Nader Lane	Pittsburgh	15212	Maxime Magni	02777029	Dolor	\N	\N	t	2012-12-17 10:56:53.094239	2012-12-17 10:56:53.094241
90	Prohaska	1630 Paula Courts	1287 Boyer Estate	Pittsburgh	15220	Corporis Saepe	05831055	Ad	\N	\N	t	2012-12-17 10:56:53.096558	2012-12-17 10:56:53.09656
91	Renner	953 Reilly Dam	\N	Pittsburgh	15136	Ipsa	07879900	Repudiandae	\N	\N	f	2012-12-17 10:56:53.1005	2012-12-17 10:56:53.100502
92	Paucek	91101 Chanel Squares	58727 Raynor Grove	Pittsburgh	15233	Nihil Tempora	08249759	Qui	\N	\N	t	2012-12-17 10:56:53.10425	2012-12-17 10:56:53.104252
93	Fritsch	630 Demarco Point	\N	Pittsburgh	15212	Blanditiis Sunt	01383923	Laboriosam	\N	\N	t	2012-12-17 10:56:53.106593	2012-12-17 10:56:53.106595
94	Heidenreich	13749 Wilson Isle	\N	Pittsburgh	15219	Ducimus	15895256	Tempora	\N	\N	t	2012-12-17 10:56:53.108861	2012-12-17 10:56:53.108863
95	Blick	950 Keeling Valleys	\N	Pittsburgh	15214	Natus	06457702	Et	\N	\N	t	2012-12-17 10:56:53.112881	2012-12-17 10:56:53.112883
96	Nikolaus	70052 Rau Ranch	\N	Pittsburgh	15203	Modi Pariatur	10261803	Explicabo	\N	\N	t	2012-12-17 10:56:53.116688	2012-12-17 10:56:53.11669
97	Renner	5138 Prohaska Mall	\N	Pittsburgh	15214	Recusandae Quod	12118023	Maxime	\N	\N	f	2012-12-17 10:56:53.120431	2012-12-17 10:56:53.120433
98	Reinger	9718 Andres Cliff	882 Guadalupe Plaza	Pittsburgh	15201	Quidem Et	13361748	Animi	\N	\N	t	2012-12-17 10:56:53.124236	2012-12-17 10:56:53.124238
99	Christiansen	94549 Wilkinson Isle	\N	Pittsburgh	15222	Ad	08911504	Maiores	\N	\N	f	2012-12-17 10:56:53.128288	2012-12-17 10:56:53.12829
100	Fritsch	775 Shawn Land	\N	Pittsburgh	15224	Dolor	12075202	Asperiores	\N	\N	t	2012-12-17 10:56:53.132053	2012-12-17 10:56:53.132055
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY locations (id, name, street, city, zip, lat, lon, active, created_at, updated_at) FROM stdin;
1	UIF - Union Place	801 Union Place	Pittsburgh	15212	\N	\N	t	2012-12-17 10:56:51.974397	2012-12-17 10:56:51.974397
2	Carnegie Mellon	5000 Forbes Avenue	Pittsburgh	15213	\N	\N	t	2012-12-17 10:56:51.980749	2012-12-17 10:56:51.980749
3	Convention Center	1000 Fort Duquesne Blvd	Pittsburgh	15222	\N	\N	t	2012-12-17 10:56:51.986913	2012-12-17 10:56:51.986913
4	Point State Park	101 Commonwealth Place	Pittsburgh	15222	\N	\N	t	2012-12-17 10:56:51.990903	2012-12-17 10:56:51.990903
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY notes (id, user_id, date, title, contents, notable_type, notable_id, priority, active, created_at, updated_at) FROM stdin;
1	1	2012-12-17	Tiana's dealing with insecurities	Typical teenage issues, but will need some counseling	Student	122	2	t	2012-12-17 12:11:44.528847	2012-12-17 12:11:44.528847
2	1	2012-12-17	Hit another student	Lavon has been suspended indefinitely because of his propensity to hit other students.	Student	86	1	t	2012-12-17 12:12:51.620867	2012-12-17 12:12:51.620867
3	1	2012-12-17	Third Floor only	The choir is restricted to the third floor -- no one is allowed outside.	Event	22	3	t	2012-12-17 12:13:50.864361	2012-12-17 12:13:50.864361
4	1	2012-12-17	Need to add additional sections	There is a lot more here (like the bucket band) that is just not covered yet.	Event	21	3	t	2012-12-17 12:15:51.973479	2012-12-17 12:15:51.973479
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY programs (id, name, description, department_id, min_grade, max_grade, active, max_capacity, start_date, end_date, scan_by_absence, created_at, updated_at) FROM stdin;
1	Performing Arts Academy	Et ut animi et et nemo sed ullam ullam ullam et molestiae molestias inventore laboriosam. Eius ut in aperiam asperiores qui et dicta quisquam rerum error aut non eaque accusantium et illo possimus eaque sint. Suscipit voluptatem minus ut et quis. Maxime recusandae et nobis amet quia laborum perferendis sint reiciendis voluptates sed sequi. Voluptatum voluptates ut id ut amet et magnam. Dolorem ut ipsum porro et. Consequatur aut eveniet ut eum velit totam ipsum officiis est voluptatem in et dolores et sed ut dicta eligendi quam	1	1	12	t	95	2011-09-19	\N	f	2012-12-17 10:56:52.019188	2012-12-17 10:56:52.019188
2	Urban Impact Choir	Ipsum numquam est vero dolores non voluptatem. Et id commodi optio dicta pariatur aliquid alias mollitia sint vel distinctio. Et est culpa quidem quasi omnis sit facilis corrupti laudantium voluptate sint quidem corporis ut unde praesentium quo veniam debitis. Molestiae aut accusantium qui aliquam voluptatem. Id quo voluptatem explicabo ducimus. Eos error amet sint sed ratione. Autem quod qui voluptas vitae esse repudiandae tenetur eum rerum	1	6	12	t	95	2011-02-25	\N	t	2012-12-17 10:56:52.027115	2012-12-17 10:56:52.027115
4	Urban Impact Singers	Sit quia similique minus deserunt voluptate repellendus mollitia eaque vel facere quisquam. Totam amet dolore quisquam perspiciatis qui dolorem doloribus at libero est voluptatibus in totam cum consequatur alias quo sit. Rem incidunt laboriosam expedita qui eaque repudiandae dolores est dolorem pariatur id tempore. Adipisci nostrum iusto quisquam et ad cupiditate in voluptas aliquam nihil unde autem ut et qui. Enim debitis in qui laudantium sunt laborum sunt error. Rem hic qui velit rerum dignissimos quasi molestiae reprehenderit saepe expedita quod exercitationem saepe aliquam ex soluta ut eos praesentium. Laboriosam natus voluptates consequatur itaque aut in minima dicta dicta beatae dolorum laudantium. Enim eum unde et quia non. Alias nihil omnis earum sequi	1	8	12	f	70	2012-07-28	2012-10-23	f	2012-12-17 10:56:52.038627	2012-12-17 10:56:52.038627
5	Urban Impact Shakes	Dolor consectetur recusandae dolorum consequatur. Perferendis minima nobis ducimus consectetur sunt facere tempore voluptates sint ut. Beatae eum cupiditate et culpa vel sit dolores velit animi amet qui ratione iusto. Debitis qui dolores aut ipsum dolorum ut dolorem blanditiis fuga modi consectetur aut consequatur quibusdam eum doloribus inventore. Eligendi magni fugit eius qui molestias et autem sit sed voluptate distinctio et eos eveniet quam qui voluptatem explicabo omnis	1	8	12	t	90	2011-03-19	\N	f	2012-12-17 10:56:52.044033	2012-12-17 10:56:52.044033
6	Intramural Basketball	Ratione excepturi eaque veritatis voluptas dolores quia quae voluptatum at suscipit alias. Est laboriosam suscipit dolor vero magni aliquid reiciendis quia quidem quis possimus quibusdam voluptatem ab nihil odit. Voluptatem necessitatibus non ea quos quo eveniet vero culpa neque qui voluptas sunt accusamus tenetur ducimus. Odit impedit ex consequatur iure aut eos voluptas aut odit architecto perferendis provident fuga sed voluptas facilis nostrum et voluptatum. Consequatur dolorum voluptas inventore facere recusandae sapiente aut ipsam eaque veniam aut minus eum. Ea voluptatem autem accusamus numquam officia beatae et qui optio quaerat similique cumque. Eveniet dolor qui aspernatur est et tempora dolores voluptate non ipsa consequuntur odio quo sit eveniet dolor	2	1	12	t	65	2012-04-28	\N	f	2012-12-17 10:56:52.113842	2012-12-17 10:56:52.113842
7	High School Travel Basketball Teams	Magni deleniti maiores laboriosam odit quia natus molestias maxime blanditiis autem quia sit repellat. Culpa quibusdam rerum laborum et praesentium non. Sit culpa id reiciendis aut. Et fugit voluptatibus praesentium est explicabo aut error ipsa sit et adipisci illum vero. Et repellendus amet ullam aut officiis dolore. Ut non quis cum voluptate. Exercitationem esse perspiciatis temporibus sit rerum omnis quia doloremque ducimus vero quibusdam distinctio sit sit pariatur voluptatem doloribus et. Culpa fugiat enim quis quia sed. In id qui sequi id dolores sit soluta omnis dolor nostrum recusandae dolorem natus natus	2	9	12	t	90	2011-07-06	\N	f	2012-12-17 10:56:52.119839	2012-12-17 10:56:52.119839
8	Middle School Travel Basketball Teams	Accusamus vitae id id tempora quo dicta qui ab debitis officia nihil sed autem non repellendus. Sit porro sunt ut nesciunt nulla voluptates harum asperiores dolorem quod quod. Voluptatum quia ut qui magnam explicabo hic reiciendis. Reprehenderit nisi rerum iusto et minima assumenda voluptatem labore sunt qui nihil eos quisquam fuga nihil quis quam. Autem recusandae ad qui maiores perferendis sed suscipit voluptate necessitatibus repellat est. Sit mollitia qui quasi excepturi nulla hic aut itaque neque qui modi sapiente commodi recusandae. Maxime a esse nisi rerum eius veritatis dolorem quo aperiam tempore veniam. Velit temporibus inventore in enim odio sit corrupti sint nostrum dolor atque dolor atque. Quas a id debitis deserunt dolor possimus tempore eos alias est. Illum illum voluptatem est quidem aliquam qui omnis reprehenderit ducimus est ipsa delectus repellat vel esse	2	6	8	f	100	2012-08-06	2012-11-08	f	2012-12-17 10:56:52.126602	2012-12-17 10:56:52.126602
9	Boys HS & MS Basketball Leagues	Necessitatibus architecto porro molestiae est minima quibusdam unde reiciendis aut. Aliquam eum laboriosam corporis veniam repellendus error. Cumque sequi praesentium sint labore dolores aut et et quo qui placeat perspiciatis qui asperiores veniam quas fugit impedit. Doloremque pariatur quia et enim modi	2	6	12	f	60	2011-11-09	2012-12-07	f	2012-12-17 10:56:52.132332	2012-12-17 10:56:52.132332
10	Baseball	Dolorem sequi est dolore sed at mollitia eaque similique. Suscipit aut aut minima officiis rerum culpa omnis qui. Velit saepe illo omnis dolores veritatis natus aspernatur sit eius ea hic. Autem sit sed ullam autem adipisci autem aspernatur. Corporis voluptas necessitatibus fuga quis animi delectus debitis occaecati. Molestiae aliquam eum consectetur beatae cumque. Sequi nam deserunt vel nisi aut aut voluptas ducimus aut ut	2	1	8	f	65	2011-03-23	2012-11-16	f	2012-12-17 10:56:52.138166	2012-12-17 10:56:52.138166
11	Soccer	Adipisci labore veritatis quis voluptatem tempora reprehenderit repellendus qui odit aut doloremque architecto qui in eos repellendus aliquid voluptate repellat. Et quia recusandae culpa quibusdam cum accusamus dolore eaque alias labore assumenda a. Quis et assumenda quisquam repellendus non accusantium fugiat ea non ab corporis et totam dolores et nihil. Dolor consequatur maiores quisquam neque rerum consectetur molestias corporis voluptatem est nihil dicta sed dolor velit. Omnis quos quia temporibus consequatur nulla dolorem ex quaerat sed magni qui asperiores et eaque distinctio aspernatur perferendis totam ea	2	1	8	t	60	2012-01-02	\N	f	2012-12-17 10:56:52.145656	2012-12-17 10:56:52.145656
12	SAT Classes	Nesciunt autem hic occaecati qui eos voluptatem quidem ea. Hic alias incidunt beatae unde nisi recusandae impedit harum. Accusantium molestiae asperiores dicta ex amet asperiores fugit totam hic quisquam vitae sit esse libero voluptatum et consequatur sed perferendis. Cum dolore consequatur molestiae eveniet. Quam quaerat quidem explicabo corporis vitae impedit ipsa pariatur deserunt quis culpa. Saepe cumque explicabo similique ipsam repellendus sequi eos nam ipsam voluptates expedita cupiditate facilis rem itaque. Suscipit quos enim molestias nemo voluptate non beatae ratione	3	10	12	t	100	2011-03-20	\N	f	2012-12-17 10:56:52.151537	2012-12-17 10:56:52.151537
13	Summer Day Camp	Soluta quo porro qui magnam et eos illum similique incidunt. Cum quia officiis ab in quasi cum commodi quas. Recusandae modi quos distinctio maxime suscipit aut aut atque saepe iure	3	1	12	f	75	2012-05-20	2012-11-11	f	2012-12-17 10:56:52.157277	2012-12-17 10:56:52.157277
3	UIF Children's Choir	Tempore sed nisi earum id quas. Non dicta veritatis aut sed minima dolores	1	1	5	t	95	2012-05-08	\N	t	2012-12-17 10:56:52.03273	2012-12-17 11:11:04.330698
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: urban_impact
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
20121120191614
20121121094204
20121130034918
20121205221245
\.


--
-- Data for Name: section_events; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY section_events (id, section_id, event_id, created_at, updated_at) FROM stdin;
1	14	1	2012-12-17 10:56:52.285217	2012-12-17 10:56:52.28522
2	2	2	2012-12-17 10:56:52.286052	2012-12-17 10:56:52.286055
3	22	3	2012-12-17 10:56:52.286451	2012-12-17 10:56:52.286454
4	20	4	2012-12-17 10:56:52.287051	2012-12-17 10:56:52.287053
5	4	5	2012-12-17 10:56:52.287451	2012-12-17 10:56:52.287453
6	9	6	2012-12-17 10:56:52.287855	2012-12-17 10:56:52.287857
7	15	7	2012-12-17 10:56:52.288343	2012-12-17 10:56:52.288345
8	4	8	2012-12-17 10:56:52.288742	2012-12-17 10:56:52.288744
9	7	9	2012-12-17 10:56:52.289103	2012-12-17 10:56:52.289105
10	11	10	2012-12-17 10:56:52.289646	2012-12-17 10:56:52.289648
11	15	11	2012-12-17 10:56:52.290118	2012-12-17 10:56:52.290121
12	21	12	2012-12-17 10:56:52.290716	2012-12-17 10:56:52.290719
13	8	13	2012-12-17 10:56:52.29131	2012-12-17 10:56:52.291312
14	18	14	2012-12-17 10:56:52.29177	2012-12-17 10:56:52.291772
15	21	15	2012-12-17 10:56:52.292374	2012-12-17 10:56:52.292376
16	12	16	2012-12-17 10:56:52.292732	2012-12-17 10:56:52.292734
17	19	17	2012-12-17 10:56:52.293339	2012-12-17 10:56:52.293341
18	4	18	2012-12-17 10:56:52.293731	2012-12-17 10:56:52.293733
19	19	19	2012-12-17 10:56:52.294332	2012-12-17 10:56:52.294334
20	9	20	2012-12-17 10:56:52.294728	2012-12-17 10:56:52.29473
21	1	21	2012-12-17 10:59:36.603293	2012-12-17 10:59:36.603293
22	2	22	2012-12-17 11:00:06.539241	2012-12-17 11:00:06.539241
23	4	23	2012-12-17 11:57:25.697292	2012-12-17 11:57:25.697292
24	2	24	2012-12-17 12:06:23.190938	2012-12-17 12:06:23.190938
25	2	25	2012-12-17 12:07:48.654873	2012-12-17 12:07:48.654873
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY sections (id, name, program_id, max_capacity, active, created_at, updated_at) FROM stdin;
1	Music	1	60	t	2012-12-17 10:56:52.177957	2012-12-17 10:56:52.177957
2	Main	2	55	t	2012-12-17 10:56:52.184365	2012-12-17 10:56:52.184365
3	Secondary	2	40	t	2012-12-17 10:56:52.188713	2012-12-17 10:56:52.188713
4	Main	3	30	t	2012-12-17 10:56:52.193849	2012-12-17 10:56:52.193849
5	Main	4	30	t	2012-12-17 10:56:52.198018	2012-12-17 10:56:52.198018
6	Secondary	4	20	t	2012-12-17 10:56:52.202084	2012-12-17 10:56:52.202084
7	Tertiary	4	50	t	2012-12-17 10:56:52.206056	2012-12-17 10:56:52.206056
8	Main	5	60	t	2012-12-17 10:56:52.210106	2012-12-17 10:56:52.210106
9	Novice	6	30	t	2012-12-17 10:56:52.213478	2012-12-17 10:56:52.213478
10	Intermediate	6	25	t	2012-12-17 10:56:52.216872	2012-12-17 10:56:52.216872
11	Novice	7	45	t	2012-12-17 10:56:52.220262	2012-12-17 10:56:52.220262
12	Novice	8	50	t	2012-12-17 10:56:52.223663	2012-12-17 10:56:52.223663
13	Intermediate	8	20	t	2012-12-17 10:56:52.227711	2012-12-17 10:56:52.227711
14	Advanced	8	60	t	2012-12-17 10:56:52.23154	2012-12-17 10:56:52.23154
15	Novice	9	45	t	2012-12-17 10:56:52.235682	2012-12-17 10:56:52.235682
16	Novice	10	45	t	2012-12-17 10:56:52.239154	2012-12-17 10:56:52.239154
17	Intermediate	10	30	t	2012-12-17 10:56:52.242851	2012-12-17 10:56:52.242851
18	Novice	11	55	t	2012-12-17 10:56:52.246365	2012-12-17 10:56:52.246365
19	Main	12	60	t	2012-12-17 10:56:52.250268	2012-12-17 10:56:52.250268
20	Secondary	12	25	t	2012-12-17 10:56:52.254287	2012-12-17 10:56:52.254287
21	Tertiary	12	50	t	2012-12-17 10:56:52.259064	2012-12-17 10:56:52.259064
22	Main	13	30	t	2012-12-17 10:56:52.263006	2012-12-17 10:56:52.263006
\.


--
-- Data for Name: student_allergies; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY student_allergies (id, student_id, allergy_id, created_at, updated_at) FROM stdin;
1	122	7	2012-12-17 10:56:53.799641	2012-12-17 10:56:53.799645
2	33	12	2012-12-17 10:56:53.799708	2012-12-17 10:56:53.79971
3	115	5	2012-12-17 10:56:53.799741	2012-12-17 10:56:53.799743
4	87	10	2012-12-17 10:56:53.799774	2012-12-17 10:56:53.799776
5	52	3	2012-12-17 10:56:53.799806	2012-12-17 10:56:53.799808
6	16	4	2012-12-17 10:56:53.799838	2012-12-17 10:56:53.79984
7	86	11	2012-12-17 10:56:53.799871	2012-12-17 10:56:53.799872
8	128	1	2012-12-17 10:56:53.799902	2012-12-17 10:56:53.799904
9	10	11	2012-12-17 10:56:53.799934	2012-12-17 10:56:53.799936
10	114	10	2012-12-17 10:56:53.799967	2012-12-17 10:56:53.79997
11	119	6	2012-12-17 10:56:53.800001	2012-12-17 10:56:53.800003
12	73	7	2012-12-17 10:56:53.800033	2012-12-17 10:56:53.800035
13	135	13	2012-12-17 10:56:53.800066	2012-12-17 10:56:53.800068
14	58	11	2012-12-17 10:56:53.800099	2012-12-17 10:56:53.800101
15	59	6	2012-12-17 10:56:53.800132	2012-12-17 10:56:53.800134
16	11	12	2012-12-17 10:56:53.800165	2012-12-17 10:56:53.800167
17	129	16	2012-12-17 10:56:53.800198	2012-12-17 10:56:53.8002
18	25	7	2012-12-17 10:56:53.80023	2012-12-17 10:56:53.800232
19	31	5	2012-12-17 10:56:53.800265	2012-12-17 10:56:53.800267
20	65	10	2012-12-17 10:56:53.800298	2012-12-17 10:56:53.8003
21	143	16	2012-12-17 10:56:53.800331	2012-12-17 10:56:53.800333
22	6	13	2012-12-17 10:56:53.800364	2012-12-17 10:56:53.800365
23	103	4	2012-12-17 10:56:53.800396	2012-12-17 10:56:53.800398
24	58	13	2012-12-17 10:56:53.80043	2012-12-17 10:56:53.800431
25	105	16	2012-12-17 10:56:53.800462	2012-12-17 10:56:53.800464
26	38	12	2012-12-17 10:56:53.800495	2012-12-17 10:56:53.800497
27	45	12	2012-12-17 10:56:53.800527	2012-12-17 10:56:53.800529
28	43	8	2012-12-17 10:56:53.800561	2012-12-17 10:56:53.800563
29	86	12	2012-12-17 10:56:53.800594	2012-12-17 10:56:53.800596
30	101	3	2012-12-17 10:56:53.800626	2012-12-17 10:56:53.800628
31	121	18	2012-12-17 10:56:53.800659	2012-12-17 10:56:53.800661
32	65	5	2012-12-17 10:56:53.800692	2012-12-17 10:56:53.800694
33	142	16	2012-12-17 10:56:53.800724	2012-12-17 10:56:53.800726
34	18	3	2012-12-17 10:56:53.800756	2012-12-17 10:56:53.800758
35	75	13	2012-12-17 10:56:53.800789	2012-12-17 10:56:53.800791
36	19	17	2012-12-17 10:56:53.800822	2012-12-17 10:56:53.800824
37	23	14	2012-12-17 10:56:53.800855	2012-12-17 10:56:53.800856
38	118	15	2012-12-17 10:56:53.800886	2012-12-17 10:56:53.800888
39	105	1	2012-12-17 10:56:53.800919	2012-12-17 10:56:53.800921
40	146	12	2012-12-17 10:56:53.800952	2012-12-17 10:56:53.800953
41	13	14	2012-12-17 10:56:53.800983	2012-12-17 10:56:53.800985
42	103	18	2012-12-17 10:56:53.801016	2012-12-17 10:56:53.801018
43	143	7	2012-12-17 10:56:53.801047	2012-12-17 10:56:53.801049
44	73	5	2012-12-17 10:56:53.801081	2012-12-17 10:56:53.801083
45	35	14	2012-12-17 10:56:53.801113	2012-12-17 10:56:53.801115
46	140	1	2012-12-17 10:56:53.801144	2012-12-17 10:56:53.801146
47	14	20	2012-12-17 10:56:53.801176	2012-12-17 10:56:53.801178
48	37	20	2012-12-17 10:56:53.80121	2012-12-17 10:56:53.801212
49	30	19	2012-12-17 10:56:53.801242	2012-12-17 10:56:53.801244
50	81	13	2012-12-17 10:56:53.801274	2012-12-17 10:56:53.801276
51	51	20	2012-12-17 10:56:53.801306	2012-12-17 10:56:53.801308
52	139	13	2012-12-17 10:56:53.801338	2012-12-17 10:56:53.80134
53	146	20	2012-12-17 10:56:53.801371	2012-12-17 10:56:53.801373
54	111	6	2012-12-17 10:56:53.801406	2012-12-17 10:56:53.801408
55	40	3	2012-12-17 10:56:53.801438	2012-12-17 10:56:53.80144
56	53	20	2012-12-17 10:56:53.80147	2012-12-17 10:56:53.801472
57	97	12	2012-12-17 10:56:53.801502	2012-12-17 10:56:53.801504
58	108	16	2012-12-17 10:56:53.801535	2012-12-17 10:56:53.801537
59	35	2	2012-12-17 10:56:53.801568	2012-12-17 10:56:53.80157
60	129	14	2012-12-17 10:56:53.801599	2012-12-17 10:56:53.801601
61	96	19	2012-12-17 10:56:53.801631	2012-12-17 10:56:53.801632
62	100	15	2012-12-17 10:56:53.801663	2012-12-17 10:56:53.801665
63	125	3	2012-12-17 10:56:53.801695	2012-12-17 10:56:53.801697
64	69	8	2012-12-17 10:56:53.801728	2012-12-17 10:56:53.80173
65	37	11	2012-12-17 10:56:53.80176	2012-12-17 10:56:53.801762
66	147	20	2012-12-17 10:56:53.801793	2012-12-17 10:56:53.801795
67	114	11	2012-12-17 10:56:53.801825	2012-12-17 10:56:53.801827
68	54	20	2012-12-17 10:56:53.801857	2012-12-17 10:56:53.801859
69	83	18	2012-12-17 10:56:53.80189	2012-12-17 10:56:53.801892
70	10	14	2012-12-17 10:56:53.801921	2012-12-17 10:56:53.801923
71	64	3	2012-12-17 10:56:53.801953	2012-12-17 10:56:53.801955
72	54	16	2012-12-17 10:56:53.801985	2012-12-17 10:56:53.801987
73	135	12	2012-12-17 10:56:53.802018	2012-12-17 10:56:53.80202
74	26	19	2012-12-17 10:56:53.802051	2012-12-17 10:56:53.802053
75	32	14	2012-12-17 10:56:53.802082	2012-12-17 10:56:53.802084
76	145	4	2012-12-17 10:56:53.802114	2012-12-17 10:56:53.802116
77	10	1	2012-12-17 10:56:53.802145	2012-12-17 10:56:53.802147
78	112	2	2012-12-17 10:56:53.802178	2012-12-17 10:56:53.80218
79	134	15	2012-12-17 10:56:53.802211	2012-12-17 10:56:53.802213
80	137	19	2012-12-17 10:56:53.802243	2012-12-17 10:56:53.802246
81	64	15	2012-12-17 10:56:53.802275	2012-12-17 10:56:53.802277
82	95	7	2012-12-17 10:56:53.802307	2012-12-17 10:56:53.802309
83	8	1	2012-12-17 10:56:53.80234	2012-12-17 10:56:53.802342
84	112	1	2012-12-17 10:56:53.802373	2012-12-17 10:56:53.802375
85	5	3	2012-12-17 10:56:53.802405	2012-12-17 10:56:53.802407
86	15	19	2012-12-17 10:56:53.802436	2012-12-17 10:56:53.802438
87	88	12	2012-12-17 10:56:53.802468	2012-12-17 10:56:53.80247
88	21	4	2012-12-17 10:56:53.802501	2012-12-17 10:56:53.802503
89	93	20	2012-12-17 10:56:53.802533	2012-12-17 10:56:53.802534
90	95	1	2012-12-17 10:56:53.802564	2012-12-17 10:56:53.802566
91	81	17	2012-12-17 10:56:53.802597	2012-12-17 10:56:53.802599
92	22	2	2012-12-17 10:56:53.802628	2012-12-17 10:56:53.80263
93	60	16	2012-12-17 10:56:53.802659	2012-12-17 10:56:53.802661
94	91	6	2012-12-17 10:56:53.802693	2012-12-17 10:56:53.802695
95	105	5	2012-12-17 10:56:53.802726	2012-12-17 10:56:53.802728
96	50	13	2012-12-17 10:56:53.802757	2012-12-17 10:56:53.802759
97	136	13	2012-12-17 10:56:53.802789	2012-12-17 10:56:53.802791
98	81	18	2012-12-17 10:56:53.802821	2012-12-17 10:56:53.802823
99	99	10	2012-12-17 10:56:53.802853	2012-12-17 10:56:53.802855
100	14	13	2012-12-17 10:56:53.802886	2012-12-17 10:56:53.802888
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY students (id, first_name, last_name, barcode_number, household_id, is_male, grade, date_of_birth, cell_phone, can_text, email, status, is_visitor, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
1	Quinten	Fritsch	156489244966	1	t	6	1991-11-03	4129531865	t	quinten.fritsch@example.com	Graduated	f	2012-12-17 10:56:52.594374	2012-12-17 10:56:52.594377	\N	\N	\N	\N
2	Hellen	Hills	646055193611	2	f	11	1993-05-03	4121108537	t	hellen.hills@example.com	College	f	2012-12-17 10:56:52.596992	2012-12-17 10:56:52.596994	\N	\N	\N	\N
3	Heidi	Connelly	090814413439	3	t	9	1992-02-03	4124947818	t	heidi.connelly@example.com	Active	f	2012-12-17 10:56:52.599162	2012-12-17 10:56:52.59917	\N	\N	\N	\N
4	Gerald	Connelly	736129408679	3	t	3	1995-09-23	4122152722	t	gerald.connelly@example.com	Active	f	2012-12-17 10:56:52.600924	2012-12-17 10:56:52.600927	\N	\N	\N	\N
5	Beverly	Wisoky	038416739670	4	t	7	1994-09-15	4121235520	t	beverly.wisoky@example.com	Missing	f	2012-12-17 10:56:52.603119	2012-12-17 10:56:52.603121	\N	\N	\N	\N
6	Icie	Wehner	214397471346	5	t	12	1996-10-14	\N	t	icie.wehner@example.com	Graduated	f	2012-12-17 10:56:52.605564	2012-12-17 10:56:52.605566	\N	\N	\N	\N
7	Lucius	Wehner	852799790259	5	t	1	1993-02-18	\N	t	lucius.wehner@example.com	College	f	2012-12-17 10:56:52.607328	2012-12-17 10:56:52.60733	\N	\N	\N	\N
8	Lucile	Wehner	061959011292	6	t	5	1993-08-19	4126465257	t	lucile.wehner@example.com	Unactive	f	2012-12-17 10:56:52.609609	2012-12-17 10:56:52.609611	\N	\N	\N	\N
9	Camila	Rempel	282013697464	7	t	4	1996-01-24	\N	t	camila.rempel@example.com	College	f	2012-12-17 10:56:52.611804	2012-12-17 10:56:52.611807	\N	\N	\N	\N
10	Kaitlyn	Rempel	035622041656	7	t	2	1991-09-12	\N	t	kaitlyn.rempel@example.com	Unactive	f	2012-12-17 10:56:52.613687	2012-12-17 10:56:52.613689	\N	\N	\N	\N
11	Abigayle	Flatley	715533707696	8	t	7	1990-12-27	4129289377	t	abigayle.flatley@example.com	College	f	2012-12-17 10:56:52.617005	2012-12-17 10:56:52.617007	\N	\N	\N	\N
12	Noelia	Cormier	172962957625	9	t	5	1991-09-06	4129697277	t	noelia.cormier@example.com	Active	f	2012-12-17 10:56:52.619402	2012-12-17 10:56:52.619404	\N	\N	\N	\N
13	Randy	Cormier	529841270602	9	t	3	1996-03-17	4126860339	t	randy.cormier@example.com	College	f	2012-12-17 10:56:52.621156	2012-12-17 10:56:52.621159	\N	\N	\N	\N
14	Penelope	Casper	303477888810	10	f	8	1997-04-13	\N	t	penelope.casper@example.com	Active	f	2012-12-17 10:56:52.700251	2012-12-17 10:56:52.700253	\N	\N	\N	\N
15	Brielle	Walsh	866150262631	11	t	1	1994-12-16	\N	t	brielle.walsh@example.com	Unactive	f	2012-12-17 10:56:52.70275	2012-12-17 10:56:52.702752	\N	\N	\N	\N
16	Emmanuel	Ziemann	724435069624	12	t	3	1995-02-17	4121687943	f	emmanuel.ziemann@example.com	Missing	f	2012-12-17 10:56:52.705161	2012-12-17 10:56:52.705164	\N	\N	\N	\N
17	Merlin	McLaughlin	212947673646	13	f	7	1993-11-08	4127182998	t	merlin.mclaughlin@example.com	Missing	f	2012-12-17 10:56:52.707358	2012-12-17 10:56:52.70736	\N	\N	\N	\N
18	Mitchel	Reichert	374973436139	14	t	4	1991-10-12	4129407942	f	mitchel.reichert@example.com	Unactive	f	2012-12-17 10:56:52.70971	2012-12-17 10:56:52.709712	\N	\N	\N	\N
19	Stanton	Wisoky	092211313245	15	t	3	1991-04-27	\N	t	stanton.wisoky@example.com	Active	f	2012-12-17 10:56:52.712027	2012-12-17 10:56:52.712029	\N	\N	\N	\N
20	Leta	Klocko	483641127379	16	t	10	1993-04-21	4120860496	t	leta.klocko@example.com	Missing	f	2012-12-17 10:56:52.714265	2012-12-17 10:56:52.714268	\N	\N	\N	\N
21	Ellis	Jast	124844695204	17	t	12	1993-06-11	4125597325	t	ellis.jast@example.com	Unactive	f	2012-12-17 10:56:52.716588	2012-12-17 10:56:52.71659	\N	\N	\N	\N
22	Abigale	Jast	167978638051	17	t	8	1996-09-19	4121111259	t	abigale.jast@example.com	College	f	2012-12-17 10:56:52.718352	2012-12-17 10:56:52.718354	\N	\N	\N	\N
23	Alexandrine	Barton	197357839002	18	t	9	1994-06-07	4129356712	t	alexandrine.barton@example.com	Active	f	2012-12-17 10:56:52.720577	2012-12-17 10:56:52.720579	\N	\N	\N	\N
24	Sean	Barton	536021021602	18	f	1	1996-12-10	\N	t	sean.barton@example.com	Missing	f	2012-12-17 10:56:52.722362	2012-12-17 10:56:52.722365	\N	\N	\N	\N
25	Berry	Predovic	719954737034	19	t	8	1996-01-05	\N	t	berry.predovic@example.com	Missing	f	2012-12-17 10:56:52.724986	2012-12-17 10:56:52.724989	\N	\N	\N	\N
26	Nicola	Predovic	510401144641	19	t	12	1996-08-03	4126800544	t	nicola.predovic@example.com	Unactive	f	2012-12-17 10:56:52.727132	2012-12-17 10:56:52.727136	\N	\N	\N	\N
27	Obie	O'Connell	447136734675	20	t	2	1995-12-24	4126609928	t	obie.o'connell@example.com	Active	f	2012-12-17 10:56:52.729678	2012-12-17 10:56:52.729681	\N	\N	\N	\N
28	Grover	O'Connell	602769131457	20	f	7	1992-12-16	4129734053	t	grover.o'connell@example.com	Active	f	2012-12-17 10:56:52.731556	2012-12-17 10:56:52.73156	\N	\N	\N	\N
29	Tiffany	Swift	558196721962	21	t	1	1996-04-03	\N	t	tiffany.swift@example.com	Unactive	f	2012-12-17 10:56:52.733968	2012-12-17 10:56:52.73397	\N	\N	\N	\N
30	Mariane	White	834434772468	22	f	2	1994-06-07	\N	t	mariane.white@example.com	Active	f	2012-12-17 10:56:52.736119	2012-12-17 10:56:52.736121	\N	\N	\N	\N
31	Hadley	Ondricka	788535625146	23	t	1	1991-09-22	4129623957	t	hadley.ondricka@example.com	Missing	f	2012-12-17 10:56:52.738212	2012-12-17 10:56:52.738215	\N	\N	\N	\N
32	Brice	Ondricka	625983710480	23	t	10	1996-12-09	4126258041	t	brice.ondricka@example.com	Missing	f	2012-12-17 10:56:52.7399	2012-12-17 10:56:52.739902	\N	\N	\N	\N
33	Bennett	Harvey	440196224319	24	t	4	1996-09-29	\N	t	bennett.harvey@example.com	College	f	2012-12-17 10:56:52.741996	2012-12-17 10:56:52.741998	\N	\N	\N	\N
34	Lennie	Jewess	807679897395	25	f	6	1997-06-24	4120941697	t	lennie.jewess@example.com	Active	f	2012-12-17 10:56:52.744185	2012-12-17 10:56:52.744188	\N	\N	\N	\N
35	Jasmin	Homenick	555067827751	26	t	4	1991-09-22	\N	f	jasmin.homenick@example.com	Active	f	2012-12-17 10:56:52.746526	2012-12-17 10:56:52.746528	\N	\N	\N	\N
36	Spencer	Maggio	663245499033	27	t	1	1991-02-11	4129659970	f	spencer.maggio@example.com	Unactive	f	2012-12-17 10:56:52.748656	2012-12-17 10:56:52.748659	\N	\N	\N	\N
37	Eldred	McClure	289064582506	28	f	11	1992-11-18	4122689143	t	eldred.mcclure@example.com	Active	f	2012-12-17 10:56:52.750862	2012-12-17 10:56:52.750864	\N	\N	\N	\N
38	Reva	Greenfelder	837306933073	29	f	11	1991-12-27	4124396915	t	reva.greenfelder@example.com	Graduated	f	2012-12-17 10:56:52.753277	2012-12-17 10:56:52.753279	\N	\N	\N	\N
39	Betsy	Nicolas	340363387396	30	t	12	1991-02-26	4123211064	t	betsy.nicolas@example.com	Graduated	f	2012-12-17 10:56:52.755435	2012-12-17 10:56:52.755438	\N	\N	\N	\N
40	Hans	Nicolas	395809020772	30	t	12	1992-07-18	\N	t	hans.nicolas@example.com	College	f	2012-12-17 10:56:52.757129	2012-12-17 10:56:52.757131	\N	\N	\N	\N
41	Anna	Mayer	213773531326	31	t	9	1993-08-13	4128785934	t	anna.mayer@example.com	Graduated	f	2012-12-17 10:56:52.759237	2012-12-17 10:56:52.759239	\N	\N	\N	\N
42	Percival	Daniel	486721573085	32	t	8	1996-02-24	4129458277	t	percival.daniel@example.com	Missing	f	2012-12-17 10:56:52.761393	2012-12-17 10:56:52.761395	\N	\N	\N	\N
43	Alexane	Daniel	530379337348	32	t	10	1995-07-15	4128653166	f	alexane.daniel@example.com	College	f	2012-12-17 10:56:52.763149	2012-12-17 10:56:52.763151	\N	\N	\N	\N
44	Dell	Hoeger	192269010966	33	t	8	1997-05-15	\N	t	dell.hoeger@example.com	College	f	2012-12-17 10:56:52.765265	2012-12-17 10:56:52.765267	\N	\N	\N	\N
45	Kailyn	Hoeger	872426302319	33	t	12	1996-07-29	4120186366	t	kailyn.hoeger@example.com	Active	f	2012-12-17 10:56:52.766906	2012-12-17 10:56:52.766908	\N	\N	\N	\N
46	Wava	Douglas	633958917625	34	f	4	1996-07-14	\N	t	wava.douglas@example.com	College	f	2012-12-17 10:56:52.769173	2012-12-17 10:56:52.769175	\N	\N	\N	\N
47	Jo	Glover	238778122211	35	f	11	1994-01-21	4124125213	t	jo.glover@example.com	Active	f	2012-12-17 10:56:52.771263	2012-12-17 10:56:52.771265	\N	\N	\N	\N
48	Clarissa	Glover	013983050489	35	f	2	1995-09-08	4127354876	f	clarissa.glover@example.com	Unactive	f	2012-12-17 10:56:52.772945	2012-12-17 10:56:52.772947	\N	\N	\N	\N
49	Rahsaan	Schinner	232283217592	36	t	11	1992-11-30	\N	t	rahsaan.schinner@example.com	Graduated	f	2012-12-17 10:56:52.77535	2012-12-17 10:56:52.775352	\N	\N	\N	\N
50	Vida	Schinner	705571606171	36	t	1	1994-09-11	\N	t	vida.schinner@example.com	Graduated	f	2012-12-17 10:56:52.777219	2012-12-17 10:56:52.777221	\N	\N	\N	\N
51	Graham	Heidenreich	008679699620	37	f	9	1996-01-21	4123888561	t	graham.heidenreich@example.com	College	f	2012-12-17 10:56:52.779539	2012-12-17 10:56:52.779541	\N	\N	\N	\N
52	Rosetta	Heidenreich	794193259042	37	f	12	1996-05-14	4128052895	f	rosetta.heidenreich@example.com	College	f	2012-12-17 10:56:52.781291	2012-12-17 10:56:52.781293	\N	\N	\N	\N
53	Ibrahim	Zemlak	081715422463	38	t	2	1994-01-01	4125008449	t	ibrahim.zemlak@example.com	College	f	2012-12-17 10:56:52.78345	2012-12-17 10:56:52.783452	\N	\N	\N	\N
54	Gianni	Emmerich	393296207524	39	t	6	1991-01-08	\N	t	gianni.emmerich@example.com	Missing	f	2012-12-17 10:56:52.785598	2012-12-17 10:56:52.7856	\N	\N	\N	\N
55	Adolph	Emmerich	379253815507	39	t	11	1994-05-19	\N	t	adolph.emmerich@example.com	Missing	f	2012-12-17 10:56:52.78732	2012-12-17 10:56:52.787322	\N	\N	\N	\N
56	Ulices	Stanton	473648822501	40	f	9	1991-07-02	\N	t	ulices.stanton@example.com	Graduated	f	2012-12-17 10:56:52.78964	2012-12-17 10:56:52.789642	\N	\N	\N	\N
57	Arielle	Jacobi	609066335539	41	t	12	1993-04-14	\N	t	arielle.jacobi@example.com	Missing	f	2012-12-17 10:56:52.791772	2012-12-17 10:56:52.791774	\N	\N	\N	\N
58	Jazlyn	Bruen	229514342230	42	t	4	1997-02-04	4126999887	t	jazlyn.bruen@example.com	Active	f	2012-12-17 10:56:52.794102	2012-12-17 10:56:52.794104	\N	\N	\N	\N
59	Adolphus	Bruen	865902861264	42	t	4	1992-11-09	4121411551	t	adolphus.bruen@example.com	Unactive	f	2012-12-17 10:56:52.795845	2012-12-17 10:56:52.795847	\N	\N	\N	\N
60	Sincere	Ernser	796162715798	43	f	8	1991-11-01	4128165809	t	sincere.ernser@example.com	Graduated	f	2012-12-17 10:56:52.798025	2012-12-17 10:56:52.798027	\N	\N	\N	\N
61	Zachery	Kunde	498223862568	44	t	11	1994-03-17	4121756851	t	zachery.kunde@example.com	Graduated	f	2012-12-17 10:56:52.800362	2012-12-17 10:56:52.800364	\N	\N	\N	\N
62	Deborah	Kunde	500917271176	44	f	4	1996-01-25	4120432399	t	deborah.kunde@example.com	Unactive	f	2012-12-17 10:56:52.87916	2012-12-17 10:56:52.879165	\N	\N	\N	\N
63	Caden	Champlin	462692742326	45	t	9	1992-10-21	\N	t	caden.champlin@example.com	Active	f	2012-12-17 10:56:52.881988	2012-12-17 10:56:52.88199	\N	\N	\N	\N
64	Alvera	Champlin	388760351336	45	t	1	1997-03-08	4128646880	f	alvera.champlin@example.com	Graduated	f	2012-12-17 10:56:52.883926	2012-12-17 10:56:52.883929	\N	\N	\N	\N
65	Dedric	Jones	364201213682	46	t	11	1991-10-29	4126891570	t	dedric.jones@example.com	Unactive	f	2012-12-17 10:56:52.88627	2012-12-17 10:56:52.886272	\N	\N	\N	\N
66	Nick	Mraz	282304308118	47	t	1	1993-02-13	4122366543	t	nick.mraz@example.com	Missing	f	2012-12-17 10:56:52.888538	2012-12-17 10:56:52.88854	\N	\N	\N	\N
67	Geovany	Lockman	535009727134	48	f	12	1993-05-22	4122719255	f	geovany.lockman@example.com	Unactive	f	2012-12-17 10:56:52.89077	2012-12-17 10:56:52.890772	\N	\N	\N	\N
68	Emilie	Runte	083699655582	49	t	3	1994-09-25	4128434144	t	emilie.runte@example.com	College	f	2012-12-17 10:56:52.892984	2012-12-17 10:56:52.892986	\N	\N	\N	\N
69	Creola	Runte	443603051482	49	t	6	1997-05-22	4127379858	t	creola.runte@example.com	Active	f	2012-12-17 10:56:52.894873	2012-12-17 10:56:52.894875	\N	\N	\N	\N
70	Flavio	Haag	224887740884	50	t	4	1996-08-26	4129371916	f	flavio.haag@example.com	College	f	2012-12-17 10:56:52.897124	2012-12-17 10:56:52.897126	\N	\N	\N	\N
71	Ansel	Haag	598836649734	50	t	12	1997-08-02	4121810103	f	ansel.haag@example.com	Active	f	2012-12-17 10:56:52.899081	2012-12-17 10:56:52.899084	\N	\N	\N	\N
72	Zelda	Jacobs	218644188854	51	t	8	1994-03-09	4127338148	t	zelda.jacobs@example.com	Unactive	f	2012-12-17 10:56:52.901476	2012-12-17 10:56:52.901478	\N	\N	\N	\N
73	Leonardo	Jacobs	135344438791	51	t	11	1996-04-14	\N	t	leonardo.jacobs@example.com	Missing	f	2012-12-17 10:56:52.903204	2012-12-17 10:56:52.903206	\N	\N	\N	\N
74	Rupert	Friesen	147429683828	52	f	9	1994-11-01	4127886153	t	rupert.friesen@example.com	Missing	f	2012-12-17 10:56:52.905547	2012-12-17 10:56:52.905549	\N	\N	\N	\N
75	Marty	Friesen	853958783683	52	t	6	1992-10-06	\N	t	marty.friesen@example.com	College	f	2012-12-17 10:56:52.907219	2012-12-17 10:56:52.907221	\N	\N	\N	\N
76	Yesenia	Mante	538343864288	53	f	12	1993-09-26	4126137764	t	yesenia.mante@example.com	College	f	2012-12-17 10:56:52.909488	2012-12-17 10:56:52.90949	\N	\N	\N	\N
77	Milan	O'Hara	175348387931	54	t	3	1994-04-28	4126855646	f	milan.o'hara@example.com	Unactive	f	2012-12-17 10:56:52.911762	2012-12-17 10:56:52.911764	\N	\N	\N	\N
78	Maybelle	Reilly	360333222278	55	t	12	1995-03-21	4123976720	f	maybelle.reilly@example.com	College	f	2012-12-17 10:56:52.913885	2012-12-17 10:56:52.913887	\N	\N	\N	\N
79	Dangelo	Metz	052626736792	56	t	2	1991-03-25	\N	t	dangelo.metz@example.com	Active	f	2012-12-17 10:56:52.916131	2012-12-17 10:56:52.916133	\N	\N	\N	\N
80	Gerard	Hammes	451647511753	57	t	3	1993-03-22	4129159925	t	gerard.hammes@example.com	Active	f	2012-12-17 10:56:52.918463	2012-12-17 10:56:52.918465	\N	\N	\N	\N
81	Newell	Hammes	245917674947	57	t	3	1995-10-27	4123224515	t	newell.hammes@example.com	Graduated	f	2012-12-17 10:56:52.920169	2012-12-17 10:56:52.920172	\N	\N	\N	\N
82	Justina	Gerhold	048581769262	58	t	5	1992-11-18	4121934882	f	justina.gerhold@example.com	Missing	f	2012-12-17 10:56:52.92235	2012-12-17 10:56:52.922352	\N	\N	\N	\N
83	Loren	Johnson	436929560958	59	t	11	1991-10-18	\N	f	loren.johnson@example.com	Active	f	2012-12-17 10:56:52.924497	2012-12-17 10:56:52.924499	\N	\N	\N	\N
84	Josefa	Hauck	770187717359	60	t	8	1991-04-24	4123424261	t	josefa.hauck@example.com	Graduated	f	2012-12-17 10:56:52.926641	2012-12-17 10:56:52.926643	\N	\N	\N	\N
85	Colt	Hauck	856137141541	60	t	6	1995-02-15	\N	f	colt.hauck@example.com	Missing	f	2012-12-17 10:56:52.928351	2012-12-17 10:56:52.928354	\N	\N	\N	\N
86	Lavon	Adams	203765502332	61	f	3	1992-06-11	4129581267	t	lavon.adams@example.com	College	f	2012-12-17 10:56:52.93048	2012-12-17 10:56:52.930482	\N	\N	\N	\N
87	Kianna	Weissnat	678146788069	62	f	7	1995-09-26	\N	t	kianna.weissnat@example.com	College	f	2012-12-17 10:56:52.932835	2012-12-17 10:56:52.932837	\N	\N	\N	\N
88	Norbert	Weissnat	569607822792	62	t	8	1991-05-29	4125608693	t	norbert.weissnat@example.com	Active	f	2012-12-17 10:56:52.934541	2012-12-17 10:56:52.934543	\N	\N	\N	\N
89	Leanne	Lemke	513027788105	63	t	6	1993-03-07	4120754811	t	leanne.lemke@example.com	College	f	2012-12-17 10:56:52.936664	2012-12-17 10:56:52.936666	\N	\N	\N	\N
90	Sam	Lemke	585395269679	63	t	3	1997-06-03	4121193399	t	sam.lemke@example.com	Graduated	f	2012-12-17 10:56:52.938332	2012-12-17 10:56:52.938334	\N	\N	\N	\N
91	Winston	Gerhold	017321788344	64	t	6	1997-02-03	4126043861	t	winston.gerhold@example.com	Missing	f	2012-12-17 10:56:52.940595	2012-12-17 10:56:52.940597	\N	\N	\N	\N
92	Osborne	Gerhold	413024749957	64	t	7	1995-05-02	\N	t	osborne.gerhold@example.com	College	f	2012-12-17 10:56:52.942312	2012-12-17 10:56:52.942314	\N	\N	\N	\N
93	Emie	Leuschke	655629328184	65	t	8	1995-06-13	\N	t	emie.leuschke@example.com	Active	f	2012-12-17 10:56:52.94446	2012-12-17 10:56:52.944463	\N	\N	\N	\N
94	Eldridge	Leuschke	215158568108	65	t	11	1995-05-05	4123305166	t	eldridge.leuschke@example.com	Missing	f	2012-12-17 10:56:52.946151	2012-12-17 10:56:52.946153	\N	\N	\N	\N
95	Lina	Dare	212741333546	66	t	10	1991-04-30	\N	t	lina.dare@example.com	Graduated	f	2012-12-17 10:56:52.948308	2012-12-17 10:56:52.94831	\N	\N	\N	\N
96	Rosella	Dare	871299125218	66	f	2	1991-12-23	4124795116	f	rosella.dare@example.com	Unactive	f	2012-12-17 10:56:52.950011	2012-12-17 10:56:52.950013	\N	\N	\N	\N
97	Marc	Hessel	860727901349	67	t	12	1993-02-08	\N	t	marc.hessel@example.com	College	f	2012-12-17 10:56:52.952123	2012-12-17 10:56:52.952125	\N	\N	\N	\N
98	Kellie	Hessel	056151214686	67	f	8	1995-02-07	4129835276	f	kellie.hessel@example.com	Active	f	2012-12-17 10:56:52.953774	2012-12-17 10:56:52.953776	\N	\N	\N	\N
99	Eden	Greenholt	011859111328	68	f	10	1995-04-12	4124847813	t	eden.greenholt@example.com	Active	f	2012-12-17 10:56:52.95605	2012-12-17 10:56:52.956052	\N	\N	\N	\N
100	Marques	Greenholt	677923542974	68	f	4	1991-01-23	4125145085	t	marques.greenholt@example.com	Unactive	f	2012-12-17 10:56:52.957718	2012-12-17 10:56:52.95772	\N	\N	\N	\N
101	Camille	Kuvalis	615518932925	69	t	5	1993-06-29	4127252585	t	camille.kuvalis@example.com	Missing	f	2012-12-17 10:56:52.959814	2012-12-17 10:56:52.959816	\N	\N	\N	\N
102	Malika	Cormier	087337473530	70	t	4	1992-12-29	4129091334	t	malika.cormier@example.com	Unactive	f	2012-12-17 10:56:52.96191	2012-12-17 10:56:52.961913	\N	\N	\N	\N
103	George	Runolfsson	710261890450	71	t	3	1995-06-04	4120926754	t	george.runolfsson@example.com	Unactive	f	2012-12-17 10:56:52.964112	2012-12-17 10:56:52.964114	\N	\N	\N	\N
104	Garnett	Runolfsson	008137626322	71	t	7	1994-07-29	4122725301	t	garnett.runolfsson@example.com	Unactive	f	2012-12-17 10:56:52.965802	2012-12-17 10:56:52.965804	\N	\N	\N	\N
105	Mervin	Rolfson	641375219927	72	t	12	1991-11-08	\N	t	mervin.rolfson@example.com	Active	f	2012-12-17 10:56:52.967909	2012-12-17 10:56:52.967911	\N	\N	\N	\N
106	Elisha	Rolfson	246097862404	72	f	11	1996-09-18	4120564122	t	elisha.rolfson@example.com	Missing	f	2012-12-17 10:56:52.969563	2012-12-17 10:56:52.969566	\N	\N	\N	\N
107	Marilou	Bechtelar	523539222355	73	t	11	1995-06-08	\N	f	marilou.bechtelar@example.com	College	f	2012-12-17 10:56:52.971654	2012-12-17 10:56:52.971656	\N	\N	\N	\N
108	Myrtice	Bechtelar	486323254360	73	t	11	1996-04-26	4127477923	f	myrtice.bechtelar@example.com	College	f	2012-12-17 10:56:52.973308	2012-12-17 10:56:52.97331	\N	\N	\N	\N
109	Mayra	Hoeger	488831940511	74	f	9	1992-03-24	\N	t	mayra.hoeger@example.com	Graduated	f	2012-12-17 10:56:52.975503	2012-12-17 10:56:52.975505	\N	\N	\N	\N
110	Karl	Schuppe	161751718591	75	t	11	1994-06-25	\N	t	karl.schuppe@example.com	Active	f	2012-12-17 10:56:52.977616	2012-12-17 10:56:52.977619	\N	\N	\N	\N
111	Claude	Schuppe	127528019007	75	t	7	1991-12-23	4129061047	t	claude.schuppe@example.com	Graduated	f	2012-12-17 10:56:53.057098	2012-12-17 10:56:53.057103	\N	\N	\N	\N
112	Rolando	Beatty	216457884893	76	f	2	1993-12-15	4124074889	t	rolando.beatty@example.com	Missing	f	2012-12-17 10:56:53.060176	2012-12-17 10:56:53.060179	\N	\N	\N	\N
113	Burley	Beatty	196649079932	76	t	12	1993-08-26	4128471029	t	burley.beatty@example.com	College	f	2012-12-17 10:56:53.062091	2012-12-17 10:56:53.062093	\N	\N	\N	\N
114	Madelynn	Moore	126087799586	77	t	8	1996-08-05	4120986615	f	madelynn.moore@example.com	Unactive	f	2012-12-17 10:56:53.064382	2012-12-17 10:56:53.064384	\N	\N	\N	\N
115	Zita	Koelpin	354299836976	78	t	11	1997-02-25	\N	t	zita.koelpin@example.com	Missing	f	2012-12-17 10:56:53.066739	2012-12-17 10:56:53.066741	\N	\N	\N	\N
116	Eleanora	Hartmann	487432312274	79	t	7	1991-09-22	4125537293	f	eleanora.hartmann@example.com	Unactive	f	2012-12-17 10:56:53.069044	2012-12-17 10:56:53.069046	\N	\N	\N	\N
117	Vito	Deckow	735207904190	80	t	3	1996-10-13	4123903725	t	vito.deckow@example.com	College	f	2012-12-17 10:56:53.071328	2012-12-17 10:56:53.07133	\N	\N	\N	\N
118	Arnulfo	Hudson	173022699471	81	f	8	1995-11-09	4127825391	t	arnulfo.hudson@example.com	Missing	f	2012-12-17 10:56:53.073578	2012-12-17 10:56:53.073581	\N	\N	\N	\N
119	Watson	Mohr	767519159980	82	t	2	1996-04-01	\N	t	watson.mohr@example.com	College	f	2012-12-17 10:56:53.075812	2012-12-17 10:56:53.075815	\N	\N	\N	\N
120	Nikolas	Zieme	267808854135	83	f	11	1993-01-01	4123550053	t	nikolas.zieme@example.com	Unactive	f	2012-12-17 10:56:53.077997	2012-12-17 10:56:53.077999	\N	\N	\N	\N
121	Kyra	DuBuque	694776403094	84	t	6	1994-12-22	4126726945	f	kyra.dubuque@example.com	Graduated	f	2012-12-17 10:56:53.080367	2012-12-17 10:56:53.08037	\N	\N	\N	\N
122	Tiana	DuBuque	715959554975	84	t	10	1996-05-25	4120500539	t	tiana.dubuque@example.com	College	f	2012-12-17 10:56:53.082123	2012-12-17 10:56:53.082125	\N	\N	\N	\N
123	Brandi	Schimmel	012856857973	85	t	7	1997-02-09	4127055071	t	brandi.schimmel@example.com	Unactive	f	2012-12-17 10:56:53.084353	2012-12-17 10:56:53.084355	\N	\N	\N	\N
124	Francisca	Blick	474701832170	86	t	5	1993-02-09	4121803375	t	francisca.blick@example.com	Active	f	2012-12-17 10:56:53.086516	2012-12-17 10:56:53.086518	\N	\N	\N	\N
125	Stacey	Stamm	308725578280	87	t	5	1997-06-13	4121683319	f	stacey.stamm@example.com	Missing	f	2012-12-17 10:56:53.088697	2012-12-17 10:56:53.088699	\N	\N	\N	\N
126	Kara	Stamm	635699303845	87	t	8	1993-08-10	4121493092	t	kara.stamm@example.com	College	f	2012-12-17 10:56:53.090414	2012-12-17 10:56:53.090416	\N	\N	\N	\N
127	Polly	Glover	722773210697	88	t	5	1997-02-27	4122865486	t	polly.glover@example.com	College	f	2012-12-17 10:56:53.092546	2012-12-17 10:56:53.092548	\N	\N	\N	\N
128	Gilda	Quigley	351171234711	89	t	4	1994-06-01	4126103830	f	gilda.quigley@example.com	College	f	2012-12-17 10:56:53.094856	2012-12-17 10:56:53.094858	\N	\N	\N	\N
129	Phoebe	Prohaska	621649804729	90	t	4	1996-09-09	\N	t	phoebe.prohaska@example.com	Active	f	2012-12-17 10:56:53.097168	2012-12-17 10:56:53.09717	\N	\N	\N	\N
130	Cade	Prohaska	458602051367	90	f	3	1991-01-08	\N	f	cade.prohaska@example.com	Missing	f	2012-12-17 10:56:53.098848	2012-12-17 10:56:53.09885	\N	\N	\N	\N
131	Hester	Renner	691935150074	91	t	8	1994-04-07	\N	f	hester.renner@example.com	Unactive	f	2012-12-17 10:56:53.100932	2012-12-17 10:56:53.100934	\N	\N	\N	\N
132	Lurline	Renner	621324638781	91	t	10	1991-11-27	4128532345	t	lurline.renner@example.com	Active	f	2012-12-17 10:56:53.102584	2012-12-17 10:56:53.102586	\N	\N	\N	\N
133	Lisette	Paucek	168397517602	92	t	6	1994-07-23	4128075085	t	lisette.paucek@example.com	Missing	f	2012-12-17 10:56:53.104865	2012-12-17 10:56:53.104867	\N	\N	\N	\N
134	Haven	Fritsch	013421088513	93	f	2	1992-03-20	4129708652	t	haven.fritsch@example.com	Active	f	2012-12-17 10:56:53.107049	2012-12-17 10:56:53.107051	\N	\N	\N	\N
135	Paula	Heidenreich	181476919421	94	t	6	1993-10-01	\N	t	paula.heidenreich@example.com	Unactive	f	2012-12-17 10:56:53.109343	2012-12-17 10:56:53.109345	\N	\N	\N	\N
136	Nannie	Heidenreich	715695961490	94	t	1	1992-10-12	4127816741	t	nannie.heidenreich@example.com	Missing	f	2012-12-17 10:56:53.111181	2012-12-17 10:56:53.111183	\N	\N	\N	\N
137	Kyle	Blick	273714986619	95	t	8	1996-06-08	4121662136	t	kyle.blick@example.com	College	f	2012-12-17 10:56:53.113352	2012-12-17 10:56:53.113355	\N	\N	\N	\N
138	Alfreda	Blick	876179134432	95	t	2	1991-07-05	4121438005	t	alfreda.blick@example.com	Graduated	f	2012-12-17 10:56:53.115029	2012-12-17 10:56:53.115031	\N	\N	\N	\N
139	Jessica	Nikolaus	634858397346	96	t	8	1995-07-06	\N	f	jessica.nikolaus@example.com	Active	f	2012-12-17 10:56:53.117132	2012-12-17 10:56:53.117134	\N	\N	\N	\N
140	Dane	Nikolaus	544433625546	96	t	5	1991-07-30	4125878911	t	dane.nikolaus@example.com	Missing	f	2012-12-17 10:56:53.118782	2012-12-17 10:56:53.118784	\N	\N	\N	\N
141	Casimir	Renner	085382847957	97	t	10	1997-08-29	\N	t	casimir.renner@example.com	Missing	f	2012-12-17 10:56:53.120868	2012-12-17 10:56:53.12087	\N	\N	\N	\N
142	Tianna	Renner	063448159267	97	f	6	1994-08-29	4128341643	t	tianna.renner@example.com	Active	f	2012-12-17 10:56:53.122551	2012-12-17 10:56:53.122554	\N	\N	\N	\N
143	Stephan	Reinger	453387089505	98	f	7	1993-11-16	\N	t	stephan.reinger@example.com	Active	f	2012-12-17 10:56:53.124877	2012-12-17 10:56:53.124879	\N	\N	\N	\N
144	Lura	Reinger	555743844664	98	t	2	1992-09-23	4124718658	f	lura.reinger@example.com	Active	f	2012-12-17 10:56:53.1266	2012-12-17 10:56:53.126602	\N	\N	\N	\N
145	Humberto	Christiansen	070174879470	99	f	12	1992-08-19	4120107379	t	humberto.christiansen@example.com	Missing	f	2012-12-17 10:56:53.128737	2012-12-17 10:56:53.128739	\N	\N	\N	\N
146	Greyson	Christiansen	400606245435	99	f	6	1995-08-19	4122838007	t	greyson.christiansen@example.com	Unactive	f	2012-12-17 10:56:53.13041	2012-12-17 10:56:53.130412	\N	\N	\N	\N
147	Louie	Fritsch	500074852054	100	t	3	1996-08-15	4126822474	t	louie.fritsch@example.com	Graduated	f	2012-12-17 10:56:53.132478	2012-12-17 10:56:53.132481	\N	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: urban_impact
--

COPY users (id, first_name, last_name, username, role, department_id, active, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, authentication_token) FROM stdin;
2	Ed	Glover	ed.glover	admin	\N	t	2012-12-17 10:56:51.445355	2012-12-17 10:56:51.445355	edglover@uif.com	$2a$10$oalZYzhxc00jaV/wpdqNiuIq2nSdHOPIh8Ao7EqhjYwXuzPHRARS6	\N	\N	\N	0	\N	\N	\N	\N	Ls4yuQwjzU9JdRzpZyjc
1	Professor	Heimann	urban_impact	admin	\N	t	2012-12-17 10:56:51.294114	2012-12-17 10:59:01.299501	urban_impact@cmu.edu	$2a$10$WcGp91pu6O4gzNC9lZB0Hu36b8FI7NI9mqL8DNZ/rHVTpCrWh6Ag.	\N	\N	\N	1	2012-12-17 10:59:01.297898	2012-12-17 10:59:01.297898	127.0.0.1	127.0.0.1	8KBy7r78MmG4sC4Lqvtm
\.


--
-- Name: allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY allergies
    ADD CONSTRAINT allergies_pkey PRIMARY KEY (id);


--
-- Name: attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY guardians
    ADD CONSTRAINT guardians_pkey PRIMARY KEY (id);


--
-- Name: households_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY households
    ADD CONSTRAINT households_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: section_events_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY section_events
    ADD CONSTRAINT section_events_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: student_allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY student_allergies
    ADD CONSTRAINT student_allergies_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: urban_impact; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: urban_impact; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: urban_impact
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM urban_impact;
GRANT ALL ON SCHEMA public TO urban_impact;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

