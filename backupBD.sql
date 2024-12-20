PGDMP                  
    |            CoinkDB    17.1    17.1 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            "           1262    16438    CoinkDB    DATABASE     |   CREATE DATABASE "CoinkDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "CoinkDB";
                     postgres    false            �            1255    24584 3   agregar_usuario(text, text, text, integer, boolean)    FUNCTION     �  CREATE FUNCTION public.agregar_usuario(p_nombre text, p_telefono text, p_direccion text, p_id_municipio integer, p_estado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.usuario (
        nombre, telefono, direccion, id_municipio, estado, fecha_creacion
    )
    VALUES (
        p_nombre, p_telefono, p_direccion, p_id_municipio, p_estado, NOW()
    );       
END;
$$;
 �   DROP FUNCTION public.agregar_usuario(p_nombre text, p_telefono text, p_direccion text, p_id_municipio integer, p_estado boolean);
       public               postgres    false            �            1259    16501    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap r       postgres    false            �            1259    16448    departamento    TABLE     �   CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    id_pais integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.departamento;
       public         heap r       postgres    false            �            1259    16447     departamento_id_departamento_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.departamento_id_departamento_seq;
       public               postgres    false    220            #           0    0     departamento_id_departamento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;
          public               postgres    false    219            �            1259    16461 	   municipio    TABLE       CREATE TABLE public.municipio (
    id_municipio integer NOT NULL,
    id_departamento integer NOT NULL,
    nombre character varying(100) NOT NULL,
    estado boolean DEFAULT true,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.municipio;
       public         heap r       postgres    false            �            1259    16460    municipio_id_municipio_seq    SEQUENCE     �   CREATE SEQUENCE public.municipio_id_municipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.municipio_id_municipio_seq;
       public               postgres    false    222            $           0    0    municipio_id_municipio_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.municipio_id_municipio_seq OWNED BY public.municipio.id_municipio;
          public               postgres    false    221            �            1259    16440    pais    TABLE     �   CREATE TABLE public.pais (
    id_pais integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.pais;
       public         heap r       postgres    false            �            1259    16439    pais_id_pais_seq    SEQUENCE     �   CREATE SEQUENCE public.pais_id_pais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pais_id_pais_seq;
       public               postgres    false    218            %           0    0    pais_id_pais_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pais_id_pais_seq OWNED BY public.pais.id_pais;
          public               postgres    false    217            �            1259    16509    usuario    TABLE     E  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    direccion character varying(200),
    id_municipio integer NOT NULL,
    estado boolean DEFAULT true,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    16508    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public               postgres    false    225            &           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public               postgres    false    224            n           2604    16451    departamento id_departamento    DEFAULT     �   ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);
 K   ALTER TABLE public.departamento ALTER COLUMN id_departamento DROP DEFAULT;
       public               postgres    false    219    220    220            p           2604    16464    municipio id_municipio    DEFAULT     �   ALTER TABLE ONLY public.municipio ALTER COLUMN id_municipio SET DEFAULT nextval('public.municipio_id_municipio_seq'::regclass);
 E   ALTER TABLE public.municipio ALTER COLUMN id_municipio DROP DEFAULT;
       public               postgres    false    222    221    222            l           2604    16443    pais id_pais    DEFAULT     l   ALTER TABLE ONLY public.pais ALTER COLUMN id_pais SET DEFAULT nextval('public.pais_id_pais_seq'::regclass);
 ;   ALTER TABLE public.pais ALTER COLUMN id_pais DROP DEFAULT;
       public               postgres    false    217    218    218            s           2604    16512    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    225    224    225                      0    16501    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public               postgres    false    223   �0                 0    16448    departamento 
   TABLE DATA           X   COPY public.departamento (id_departamento, id_pais, nombre, fecha_creacion) FROM stdin;
    public               postgres    false    220   �0                 0    16461 	   municipio 
   TABLE DATA           b   COPY public.municipio (id_municipio, id_departamento, nombre, estado, fecha_creacion) FROM stdin;
    public               postgres    false    222   @1                 0    16440    pais 
   TABLE DATA           ?   COPY public.pais (id_pais, nombre, fecha_creacion) FROM stdin;
    public               postgres    false    218   �1                 0    16509    usuario 
   TABLE DATA           p   COPY public.usuario (id_usuario, nombre, telefono, direccion, id_municipio, estado, fecha_creacion) FROM stdin;
    public               postgres    false    225   �1       '           0    0     departamento_id_departamento_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 3, true);
          public               postgres    false    219            (           0    0    municipio_id_municipio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.municipio_id_municipio_seq', 3, true);
          public               postgres    false    221            )           0    0    pais_id_pais_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pais_id_pais_seq', 3, true);
          public               postgres    false    217            *           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 13, true);
          public               postgres    false    224            }           2606    16505 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public                 postgres    false    223            y           2606    16454    departamento departamento_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public                 postgres    false    220            {           2606    16468    municipio municipio_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id_municipio);
 B   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_pkey;
       public                 postgres    false    222            w           2606    16446    pais pais_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);
 8   ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
       public                 postgres    false    218                       2606    16516    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    225            �           2606    16455 &   departamento departamento_id_pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.pais(id_pais);
 P   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_id_pais_fkey;
       public               postgres    false    220    218    4727            �           2606    16469 (   municipio municipio_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);
 R   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_id_departamento_fkey;
       public               postgres    false    220    222    4729            �           2606    16517 !   usuario usuario_id_municipio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.municipio(id_municipio);
 K   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_municipio_fkey;
       public               postgres    false    4731    222    225                  x������ � �         X   x�3�4�t.�K��K�M,JN�4202�54�54W02�20�2��33714��2�u�+��/,�ī��0,1''U!%5G�9���1z\\\ �H[         P   x�3�4�t�O�/9��������D��P��\��������R�����Ȃˈӈ�75%5'���<�J�9�9�s2����� �m'         K   x�3�t����M�L�4202�54�54W02�20�2��33714��2��=��"39�"cNǢ�Լ��<�f��qqq �!         f  x��R;N1�ǧ����x�K�(�r ���l�6h�D��Pr�\�B��ƒߛ���C����1�o@Z�!���]�n{Y^7�v7���w@؃��.�H����� �fz �\��.wr�;0?a�"rD���k��M:Lr���5[D��r�r��~A���(2�'6u꺟�>�ߚ�lh�e��.�V4F��/��;[�sf^T�g��c��1� ��pԬ�L����!���(��fJӘwP�s�P�˲�� |�^i���0��y�_� ۜ6�I^�Q���У�?ڿо�ǩ_����D�($��sy�J煪�?v�^���=��2x���@�b��<�:O���w�+G>2� ��Q	!>��     