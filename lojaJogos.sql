PGDMP  )                    |         
   loja_jogos    16.4    16.4 n    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    16397 
   loja_jogos    DATABASE     �   CREATE DATABASE loja_jogos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE loja_jogos;
                postgres    false            �            1259    16476    carrinho    TABLE     e   CREATE TABLE public.carrinho (
    id_carrinho integer NOT NULL,
    valor_carrinho numeric(10,2)
);
    DROP TABLE public.carrinho;
       public         heap    postgres    false            �            1259    16571    carrinho_do_cliente    TABLE     o   CREATE TABLE public.carrinho_do_cliente (
    id_carrinho integer NOT NULL,
    id_cliente integer NOT NULL
);
 '   DROP TABLE public.carrinho_do_cliente;
       public         heap    postgres    false            �            1259    16569 #   carrinho_do_cliente_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinho_do_cliente_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.carrinho_do_cliente_id_carrinho_seq;
       public          postgres    false    234            {           0    0 #   carrinho_do_cliente_id_carrinho_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.carrinho_do_cliente_id_carrinho_seq OWNED BY public.carrinho_do_cliente.id_carrinho;
          public          postgres    false    232            �            1259    16570 "   carrinho_do_cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinho_do_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.carrinho_do_cliente_id_cliente_seq;
       public          postgres    false    234            |           0    0 "   carrinho_do_cliente_id_cliente_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.carrinho_do_cliente_id_cliente_seq OWNED BY public.carrinho_do_cliente.id_cliente;
          public          postgres    false    233            �            1259    16475    carrinho_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.carrinho_id_carrinho_seq;
       public          postgres    false    220            }           0    0    carrinho_id_carrinho_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.carrinho_id_carrinho_seq OWNED BY public.carrinho.id_carrinho;
          public          postgres    false    219            �            1259    16465    cliente    TABLE     M  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    cpf character(11),
    cep character(8),
    adress_number smallint NOT NULL,
    data_cadastro date DEFAULT CURRENT_DATE,
    nome_cliente character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    data_nasc date,
    telefone character varying(20) NOT NULL,
    senha character varying(200) NOT NULL,
    CONSTRAINT cliente_cep_check CHECK ((length(cep) = 8)),
    CONSTRAINT cliente_cpf_check CHECK ((length(cpf) = 11)),
    CONSTRAINT cliente_data_nasc_check CHECK ((data_nasc < CURRENT_DATE))
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16533    cliente_avalia    TABLE     �   CREATE TABLE public.cliente_avalia (
    id_cliente integer NOT NULL,
    nome_jogo character varying(100) NOT NULL,
    nota integer,
    review text,
    CONSTRAINT cliente_avalia_nota_check CHECK (((nota >= 0) AND (nota <= 5)))
);
 "   DROP TABLE public.cliente_avalia;
       public         heap    postgres    false            �            1259    16532    cliente_avalia_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_avalia_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.cliente_avalia_id_cliente_seq;
       public          postgres    false    229            ~           0    0    cliente_avalia_id_cliente_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.cliente_avalia_id_cliente_seq OWNED BY public.cliente_avalia.id_cliente;
          public          postgres    false    228            �            1259    16464    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    218                       0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    217            �            1259    16516    cliente_possui    TABLE     �   CREATE TABLE public.cliente_possui (
    id_cliente integer NOT NULL,
    nome_jogo character varying(100) NOT NULL,
    horas_jogadas numeric(10,2)
);
 "   DROP TABLE public.cliente_possui;
       public         heap    postgres    false            �            1259    16515    cliente_possui_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_possui_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.cliente_possui_id_cliente_seq;
       public          postgres    false    227            �           0    0    cliente_possui_id_cliente_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.cliente_possui_id_cliente_seq OWNED BY public.cliente_possui.id_cliente;
          public          postgres    false    226            �            1259    16483    compra    TABLE     �   CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    data_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    valor_total numeric(10,2) NOT NULL,
    status character varying(100)
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    16590    compra_carrinho    TABLE     j   CREATE TABLE public.compra_carrinho (
    id_carrinho integer NOT NULL,
    id_compra integer NOT NULL
);
 #   DROP TABLE public.compra_carrinho;
       public         heap    postgres    false            �            1259    16588    compra_carrinho_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.compra_carrinho_id_carrinho_seq;
       public          postgres    false    237            �           0    0    compra_carrinho_id_carrinho_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.compra_carrinho_id_carrinho_seq OWNED BY public.compra_carrinho.id_carrinho;
          public          postgres    false    235            �            1259    16589    compra_carrinho_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_carrinho_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.compra_carrinho_id_compra_seq;
       public          postgres    false    237            �           0    0    compra_carrinho_id_compra_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.compra_carrinho_id_compra_seq OWNED BY public.compra_carrinho.id_compra;
          public          postgres    false    236            �            1259    16482    compra_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.compra_id_compra_seq;
       public          postgres    false    222            �           0    0    compra_id_compra_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;
          public          postgres    false    221            �            1259    16457    genero    TABLE     v   CREATE TABLE public.genero (
    nome_genero character varying(100) NOT NULL,
    description_genero text NOT NULL
);
    DROP TABLE public.genero;
       public         heap    postgres    false            �            1259    16448    jogo    TABLE     a  CREATE TABLE public.jogo (
    nome_jogo character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    data_launch date,
    developer character varying(100) NOT NULL,
    CONSTRAINT jogo_data_launch_check CHECK ((data_launch <= CURRENT_DATE)),
    CONSTRAINT jogo_description_check CHECK ((length(description) >= 50))
);
    DROP TABLE public.jogo;
       public         heap    postgres    false            �            1259    16553    jogo_no_carrinho    TABLE     �   CREATE TABLE public.jogo_no_carrinho (
    valor_jogo numeric(10,2),
    id_carrinho integer NOT NULL,
    nome_jogo character varying(100) NOT NULL
);
 $   DROP TABLE public.jogo_no_carrinho;
       public         heap    postgres    false            �            1259    16552     jogo_no_carrinho_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.jogo_no_carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.jogo_no_carrinho_id_carrinho_seq;
       public          postgres    false    231            �           0    0     jogo_no_carrinho_id_carrinho_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.jogo_no_carrinho_id_carrinho_seq OWNED BY public.jogo_no_carrinho.id_carrinho;
          public          postgres    false    230            �            1259    16500    jogo_tag    TABLE     ~   CREATE TABLE public.jogo_tag (
    nome_jogo character varying(100) NOT NULL,
    nome_tag character varying(100) NOT NULL
);
    DROP TABLE public.jogo_tag;
       public         heap    postgres    false            �            1259    16609    paga_compra    TABLE     k   CREATE TABLE public.paga_compra (
    numero_pagamento integer NOT NULL,
    id_compra integer NOT NULL
);
    DROP TABLE public.paga_compra;
       public         heap    postgres    false            �            1259    16608    paga_compra_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.paga_compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.paga_compra_id_compra_seq;
       public          postgres    false    240            �           0    0    paga_compra_id_compra_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.paga_compra_id_compra_seq OWNED BY public.paga_compra.id_compra;
          public          postgres    false    239            �            1259    16607     paga_compra_numero_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.paga_compra_numero_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.paga_compra_numero_pagamento_seq;
       public          postgres    false    240            �           0    0     paga_compra_numero_pagamento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.paga_compra_numero_pagamento_seq OWNED BY public.paga_compra.numero_pagamento;
          public          postgres    false    238            �            1259    16491 	   pagamento    TABLE     �   CREATE TABLE public.pagamento (
    numero_pagamento integer NOT NULL,
    data_pagamento date DEFAULT CURRENT_DATE,
    metodo character varying(100) NOT NULL,
    nota_fical character(20) NOT NULL,
    valor_final numeric(10,2) NOT NULL
);
    DROP TABLE public.pagamento;
       public         heap    postgres    false            �            1259    16490    pagamento_numero_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamento_numero_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pagamento_numero_pagamento_seq;
       public          postgres    false    224            �           0    0    pagamento_numero_pagamento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pagamento_numero_pagamento_seq OWNED BY public.pagamento.numero_pagamento;
          public          postgres    false    223            �           2604    16479    carrinho id_carrinho    DEFAULT     |   ALTER TABLE ONLY public.carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.carrinho_id_carrinho_seq'::regclass);
 C   ALTER TABLE public.carrinho ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16574    carrinho_do_cliente id_carrinho    DEFAULT     �   ALTER TABLE ONLY public.carrinho_do_cliente ALTER COLUMN id_carrinho SET DEFAULT nextval('public.carrinho_do_cliente_id_carrinho_seq'::regclass);
 N   ALTER TABLE public.carrinho_do_cliente ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    234    232    234            �           2604    16575    carrinho_do_cliente id_cliente    DEFAULT     �   ALTER TABLE ONLY public.carrinho_do_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.carrinho_do_cliente_id_cliente_seq'::regclass);
 M   ALTER TABLE public.carrinho_do_cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    16468    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16536    cliente_avalia id_cliente    DEFAULT     �   ALTER TABLE ONLY public.cliente_avalia ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_avalia_id_cliente_seq'::regclass);
 H   ALTER TABLE public.cliente_avalia ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16519    cliente_possui id_cliente    DEFAULT     �   ALTER TABLE ONLY public.cliente_possui ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_possui_id_cliente_seq'::regclass);
 H   ALTER TABLE public.cliente_possui ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    16486    compra id_compra    DEFAULT     t   ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);
 ?   ALTER TABLE public.compra ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16593    compra_carrinho id_carrinho    DEFAULT     �   ALTER TABLE ONLY public.compra_carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.compra_carrinho_id_carrinho_seq'::regclass);
 J   ALTER TABLE public.compra_carrinho ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    237    235    237            �           2604    16594    compra_carrinho id_compra    DEFAULT     �   ALTER TABLE ONLY public.compra_carrinho ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_carrinho_id_compra_seq'::regclass);
 H   ALTER TABLE public.compra_carrinho ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    16556    jogo_no_carrinho id_carrinho    DEFAULT     �   ALTER TABLE ONLY public.jogo_no_carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.jogo_no_carrinho_id_carrinho_seq'::regclass);
 K   ALTER TABLE public.jogo_no_carrinho ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    16612    paga_compra numero_pagamento    DEFAULT     �   ALTER TABLE ONLY public.paga_compra ALTER COLUMN numero_pagamento SET DEFAULT nextval('public.paga_compra_numero_pagamento_seq'::regclass);
 K   ALTER TABLE public.paga_compra ALTER COLUMN numero_pagamento DROP DEFAULT;
       public          postgres    false    238    240    240            �           2604    16613    paga_compra id_compra    DEFAULT     ~   ALTER TABLE ONLY public.paga_compra ALTER COLUMN id_compra SET DEFAULT nextval('public.paga_compra_id_compra_seq'::regclass);
 D   ALTER TABLE public.paga_compra ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    16494    pagamento numero_pagamento    DEFAULT     �   ALTER TABLE ONLY public.pagamento ALTER COLUMN numero_pagamento SET DEFAULT nextval('public.pagamento_numero_pagamento_seq'::regclass);
 I   ALTER TABLE public.pagamento ALTER COLUMN numero_pagamento DROP DEFAULT;
       public          postgres    false    223    224    224            `          0    16476    carrinho 
   TABLE DATA           ?   COPY public.carrinho (id_carrinho, valor_carrinho) FROM stdin;
    public          postgres    false    220   7�       n          0    16571    carrinho_do_cliente 
   TABLE DATA           F   COPY public.carrinho_do_cliente (id_carrinho, id_cliente) FROM stdin;
    public          postgres    false    234   T�       ^          0    16465    cliente 
   TABLE DATA           �   COPY public.cliente (id_cliente, cpf, cep, adress_number, data_cadastro, nome_cliente, email, data_nasc, telefone, senha) FROM stdin;
    public          postgres    false    218   q�       i          0    16533    cliente_avalia 
   TABLE DATA           M   COPY public.cliente_avalia (id_cliente, nome_jogo, nota, review) FROM stdin;
    public          postgres    false    229   ��       g          0    16516    cliente_possui 
   TABLE DATA           N   COPY public.cliente_possui (id_cliente, nome_jogo, horas_jogadas) FROM stdin;
    public          postgres    false    227   ��       b          0    16483    compra 
   TABLE DATA           K   COPY public.compra (id_compra, data_hora, valor_total, status) FROM stdin;
    public          postgres    false    222   ύ       q          0    16590    compra_carrinho 
   TABLE DATA           A   COPY public.compra_carrinho (id_carrinho, id_compra) FROM stdin;
    public          postgres    false    237   �       \          0    16457    genero 
   TABLE DATA           A   COPY public.genero (nome_genero, description_genero) FROM stdin;
    public          postgres    false    216   	�       [          0    16448    jogo 
   TABLE DATA           U   COPY public.jogo (nome_jogo, description, price, data_launch, developer) FROM stdin;
    public          postgres    false    215   �       k          0    16553    jogo_no_carrinho 
   TABLE DATA           N   COPY public.jogo_no_carrinho (valor_jogo, id_carrinho, nome_jogo) FROM stdin;
    public          postgres    false    231   ��       e          0    16500    jogo_tag 
   TABLE DATA           7   COPY public.jogo_tag (nome_jogo, nome_tag) FROM stdin;
    public          postgres    false    225   ��       t          0    16609    paga_compra 
   TABLE DATA           B   COPY public.paga_compra (numero_pagamento, id_compra) FROM stdin;
    public          postgres    false    240   Ș       d          0    16491 	   pagamento 
   TABLE DATA           f   COPY public.pagamento (numero_pagamento, data_pagamento, metodo, nota_fical, valor_final) FROM stdin;
    public          postgres    false    224   �       �           0    0 #   carrinho_do_cliente_id_carrinho_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.carrinho_do_cliente_id_carrinho_seq', 1, false);
          public          postgres    false    232            �           0    0 "   carrinho_do_cliente_id_cliente_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.carrinho_do_cliente_id_cliente_seq', 1, false);
          public          postgres    false    233            �           0    0    carrinho_id_carrinho_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.carrinho_id_carrinho_seq', 1, false);
          public          postgres    false    219            �           0    0    cliente_avalia_id_cliente_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cliente_avalia_id_cliente_seq', 1, false);
          public          postgres    false    228            �           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public          postgres    false    217            �           0    0    cliente_possui_id_cliente_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cliente_possui_id_cliente_seq', 1, false);
          public          postgres    false    226            �           0    0    compra_carrinho_id_carrinho_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.compra_carrinho_id_carrinho_seq', 1, false);
          public          postgres    false    235            �           0    0    compra_carrinho_id_compra_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.compra_carrinho_id_compra_seq', 1, false);
          public          postgres    false    236            �           0    0    compra_id_compra_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.compra_id_compra_seq', 1, false);
          public          postgres    false    221            �           0    0     jogo_no_carrinho_id_carrinho_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.jogo_no_carrinho_id_carrinho_seq', 1, false);
          public          postgres    false    230            �           0    0    paga_compra_id_compra_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.paga_compra_id_compra_seq', 1, false);
          public          postgres    false    239            �           0    0     paga_compra_numero_pagamento_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.paga_compra_numero_pagamento_seq', 1, false);
          public          postgres    false    238            �           0    0    pagamento_numero_pagamento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pagamento_numero_pagamento_seq', 1, false);
          public          postgres    false    223            �           2606    16577 ,   carrinho_do_cliente carrinho_do_cliente_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.carrinho_do_cliente
    ADD CONSTRAINT carrinho_do_cliente_pkey PRIMARY KEY (id_carrinho, id_cliente);
 V   ALTER TABLE ONLY public.carrinho_do_cliente DROP CONSTRAINT carrinho_do_cliente_pkey;
       public            postgres    false    234    234            �           2606    16481    carrinho carrinho_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_pkey PRIMARY KEY (id_carrinho);
 @   ALTER TABLE ONLY public.carrinho DROP CONSTRAINT carrinho_pkey;
       public            postgres    false    220            �           2606    16541 "   cliente_avalia cliente_avalia_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_pkey PRIMARY KEY (id_cliente, nome_jogo);
 L   ALTER TABLE ONLY public.cliente_avalia DROP CONSTRAINT cliente_avalia_pkey;
       public            postgres    false    229    229            �           2606    16474    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    218            �           2606    16521 "   cliente_possui cliente_possui_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_pkey PRIMARY KEY (id_cliente, nome_jogo);
 L   ALTER TABLE ONLY public.cliente_possui DROP CONSTRAINT cliente_possui_pkey;
       public            postgres    false    227    227            �           2606    16596 $   compra_carrinho compra_carrinho_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.compra_carrinho
    ADD CONSTRAINT compra_carrinho_pkey PRIMARY KEY (id_carrinho, id_compra);
 N   ALTER TABLE ONLY public.compra_carrinho DROP CONSTRAINT compra_carrinho_pkey;
       public            postgres    false    237    237            �           2606    16489    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    222            �           2606    16463    genero genero_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (nome_genero);
 <   ALTER TABLE ONLY public.genero DROP CONSTRAINT genero_pkey;
       public            postgres    false    216            �           2606    16558 &   jogo_no_carrinho jogo_no_carrinho_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_pkey PRIMARY KEY (id_carrinho, nome_jogo);
 P   ALTER TABLE ONLY public.jogo_no_carrinho DROP CONSTRAINT jogo_no_carrinho_pkey;
       public            postgres    false    231    231            �           2606    16456    jogo jogo_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT jogo_pkey PRIMARY KEY (nome_jogo);
 8   ALTER TABLE ONLY public.jogo DROP CONSTRAINT jogo_pkey;
       public            postgres    false    215            �           2606    16504    jogo_tag jogo_tag_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_pkey PRIMARY KEY (nome_jogo, nome_tag);
 @   ALTER TABLE ONLY public.jogo_tag DROP CONSTRAINT jogo_tag_pkey;
       public            postgres    false    225    225            �           2606    16615    paga_compra paga_compra_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.paga_compra
    ADD CONSTRAINT paga_compra_pkey PRIMARY KEY (numero_pagamento, id_compra);
 F   ALTER TABLE ONLY public.paga_compra DROP CONSTRAINT paga_compra_pkey;
       public            postgres    false    240    240            �           2606    16499 "   pagamento pagamento_nota_fical_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_nota_fical_key UNIQUE (nota_fical);
 L   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_nota_fical_key;
       public            postgres    false    224            �           2606    16497    pagamento pagamento_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (numero_pagamento);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public            postgres    false    224            �           2606    16578 8   carrinho_do_cliente carrinho_do_cliente_id_carrinho_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrinho_do_cliente
    ADD CONSTRAINT carrinho_do_cliente_id_carrinho_fkey FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.carrinho_do_cliente DROP CONSTRAINT carrinho_do_cliente_id_carrinho_fkey;
       public          postgres    false    4777    220    234            �           2606    16583 7   carrinho_do_cliente carrinho_do_cliente_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrinho_do_cliente
    ADD CONSTRAINT carrinho_do_cliente_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.carrinho_do_cliente DROP CONSTRAINT carrinho_do_cliente_id_cliente_fkey;
       public          postgres    false    234    4775    218            �           2606    16542 -   cliente_avalia cliente_avalia_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.cliente_avalia DROP CONSTRAINT cliente_avalia_id_cliente_fkey;
       public          postgres    false    218    229    4775            �           2606    16547 ,   cliente_avalia cliente_avalia_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.cliente_avalia DROP CONSTRAINT cliente_avalia_nome_jogo_fkey;
       public          postgres    false    215    229    4771            �           2606    16522 -   cliente_possui cliente_possui_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.cliente_possui DROP CONSTRAINT cliente_possui_id_cliente_fkey;
       public          postgres    false    4775    218    227            �           2606    16527 ,   cliente_possui cliente_possui_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.cliente_possui DROP CONSTRAINT cliente_possui_nome_jogo_fkey;
       public          postgres    false    4771    227    215            �           2606    16597 0   compra_carrinho compra_carrinho_id_carrinho_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra_carrinho
    ADD CONSTRAINT compra_carrinho_id_carrinho_fkey FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.compra_carrinho DROP CONSTRAINT compra_carrinho_id_carrinho_fkey;
       public          postgres    false    237    220    4777            �           2606    16602 .   compra_carrinho compra_carrinho_id_compra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra_carrinho
    ADD CONSTRAINT compra_carrinho_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.compra_carrinho DROP CONSTRAINT compra_carrinho_id_compra_fkey;
       public          postgres    false    222    4779    237            �           2606    16559 2   jogo_no_carrinho jogo_no_carrinho_id_carrinho_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_id_carrinho_fkey FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.jogo_no_carrinho DROP CONSTRAINT jogo_no_carrinho_id_carrinho_fkey;
       public          postgres    false    220    4777    231            �           2606    16564 0   jogo_no_carrinho jogo_no_carrinho_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.jogo_no_carrinho DROP CONSTRAINT jogo_no_carrinho_nome_jogo_fkey;
       public          postgres    false    215    231    4771            �           2606    16505     jogo_tag jogo_tag_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.jogo_tag DROP CONSTRAINT jogo_tag_nome_jogo_fkey;
       public          postgres    false    4771    215    225            �           2606    16510    jogo_tag jogo_tag_nome_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_tag_fkey FOREIGN KEY (nome_tag) REFERENCES public.genero(nome_genero) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.jogo_tag DROP CONSTRAINT jogo_tag_nome_tag_fkey;
       public          postgres    false    4773    216    225            �           2606    16621 &   paga_compra paga_compra_id_compra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paga_compra
    ADD CONSTRAINT paga_compra_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.paga_compra DROP CONSTRAINT paga_compra_id_compra_fkey;
       public          postgres    false    4779    240    222            �           2606    16616 -   paga_compra paga_compra_numero_pagamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paga_compra
    ADD CONSTRAINT paga_compra_numero_pagamento_fkey FOREIGN KEY (numero_pagamento) REFERENCES public.pagamento(numero_pagamento) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.paga_compra DROP CONSTRAINT paga_compra_numero_pagamento_fkey;
       public          postgres    false    224    240    4783            `      x������ � �      n      x������ � �      ^     x�]�Oo�0��ԧ�1;Ƞ$˒ok�0t��^wQoS�?��C?�HK1�G���|�Q���l�|��p�q4�J��F�����%v:>�3����B�޵�q�A5J�RY8(��h�����V0���@W
+L)@�iT�Ҿ�)�!?����)@�
�;�����p��%l%	��K�+�C��T�r�ԍ��x�p\D9�������g$�ģKE+��*�x�c;a8��a��~gI�{&�d$�t��IH�l|�-*aaEV��L��-�y<M��X���<�0%Y΋���K��&?-3�JIH��t��aEZXg&?�a~�t��?�i��-��=�}����Nk��������p�B��]3ko�|�d�i,�� S�eHz߫#C��:�����3���B���Ys��>v�x�=G��eG�}�l%-<��HɱM4�V4�¼l2�[���O�a,h_�q��U�'�﯑褦�6Ld%7k������g���̬o�##��p��'����o�V��-�+�h��3�W��U
!�G�%      i      x������ � �      g      x������ � �      b      x������ � �      q      x������ � �      \   �  x��T�nA<�_��o�! !�"�#��;q�n�XE�����	q�:?F�g6�<���f��Uv������U_��^��\�q�Q�
�k���G{��&:r������X�KR��4ݎ�)���KO�u�/�>���oV,;�`��:��:����9e��s̀��\�_I 7&���Q>r�J�ɞo8�,8{.�^x�YN?�c>^�_y=���H)��=Y���&�3,c���H�7�D�)�;��T�:�� ���X��E|��6#*q.I���D&�9�qb�5(:�+Rw�=u� ���_��O��1����Z�<�d'�3�P�dh�k�� vRK�SG3�黛�XK��3	u�Ǧ)3Y�q@TrM� ��TZ
KL��u��3�L�{��`�X#[��������%�8�j�������Kn9��4w�Y���ق�E�� �$BCsV��]��`D�$��yC��ȍ��������9g���V2�'5�a���|��z���4�1ٳ��\�ю����<Y1���2�sN�Iuڤ���?fgQ��}�����f30�0�a=8 �_�C��h)�0ʂ��v��xy�Z�4�c��I�q�M2燩Xa!�O�_]�G�������n�i����eA����33F�r�I�GƸD�,�C�[�Q���3������ȣ���d�[V�Q���d����mK{��V�=a��쵭8��K��|�n6���@]      [   �  x��V[r�F�N1���,��PO�*�H٪�� ��J�.���%�)���ҳ (�.W��*Jvzz�{v�%]�*i�%�M���$�Z+�F���봢���ii��jT�&c�WkK3�����<Q����rv��F�mb�T�V�}�Lޟ�;;K&��t��G����>(G7�f�N_�nӚg��ON ��_nhن��"U�M�a�RQQ�Kx�@���5w��Vv�� PY��g����(� B2��/�>�s�[�奬���G�~�z�'W�өFK�X�(�T��o6�� �!To󎓕�Ȏ� ��F�I�hv�h����x�:ƀ�	yU��)к؛B?{���l��6�~� �f�(<�/M�Q:��Ȅ����v�[����;K�껉�P=����jl�*��(Yjc�uփ���|�r�Ў0�S��h<MN�����ht��ִN��d���s���F��re��Ƅ�� ����I����}�( -�m!F�邟����~�t����#�a?����H�j�e�m�*�}�Vy|4�L�kg�(����<^vFU"�'��Q�@"=5N׬e ��h��z8�o��+K[��ߪ�g�K�q�Kڕ�ZphcŰ�!���#%[�cO�掍�~������
J�>OG��d�5��t��]P���-�gԥ���#�O��} )Lþ�E������b91�����MT���8yѫLo@Xx=��k�Nݥ`���D1[G���F%��*V�C�qv)��?d��O>+����R[�>�j����~��Y啵e維��>�}'sXa����U� Z��@�Q?$:=	���|�H߫b�w�<��f-N�G���\༥.�&��^���2%�
F��FA�1T��{�8��^�B̾>:�]B�p���c$�����������&o}���e#Է1� El2s���2ޏ�����:�6�d�Ӯ�
�iH�"�K��-X�6����:y�2�ͤ�^&tg�)�ѠS���B�x��B���v b�+EhJ|*���w����/�W��2�G���a��B�������2V:fɲ9s�y[i
�����l�]v���*䮐b��D9	SG`G��<M��76�y����PCG�X��Z��v7
ׂ��>����:G���j���݉� CTMr� �>r���K�b�W����M��������3Z1Ȝ9Z�"=P����a̨�Lu\D��
H�5Б������{v����ڗL5Β�Z4���4&���^��m��ǎa���W(#Wr����F\�&�a��0�;���fV�b��7��lH�d�=��|���e�1o�ǫ��xC��Q���+�wۚ��ַ2^"��%�� �����{�<;;�a��.M���j      k      x������ � �      e     x�}SKn�0]G���h�E �\۪�	XB����X��$eǽM�E�s�b��R��A���{Ù�FX�[�h�6�K%a�jw5:�:�䤌዇�qp�C�Z#�������%LPH�l���4(���������Z�����]�=�v~�BŚ�s:��gB��/�W-^�-&#k���-�z��B�B)���.�1T���{�_�0L�^��.��|	(}I]�3BK�U ��s�o�
ܒ��ZH�[�B��5�xB� ������:�?ɘ�3��a۝�G���3˶�A�"�h͎vB%ڑ&w�`n�"Ե�IW�Z_w�]�H��6��C�|�VW+�,���Y��f�z��d����m5>�x�g�ܬ`!H��kOϗ���No�
jZ%^���)���}\��I+;o)Le�>�����A1f����̰/�?��H'L�b�#J� �m��������t%�?�#HӁoU�������U�z�@g�|���`-b#���6�oo�$�n��      t      x������ � �      d      x������ � �     