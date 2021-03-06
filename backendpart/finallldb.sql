--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO djangos;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO djangos;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO djangos;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO djangos;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: api_comment; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_comment (
    id integer NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.api_comment OWNER TO djangos;

--
-- Name: api_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_comment_id_seq OWNER TO djangos;

--
-- Name: api_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_comment_id_seq OWNED BY public.api_comment.id;


--
-- Name: api_post; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_post (
    id integer NOT NULL,
    text text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_post OWNER TO djangos;

--
-- Name: api_post_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_post_id_seq OWNER TO djangos;

--
-- Name: api_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_post_id_seq OWNED BY public.api_post.id;


--
-- Name: api_reportcomment; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_reportcomment (
    id integer NOT NULL,
    num_of_reports integer NOT NULL,
    comment_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_reportcomment OWNER TO djangos;

--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_reportcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportcomment_id_seq OWNER TO djangos;

--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_reportcomment_id_seq OWNED BY public.api_reportcomment.id;


--
-- Name: api_reportpost; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_reportpost (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    num_of_reports integer NOT NULL,
    owner_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.api_reportpost OWNER TO djangos;

--
-- Name: api_reportpost_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_reportpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportpost_id_seq OWNER TO djangos;

--
-- Name: api_reportpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_reportpost_id_seq OWNED BY public.api_reportpost.id;


--
-- Name: api_trainee; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_trainee (
    id integer NOT NULL,
    "dateOfBirth" date NOT NULL,
    "currentWeight" character varying(5),
    height character varying(5) NOT NULL,
    "medicalHistory" boolean NOT NULL,
    status character varying(20),
    "changedPlanStatus" boolean NOT NULL,
    trainee_id integer,
    "trainerID_id" integer,
    "workoutPlan_id" integer,
    "yogaPlan_id" integer
);


ALTER TABLE public.api_trainee OWNER TO djangos;

--
-- Name: api_trainee_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_trainee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_trainee_id_seq OWNER TO djangos;

--
-- Name: api_trainee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_trainee_id_seq OWNED BY public.api_trainee.id;


--
-- Name: api_trainer; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_trainer (
    id integer NOT NULL,
    "dateOfBirth" date NOT NULL,
    gender character varying(6) NOT NULL,
    "phoneNumber" character varying(11) NOT NULL,
    address text NOT NULL,
    image character varying(100) NOT NULL,
    trainer_id integer
);


ALTER TABLE public.api_trainer OWNER TO djangos;

--
-- Name: api_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_trainer_id_seq OWNER TO djangos;

--
-- Name: api_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_trainer_id_seq OWNED BY public.api_trainer.id;


--
-- Name: api_watertracker; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_watertracker (
    id integer NOT NULL,
    "currentAmount" double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "traineeID_id" integer
);


ALTER TABLE public.api_watertracker OWNER TO djangos;

--
-- Name: api_watertracker_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_watertracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_watertracker_id_seq OWNER TO djangos;

--
-- Name: api_watertracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_watertracker_id_seq OWNED BY public.api_watertracker.id;


--
-- Name: api_watertrackerhistory; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_watertrackerhistory (
    id integer NOT NULL,
    "dailyAmount" double precision NOT NULL,
    created_at date NOT NULL,
    updated_at date NOT NULL,
    "traineeID_id" integer
);


ALTER TABLE public.api_watertrackerhistory OWNER TO djangos;

--
-- Name: api_watertrackerhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_watertrackerhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_watertrackerhistory_id_seq OWNER TO djangos;

--
-- Name: api_watertrackerhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_watertrackerhistory_id_seq OWNED BY public.api_watertrackerhistory.id;


--
-- Name: api_weighttracker; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_weighttracker (
    id integer NOT NULL,
    "currentWeight" character varying(5),
    "numOfLogin" integer NOT NULL,
    "traineeID_id" integer
);


ALTER TABLE public.api_weighttracker OWNER TO djangos;

--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_weighttracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weighttracker_id_seq OWNER TO djangos;

--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_weighttracker_id_seq OWNED BY public.api_weighttracker.id;


--
-- Name: api_weighttrackerhistory; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_weighttrackerhistory (
    id integer NOT NULL,
    "traineeWeight" double precision NOT NULL,
    created_at date NOT NULL,
    "traineeID_id" integer NOT NULL
);


ALTER TABLE public.api_weighttrackerhistory OWNER TO djangos;

--
-- Name: api_weighttrackerhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_weighttrackerhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weighttrackerhistory_id_seq OWNER TO djangos;

--
-- Name: api_weighttrackerhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_weighttrackerhistory_id_seq OWNED BY public.api_weighttrackerhistory.id;


--
-- Name: api_workoutexcercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutexcercise (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    duration integer,
    description character varying(650) NOT NULL,
    gif character varying(100) NOT NULL
);


ALTER TABLE public.api_workoutexcercise OWNER TO djangos;

--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutexcercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutexcercise_id_seq OWNER TO djangos;

--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutexcercise_id_seq OWNED BY public.api_workoutexcercise.id;


--
-- Name: api_workoutplan; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutplan (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(70),
    image character varying(100) NOT NULL,
    status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_workoutplan OWNER TO djangos;

--
-- Name: api_workoutplan_exercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutplan_exercise (
    id integer NOT NULL,
    workoutplan_id integer NOT NULL,
    workoutexcercise_id integer NOT NULL
);


ALTER TABLE public.api_workoutplan_exercise OWNER TO djangos;

--
-- Name: api_workoutplan_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutplan_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutplan_exercise_id_seq OWNER TO djangos;

--
-- Name: api_workoutplan_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutplan_exercise_id_seq OWNED BY public.api_workoutplan_exercise.id;


--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutplan_id_seq OWNER TO djangos;

--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutplan_id_seq OWNED BY public.api_workoutplan.id;


--
-- Name: api_yogaexercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaexercise (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details text NOT NULL,
    duration integer NOT NULL,
    image character varying(100) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.api_yogaexercise OWNER TO djangos;

--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaexercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaexercise_id_seq OWNER TO djangos;

--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaexercise_id_seq OWNED BY public.api_yogaexercise.id;


--
-- Name: api_yogaplan; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaplan (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(70),
    image character varying(100) NOT NULL,
    status boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_yogaplan OWNER TO djangos;

--
-- Name: api_yogaplan_exercises; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaplan_exercises (
    id integer NOT NULL,
    yogaplan_id integer NOT NULL,
    yogaexercise_id integer NOT NULL
);


ALTER TABLE public.api_yogaplan_exercises OWNER TO djangos;

--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaplan_exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaplan_exercises_id_seq OWNER TO djangos;

--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaplan_exercises_id_seq OWNED BY public.api_yogaplan_exercises.id;


--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaplan_id_seq OWNER TO djangos;

--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaplan_id_seq OWNED BY public.api_yogaplan.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO djangos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO djangos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO djangos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO djangos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO djangos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO djangos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO djangos;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO djangos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO djangos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO djangos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO djangos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO djangos;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO djangos;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO djangos;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO djangos;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO djangos;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO djangos;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO djangos;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO djangos;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO djangos;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_newuser; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.users_newuser OWNER TO djangos;

--
-- Name: users_newuser_groups; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser_groups (
    id integer NOT NULL,
    newuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_newuser_groups OWNER TO djangos;

--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_groups_id_seq OWNER TO djangos;

--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_groups_id_seq OWNED BY public.users_newuser_groups.id;


--
-- Name: users_newuser_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_id_seq OWNER TO djangos;

--
-- Name: users_newuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_id_seq OWNED BY public.users_newuser.id;


--
-- Name: users_newuser_user_permissions; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser_user_permissions (
    id integer NOT NULL,
    newuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_newuser_user_permissions OWNER TO djangos;

--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_user_permissions_id_seq OWNER TO djangos;

--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_user_permissions_id_seq OWNED BY public.users_newuser_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: api_comment id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment ALTER COLUMN id SET DEFAULT nextval('public.api_comment_id_seq'::regclass);


--
-- Name: api_post id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post ALTER COLUMN id SET DEFAULT nextval('public.api_post_id_seq'::regclass);


--
-- Name: api_reportcomment id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment ALTER COLUMN id SET DEFAULT nextval('public.api_reportcomment_id_seq'::regclass);


--
-- Name: api_reportpost id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost ALTER COLUMN id SET DEFAULT nextval('public.api_reportpost_id_seq'::regclass);


--
-- Name: api_trainee id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee ALTER COLUMN id SET DEFAULT nextval('public.api_trainee_id_seq'::regclass);


--
-- Name: api_trainer id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer ALTER COLUMN id SET DEFAULT nextval('public.api_trainer_id_seq'::regclass);


--
-- Name: api_watertracker id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertracker ALTER COLUMN id SET DEFAULT nextval('public.api_watertracker_id_seq'::regclass);


--
-- Name: api_watertrackerhistory id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertrackerhistory ALTER COLUMN id SET DEFAULT nextval('public.api_watertrackerhistory_id_seq'::regclass);


--
-- Name: api_weighttracker id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker ALTER COLUMN id SET DEFAULT nextval('public.api_weighttracker_id_seq'::regclass);


--
-- Name: api_weighttrackerhistory id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttrackerhistory ALTER COLUMN id SET DEFAULT nextval('public.api_weighttrackerhistory_id_seq'::regclass);


--
-- Name: api_workoutexcercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutexcercise ALTER COLUMN id SET DEFAULT nextval('public.api_workoutexcercise_id_seq'::regclass);


--
-- Name: api_workoutplan id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan ALTER COLUMN id SET DEFAULT nextval('public.api_workoutplan_id_seq'::regclass);


--
-- Name: api_workoutplan_exercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise ALTER COLUMN id SET DEFAULT nextval('public.api_workoutplan_exercise_id_seq'::regclass);


--
-- Name: api_yogaexercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise ALTER COLUMN id SET DEFAULT nextval('public.api_yogaexercise_id_seq'::regclass);


--
-- Name: api_yogaplan id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan ALTER COLUMN id SET DEFAULT nextval('public.api_yogaplan_id_seq'::regclass);


--
-- Name: api_yogaplan_exercises id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises ALTER COLUMN id SET DEFAULT nextval('public.api_yogaplan_exercises_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_newuser id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_id_seq'::regclass);


--
-- Name: users_newuser_groups id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_groups_id_seq'::regclass);


--
-- Name: users_newuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	eng.israahussein88@gmail.com	f	t	1
2	b@q.com	f	t	2
3	b@qk.com	f	t	3
5	7ananm7mddd@gmail.com	t	t	6
6	hanannmohameddd@gmail.com	t	t	8
7	hala@gmail.com	f	t	9
8	sara@gmail.com	f	t	10
9	yousef@gmail.com	t	t	11
10	hala.hamde.22@gmail.com	t	t	12
11	hadeerashraf189@gmail.com	f	t	13
12	Israahusu88@gmail.com	t	t	14
13	ess@gmail.com	t	t	15
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: api_comment; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_comment (id, content, "createdAt", "updatedAt", owner_id, post_id) FROM stdin;
1	okay!	2022-03-03 15:57:05.990826+02	2022-03-03 15:57:05.990878+02	2	3
2	Sure, we will	2022-03-03 17:13:58.800543+02	2022-03-03 17:13:58.800559+02	2	3
\.


--
-- Data for Name: api_post; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_post (id, text, "createdAt", "updatedAt", owner_id) FROM stdin;
5	Choosing good plans that suit your body type is very important.	2022-02-22 07:22:51.351373+02	2022-02-22 07:22:51.351411+02	3
7	Healthy food along with the exercises, makes your life better.	2022-02-22 07:25:13.854784+02	2022-02-22 07:25:13.854827+02	3
9	Don't let your age prevents you from starting healthy life, age is just a number	2022-02-22 07:26:33.85568+02	2022-02-22 07:26:33.855717+02	3
13	Manage your time efficiently to have free time for exercises.	2022-02-22 07:29:40.527605+02	2022-02-22 07:29:40.527638+02	3
15	As a trainer, it is always my peasure to see you with better health.	2022-02-22 07:35:49.398321+02	2022-02-22 07:35:49.398353+02	3
17	I can see that most trainees are going well with their plans	2022-02-22 07:39:08.350379+02	2022-02-22 07:39:08.350414+02	3
19	The adult human body is 60% water and your blood is 90% water. Drinking water benefits the whole body in a million ways.	2022-02-22 08:10:35.264986+02	2022-02-22 08:10:35.295314+02	3
1	Exercises are so useful. Keep going.	2022-01-22 07:13:58.590871+02	2022-02-22 07:13:58.590903+02	3
2	Yoga helps maintaining mental health.	2021-12-28 07:21:04.687808+02	2022-02-22 07:21:04.687843+02	3
3	Try to choose most suitable plans for you.	2022-03-03 07:22:05.928845+02	2022-02-22 07:22:05.928886+02	3
4	Fitness apps are helpful, be active!	2022-01-03 07:22:29.011513+02	2022-02-22 07:22:29.011555+02	3
6	Water helps the body to be hydrated which makes you healthier.	2022-02-25 07:23:21.624753+02	2022-02-22 07:23:21.624789+02	3
8	Active trainees make working easier!	2022-02-02 07:25:27.690873+02	2022-02-22 07:25:27.690937+02	3
10	what about giving one another healthy advices?	2022-01-27 07:27:35.16483+02	2022-02-22 07:27:35.164859+02	3
11	You can always think better when having good life style!	2022-02-05 07:28:07.247465+02	2022-02-22 07:28:07.247515+02	3
12	Life style is a main effect on your mental and physical health. 	2022-02-19 07:28:31.889331+02	2022-02-22 07:28:31.889363+02	3
14	Yoga helps for relaxation.	2022-01-20 07:32:42.035281+02	2022-02-22 07:32:42.035314+02	3
16	Started to see younger trainees using the app, so happy!	2022-01-29 07:38:43.023286+02	2022-02-22 07:38:43.023313+02	3
18	Females, water improves skin tone, don't miss it!	2022-01-13 07:39:59.382877+02	2022-02-22 07:39:59.382915+02	3
20	By increasing blood flow, exercise helps nourish skin cells and keep them vital.	2022-02-20 08:12:44.499677+02	2022-02-22 08:12:44.499697+02	3
21	Exercise helps to promote blood circulation to the scalp and hair follicles.	2022-02-12 08:13:50.382069+02	2022-02-22 08:13:50.382098+02	3
22	Exercise is a great deterrent of wrinkles, fine lines, and sagging skin.	2022-01-20 08:13:58.708009+02	2022-02-22 08:13:58.708039+02	3
23	By exercising, you can prevent hormonal imbalances that lead to acne.	2022-03-02 08:14:31.790687+02	2022-02-22 08:14:31.790725+02	3
24	When exercising outdoors, your hair could develop a few sunlit streaks for a natural highlighted effect.	2022-02-25 14:34:32.355451+02	2022-02-22 14:34:32.355493+02	3
25	Exercise Has an Indirect Effect on Skin Aging by Bettering Sleep and Lowering Stress.	2022-01-30 14:45:51.56286+02	2022-02-22 14:45:51.562932+02	3
\.


--
-- Data for Name: api_reportcomment; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_reportcomment (id, num_of_reports, comment_id, owner_id) FROM stdin;
\.


--
-- Data for Name: api_reportpost; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_reportpost (id, "createdAt", "updatedAt", num_of_reports, owner_id, post_id) FROM stdin;
1	2022-03-04 04:39:36.466517+02	2022-03-04 04:39:36.466568+02	0	2	3
2	2022-03-04 04:55:24.111976+02	2022-03-04 04:55:24.112001+02	0	2	3
\.


--
-- Data for Name: api_trainee; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_trainee (id, "dateOfBirth", "currentWeight", height, "medicalHistory", status, "changedPlanStatus", trainee_id, "trainerID_id", "workoutPlan_id", "yogaPlan_id") FROM stdin;
1	2019-02-05	90	134	f	\N	f	1	3	\N	\N
3	2021-06-23	50	150	f	\N	f	11	3	\N	\N
4	1998-02-03	90	165	f	\N	f	12	\N	\N	\N
5	1983-02-05	80	170	f	\N	f	13	\N	\N	\N
6	2022-02-05	70	170	f	\N	f	14	\N	\N	\N
2	1999-06-06	57	165	f	\N	f	8	3	12	3
\.


--
-- Data for Name: api_trainer; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_trainer (id, "dateOfBirth", gender, "phoneNumber", address, image, trainer_id) FROM stdin;
6	2022-03-05	Female	01069301077	2 years gym coach	profile/hp.jpeg	15
1	2022-03-31	Female	0113466604	Talented trainer worked in many gyms	profile/r.png	3
2	2022-03-25	Female	01123455502	I can let you loose weight in shortest time possible	profile/shoes.jpeg	4
3	1999-07-10	Female	01069301066	Experienced trainer who knows all healthy techniques	profile/avatar_xx8hxUx.jpg	6
4	1999-08-10	Female	01069301066	3 years experience in training 	profile/g.jpg	9
5	1999-08-10	Female	01069301066	Gym coach and nutritionist	profile/avatar2.png	10
\.


--
-- Data for Name: api_watertracker; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_watertracker (id, "currentAmount", created_at, updated_at, "traineeID_id") FROM stdin;
1	0	2022-03-01 22:47:50.637973+02	2022-03-01 22:47:50.638024+02	1
3	0	2022-03-04 12:37:23.052152+02	2022-03-04 12:37:23.052216+02	3
4	0	2022-03-04 13:33:29.545016+02	2022-03-04 13:33:29.545059+02	4
5	0	2022-03-04 13:55:29.694995+02	2022-03-04 13:55:29.695051+02	5
6	0	2022-03-04 14:08:30.984346+02	2022-03-04 14:08:30.984426+02	6
2	500	2022-03-02 03:35:49.048192+02	2022-03-05 16:43:16.469128+02	2
\.


--
-- Data for Name: api_watertrackerhistory; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_watertrackerhistory (id, "dailyAmount", created_at, updated_at, "traineeID_id") FROM stdin;
1	1500	2022-02-15	2022-02-15	2
2	2150	2022-02-16	2022-02-16	2
3	1450	2022-02-17	2022-02-17	2
4	2500	2022-02-18	2022-02-18	2
5	2300	2022-02-19	2022-02-19	2
6	2700	2022-02-20	2022-02-20	2
7	1900	2022-02-21	2022-02-21	2
\.


--
-- Data for Name: api_weighttracker; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_weighttracker (id, "currentWeight", "numOfLogin", "traineeID_id") FROM stdin;
1	90	1	1
2	57	1	2
3	50	1	3
4	90	1	4
5	80	1	5
6	70	1	6
\.


--
-- Data for Name: api_weighttrackerhistory; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_weighttrackerhistory (id, "traineeWeight", created_at, "traineeID_id") FROM stdin;
2	57	2022-01-27	2
3	59	2022-02-04	2
4	55	2022-02-10	2
1	65	2022-01-20	2
\.


--
-- Data for Name: api_workoutexcercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutexcercise (id, name, duration, description, gif) FROM stdin;
2	Standing Bicycle Crunch	30	Stand with feet shoulder-width apart, hands behind your head, elbows out. Lift your right knee and twist to meet it with your left elbow. Now do the opposite ??? touching your right elbow to your raised knee on the left. As you twist your upper body, crunch the abs	exercises/standing.gif
4	Side Plank Front Kick	30	Start in a side plank position, with your bottom knee bent and on the mat and with your top leg extended. Lift your top leg at hip height and kick it slowly to the front, without moving your upper body. Bring your leg back and repeat.	exercises/sideplank.gif
3	Plank	30	Plant hands directly under shoulders (slightly wider than shoulder width) . Ground toes into the floor and squeeze gluts to stabilize your body. Your legs should be working, too ??? be careful not to lock or hyper extend your knees. Neutralize your neck and spine by looking at a spot on the floor about a foot beyond your hands. Your head should be in line with your back.	exercises/plank.gif
5	Bicycle Crunch	30	Lie down on your back. Plant your feet on the floor, hip-width apart. Bend your knees and place your arms across your chest. Contract your abs and inhale. Exhale and lift your upper body, keeping your head and neck relaxed. Inhale and return to the starting position.	exercises/bicycle-crunches-exercise-illustration.gif
6	Vertical Leg Crunch	30	Grab a mat or choose a comfortable surface to lie on.  Lie on your back and get into a comfortable position.  Keep your legs together and raise them vertically in the air.  Place your hands behind your head. Contract your abs and lift your shoulder blades off the floor.	exercises/vertical.gif
7	Single Leg V-Up	30	Lie on your back with your arms extended overhead. Engage your abs to crunch up. Lift your leg upright at the same time, with your lower back on the ground. Touch your hands to the shin of the lifted leg. Keep your body tight and do not drop freely when lowering back down.	exercises/singleleg.gif
8	Mountain Climber	30	Check your form???your hands should be about shoulder-width apart, back flat, abs engaged, and head in alignment. Pull your right knee into your chest as far as you can. Switch legs, pulling one knee out and bringing the other knee in. Keep your hips down and run your knees in and out as far and as fast as you can. Alternate inhaling and exhaling with each leg change.	exercises/mountain.gif
9	Abdominal Crunch	30	Lie face up to the floor with knees bent. With hands behind ears, raise your body off the floor. Hold for 1 second and slowly return to starting position. Repeat	exercises/abdominal.gif
10	V-Sit	30	Hold a dumbbell in each hand, sit on the mat and raise your legs to a 45-degree angle. Squeeze the biceps, lift the dumbbells and curl. Rotate your palms to the front, push the dumbbells up and fully extend your arms. Lower your arms back to the starting position and repeat until the set is complete.	exercises/vsit2.gif
11	Plank With Leg Lift	30	Start in plank position with hands shoulder-width apart. Your shoulders, hips, and ankles should be in a line. Keep abs engaged and raise right leg off the floor until it???s at about hip height. Keep right foot flexed. Pause and feel the burn. Then lower your right leg back to the floor. Repeat with your left leg.	exercises/plankleglift.gif
1	Jumping Jack	30	Stand upright with your legs together, arms at your sides. Bend your knees slightly, and jump into the air. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head. Jump back to starting position. Repeat.	exercises/jumpingg.gif
12	Clam-shell	30	Lie on one side, with legs stacked and knees bent at a 45 degree angle. Keeping your feet touching. raise your upper knee as high as you can without shifting your hips or pelvis.	exercises/clamshell-left.gif
13	Reclined Bound Angle Pose	30	Sit on the floor, bend your legs and pull your knees toward your body. Let your thighs fall open , press the soles of your feet together and carefully pull your heels toward your pelvis.	exercises/reclinedBound.jpg
14	Surrender	30	Keeping your whole upper body upright and strong, proceed to bend in the knees, placing your left knee on the floor. As soon as your first knee finds placement on the floor, follow with the second knee.	exercises/surrender.gif
15	Squat Kickback	30	Begin this move by standing tall, chest high, core engaged, with your added weight on your shoulders. Place your feet just at hip width, with your toes forward.  Proceed to bend in your knees, pushing your rear end out behind you. Focus on keeping your knees behind your toes. Keep the weight in your heels. Once you reach your lowest point, immediately start to push back upward. Only now, you will lift one knee up with you as you reach a standing position.	exercises/squat.gif
16	Step Up	30	Perform step-ups by standing in front of an elevated, knee-height surface like a poly metric box or bench. Place your right foot on top of the elevated surface and push through your right leg to lift your body up onto it.	exercises/stepup.gif
17	Side To Side Squats	30	Start with your feet slightly wider than hip-width apart. Keep your chest up, engage your abdominals, and shift your weight onto your heels as you push your hips back into a sitting position. Lower your hips until your thighs are parallel or almost parallel to the floor. You should feel the squat in your thighs and gluts. Pause with your knees over, but not beyond, your toes. Exhale and push back up to the starting position.	exercises/sideToSideSquats.gif
18	Boxer Squat Punch	30	Start in boxer stance, hands near your nose. Your back heel should be slightly lifted off the ground. Have your fists closed with fingertips facing your chin. Keep your hips in place as you punch your left hand straight out. As you punch, twist the knuckles of your hand so that when your arm is extended, your fingertips face the ground. Be sure to keep your right hand in a fist, tucked and at the ready. Return your left hand to the starting position	exercises/boxerSquat.gif
19	Jump Squat	30	Stand with feet shoulder width and knees slightly bent. Bend your knees and descend to a full squat position. Engage through the quads, glutes, and hamstrings and propel the body up and off the floor, extending through the legs. With the legs fully extended, the feet will be a few inches (or more) off the floor.	exercises/jumpSquat.gif
20	Plie Squat Scoop Up	30	Stand up your feet two to three feet apart and turn your toes out. Bring your hands to your hips. And as you sit back bend your knees and lower into a squat position push	exercises/PileSquat.gif
21	Lunge Punch	30	Stand straight with your feet hip-width apart and hold a dumbbell in each hand. Position the dumbbells at shoulder height with your palms facing each other. Take a step back with your left leg, flex your knees and push your left arm out in a punching motion. Stand back up, switch legs and repeat. Keep alternating legs until the set is complete.	exercises/lungePunch.gif
22	Lunge Kicks	30	Start with your feet together, step back with your right leg, and lunge. As you come up kick your right leg up. Return to the starting position and repeat with the left leg. Keep alternating legs until set is complete. Proper Form And Breathing Pattern.	exercises/lungeKicks.gif
23	Flutter Kick	30	Lie on your back on a gym mat with your legs extended and your arms alongside your hips, palms down. Lift your Legs 4 to 6 inches off the floor. Press your low back into the mat. Keep your Legs  straits as you rhythmically raise one leg higher, then switch. Move in a flutting, up and down motion.  Repeat	exercises/Flutter_Kick.gif
24	Calf Raises	60	Stand with your feet hip-width apart and the toes pointing forward. Raise your heels and squeeze the calves. Lower the heels back to the floor and repeat.	exercises/Calf_raises.gif
25	Lateral Leg Swings	30	Swing your leg across your body from left to right. Switch legs and swing from right to left.	exercises/Lateral_leg_swings.gif
26	Forward Leg Swings	30	Stand up straight and hold onto a wall. Swing one leg forward and backward in a single smooth movement. Switch legs and repeat.	exercises/Forward_leg_swings.gif
27	Back Leg Lifts	30	Start on all fours with the hands under the shoulders and the knees under the hips. Extend one leg behind you. Lift the leg to hip level and then slowly lower it back down. Repeat with the opposite leg until the set is complete.	exercises/Back_Leg_Lifts.gif
28	Fire Hydrant	30	Get down on your hands and knees, with your wrists under your shoulders and your knees hip-width apart. Keeping the knee bent, raise one leg up and out to the side, until it???s level with your hip. Return to the starting position, repeat, and then switch legs.	exercises/Fire_Hydrant.gif
29	Front And Back Lunges	30	Stand with your feet hip-width apart, take a step forward and then slowly bend both knees until your back knee is just above the floor. Stand back up, take a step back with the same leg, and bend both knees until your back knee is just above the floor. Repeat this back and forth movement for the entire duration of the set, and then switch legs.	exercises/Front_And_Back_Lunges.gif
30	Kick Crunch	30	Stand tall with your feet shoulder-width apart. Lift your left leg as high as you can, and touch your left foot with your right hand. Return to the initial position and repeat on the opposite side. Continue alternating sides, in a fast-paced move, until the set is complete.	exercises/kick_crunch.gif
31	Knee to elbow kickback	30	Start in a low plank position, bring your right knee close to your right elbow and crunch. Extend your right leg behind you and kick back. Repeat for 30 seconds and then switch sides.	exercises/Knee_to_elbow_kickback.gif
32	Lunge back kick	60	Stand with your feet hip-width apart, take a step to the front with your right leg and lunge. As you come back up, kick your right leg back and squeeze the glutes. Switch legs and repeat.	exercises/Lunge_back_kick.gif
33	Double Leg Stretch	30	Lie on the mat with your legs bent, feet off the floor, and grab both knees. Lift the shoulders off the floor, extend your arms toward the ears and simultaneously extend both legs to a 45-degree angle off the floor. Then bend the knees and hug the chins toward your chest. Extend your arms and legs and repeat until the set is complete.	exercises/Double_Leg_Stretch_.gif
34	Hamstring Stretch	30	Lie on your back and lift your left leg. Gently pull your thigh toward your chest until you feel a stretch in your hamstrings. Hold the stretch and then repeat with the right leg.	exercises/Hamstring_Stretch.gif
35	Arm swings	60	Stand up straight with your feet shoulder-width apart. Cross your arms at the front and then quickly bring them back as far as you can.	exercises/Arm_swings.gif
36	Arm circles	30	Stand straight with your feet shoulder-width apart. Raise and extend your arms to the sides without bending the elbows. Slowly rotate your arms forward, making small circles for 30 seconds, and then switch, rotating backward.	exercises/Arm_circles_.gif
37	Big arm circles	30	Stand with your feet shoulder width apart and rotate your arms forward, making big circles. Repeat for 30 seconds and then rotate backwards.	exercises/Big_arm_circles.gif
38	Dumbbell shoulder press	60	Lift your torso and position the dumbbells at your shoulders with your palms facing forward and your elbows under your wrists. Push the dumbbells up and fully extend your arms. Lower the dumbbells back down to your shoulders and repeat the movement for 60 seconds.	exercises/Dumbbell_shoulder_press_.gif
39	Cross chest curl	30	Roll your shoulders back, squeeze the left biceps, and bring the dumbbell across your body and toward your right shoulder. Repeat for 30 seconds and then switch sides.	exercises/Cross_chest_curl_.gif
40	Dumbbell front raise	45	Stand with your palms facing down and lift one dumbbell until your arm is slightly above parallel to the floor. Pause and then slowly lower the arm back to the starting position. Repeat with the opposite arm and keep alternating sides for 45 seconds.	exercises/Dumbbell_front_raise.gif
41	Dumbbell lateral raise	45	Stand straight with your palms facing down, lift the dumbbells and raise your arms out to the sides. Once your elbows are at shoulder height, pause, and then slowly lower the arms back to the initial position. Repeat.	exercises/Dumbbell_lateral_raise.gif
42	Bicep curls	60	Stand straight with your feet shoulder-width apart and hands by your sides. Squeeze the biceps and lift the dumbbells. Keep the elbows close to your body and the upper arms stationary, only the forearms should move. Once the dumbbells are at shoulder level, slowly lower the arms to the starting position and repeat.	exercises/Bicep_curls_.gif
43	Concentration curl	30	Sit on a bench holding a dumbbell in your left hand, and rest your elbow on the inside of your left thigh. Squeeze the left biceps and bring the dumbbell toward your chest. Lower the left arm to the starting position, repeat for 30 seconds, and then switch arms.	exercises/Concentration_curl.gif
44	Tricep dips	60	Place your hands behind you onto a chair, so that your fingers face forward. Extend your legs and start bending your elbows. Lower your body until your arms are at a 90-degree angle. Lift your body back and repeat.	exercises/Tricep_dips.gif
45	Push ups	45	Get down into a push-up position, start bending your elbows, and lower your chest until it???s just above the floor.	exercises/Push_ups.gif
46	Inchworm	30	Start standing with your feet together. Forward fold with straight legs, and place your hands on the floor. Walk your hands out until you are in a plank position with shoulders over your wrists. Bend your elbows and bring your chin and chest to the floor. Your elbows should form a 45-degree angle with your shoulder joints. Press back up to your plank. Walk your hands back in toward your feet, keeping your legs as straight as possible. Roll back up to a standing position, with control.	exercises/inchworm.gif
47	Rope Climb Crunches	30	Sit down on the floor with your knees slightly bent and lean your torso back. Extend your right arm toward the ceiling and bring your left knee up. Switch sides, moving your arms as if you were climbing a rope, and repeat. Keep alternating sides until the set is complete	exercises/ropeClimb.gif
48	Single Leg Stretch	30	Lie on the floor with both legs extended and arms along the sides with your palms facing down. Pull your abs in, lift both shoulders off the floor and simultaneously bend your right knee. Pull the knee in toward your chest and hold your right ankle with your right hand and your right knee with your left hand. Slowly switch leg and hand positions and keep your extended leg raised a few inches off the floor with the toes pointed. Keep switching leg positions until the set is complete.	exercises/singleLegStretch.gif
49	Squat Thrust	30	Stand straight with your feet shoulder-width apart. Squat and place your hands in front of your feet. Jump back and get into a push-up position. Jump again, bringing the legs toward your palms, and stand up. Repeat until the set is complete.	exercises/squatThrust.gif
50	Run In Place	30	Stand straight with your feet shoulder-width apart and face forward, opening up your chest. Start pulling your knees up, and slowly land on the balls of your feet. Repeat until the set is complete.	exercises/runInPlace.gif
51	180 Jump Squat	30	Stand with your feet a little wider than shoulder-width apart, your toes pointing slightly outward, and sit back. Push through the heels to jump up, spinning to the left 180 degrees. Land on your toes with your knees slightly bent and squat. Quickly jump up, spinning to the right, and go back into the squat position. Repeat until the set is complete.	exercises/jumpSquat180.gif
52	High Knees	30	Stand straight with your feet shoulder-width apart. Face forward and open your chest. Bring your knees up to waist level and then slowly land on the balls of your feet. Repeat until the set is complete.	exercises/highKnees.gif
\.


--
-- Data for Name: api_workoutplan; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutplan (id, name, description, image, status, created_at, updated_at, owner_id) FROM stdin;
8	LEG workout Intermediate	\N	images/bradley-dunn-ACbu5AY5Tvk-unsplash_gMwpsCR.jpg	t	2022-02-15 02:24:26.67858+02	2022-02-15 03:12:41.182081+02	1
10	ARM workout Begineer	\N	images/pexels-marta-wave-6454196.jpg	t	2022-02-15 03:24:00.541586+02	2022-02-15 03:24:00.541605+02	1
12	ARM workout Advanced	\N	images/geert-pieters-3RnkZpDqsEI-unsplash.jpg	t	2022-02-15 03:27:34.800801+02	2022-02-15 03:27:34.800818+02	1
13	BUTT workout Begineer	\N	images/luke-aguaita-Nm5yy2sbgB8-unsplash.jpg	t	2022-02-15 03:37:09.013264+02	2022-02-15 03:37:09.013284+02	1
14	BUTT workout Intermediate	\N	images/sergio-pedemonte-pE5oWO__uDI-unsplash.jpg	t	2022-02-15 03:40:33.178049+02	2022-02-15 03:40:33.178073+02	1
9	LEG workout Advanced	\N	images/sergio-pedemonte-7Li2duPduew-unsplash.jpg	t	2022-02-15 03:22:04.857684+02	2022-02-15 03:44:23.502594+02	1
16	ABS workout Begineer	\N	images/pexels-marcus-aurelius-6787216.jpg	t	2022-02-15 03:46:49.861259+02	2022-02-15 03:46:49.861277+02	1
18	ABS workout Advanced	\N	images/istockphoto-930884708-1024x1024.jpg	t	2022-02-15 03:48:43.438128+02	2022-02-15 03:52:26.545633+02	1
19	Weight Loss	\N	images/tyler-nix-Y1drF0Y3Oe0-unsplash.jpg	t	2022-02-15 03:58:26.562223+02	2022-02-15 03:59:49.510904+02	1
7	LEG workout Begineer	\N	images/pexels-monstera-6311667_gtoOHKb_GXKiOj3.jpg	t	2022-02-15 02:23:25.492899+02	2022-02-17 18:06:58.556615+02	1
11	ARM workout Intermediate	\N	images/pexels-klaus-nielsen-6303478_q7mL0T7_xcvCBKR.jpg	t	2022-02-15 03:26:08.867354+02	2022-02-17 18:38:53.547159+02	1
17	ABS workout Intermediate	\N	images/pexels-photo-6019876_DYwGtNV.jpeg	t	2022-02-15 03:48:01.791951+02	2022-02-17 18:41:36.52904+02	1
15	BUTT workout Advanced	\N	images/butt-advanced.jpg	t	2022-02-15 03:43:22.742537+02	2022-02-18 00:26:18.130055+02	1
\.


--
-- Data for Name: api_workoutplan_exercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutplan_exercise (id, workoutplan_id, workoutexcercise_id) FROM stdin;
37	8	32
38	8	33
39	8	34
40	8	8
41	8	46
42	8	31
49	9	33
50	9	8
51	9	23
52	9	24
53	9	27
54	9	29
55	10	35
56	10	36
57	10	37
58	10	38
59	10	39
65	12	35
66	12	37
67	12	43
68	12	44
69	12	45
70	13	12
71	13	15
72	13	17
73	13	18
74	13	20
75	14	15
76	14	49
77	14	52
78	14	21
79	14	22
80	15	41
81	15	14
82	15	15
83	15	17
84	15	18
85	15	19
86	15	20
87	15	21
88	15	31
89	16	1
90	16	2
91	16	3
92	16	5
93	16	6
94	16	7
101	18	1
102	18	4
103	18	5
104	18	11
105	18	12
106	19	1
107	19	3
108	19	7
109	19	44
110	19	47
111	19	16
112	19	49
113	19	50
114	19	19
115	19	51
116	19	52
117	19	46
118	7	23
119	7	24
120	7	25
121	7	26
122	7	27
123	7	28
124	7	29
125	11	38
126	11	39
127	11	40
128	11	41
129	11	42
130	17	3
131	17	4
132	17	7
133	17	8
134	17	9
135	17	10
\.


--
-- Data for Name: api_yogaexercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaexercise (id, name, details, duration, image, "createdAt", "updatedAt") FROM stdin;
1	Child???s Pose	1-Get on all fours on your mat.\r\n2-Spread your knees wide and position your big toes so that they???re touching.\r\n3-Let your stomach fall between your thighs and allow your forehead to drop toward the floor.\r\n4-Extend your arms in front of your body with your palms on the floor.\r\nBreathe deeply in and out here.	30	yogaexercises/childpose.gif	2022-02-14 09:35:46.032286+02	2022-02-14 10:01:04.519057+02
2	Happy Baby	Lie on your back on your mat.\r\nBend your knees and bring them to your stomach, gripping the outsides of your feet. Flex your heels and ankles.\r\nBreathe here, focusing on keeping your ankles directly above your knees while pushing against your hands with your feet.	30	yogaexercises/happybaby.gif	2022-02-14 09:37:08.39822+02	2022-02-14 10:01:24.828149+02
3	Cat-Cow	Get on all fours on your mat with yours hands under yours shoulders and knees under your hips.\r\nEngage your abs, exhale, and push your spine up toward the ceiling.\r\nAllow your head to fall toward your chest. Hold here for 10 seconds.\r\nInhale and let your spine fall back down, allowing your stomach to fall toward the ground while your head comes up and back. Hold here for 10 seconds	30	yogaexercises/catcow.gif	2022-02-14 09:38:09.10926+02	2022-02-14 10:01:44.951684+02
4	Cobra	Lie on your mat on your stomach with your legs shoulder-width apart and the tops of your feet on the mat.\r\nPlace your hands underneath your shoulders with your elbows tucked into your body.\r\nInhale and begin to straighten your arms, pushing through the tops of your feet.\r\nLift your chest off the floor and push your shoulders back.\r\nStop straightening your arms as soon as your pelvis loses contact with the ground ??? breathe in and out here for up to 30 seconds.	30	yogaexercises/copra.gif	2022-02-14 09:38:55.508471+02	2022-02-14 10:03:11.007308+02
6	Downward Dog	Get on all fours on your mat with your hands underneath your shoulders and your knees underneath your hips. Inhale.\r\nExhale and lift your knees away from the floor, pushing your heels down toward the floor. Lift your tailbone toward the ceiling. Do not lock your knees.\r\nDraw your shoulder blades toward your tailbone and keep your head between your arms.\r\nStay here, working on getting your feet in contact with the ground	30	yogaexercises/drowningdog.gif	2022-02-14 09:41:10.919127+02	2022-02-14 10:03:53.052571+02
5	Chair	Stand with your feet together and inhale, extending your arms directly overhead.\r\nExhale, begin to sit back into your hips, and bend your knees. Stop when your thighs are parallel to the ground.\r\nRoll your shoulders down and back and press your tailbone toward the ground. Breathe here.	30	yogaexercises/chair.gif	2022-02-14 09:39:40.556803+02	2022-02-14 10:03:35.694718+02
7	Warrior I	Stand with your feet together and arms at your side.\r\nStep with your left foot into a lunge, keeping your right leg straight and turning your right foot at a 45-degree angle.\r\nExtend your arms above your head.\r\nSqueeze your shoulder blades together and down, and lift your head to look up at your fingertips.	30	yogaexercises/warriorI.gif	2022-02-14 09:41:53.687348+02	2022-02-14 10:04:06.342662+02
8	Bridge	Lie on your back with your knees bent and feet flat on the ground.\r\nPlace your arms at your sides with your palms on the ground.\r\nInhale. Exhale and push up through your feet, pushing your hips up toward the s	30	yogaexercises/bridge.gif	2022-02-14 09:42:45.241647+02	2022-02-14 10:04:28.196501+02
10	Bow	Lay on your stomach with your arms extended by your sides and your palms up.\r\nBend your knees and reach back, grabbing hold of your ankles with your hands.\r\nKeep your knees in line with your hips.\r\nAs you inhale, lift your heels away from your butt while you lift your thighs off the ground.\r\nPress your shoulder blades back and look forward.	30	yogaexercises/bow.gif	2022-02-14 09:44:16.073113+02	2022-02-14 10:04:49.01747+02
11	Boat	Sit on your butt with your legs extended in front of you.\r\nLean back slightly with your hands on the ground supporting you.\r\nInhale and bring your knees toward your chest, stopping when your thighs are at a 45-degree angle to the ground.\r\nExtend your legs if possible ??? otherwise, keep them here.\r\nBring your arms out in front of you so they???re parallel to the floor. Hold he	30	yogaexercises/boat.gif	2022-02-14 09:45:13.033703+02	2022-02-14 10:05:09.367873+02
12	King Pigeon	Assume Pigeon Pose with your left knee bent in front of you and your right leg extended behind you.\r\nBend your right knee and bring your foot up toward your back.\r\nArch your back and drop your head down.\r\nReach your hands over your head and grab hold of your foot with both hands	30	yogaexercises/king.gif	2022-02-14 09:46:53.701198+02	2022-02-14 10:05:34.105349+02
14	Lord of the Dance	Stand with your feet together and arms down at your sides.\r\nBend your left knee, bringing your foot to your butt.\r\nGrab the outside of your foot with your left hand, pushing your tailbone down and your pelvis up toward your belly button.\r\nAllow your knee to extend slightly as it moves up toward the ceiling.\r\nExtend your right arm in front of you parallel to the floor.	30	yogaexercises/lordofdance.gif	2022-02-14 09:48:38.743906+02	2022-02-14 10:06:08.676306+02
13	Dove	Kneel on the floor with your arms down at your sides.\r\nWith your fingers facing forward, lean back onto your hands with your arms straight.\r\nLower down onto your forearms.\r\nBegin to push your thighs up and out, arching your back, dropping your head, and moving your hands as close to your feet as possible.	30	yogaexercises/dove.gif	2022-02-14 09:47:40.135277+02	2022-02-14 10:05:52.580804+02
15	Firefly	Squat down and lean your torso forward between your legs.\r\nPlace your hands on the floor inside your legs.\r\nBring your upper arms as close to your upper thigh as possible.\r\nBegin to lift yourself off the floor and push your weight into your hands.\r\nShift your center of gravity back, allowing your legs to straighten in front of you	30	yogaexercises/firefly.gif	2022-02-14 09:49:58.115856+02	2022-02-14 10:06:44.770708+02
16	Extended Side Angle Pose	Turn your right foot out so your toes are pointing to the short edge of the mat and turn your left toes in, about 45 degrees. You are looking for stability through both legs. \r\nAs you exhale, bend your right knee, thigh parallel to the floor, knee above the ankle \r\nTake a deep inhale and firm your lower abdomen in and up. \r\nAs you exhale, extend your body over the right leg, and bring your right arm down, either with your elbow on your right thigh or place your hand on the floor to the inside or the outside of the right foot ??? whatever feels right for your body.	30	yogaexercises/sideAngleLeft.gif	2022-02-14 09:53:51.351028+02	2022-02-14 10:07:06.271523+02
17	Extended Triangle Pose	From Tadasana (Mountain Pose), step or lightly jump your feet 3 to 4 feet apart. Raise your arms parallel to the floor and reach them actively to the sides, shoulder blades wide, palms down.\r\nTurn your left foot in slightly and your right foot out to 90 degrees. Align your right heel with your left heel. Firm your thighs and rotate your right thigh outward, so the center of your right kneecap is in line with the center of the right ankle.	30	yogaexercises/extendttraingle.gif	2022-02-14 10:12:53.799+02	2022-02-14 10:12:53.799027+02
9	Garland	Squat down with your feet as close together as you can get them, toes pointed out.\r\nLet your torso fall between your thighs, pressing your elbows against your knees.\r\nKeep your tailbone pressed toward the ground and your chest up, using the resistance of your knees to help you.	30	yogaexercises/graland.gif	2022-02-14 09:43:32.435727+02	2022-02-14 10:15:49.569582+02
\.


--
-- Data for Name: api_yogaplan; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaplan (id, name, description, image, status, "createdAt", owner_id) FROM stdin;
2	Core Yoga	Focuses on different Twist moves to release stress	media/coreyoga_hKPTLOL.jpeg	t	2022-02-15 13:30:11.984686+02	1
3	Dynamic Yoga	Gives you inner energy	media/dynamicyoga_Oh7CNWB.jpeg	t	2022-02-15 13:33:56.764685+02	1
4	Twist Stretch Yoga	Helps you to extend all body parts	media/twiststretch_NL1gcor.jpeg	t	2022-02-15 13:52:43.157175+02	1
6	Heartbeat Yoga	Focuses on yoga postures	media/heartbeat_axSzzlk.jpeg	t	2022-02-15 13:59:31.532806+02	1
7	Be Continued Yoga	Maintain poses for an extended amount of time and improve your balance	media/becontinued_dw1Elx1.jpeg	t	2022-02-15 14:02:32.842712+02	1
8	Back Care Yoga	A routine to help relieve your back tightness	media/backyoga_k30Zw0l.jpeg	t	2022-02-15 14:09:30.664158+02	1
9	Yoga Balance	Calms your mind and makes you feel the peace	media/yogabalance_MAA14MX.jpeg	t	2022-02-15 14:12:40.288486+02	1
11	Yogi Angel Yoga	Light exercises to recharge your energy and spirit for new day	media/yogiangel.jpeg	t	2022-02-15 14:49:53.875608+02	1
12	Power Yoga	Strengthen and relax your body	media/poweryoga.jpeg	t	2022-02-15 14:54:50.50512+02	1
13	Just Be Yoga	Light exercises to active your body and decrease fatigue	media/justbeyoga.jpeg	t	2022-02-15 14:58:16.214262+02	1
15	Go To Flow Yoga	Breath And Relax	media/gotoflowyoga.jpeg	t	2022-02-15 15:09:50.922754+02	1
10	Yummy Yoga	Stretch your entire body with different angles and poses	media/yumyyoga_FkjPK14.jpg	t	2022-02-15 14:15:09.207329+02	1
1	Beginner Yoga	Yoga For Beginners with easy follow poses	media/beginner_lmmbaHo.jpg	t	2022-02-15 13:26:17.622635+02	1
5	White Heat Yoga	Focuses on Flexibility and Strength of muscles	media/whiteheat_u4Ja19p.jpg	t	2022-02-15 13:56:39.726471+02	1
14	Laughing Frog Yoga	Relaxing your body , make it breath	media/laughingg_DQKlyY2.jpeg	t	2022-02-15 15:02:12.783121+02	1
\.


--
-- Data for Name: api_yogaplan_exercises; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaplan_exercises (id, yogaplan_id, yogaexercise_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	7
7	2	6
8	2	7
9	2	8
10	2	10
11	2	11
12	2	12
13	2	14
14	3	1
15	3	4
16	3	6
17	3	7
18	3	8
19	3	9
20	3	10
21	3	11
22	3	13
23	3	15
24	4	3
25	4	4
26	4	5
27	4	7
28	4	10
29	4	12
30	4	13
31	4	16
32	4	17
33	5	1
34	5	3
35	5	6
36	5	7
37	5	8
38	5	9
39	5	12
40	5	14
41	6	1
42	6	2
43	6	3
44	6	5
45	6	6
46	6	9
47	6	12
48	6	15
49	7	1
50	7	3
51	7	6
52	7	7
53	7	9
54	7	10
55	7	11
56	7	12
57	7	14
58	7	15
59	7	16
60	7	17
61	8	1
62	8	3
63	8	4
64	8	6
65	8	8
66	8	10
67	8	13
68	8	14
69	8	16
70	8	17
71	9	2
72	9	5
73	9	7
74	9	9
75	9	11
76	9	12
77	9	13
78	9	14
79	9	15
80	10	1
81	10	3
82	10	4
83	10	6
85	10	10
86	10	13
87	10	14
88	10	16
89	10	17
90	10	2
91	10	11
92	10	12
93	10	7
94	11	1
95	11	2
96	11	3
97	11	4
98	11	5
99	11	7
100	11	8
101	11	9
102	11	14
103	12	4
104	12	7
105	12	8
106	12	9
107	12	10
108	12	12
109	12	13
110	12	14
111	12	15
112	13	1
113	13	2
114	13	3
115	13	4
116	13	5
117	13	7
118	13	8
119	13	9
120	14	1
121	14	2
122	14	3
123	14	4
124	14	5
125	14	8
126	14	9
127	14	11
128	14	12
129	15	1
130	15	2
131	15	3
132	15	4
133	15	7
134	15	11
135	15	12
136	15	14
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add new user	14	add_newuser
54	Can change new user	14	change_newuser
55	Can delete new user	14	delete_newuser
56	Can view new user	14	view_newuser
57	Can add comment	15	add_comment
58	Can change comment	15	change_comment
59	Can delete comment	15	delete_comment
60	Can view comment	15	view_comment
61	Can add post	16	add_post
62	Can change post	16	change_post
63	Can delete post	16	delete_post
64	Can view post	16	view_post
65	Can add trainee	17	add_trainee
66	Can change trainee	17	change_trainee
67	Can delete trainee	17	delete_trainee
68	Can view trainee	17	view_trainee
69	Can add trainer	18	add_trainer
70	Can change trainer	18	change_trainer
71	Can delete trainer	18	delete_trainer
72	Can view trainer	18	view_trainer
73	Can add workout excercise	19	add_workoutexcercise
74	Can change workout excercise	19	change_workoutexcercise
75	Can delete workout excercise	19	delete_workoutexcercise
76	Can view workout excercise	19	view_workoutexcercise
77	Can add yoga exercise	20	add_yogaexercise
78	Can change yoga exercise	20	change_yogaexercise
79	Can delete yoga exercise	20	delete_yogaexercise
80	Can view yoga exercise	20	view_yogaexercise
81	Can add yoga plan	21	add_yogaplan
82	Can change yoga plan	21	change_yogaplan
83	Can delete yoga plan	21	delete_yogaplan
84	Can view yoga plan	21	view_yogaplan
85	Can add workout plan	22	add_workoutplan
86	Can change workout plan	22	change_workoutplan
87	Can delete workout plan	22	delete_workoutplan
88	Can view workout plan	22	view_workoutplan
89	Can add weight tracker history	23	add_weighttrackerhistory
90	Can change weight tracker history	23	change_weighttrackerhistory
91	Can delete weight tracker history	23	delete_weighttrackerhistory
92	Can view weight tracker history	23	view_weighttrackerhistory
93	Can add weight tracker	24	add_weighttracker
94	Can change weight tracker	24	change_weighttracker
95	Can delete weight tracker	24	delete_weighttracker
96	Can view weight tracker	24	view_weighttracker
97	Can add water tracker history	25	add_watertrackerhistory
98	Can change water tracker history	25	change_watertrackerhistory
99	Can delete water tracker history	25	delete_watertrackerhistory
100	Can view water tracker history	25	view_watertrackerhistory
101	Can add water tracker	26	add_watertracker
102	Can change water tracker	26	change_watertracker
103	Can delete water tracker	26	delete_watertracker
104	Can view water tracker	26	view_watertracker
105	Can add report post	27	add_reportpost
106	Can change report post	27	change_reportpost
107	Can delete report post	27	delete_reportpost
108	Can view report post	27	view_reportpost
109	Can add report comment	28	add_reportcomment
110	Can change report comment	28	change_reportcomment
111	Can delete report comment	28	delete_reportcomment
112	Can view report comment	28	view_reportcomment
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
edbb758edffff53c48f94dc7bdff66e55c9b1140	2022-03-01 22:47:50.671988+02	1
3b79dc104cb5bf63da6723e8e2042caea40e78bc	2022-03-01 22:55:34.000736+02	3
b6170f8366ae02e15bd14e4e678aae79dc2677a1	2022-03-01 22:58:24.254568+02	4
259f7e367831178f8484f9fdac93153ba9617742	2022-03-04 00:46:47.698288+02	9
3cd2064a0ad6a69c9ff931fafc56b36071326d88	2022-03-04 00:48:20.697986+02	10
4ca5ea8eed7d4cda1dcefb95f77519e6af9c5c11	2022-03-04 13:55:29.767465+02	13
b9ebb27de1eafd7d159fa2f0044c909f18cf30be	2022-03-04 14:08:31.075254+02	14
f119a212acbc99b11ed344439f56c4818375ffc5	2022-03-05 20:46:37.677802+02	6
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-03-02 03:03:10.595759+02	3	127.0.0.1:3000	1	[{"added": {}}]	6	7
2	2022-03-02 03:06:30.215862+02	5	7ananm7mddd@gmail.com	2	[{"changed": {"fields": ["Verified"]}}]	7	7
3	2022-03-04 12:37:44.932379+02	9	yousef@gmail.com	2	[{"changed": {"fields": ["Verified"]}}]	7	7
4	2022-03-04 13:54:21.810751+02	4	israaawad474@gmail.com	3		7	7
5	2022-03-04 21:24:50.338822+02	11	SaraAdell	2	[{"changed": {"fields": ["Username"]}}]	14	7
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	authtoken	token
13	authtoken	tokenproxy
14	users	newuser
15	api	comment
16	api	post
17	api	trainee
18	api	trainer
19	api	workoutexcercise
20	api	yogaexercise
21	api	yogaplan
22	api	workoutplan
23	api	weighttrackerhistory
24	api	weighttracker
25	api	watertrackerhistory
26	api	watertracker
27	api	reportpost
28	api	reportcomment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-01 22:40:01.382544+02
2	contenttypes	0002_remove_content_type_name	2022-03-01 22:40:01.463293+02
3	auth	0001_initial	2022-03-01 22:40:01.664091+02
4	auth	0002_alter_permission_name_max_length	2022-03-01 22:40:02.021933+02
5	auth	0003_alter_user_email_max_length	2022-03-01 22:40:02.148455+02
6	auth	0004_alter_user_username_opts	2022-03-01 22:40:02.203645+02
7	auth	0005_alter_user_last_login_null	2022-03-01 22:40:02.227772+02
8	auth	0006_require_contenttypes_0002	2022-03-01 22:40:02.242971+02
9	auth	0007_alter_validators_add_error_messages	2022-03-01 22:40:02.259103+02
10	auth	0008_alter_user_username_max_length	2022-03-01 22:40:02.27111+02
11	auth	0009_alter_user_last_name_max_length	2022-03-01 22:40:02.27952+02
12	auth	0010_alter_group_name_max_length	2022-03-01 22:40:02.292906+02
13	auth	0011_update_proxy_permissions	2022-03-01 22:40:02.304042+02
14	auth	0012_alter_user_first_name_max_length	2022-03-01 22:40:02.314277+02
15	users	0001_initial	2022-03-01 22:40:02.569737+02
16	account	0001_initial	2022-03-01 22:40:03.086995+02
17	account	0002_email_max_length	2022-03-01 22:40:03.260182+02
18	admin	0001_initial	2022-03-01 22:40:03.402403+02
19	admin	0002_logentry_remove_auto_add	2022-03-01 22:40:03.513411+02
20	admin	0003_logentry_add_action_flag_choices	2022-03-01 22:40:03.531272+02
21	api	0001_initial	2022-03-01 22:40:04.991802+02
22	authtoken	0001_initial	2022-03-01 22:40:06.589304+02
23	authtoken	0002_auto_20160226_1747	2022-03-01 22:40:06.833004+02
24	authtoken	0003_tokenproxy	2022-03-01 22:40:06.851714+02
25	sessions	0001_initial	2022-03-01 22:40:06.945613+02
26	sites	0001_initial	2022-03-01 22:40:07.080419+02
27	sites	0002_alter_domain_unique	2022-03-01 22:40:07.181083+02
28	socialaccount	0001_initial	2022-03-01 22:40:07.587108+02
29	socialaccount	0002_token_max_lengths	2022-03-01 22:40:07.990627+02
30	socialaccount	0003_extra_data_default_dict	2022-03-01 22:40:08.022305+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
negie14agvzsmmbatu6xbmyw62waq1wy	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiIxIn0:1nP9PU:xoQANuB0HkvBjB2nzxw651g9bNpn44vDiFfMys1k_iw	2022-03-15 22:47:52.858416+02
p87q32godpdmpmnsxaswojd3n7e9uinl	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiI0In0:1nP9Zi:_KcnZRIRP4dphaZsuKbEigN6_l8WUgBBBCJdAxo0gJQ	2022-03-15 22:58:26.525323+02
2iddxqv8xj7y1qg4t7u7dpcsxw8127x3	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiI4In0:1nPDuD:ohZjniA4HougC9LJJt-yD0W6f5MnjV-bIyijByIh8rE	2022-03-16 03:35:53.720836+02
x0luo4vxfm0ek5m97tl7ge39arqbe9t6	.eJxVjDsOwjAQRO_iGln-hdiU9JzBWu96cQDZUpxUiLuTSClA0817M28RYV1KXHue40TiIrw4_XYJ8JnrDugB9d4ktrrMU5K7Ig_a5a1Rfl0P9--gQC_bmrUOaJ0ns4WAgTUOllTQlrXK5mwAQ2JwnrVPwbEnGI0fB6ssAGbx-QL-7jiM:1nPDw7:T7OqwCnEMfDbJTS2F5RJNBEPS2Pv6SndS2thm6g1XjA	2022-03-16 03:37:51.490139+02
az0emmyukmnppo8vndkvem2kcevxay7s	.eJxVjDsOwjAQRO_iGln-hdiU9JzBWu96cQDZUpxUiLuTSClA0817M28RYV1KXHue40TiIrw4_XYJ8JnrDugB9d4ktrrMU5K7Ig_a5a1Rfl0P9--gQC_bmrUOaJ0ns4WAgTUOllTQlrXK5mwAQ2JwnrVPwbEnGI0fB6ssAGbx-QL-7jiM:1nPO5V:YLOydLjQMMvXYfa8tUxuqrrB3NxVoEiHFRccjAZut4Y	2022-03-16 14:28:13.434146+02
61dig3qx1udfzanqdji3svw4lubw2xx6	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPOZE:SeVVzTst9bnJasOe6NmjAJEC7LGXpZ6vxd9ihKUrAII	2022-03-16 14:58:56.537172+02
ii3xgvreq65rk0ik930bz19y385exs1z	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPlQp:8NJ7FO-TQ8rhK12ihI_zTMYIrGvit44EnobXcrNhUU8	2022-03-17 15:23:47.492548+02
5mogalj4gl8nf4zrmfn50jmh8pp5wuwr	.eJxVjDsOwjAQBe_iGln24l8o6XMGy95d4wBypDipEHeHSCmgfTPzXiKmba1x67zEicRFOHH63XLCB7cd0D212yxxbusyZbkr8qBdjjPx83q4fwc19fqtLWEpJmAINhTI2mmHygJBysCeBwZIVLwxBllRHhA8obYWUblz0CDeH_sjODM:1nPn1F:rf1wJeIG6lugFNROmF0GQSKQtjOVVhceZj4jRQyE2Ts	2022-03-17 17:05:29.887702+02
no80k24pwd8ijfwzqsi4fhof37bc2hji	.eJxVjEEOwiAQRe_C2hAchIpL9z0DmWEGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVRXh1-N8L0kLoBvmO9NZ1aXeaJ9KbonXY9NpbndXf_Dgr28q0RJYgnR9lZcGgIzxKsZ_DOGGaPFk8EHAwc7cCcckpAGUHSEJgdqvcHC0A5Pg:1nPn5J:A4-wSiwNaAFu7E-jKlwEbMgjeay251ZUSBLBVafHAPM	2022-03-17 17:09:41.442994+02
acjljju07pfqc8i6lwtv7vlilyygda8r	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPn5x:SIkE_K4OA7Bv3JqPi3EAcjTnBxMXVX1HvZG44XJpis8	2022-03-17 17:10:21.697889+02
s7899z1tlf1a928izemszld16c4d3pv0	.eJxVjEEOwiAQRe_C2hAchIpL9z0DmWEGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVRXh1-N8L0kLoBvmO9NZ1aXeaJ9KbonXY9NpbndXf_Dgr28q0RJYgnR9lZcGgIzxKsZ_DOGGaPFk8EHAwc7cCcckpAGUHSEJgdqvcHC0A5Pg:1nPooO:Q4bjSO-4Yyo33fQeHcFlafXRW50Y9KDkrQS9QRFT_xc	2022-03-17 19:00:20.753896+02
jequb0wyl7g9yez36jso1pcumwbxcor7	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPrSM:VAqBZXq-9U_LdnZ3NP-hqxqKx3mF6lFJgGINURPUXTE	2022-03-17 21:49:46.908873+02
6h1tng44pa5kbdx9yogo3emod5hh98z6	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPsGu:wVp-qJsTx4nDs2yaIUyESG6UkeJDRIe4XN9vMUbr6ak	2022-03-17 22:42:00.704229+02
w53a64pu33wtv8on39v7knimdd0ieiep	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPtjC:8nw9KJmFvFNGZP2tdO9M8kOs3Gigj8NmgVq-Rtyc9fs	2022-03-18 00:15:18.156923+02
v21ywaluedy26qob51u2yirimhn8xtbf	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nPvEw:MF792tnT_6cklTSS67deUL5JkUMt3SFVruI6H910p9I	2022-03-18 01:52:10.661248+02
or6wzl67v69fdzt87ul8z4c655jwo86l	.eJxVjDkOwjAQRe_iGlmeieOFkj5niGYxOIASKUuFuDtESgHtf-_9l-lpW2u_LWXuBzVnA2BOvyOTPMq4E73TeJusTOM6D2x3xR50sd2k5Xk53L-DSkv91pHVNUkoKyFcHWf1QB4DY_AIsUkxQKuJODQOJTvNJMC5RfEobUnm_QH5-DeQ:1nQ5K9:PZwCgbQ_FtKvrILpzgVkDT9L8UKuOAZDNvXT7hkSSHA	2022-03-18 12:38:13.457083+02
voptustixv1e99ltfampr8stbs7tfheg	.eJxVjDkOwjAQRe_iGlmeieOFkj5niGYxOIASKUuFuDtESgHtf-_9l-lpW2u_LWXuBzVnA2BOvyOTPMq4E73TeJusTOM6D2x3xR50sd2k5Xk53L-DSkv91pHVNUkoKyFcHWf1QB4DY_AIsUkxQKuJODQOJTvNJMC5RfEobUnm_QH5-DeQ:1nQ5L6:t_FqGMd_vNZkChn2neiZeyjLo1JJGk3kfh8iR9MeaNI	2022-03-18 12:39:12.501483+02
nyv8bj9814nfo0tgu02z14a94o26yupz	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ5Xi:07PLyAM99T9T-in6A41AqdMZ3I9i4jaztMAkUmkTKaM	2022-03-18 12:52:14.141754+02
aedst53dvvbdee0eqp5vv7c6otfy726p	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiJjIn0:1nQ6Bf:xzYkMOZX3ovpLum3Ij2wbu2KLpWULfKMKbhmzoieaEY	2022-03-18 13:33:31.975013+02
hkbv8sgreu0yaeu569pystypdsfgwog9	.eJxVjDsOwjAQBe_iGlmO1z8o6XMGaze7xgGUSHFSIe4OkVJA-2bmvVTGba15a7LkkdVFdVadfkfC4SHTTviO023Wwzyty0h6V_RBm-5nluf1cP8OKrb6rSmZlBwjeWMishUHDJ5CMD4NTgisxAgleBAK5PncQWBXnEkFEpJT7w_9bDfU:1nQ6PF:tWGG17Rt-BB7dy8kV95kPbvgZX5FEv4qwBRRD9NjrUY	2022-03-18 13:47:33.300603+02
rhefi609hv85xzd0d3c0tbphpuva7t26	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiJkIn0:1nQ6Wx:0sNx_zpZlyEJ9IZG8_u4HI_C_Ew3bihDeqS_Cpn7uUA	2022-03-18 13:55:31.879287+02
m068iibnyv7prlb98ypgenyemjbegdse	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiJlIn0:1nQ6jg:MAaLghg2TqZ7mFNdwd5zCSx68w4Mh5k7sS9eMkIYdXg	2022-03-18 14:08:40.511629+02
80uz3416fvi9m4yvw0hgfu02xhjksl3t	.eJxVjEEOwiAQRe_C2hAchIpL9z0DmWEGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVRXh1-N8L0kLoBvmO9NZ1aXeaJ9KbonXY9NpbndXf_Dgr28q0RJYgnR9lZcGgIzxKsZ_DOGGaPFk8EHAwc7cCcckpAGUHSEJgdqvcHC0A5Pg:1nQ706:pnTdKqu7hpBxHDZlFzOB9AkDxArs5KJpDNWF-BfPuD0	2022-03-18 14:25:38.16666+02
xu60fxqdc1kdg3e0qkkfb9jc2hwhwn19	.eJwNx8kRgCAMAMBeUoE5gGgzDIQwvEVejr3Lb_eFXNYz8pp-51HmgAuihy7JDJnJEokn1Gok5eDTpLdKouqEjETYTS002YgYk-wE-H6AcBir:1nQ75t:G7WxvRfHo4BDFy5i1M47YP_7ShtbEQs-vgoySeooe3E	2022-03-18 14:31:37.562673+02
dovhzs3m4qmknffeg73jxhpoaz3wey3x	.eJwFwcENwCAIAMBdnEBFBLqMEYX4rvXVdPfevaH186x2tt1t9b3CFXLSqqpeCTlHRhAFJHMvCDC5kqeRVIqbcYplsmTMrFhQRmWm8P2Aahip:1nQ76W:4VOGwNwXjd_3Qm1lMds3cShNjAFX05POebvp-Pa0cgo	2022-03-18 14:32:16.46521+02
ftehsdvp1izud0cdnhqgzgahybc6pi71	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ7HK:LPhIJgXWYrFPD8Lji_d7mhyseSDdTP3K8d9gFiNjyPg	2022-03-18 14:43:26.298191+02
7hcdvpmjx36581kxcvdfr3z5l5k5aq9q	.eJxVjMsOwiAQRf-FtSHlMTC4dO83EIaHVA0kpV0Z_12bdKHbe865L-bDtla_jbz4ObEzM-z0u1GIj9x2kO6h3TqPva3LTHxX-EEHv_aUn5fD_TuoYdRvLQUZIirGAsoJQTlSYHMpGpRKaGwRUZDTJWcUk07oJEgk0OCiQbTs_QHT_jcO:1nQ7VU:ff80UgGP51jQA07Wf31uzagDFJEnD3SRbT2QwVJzwXA	2022-03-18 14:58:04.476875+02
ipshmbmkgv3vh6wflegvb0t342qujma4	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ7WF:DhEhuq_SzcTY4AUyTIVc_6lKYluLQsfmdTepw4dmevQ	2022-03-18 14:58:51.600745+02
w8vnj4clwattjqb0euatdh9zju2j1c0w	.eJxVjMsOwiAQRf-FtSHlMTC4dO83EIaHVA0kpV0Z_12bdKHbe865L-bDtla_jbz4ObEzM-z0u1GIj9x2kO6h3TqPva3LTHxX-EEHv_aUn5fD_TuoYdRvLQUZIirGAsoJQTlSYHMpGpRKaGwRUZDTJWcUk07oJEgk0OCiQbTs_QHT_jcO:1nQ7dN:E9PM1QrhRrJcIKMLDPZ7I6xR4H20VXhB2AJqCaeiq7k	2022-03-18 15:06:13.159316+02
h7vdbvpasuk2h5txv72d5lszk6t23yp7	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ7dy:-4gCbU-5SffHUH9LYVqk1I1sjYNbaf6mBdkVG_05cIg	2022-03-18 15:06:50.632903+02
4tn9hgs8bgm2tz1e28tsc7acn8jb9yju	.eJxVjMsOwiAQRf-FtSHlMTC4dO83EIaHVA0kpV0Z_12bdKHbe865L-bDtla_jbz4ObEzM-z0u1GIj9x2kO6h3TqPva3LTHxX-EEHv_aUn5fD_TuoYdRvLQUZIirGAsoJQTlSYHMpGpRKaGwRUZDTJWcUk07oJEgk0OCiQbTs_QHT_jcO:1nQ87O:iEuUpGQwWoprLW49WU9wxBey9MeBoxtNDUzmMn4EFbs	2022-03-18 15:37:14.96713+02
c6mi54i0zki52kbgt7bfdog8yk0vbps4	.eJwNwsENwCAIAMBdmMAqInYZg4DxXeur6e5t7h5osu_Z9vKrTVkTTlC36tg58PhpCikXEyLSbBKZDo2eQxgoNriIiSoj9yNyGrUiwfsBrH0Z6A:1nQ88r:sD1XVbrThKrlm5zsIdvW9ijI6b9wHx7Y8mXQdqyK_44	2022-03-18 15:38:45.020994+02
yaiy50cl2t3mhysc2ajd2qyyzen9yhzv	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ8EZ:nSZDh8QHmjRWS2LIowZ0eG7r2SqZUxcYZ2ICVWWEHe4	2022-03-18 15:44:39.719615+02
s68nuvh42v2oxic53e94njobqjw72ahn	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQ8FT:nkElTFjr89IMXB9nLWXnmWA6S14IyO-nBY4nUuSd66A	2022-03-18 15:45:35.92595+02
grdf5qa42q12n7abpltcrpv5o4hwdor8	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ8Ga:c_d3_JWkVqGwGtZjldBAXzk7v4XQf99j2lEq2TE8xYM	2022-03-18 15:46:44.08608+02
kwtihz36js61qtup9saj2452tfawenu8	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQ8OW:TGkXY8GdDOekSZomH0JvrZIAUSFSsCc03ET-cklGq1M	2022-03-18 15:54:56.669786+02
zweom3sb54kkhkqr92npaf1hgdoym3wm	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ8PP:OJwci0NKtsVhMwAuGUaySWT5bUxxVMXKXMul5VXvpHs	2022-03-18 15:55:51.548951+02
gc9izqjoos0zwovrd0fo6waqy9ijcmzl	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQ8WK:cTQ0iSAjp7NYgoSh_-j9jYEIbkl0Sqz4xxfw6h4_tKE	2022-03-18 16:03:00.720832+02
3iy8akjj8k61d2ggj6kz1hc75r79e1b8	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ8Wn:iMwU0_NFEgnIVfggKIFwOeeJUt65RWGSePKEI7BV4e0	2022-03-18 16:03:29.752932+02
1g1edkaro6td88c67kzfnd282cezlan4	.eJxVjDsOwjAQBe_iGlmO1z8o6XMGaze7xgGUSHFSIe4OkVJA-2bmvVTGba15a7LkkdVFdVadfkfC4SHTTviO023Wwzyty0h6V_RBm-5nluf1cP8OKrb6rSmZlBwjeWMishUHDJ5CMD4NTgisxAgleBAK5PncQWBXnEkFEpJT7w_9bDfU:1nQ9Um:18YWHwmkSRJ2v93Lk6BkHtiHH3ddVdKa1vlR3cD3Weo	2022-03-18 17:05:28.905654+02
oucumx8bn1w2j5ahl77czmseaobuognf	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ9VT:9UATbo0XhG8ntdcsZ2HiPyOZeBLt0Yu6Qwz04J9in58	2022-03-18 17:06:11.843451+02
ti1tjva6bf2b7gro645xguo6wacf24w4	.eJxVjDkOwjAUBe_iGlk_izdKes5g_c04gBIpS4W4O0RKAe2bmfcyGbe15m3ROQ9iziaY0-9GyA8ddyB3HG-T5Wlc54HsrtiDLvY6iT4vh_t3UHGp37oUbXsA7qFFDeLAMzjpKJBPwpGx1dQBuYIpldgERiXnsaPY9OC9mPcH-vI4XQ:1nQ9aV:IqemgzYUclagxEHHHElwIF8t8zP4rNiMhEE64ppBY9M	2022-03-18 17:11:23.298195+02
ys86icgv1m31rvfd90wa4ug3uqwr2n91	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ9bu:yw91Nq4dgmIKwLFkDlVWbFnxc0kxBjnmQrHWOKy-z9g	2022-03-18 17:12:50.16144+02
4o7y6elhd4h12j4p3o5y3026j27dttha	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQ9k2:yNxIcIeX5zN0cRV-M3cvI4ABh-CPmPAJSNrSXhgUkZM	2022-03-18 17:21:14.578134+02
hodk15t2xc0wuwoy83ib58kquvsmsb6k	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQCcp:LhrtWJxSCCgZ76vZotjTfgJ3MlBhwNNoznmQjle6peE	2022-03-18 20:25:59.932603+02
c24yp83tzccqz2d76xq26m1svoikwtfr	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQDVo:uhs-uoW2d_Q3B-fGRWbgmr8cixgL2ZEEJXk-QZyjrfQ	2022-03-18 21:22:48.862498+02
j195qhg71lnjxovv4sbe8ahyln3jf6lx	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQDdc:Ff6RZysCoa2BebY1S8JzOPV0tUp3b6GkNgXEVNgXbj4	2022-03-18 21:30:52.882037+02
o29fag9s21ockqjzjird7qdfrs7dkccc	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQVTn:E1EYBtuNKSqzuewhwMvwnA1VSmCNoxTegaP3kufVOx4	2022-03-19 16:33:55.323806+02
9ylk86bjbxoliosndlkl07dum6egb2z0	.eJxVjMsOwiAQRf-FtSG2zADj0n2_oRkGkKqBpI-V8d-1SRe6veec-1Ijb2sZtyXN4xTVRXWoTr9jYHmkupN453prWlpd5ynoXdEHXfTQYnpeD_fvoPBSvrUgcgSQgAzgXe_Fmi55a4B9og45QzBsRBJZi5Ct6yULUSbqnaezen8ABro3zg:1nQYgh:gD582DypKwjkRIsizqOaJlcwS_kHf31883LzQxkuRww	2022-03-19 19:59:27.700771+02
6qudctzv87f1gm22aazuy09g897jp56b	.eJxVjMsOwiAQRf-FtSG2zADj0n2_oRkGkKqBpI-V8d-1SRe6veec-1Ijb2sZtyXN4xTVRXWoTr9jYHmkupN453prWlpd5ynoXdEHXfTQYnpeD_fvoPBSvrUgcgSQgAzgXe_Fmi55a4B9og45QzBsRBJZi5Ct6yULUSbqnaezen8ABro3zg:1nQYkh:bspzFu_DE5leJdH3UbFpyzaJsUMbitjWTJ8SgJCkt50	2022-03-19 20:03:35.199847+02
pe3k8kjl061mm73cjddm606b6gwp8mr3	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQYwz:pX__idXSMajPoWEVEo5qPc326HmN6bx59g_73V6guZs	2022-03-19 20:16:17.726434+02
80d72yh4e4ot5thl4yx381f6i2s5pa78	.eJxVjMsOwiAQRf-FtSG2zADj0n2_oRkGkKqBpI-V8d-1SRe6veec-1Ijb2sZtyXN4xTVRXWoTr9jYHmkupN453prWlpd5ynoXdEHXfTQYnpeD_fvoPBSvrUgcgSQgAzgXe_Fmi55a4B9og45QzBsRBJZi5Ct6yULUSbqnaezen8ABro3zg:1nQYy6:zNMlGJnxa5gOiTIevNx1BPX5oAta5rP8hpg5Ig2aExw	2022-03-19 20:17:26.055426+02
eruw3hb72iai8d0sg54gug3vbceysfs4	.eJwFwckRwCAIAMBeqMALhTTjAMr4jvGVSe_ZfaHLeVY_e959yV5wgTamHJ2KjGzWhmPmqjhVeaTkWJ2QuSAJajAcaVrgqeikzOQRvh-i0Bn_:1nQYzl:-X1fvnYOqNxUazMNHnaZXUB8xBpRCbcG9OFVKb__T58	2022-03-19 20:19:09.952349+02
7obm4q0m8wqpryzxyaxkqbmwf0xfsnov	.eJxVjMsOwiAQRf-FtSE8OqW4dO83kGEYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnMYnT7xaRHlx3kO5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKtBzA0JJ-NRsDRZKUVWK99BnIIDCOp5JSNE1pwSEiMzmfHik1SSCTeH9okOFU:1nQZ7n:KN0Wkqr8UCb8NkCv-dUCNOeWeiR5d2F2KvI_fErryi4	2022-03-19 20:27:27.052079+02
he0aeevf6hl2ukpqdy91a5mh3layjowt	.eJxVjMEOgjAQRP-lZ9OUUsrWo3e-gWx3txY1JaFwMv67kHDQzG3em3mrEbc1j1uVZZxYXZVXl98uIj2lHIAfWO6zprmsyxT1oeiTVj3MLK_b6f4dZKx5X5NwEBfBQNpDrWm7ntF7Tx2jBd-Qlc6Y5JAT9MhIBA5iY6FNITivPl8AIDhN:1nQZQL:QGmu3jlNEnLZGDeI4qlz2sgJHF2gpOz_70IVkNs3Xpo	2022-03-19 20:46:37.797722+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_site (id, domain, name) FROM stdin;
2	example.com	example.com
3	127.0.0.1:3000	HiGE Fitness App
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: users_newuser; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser (id, password, last_login, is_superuser, email, username, first_name, last_name, start_date, "createdAt", "updatedAt", is_staff, is_active) FROM stdin;
1	pbkdf2_sha256$216000$kjM4BaXEvrzZ$qqTzW3vZE3zlh3aIS+qVidGdkko2zhm+dx/R3sV6JP0=	\N	f	eng.israahussein88@gmail.com	israa			2022-03-01 22:47:50.334859+02	2022-03-01 22:47:50.465119+02	2022-03-01 22:47:50.559628+02	f	t
2	pbkdf2_sha256$216000$f0ScJRv9y2bs$gQAOehMATRi4OGdNSLmECbmwxwRf47CmVj3oApZGEFg=	\N	f	b@q.com	jjj			2022-03-01 22:54:56.216495+02	2022-03-01 22:54:56.368379+02	2022-03-01 22:54:56.467316+02	t	t
4	pbkdf2_sha256$216000$9pL341EZyWow$3ywKUtYLo3kMQmFkBNCEj9SusIkYJ5aWk9vlrde/vZk=	\N	f	israaawad474@gmail.com	israaz			2022-03-01 22:58:24.063424+02	2022-03-01 22:58:24.197374+02	2022-03-01 22:58:24.22883+02	t	t
5	pbkdf2_sha256$216000$A9fJ9qDWTQnW$82wor/m31c7RGxL9cd2uWsw2Z/oJtAmBUyfZaFY5u7o=	\N	t	a@a.com	admin			2022-03-01 23:01:48.87233+02	2022-03-01 23:01:49.022362+02	2022-03-01 23:01:49.022376+02	t	t
9	pbkdf2_sha256$216000$yVtFlmeoWTmv$m5OznvUVIp4KKwHgz5GPMKof7JBQH+nNPxF+XHJPB2Y=	\N	f	hala@gmail.com	HalaHamdy			2022-03-04 00:46:44.850905+02	2022-03-04 00:46:45.051718+02	2022-03-04 00:46:46.977484+02	t	t
10	pbkdf2_sha256$216000$AHhmqh9LOukR$7hPWdddv7cqyiVijfOOYOZM4AD95+lSc9drLGj2z/uU=	\N	f	sara@gmail.com	SaraAdel			2022-03-04 00:48:20.219306+02	2022-03-04 00:48:20.340428+02	2022-03-04 00:48:20.569017+02	t	t
12	pbkdf2_sha256$216000$bXdK1HTwnp9u$6Bc1zVy9zGcju5rMEJRcf11RSojg8Qt2EcGN717ksZs=	2022-03-04 17:05:28.423063+02	f	hala.hamde.22@gmail.com	Halaa			2022-03-04 13:33:28.629125+02	2022-03-04 13:33:28.855138+02	2022-03-04 13:33:29.37957+02	f	t
15	pbkdf2_sha256$216000$JZbk2VkSOCe1$Pnry5Ettja975bh4mG+q+WBCFeOIAnl9xGfzhgkTteM=	2022-03-05 20:17:26.037768+02	f	ess@gmail.com	essSameh			2022-03-05 19:58:43.87486+02	2022-03-05 19:58:43.875186+02	2022-03-05 20:19:09.813836+02	t	t
7	pbkdf2_sha256$216000$FH8McCI1FMZL$KFFsopbupl3rxQKdUlIGu30HXUXiXshrGb6gCoTi9Qg=	2022-03-04 17:11:23.285448+02	t	7anan@gmail.com	7anann			2022-03-02 02:52:38.606096+02	2022-03-02 02:52:38.794552+02	2022-03-02 02:52:38.794565+02	t	t
8	pbkdf2_sha256$216000$P86vuVjQa4IR$/47ewZVESc4xg3N5bpSVyLpMdO20FyNDsp2X1zCXNMY=	2022-03-05 20:27:27.034903+02	f	hanannmohameddd@gmail.com	Hanann			2022-03-02 03:35:47.186712+02	2022-03-02 03:35:47.338691+02	2022-03-02 14:58:37.503854+02	f	t
3	pbkdf2_sha256$216000$Nc3XQ3T7uqES$5hrvqYyq93t2mdXcYwSPMGPxBeFoV4KQX7oYs71ATeI=	\N	f	b@qk.com	Rahmaa_Ramadan			2022-03-01 22:55:33.746821+02	2022-03-01 22:55:33.895001+02	2022-03-01 22:55:33.921255+02	t	t
6	pbkdf2_sha256$216000$UIzzcdsAG0nC$lDrvvE98sQGIsMJ6pl06lMoa3VSKCLdINUKYdRakwT8=	2022-03-05 20:46:37.783111+02	f	7ananm7mddd@gmail.com	Lamees_Omar			2022-03-02 00:16:24.370619+02	2022-03-02 00:16:24.520286+02	2022-03-04 15:38:44.696827+02	t	t
13	pbkdf2_sha256$216000$ITRiJE3aSefN$rmIlYLS0f2xDhNxVV8wqYdc3FmeKG1NHYBsxKYwDanQ=	\N	f	hadeerashraf189@gmail.com	IsraaHussien			2022-03-04 13:55:29.305197+02	2022-03-04 13:55:29.54112+02	2022-03-04 13:55:29.628037+02	f	t
11	pbkdf2_sha256$216000$5VqdUTKQiMIr$X5uXPdJZV5EUx2lxdsDQiljsXbvRXFbA3PzFOofh8l0=	2022-03-04 12:39:12.483356+02	f	yousef@gmail.com	SaraAdell			2022-03-04 12:37:22.343722+02	2022-03-04 12:37:22.537727+02	2022-03-04 21:24:50.255648+02	f	t
14	pbkdf2_sha256$216000$TpM35PlqtrHH$R6DRNkd2LbirEZxIu+pSemB1H3DZTFIeA05MlFt734w=	\N	f	Israahusu88@gmail.com	IsraaaH			2022-03-04 14:08:29.787439+02	2022-03-04 14:08:30.053348+02	2022-03-04 14:08:30.545803+02	f	t
\.


--
-- Data for Name: users_newuser_groups; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser_groups (id, newuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_newuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser_user_permissions (id, newuser_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 13, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: api_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_comment_id_seq', 4, true);


--
-- Name: api_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_post_id_seq', 26, true);


--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_reportcomment_id_seq', 1, true);


--
-- Name: api_reportpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_reportpost_id_seq', 2, true);


--
-- Name: api_trainee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_trainee_id_seq', 6, true);


--
-- Name: api_trainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_trainer_id_seq', 6, true);


--
-- Name: api_watertracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_watertracker_id_seq', 6, true);


--
-- Name: api_watertrackerhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_watertrackerhistory_id_seq', 1, false);


--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_weighttracker_id_seq', 6, true);


--
-- Name: api_weighttrackerhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_weighttrackerhistory_id_seq', 1, false);


--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutexcercise_id_seq', 52, true);


--
-- Name: api_workoutplan_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutplan_exercise_id_seq', 135, true);


--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutplan_id_seq', 19, true);


--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaexercise_id_seq', 17, true);


--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaplan_exercises_id_seq', 136, true);


--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaplan_id_seq', 15, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_site_id_seq', 3, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_groups_id_seq', 1, false);


--
-- Name: users_newuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_id_seq', 15, true);


--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: api_comment api_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_pkey PRIMARY KEY (id);


--
-- Name: api_post api_post_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_pkey PRIMARY KEY (id);


--
-- Name: api_reportcomment api_reportcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_pkey PRIMARY KEY (id);


--
-- Name: api_reportpost api_reportpost_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_pkey PRIMARY KEY (id);


--
-- Name: api_trainee api_trainee_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_pkey PRIMARY KEY (id);


--
-- Name: api_trainee api_trainee_trainee_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_trainee_id_key UNIQUE (trainee_id);


--
-- Name: api_trainer api_trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_pkey PRIMARY KEY (id);


--
-- Name: api_trainer api_trainer_trainer_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_trainer_id_key UNIQUE (trainer_id);


--
-- Name: api_watertracker api_watertracker_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertracker
    ADD CONSTRAINT api_watertracker_pkey PRIMARY KEY (id);


--
-- Name: api_watertracker api_watertracker_traineeID_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertracker
    ADD CONSTRAINT "api_watertracker_traineeID_id_key" UNIQUE ("traineeID_id");


--
-- Name: api_watertrackerhistory api_watertrackerhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertrackerhistory
    ADD CONSTRAINT api_watertrackerhistory_pkey PRIMARY KEY (id);


--
-- Name: api_weighttracker api_weighttracker_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker
    ADD CONSTRAINT api_weighttracker_pkey PRIMARY KEY (id);


--
-- Name: api_weighttracker api_weighttracker_traineeID_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker
    ADD CONSTRAINT "api_weighttracker_traineeID_id_key" UNIQUE ("traineeID_id");


--
-- Name: api_weighttrackerhistory api_weighttrackerhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttrackerhistory
    ADD CONSTRAINT api_weighttrackerhistory_pkey PRIMARY KEY (id);


--
-- Name: api_workoutexcercise api_workoutexcercise_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutexcercise
    ADD CONSTRAINT api_workoutexcercise_pkey PRIMARY KEY (id);


--
-- Name: api_workoutplan_exercise api_workoutplan_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exercise_pkey PRIMARY KEY (id);


--
-- Name: api_workoutplan_exercise api_workoutplan_exercise_workoutplan_id_workoutex_4aa8581d_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exercise_workoutplan_id_workoutex_4aa8581d_uniq UNIQUE (workoutplan_id, workoutexcercise_id);


--
-- Name: api_workoutplan api_workoutplan_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan
    ADD CONSTRAINT api_workoutplan_pkey PRIMARY KEY (id);


--
-- Name: api_yogaexercise api_yogaexercise_name_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise
    ADD CONSTRAINT api_yogaexercise_name_key UNIQUE (name);


--
-- Name: api_yogaexercise api_yogaexercise_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise
    ADD CONSTRAINT api_yogaexercise_pkey PRIMARY KEY (id);


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_pkey PRIMARY KEY (id);


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_yogaplan_id_yogaexercise_a71c345c_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_yogaplan_id_yogaexercise_a71c345c_uniq UNIQUE (yogaplan_id, yogaexercise_id);


--
-- Name: api_yogaplan api_yogaplan_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan
    ADD CONSTRAINT api_yogaplan_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_email_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_email_key UNIQUE (email);


--
-- Name: users_newuser_groups users_newuser_groups_newuser_id_group_id_df6b4b64_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_newuser_id_group_id_df6b4b64_uniq UNIQUE (newuser_id, group_id);


--
-- Name: users_newuser_groups users_newuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_pkey PRIMARY KEY (id);


--
-- Name: users_newuser_user_permissions users_newuser_user_permi_newuser_id_permission_id_5e320e13_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_permi_newuser_id_permission_id_5e320e13_uniq UNIQUE (newuser_id, permission_id);


--
-- Name: users_newuser_user_permissions users_newuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_username_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: api_comment_owner_id_2ff90561; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_comment_owner_id_2ff90561 ON public.api_comment USING btree (owner_id);


--
-- Name: api_comment_post_id_251fc0c3; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_comment_post_id_251fc0c3 ON public.api_comment USING btree (post_id);


--
-- Name: api_post_owner_id_6f27474b; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_post_owner_id_6f27474b ON public.api_post USING btree (owner_id);


--
-- Name: api_reportcomment_comment_id_08462b15; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportcomment_comment_id_08462b15 ON public.api_reportcomment USING btree (comment_id);


--
-- Name: api_reportcomment_owner_id_96a54b36; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportcomment_owner_id_96a54b36 ON public.api_reportcomment USING btree (owner_id);


--
-- Name: api_reportpost_owner_id_491bb966; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportpost_owner_id_491bb966 ON public.api_reportpost USING btree (owner_id);


--
-- Name: api_reportpost_post_id_312a90fc; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportpost_post_id_312a90fc ON public.api_reportpost USING btree (post_id);


--
-- Name: api_trainee_trainerID_id_bfa02a5d; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_trainerID_id_bfa02a5d" ON public.api_trainee USING btree ("trainerID_id");


--
-- Name: api_trainee_workoutPlan_id_5050c77c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_workoutPlan_id_5050c77c" ON public.api_trainee USING btree ("workoutPlan_id");


--
-- Name: api_trainee_yogaPlan_id_0290311e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_yogaPlan_id_0290311e" ON public.api_trainee USING btree ("yogaPlan_id");


--
-- Name: api_watertrackerhistory_traineeID_id_7aceae34; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_watertrackerhistory_traineeID_id_7aceae34" ON public.api_watertrackerhistory USING btree ("traineeID_id");


--
-- Name: api_weighttrackerhistory_traineeID_id_2a2a598c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_weighttrackerhistory_traineeID_id_2a2a598c" ON public.api_weighttrackerhistory USING btree ("traineeID_id");


--
-- Name: api_workoutplan_exercise_workoutexcercise_id_f9fc2237; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_exercise_workoutexcercise_id_f9fc2237 ON public.api_workoutplan_exercise USING btree (workoutexcercise_id);


--
-- Name: api_workoutplan_exercise_workoutplan_id_87b0963f; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_exercise_workoutplan_id_87b0963f ON public.api_workoutplan_exercise USING btree (workoutplan_id);


--
-- Name: api_workoutplan_owner_id_d229fc87; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_owner_id_d229fc87 ON public.api_workoutplan USING btree (owner_id);


--
-- Name: api_yogaexercise_name_3adbabf4_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaexercise_name_3adbabf4_like ON public.api_yogaexercise USING btree (name varchar_pattern_ops);


--
-- Name: api_yogaplan_exercises_yogaexercise_id_ec633ca8; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_exercises_yogaexercise_id_ec633ca8 ON public.api_yogaplan_exercises USING btree (yogaexercise_id);


--
-- Name: api_yogaplan_exercises_yogaplan_id_358172fa; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_exercises_yogaplan_id_358172fa ON public.api_yogaplan_exercises USING btree (yogaplan_id);


--
-- Name: api_yogaplan_owner_id_1d3e2521; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_owner_id_1d3e2521 ON public.api_yogaplan USING btree (owner_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_newuser_email_0b37614b_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_email_0b37614b_like ON public.users_newuser USING btree (email varchar_pattern_ops);


--
-- Name: users_newuser_groups_group_id_525a4e68; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_groups_group_id_525a4e68 ON public.users_newuser_groups USING btree (group_id);


--
-- Name: users_newuser_groups_newuser_id_7f6f4c4c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_groups_newuser_id_7f6f4c4c ON public.users_newuser_groups USING btree (newuser_id);


--
-- Name: users_newuser_user_permissions_newuser_id_bb22b5b4; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_user_permissions_newuser_id_bb22b5b4 ON public.users_newuser_user_permissions USING btree (newuser_id);


--
-- Name: users_newuser_user_permissions_permission_id_72696cfa; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_user_permissions_permission_id_72696cfa ON public.users_newuser_user_permissions USING btree (permission_id);


--
-- Name: users_newuser_username_f6857a2c_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_username_f6857a2c_like ON public.users_newuser USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_owner_id_2ff90561_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_owner_id_2ff90561_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_post_id_251fc0c3_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_post_id_251fc0c3_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_post api_post_owner_id_6f27474b_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_owner_id_6f27474b_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportcomment api_reportcomment_comment_id_08462b15_fk_api_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_comment_id_08462b15_fk_api_comment_id FOREIGN KEY (comment_id) REFERENCES public.api_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportcomment api_reportcomment_owner_id_96a54b36_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_owner_id_96a54b36_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportpost api_reportpost_owner_id_491bb966_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_owner_id_491bb966_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportpost api_reportpost_post_id_312a90fc_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_post_id_312a90fc_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_trainee_id_41d31f0a_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_trainee_id_41d31f0a_fk_users_newuser_id FOREIGN KEY (trainee_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_trainerID_id_bfa02a5d_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_trainerID_id_bfa02a5d_fk_api_trainer_id" FOREIGN KEY ("trainerID_id") REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_workoutPlan_id_5050c77c_fk_api_workoutplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_workoutPlan_id_5050c77c_fk_api_workoutplan_id" FOREIGN KEY ("workoutPlan_id") REFERENCES public.api_workoutplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_yogaPlan_id_0290311e_fk_api_yogaplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_yogaPlan_id_0290311e_fk_api_yogaplan_id" FOREIGN KEY ("yogaPlan_id") REFERENCES public.api_yogaplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainer api_trainer_trainer_id_45cc16be_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_trainer_id_45cc16be_fk_users_newuser_id FOREIGN KEY (trainer_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_watertracker api_watertracker_traineeID_id_646aaf90_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertracker
    ADD CONSTRAINT "api_watertracker_traineeID_id_646aaf90_fk_api_trainee_id" FOREIGN KEY ("traineeID_id") REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_watertrackerhistory api_watertrackerhistory_traineeID_id_7aceae34_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_watertrackerhistory
    ADD CONSTRAINT "api_watertrackerhistory_traineeID_id_7aceae34_fk_api_trainee_id" FOREIGN KEY ("traineeID_id") REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_weighttracker api_weighttracker_traineeID_id_d2a6bdc1_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker
    ADD CONSTRAINT "api_weighttracker_traineeID_id_d2a6bdc1_fk_api_trainee_id" FOREIGN KEY ("traineeID_id") REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_weighttrackerhistory api_weighttrackerhis_traineeID_id_2a2a598c_fk_api_train; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttrackerhistory
    ADD CONSTRAINT "api_weighttrackerhis_traineeID_id_2a2a598c_fk_api_train" FOREIGN KEY ("traineeID_id") REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan_exercise api_workoutplan_exer_workoutexcercise_id_f9fc2237_fk_api_worko; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exer_workoutexcercise_id_f9fc2237_fk_api_worko FOREIGN KEY (workoutexcercise_id) REFERENCES public.api_workoutexcercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan_exercise api_workoutplan_exer_workoutplan_id_87b0963f_fk_api_worko; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exer_workoutplan_id_87b0963f_fk_api_worko FOREIGN KEY (workoutplan_id) REFERENCES public.api_workoutplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan api_workoutplan_owner_id_d229fc87_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan
    ADD CONSTRAINT api_workoutplan_owner_id_d229fc87_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan_exercises api_yogaplan_exercis_yogaexercise_id_ec633ca8_fk_api_yogae; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercis_yogaexercise_id_ec633ca8_fk_api_yogae FOREIGN KEY (yogaexercise_id) REFERENCES public.api_yogaexercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_yogaplan_id_358172fa_fk_api_yogaplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_yogaplan_id_358172fa_fk_api_yogaplan_id FOREIGN KEY (yogaplan_id) REFERENCES public.api_yogaplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan api_yogaplan_owner_id_1d3e2521_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan
    ADD CONSTRAINT api_yogaplan_owner_id_1d3e2521_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_social_user_id_8146e70c_fk_users_new; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_social_user_id_8146e70c_fk_users_new FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_groups users_newuser_groups_group_id_525a4e68_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_group_id_525a4e68_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_groups users_newuser_groups_newuser_id_7f6f4c4c_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_newuser_id_7f6f4c4c_fk_users_newuser_id FOREIGN KEY (newuser_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_user_permissions users_newuser_user_p_newuser_id_bb22b5b4_fk_users_new; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_p_newuser_id_bb22b5b4_fk_users_new FOREIGN KEY (newuser_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_user_permissions users_newuser_user_p_permission_id_72696cfa_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_p_permission_id_72696cfa_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

