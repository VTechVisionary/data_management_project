PGDMP  /                
    |            data_management_framework    17.2    17.2 E    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            O           1262    16388    data_management_framework    DATABASE     �   CREATE DATABASE data_management_framework WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
 )   DROP DATABASE data_management_framework;
                     postgres    false                        2615    16389    project_schema    SCHEMA        CREATE SCHEMA project_schema;
    DROP SCHEMA project_schema;
                     postgres    false            �            1259    16643 	   analytics    TABLE     �   CREATE TABLE project_schema.analytics (
    analytics_id integer NOT NULL,
    user_id integer NOT NULL,
    report_name character varying(255),
    report_data jsonb,
    generated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE project_schema.analytics;
       project_schema         heap r       postgres    false    6            �            1259    16642    analytics_analytics_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.analytics_analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE project_schema.analytics_analytics_id_seq;
       project_schema               postgres    false    6    233            P           0    0    analytics_analytics_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE project_schema.analytics_analytics_id_seq OWNED BY project_schema.analytics.analytics_id;
          project_schema               postgres    false    232            �            1259    16596 	   audit_log    TABLE       CREATE TABLE project_schema.audit_log (
    log_id integer NOT NULL,
    user_id integer NOT NULL,
    action character varying(255) NOT NULL,
    target_table character varying(255) NOT NULL,
    action_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    details jsonb
);
 %   DROP TABLE project_schema.audit_log;
       project_schema         heap r       postgres    false    6            �            1259    16595    audit_log_log_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.audit_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE project_schema.audit_log_log_id_seq;
       project_schema               postgres    false    6    227            Q           0    0    audit_log_log_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE project_schema.audit_log_log_id_seq OWNED BY project_schema.audit_log.log_id;
          project_schema               postgres    false    226            �            1259    16554    data_sources    TABLE     �   CREATE TABLE project_schema.data_sources (
    source_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE project_schema.data_sources;
       project_schema         heap r       postgres    false    6            �            1259    16553    data_sources_source_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.data_sources_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE project_schema.data_sources_source_id_seq;
       project_schema               postgres    false    221    6            R           0    0    data_sources_source_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE project_schema.data_sources_source_id_seq OWNED BY project_schema.data_sources.source_id;
          project_schema               postgres    false    220            �            1259    16627    incident_reports    TABLE     �  CREATE TABLE project_schema.incident_reports (
    incident_id integer NOT NULL,
    data_id integer NOT NULL,
    issue_type character varying(255),
    severity character varying(50),
    description text,
    reported_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT incident_reports_severity_check CHECK (((severity)::text = ANY ((ARRAY['low'::character varying, 'medium'::character varying, 'high'::character varying])::text[])))
);
 ,   DROP TABLE project_schema.incident_reports;
       project_schema         heap r       postgres    false    6            �            1259    16626     incident_reports_incident_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.incident_reports_incident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE project_schema.incident_reports_incident_id_seq;
       project_schema               postgres    false    231    6            S           0    0     incident_reports_incident_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE project_schema.incident_reports_incident_id_seq OWNED BY project_schema.incident_reports.incident_id;
          project_schema               postgres    false    230            �            1259    16611    metadata    TABLE     `  CREATE TABLE project_schema.metadata (
    metadata_id integer NOT NULL,
    data_id integer NOT NULL,
    lineage text,
    quality_score numeric(5,2),
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT metadata_quality_score_check CHECK (((quality_score >= (0)::numeric) AND (quality_score <= (100)::numeric)))
);
 $   DROP TABLE project_schema.metadata;
       project_schema         heap r       postgres    false    6            �            1259    16610    metadata_metadata_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.metadata_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE project_schema.metadata_metadata_id_seq;
       project_schema               postgres    false    229    6            T           0    0    metadata_metadata_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE project_schema.metadata_metadata_id_seq OWNED BY project_schema.metadata.metadata_id;
          project_schema               postgres    false    228            �            1259    16581    processed_data    TABLE     �   CREATE TABLE project_schema.processed_data (
    record_id integer NOT NULL,
    raw_data_id integer NOT NULL,
    structured_data jsonb NOT NULL,
    processing_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 *   DROP TABLE project_schema.processed_data;
       project_schema         heap r       postgres    false    6            �            1259    16580    processed_data_record_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.processed_data_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE project_schema.processed_data_record_id_seq;
       project_schema               postgres    false    6    225            U           0    0    processed_data_record_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE project_schema.processed_data_record_id_seq OWNED BY project_schema.processed_data.record_id;
          project_schema               postgres    false    224            �            1259    16566    raw_data    TABLE     �   CREATE TABLE project_schema.raw_data (
    data_id integer NOT NULL,
    source_id integer NOT NULL,
    data jsonb NOT NULL,
    ingestion_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE project_schema.raw_data;
       project_schema         heap r       postgres    false    6            �            1259    16565    raw_data_data_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.raw_data_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE project_schema.raw_data_data_id_seq;
       project_schema               postgres    false    223    6            V           0    0    raw_data_data_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE project_schema.raw_data_data_id_seq OWNED BY project_schema.raw_data.data_id;
          project_schema               postgres    false    222            �            1259    16540    users    TABLE     �  CREATE TABLE project_schema.users (
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role character varying(50) DEFAULT 'viewer'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'analyst'::character varying, 'viewer'::character varying])::text[])))
);
 !   DROP TABLE project_schema.users;
       project_schema         heap r       postgres    false    6            �            1259    16539    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE project_schema.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE project_schema.users_user_id_seq;
       project_schema               postgres    false    219    6            W           0    0    users_user_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE project_schema.users_user_id_seq OWNED BY project_schema.users.user_id;
          project_schema               postgres    false    218            �           2604    16646    analytics analytics_id    DEFAULT     �   ALTER TABLE ONLY project_schema.analytics ALTER COLUMN analytics_id SET DEFAULT nextval('project_schema.analytics_analytics_id_seq'::regclass);
 M   ALTER TABLE project_schema.analytics ALTER COLUMN analytics_id DROP DEFAULT;
       project_schema               postgres    false    233    232    233            �           2604    16599    audit_log log_id    DEFAULT     �   ALTER TABLE ONLY project_schema.audit_log ALTER COLUMN log_id SET DEFAULT nextval('project_schema.audit_log_log_id_seq'::regclass);
 G   ALTER TABLE project_schema.audit_log ALTER COLUMN log_id DROP DEFAULT;
       project_schema               postgres    false    226    227    227            ~           2604    16557    data_sources source_id    DEFAULT     �   ALTER TABLE ONLY project_schema.data_sources ALTER COLUMN source_id SET DEFAULT nextval('project_schema.data_sources_source_id_seq'::regclass);
 M   ALTER TABLE project_schema.data_sources ALTER COLUMN source_id DROP DEFAULT;
       project_schema               postgres    false    220    221    221            �           2604    16630    incident_reports incident_id    DEFAULT     �   ALTER TABLE ONLY project_schema.incident_reports ALTER COLUMN incident_id SET DEFAULT nextval('project_schema.incident_reports_incident_id_seq'::regclass);
 S   ALTER TABLE project_schema.incident_reports ALTER COLUMN incident_id DROP DEFAULT;
       project_schema               postgres    false    231    230    231            �           2604    16614    metadata metadata_id    DEFAULT     �   ALTER TABLE ONLY project_schema.metadata ALTER COLUMN metadata_id SET DEFAULT nextval('project_schema.metadata_metadata_id_seq'::regclass);
 K   ALTER TABLE project_schema.metadata ALTER COLUMN metadata_id DROP DEFAULT;
       project_schema               postgres    false    228    229    229            �           2604    16584    processed_data record_id    DEFAULT     �   ALTER TABLE ONLY project_schema.processed_data ALTER COLUMN record_id SET DEFAULT nextval('project_schema.processed_data_record_id_seq'::regclass);
 O   ALTER TABLE project_schema.processed_data ALTER COLUMN record_id DROP DEFAULT;
       project_schema               postgres    false    225    224    225            �           2604    16569    raw_data data_id    DEFAULT     �   ALTER TABLE ONLY project_schema.raw_data ALTER COLUMN data_id SET DEFAULT nextval('project_schema.raw_data_data_id_seq'::regclass);
 G   ALTER TABLE project_schema.raw_data ALTER COLUMN data_id DROP DEFAULT;
       project_schema               postgres    false    222    223    223            {           2604    16543    users user_id    DEFAULT     ~   ALTER TABLE ONLY project_schema.users ALTER COLUMN user_id SET DEFAULT nextval('project_schema.users_user_id_seq'::regclass);
 D   ALTER TABLE project_schema.users ALTER COLUMN user_id DROP DEFAULT;
       project_schema               postgres    false    218    219    219            I          0    16643 	   analytics 
   TABLE DATA           j   COPY project_schema.analytics (analytics_id, user_id, report_name, report_data, generated_at) FROM stdin;
    project_schema               postgres    false    233   h\       C          0    16596 	   audit_log 
   TABLE DATA           h   COPY project_schema.audit_log (log_id, user_id, action, target_table, action_time, details) FROM stdin;
    project_schema               postgres    false    227   �\       =          0    16554    data_sources 
   TABLE DATA           X   COPY project_schema.data_sources (source_id, name, description, created_at) FROM stdin;
    project_schema               postgres    false    221   �\       G          0    16627    incident_reports 
   TABLE DATA           x   COPY project_schema.incident_reports (incident_id, data_id, issue_type, severity, description, reported_at) FROM stdin;
    project_schema               postgres    false    231   �\       E          0    16611    metadata 
   TABLE DATA           f   COPY project_schema.metadata (metadata_id, data_id, lineage, quality_score, last_updated) FROM stdin;
    project_schema               postgres    false    229   �\       A          0    16581    processed_data 
   TABLE DATA           j   COPY project_schema.processed_data (record_id, raw_data_id, structured_data, processing_time) FROM stdin;
    project_schema               postgres    false    225   �\       ?          0    16566    raw_data 
   TABLE DATA           T   COPY project_schema.raw_data (data_id, source_id, data, ingestion_time) FROM stdin;
    project_schema               postgres    false    223   ]       ;          0    16540    users 
   TABLE DATA           X   COPY project_schema.users (user_id, email, password_hash, role, created_at) FROM stdin;
    project_schema               postgres    false    219   3]       X           0    0    analytics_analytics_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('project_schema.analytics_analytics_id_seq', 1, false);
          project_schema               postgres    false    232            Y           0    0    audit_log_log_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('project_schema.audit_log_log_id_seq', 1, false);
          project_schema               postgres    false    226            Z           0    0    data_sources_source_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('project_schema.data_sources_source_id_seq', 1, false);
          project_schema               postgres    false    220            [           0    0     incident_reports_incident_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('project_schema.incident_reports_incident_id_seq', 1, false);
          project_schema               postgres    false    230            \           0    0    metadata_metadata_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('project_schema.metadata_metadata_id_seq', 1, false);
          project_schema               postgres    false    228            ]           0    0    processed_data_record_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('project_schema.processed_data_record_id_seq', 1, false);
          project_schema               postgres    false    224            ^           0    0    raw_data_data_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('project_schema.raw_data_data_id_seq', 1, false);
          project_schema               postgres    false    222            _           0    0    users_user_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('project_schema.users_user_id_seq', 1, false);
          project_schema               postgres    false    218            �           2606    16651    analytics analytics_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY project_schema.analytics
    ADD CONSTRAINT analytics_pkey PRIMARY KEY (analytics_id);
 J   ALTER TABLE ONLY project_schema.analytics DROP CONSTRAINT analytics_pkey;
       project_schema                 postgres    false    233            �           2606    16604    audit_log audit_log_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY project_schema.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (log_id);
 J   ALTER TABLE ONLY project_schema.audit_log DROP CONSTRAINT audit_log_pkey;
       project_schema                 postgres    false    227            �           2606    16564 "   data_sources data_sources_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY project_schema.data_sources
    ADD CONSTRAINT data_sources_name_key UNIQUE (name);
 T   ALTER TABLE ONLY project_schema.data_sources DROP CONSTRAINT data_sources_name_key;
       project_schema                 postgres    false    221            �           2606    16562    data_sources data_sources_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY project_schema.data_sources
    ADD CONSTRAINT data_sources_pkey PRIMARY KEY (source_id);
 P   ALTER TABLE ONLY project_schema.data_sources DROP CONSTRAINT data_sources_pkey;
       project_schema                 postgres    false    221            �           2606    16636 &   incident_reports incident_reports_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY project_schema.incident_reports
    ADD CONSTRAINT incident_reports_pkey PRIMARY KEY (incident_id);
 X   ALTER TABLE ONLY project_schema.incident_reports DROP CONSTRAINT incident_reports_pkey;
       project_schema                 postgres    false    231            �           2606    16620    metadata metadata_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY project_schema.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (metadata_id);
 H   ALTER TABLE ONLY project_schema.metadata DROP CONSTRAINT metadata_pkey;
       project_schema                 postgres    false    229            �           2606    16589 "   processed_data processed_data_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY project_schema.processed_data
    ADD CONSTRAINT processed_data_pkey PRIMARY KEY (record_id);
 T   ALTER TABLE ONLY project_schema.processed_data DROP CONSTRAINT processed_data_pkey;
       project_schema                 postgres    false    225            �           2606    16574    raw_data raw_data_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY project_schema.raw_data
    ADD CONSTRAINT raw_data_pkey PRIMARY KEY (data_id);
 H   ALTER TABLE ONLY project_schema.raw_data DROP CONSTRAINT raw_data_pkey;
       project_schema                 postgres    false    223            �           2606    16552    users users_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY project_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 G   ALTER TABLE ONLY project_schema.users DROP CONSTRAINT users_email_key;
       project_schema                 postgres    false    219            �           2606    16550    users users_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY project_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY project_schema.users DROP CONSTRAINT users_pkey;
       project_schema                 postgres    false    219            �           2606    16652    analytics fk_analytics_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.analytics
    ADD CONSTRAINT fk_analytics_user FOREIGN KEY (user_id) REFERENCES project_schema.users(user_id);
 M   ALTER TABLE ONLY project_schema.analytics DROP CONSTRAINT fk_analytics_user;
       project_schema               postgres    false    4754    219    233            �           2606    16605    audit_log fk_audit_log_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.audit_log
    ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (user_id) REFERENCES project_schema.users(user_id);
 M   ALTER TABLE ONLY project_schema.audit_log DROP CONSTRAINT fk_audit_log_user;
       project_schema               postgres    false    227    4754    219            �           2606    16637 (   incident_reports fk_incident_reports_raw    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.incident_reports
    ADD CONSTRAINT fk_incident_reports_raw FOREIGN KEY (data_id) REFERENCES project_schema.raw_data(data_id);
 Z   ALTER TABLE ONLY project_schema.incident_reports DROP CONSTRAINT fk_incident_reports_raw;
       project_schema               postgres    false    231    223    4760            �           2606    16621    metadata fk_metadata_raw_data    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.metadata
    ADD CONSTRAINT fk_metadata_raw_data FOREIGN KEY (data_id) REFERENCES project_schema.raw_data(data_id);
 O   ALTER TABLE ONLY project_schema.metadata DROP CONSTRAINT fk_metadata_raw_data;
       project_schema               postgres    false    223    4760    229            �           2606    16590 $   processed_data fk_processed_data_raw    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.processed_data
    ADD CONSTRAINT fk_processed_data_raw FOREIGN KEY (raw_data_id) REFERENCES project_schema.raw_data(data_id);
 V   ALTER TABLE ONLY project_schema.processed_data DROP CONSTRAINT fk_processed_data_raw;
       project_schema               postgres    false    4760    223    225            �           2606    16575    raw_data fk_raw_data_source    FK CONSTRAINT     �   ALTER TABLE ONLY project_schema.raw_data
    ADD CONSTRAINT fk_raw_data_source FOREIGN KEY (source_id) REFERENCES project_schema.data_sources(source_id);
 M   ALTER TABLE ONLY project_schema.raw_data DROP CONSTRAINT fk_raw_data_source;
       project_schema               postgres    false    221    223    4758            I      x������ � �      C      x������ � �      =      x������ � �      G      x������ � �      E      x������ � �      A      x������ � �      ?      x������ � �      ;      x������ � �     