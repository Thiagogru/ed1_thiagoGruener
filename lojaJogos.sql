PGDMP  4                    |         
   loja_jogos    16.4    16.4 U    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    16397 
   loja_jogos    DATABASE     �   CREATE DATABASE loja_jogos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE loja_jogos;
                postgres    false            �            1259    16476    carrinho    TABLE     �   CREATE TABLE public.carrinho (
    id_carrinho integer NOT NULL,
    valor_carrinho numeric(10,2),
    id_cliente integer NOT NULL
);
    DROP TABLE public.carrinho;
       public         heap    postgres    false            �            1259    16475    carrinho_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.carrinho_id_carrinho_seq;
       public          postgres    false    220            Z           0    0    carrinho_id_carrinho_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.carrinho_id_carrinho_seq OWNED BY public.carrinho.id_carrinho;
          public          postgres    false    219            �            1259    24589    carrinho_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinho_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.carrinho_id_cliente_seq;
       public          postgres    false    220            [           0    0    carrinho_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.carrinho_id_cliente_seq OWNED BY public.carrinho.id_cliente;
          public          postgres    false    232            �            1259    16465    cliente    TABLE     M  CREATE TABLE public.cliente (
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
       public          postgres    false    229            \           0    0    cliente_avalia_id_cliente_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.cliente_avalia_id_cliente_seq OWNED BY public.cliente_avalia.id_cliente;
          public          postgres    false    228            �            1259    16464    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    218            ]           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
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
       public          postgres    false    227            ^           0    0    cliente_possui_id_cliente_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.cliente_possui_id_cliente_seq OWNED BY public.cliente_possui.id_cliente;
          public          postgres    false    226            �            1259    16483    compra    TABLE     �   CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    data_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    valor_total numeric(10,2) NOT NULL,
    status character varying(100),
    id_carrinho integer NOT NULL
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    24600    compra_id_carrinho_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.compra_id_carrinho_seq;
       public          postgres    false    222            _           0    0    compra_id_carrinho_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.compra_id_carrinho_seq OWNED BY public.compra.id_carrinho;
          public          postgres    false    233            �            1259    16482    compra_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.compra_id_compra_seq;
       public          postgres    false    222            `           0    0    compra_id_compra_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;
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
       public          postgres    false    231            a           0    0     jogo_no_carrinho_id_carrinho_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.jogo_no_carrinho_id_carrinho_seq OWNED BY public.jogo_no_carrinho.id_carrinho;
          public          postgres    false    230            �            1259    16500    jogo_tag    TABLE     ~   CREATE TABLE public.jogo_tag (
    nome_jogo character varying(100) NOT NULL,
    nome_tag character varying(100) NOT NULL
);
    DROP TABLE public.jogo_tag;
       public         heap    postgres    false            �            1259    16491 	   pagamento    TABLE     �  CREATE TABLE public.pagamento (
    numero_pagamento integer NOT NULL,
    data_pagamento date DEFAULT CURRENT_DATE,
    metodo character varying(7) NOT NULL,
    nota_fical character(20) NOT NULL,
    valor_final numeric(10,2) NOT NULL,
    id_compra integer NOT NULL,
    CONSTRAINT metodo CHECK (((metodo)::text = ANY ((ARRAY['boleto'::character varying, 'credito'::character varying, 'debito'::character varying, 'pix'::character varying])::text[])))
);
    DROP TABLE public.pagamento;
       public         heap    postgres    false            �            1259    24611    pagamento_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamento_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.pagamento_id_compra_seq;
       public          postgres    false    224            b           0    0    pagamento_id_compra_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.pagamento_id_compra_seq OWNED BY public.pagamento.id_compra;
          public          postgres    false    234            �            1259    16490    pagamento_numero_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamento_numero_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pagamento_numero_pagamento_seq;
       public          postgres    false    224            c           0    0    pagamento_numero_pagamento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pagamento_numero_pagamento_seq OWNED BY public.pagamento.numero_pagamento;
          public          postgres    false    223                       2604    16479    carrinho id_carrinho    DEFAULT     |   ALTER TABLE ONLY public.carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.carrinho_id_carrinho_seq'::regclass);
 C   ALTER TABLE public.carrinho ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    24590    carrinho id_cliente    DEFAULT     z   ALTER TABLE ONLY public.carrinho ALTER COLUMN id_cliente SET DEFAULT nextval('public.carrinho_id_cliente_seq'::regclass);
 B   ALTER TABLE public.carrinho ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    232    220            }           2604    16468    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16536    cliente_avalia id_cliente    DEFAULT     �   ALTER TABLE ONLY public.cliente_avalia ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_avalia_id_cliente_seq'::regclass);
 H   ALTER TABLE public.cliente_avalia ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    16519    cliente_possui id_cliente    DEFAULT     �   ALTER TABLE ONLY public.cliente_possui ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_possui_id_cliente_seq'::regclass);
 H   ALTER TABLE public.cliente_possui ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16486    compra id_compra    DEFAULT     t   ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);
 ?   ALTER TABLE public.compra ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    24601    compra id_carrinho    DEFAULT     x   ALTER TABLE ONLY public.compra ALTER COLUMN id_carrinho SET DEFAULT nextval('public.compra_id_carrinho_seq'::regclass);
 A   ALTER TABLE public.compra ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    233    222            �           2604    16556    jogo_no_carrinho id_carrinho    DEFAULT     �   ALTER TABLE ONLY public.jogo_no_carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.jogo_no_carrinho_id_carrinho_seq'::regclass);
 K   ALTER TABLE public.jogo_no_carrinho ALTER COLUMN id_carrinho DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    16494    pagamento numero_pagamento    DEFAULT     �   ALTER TABLE ONLY public.pagamento ALTER COLUMN numero_pagamento SET DEFAULT nextval('public.pagamento_numero_pagamento_seq'::regclass);
 I   ALTER TABLE public.pagamento ALTER COLUMN numero_pagamento DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    24612    pagamento id_compra    DEFAULT     z   ALTER TABLE ONLY public.pagamento ALTER COLUMN id_compra SET DEFAULT nextval('public.pagamento_id_compra_seq'::regclass);
 B   ALTER TABLE public.pagamento ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    234    224            E          0    16476    carrinho 
   TABLE DATA           K   COPY public.carrinho (id_carrinho, valor_carrinho, id_cliente) FROM stdin;
    public          postgres    false    220   j       C          0    16465    cliente 
   TABLE DATA           �   COPY public.cliente (id_cliente, cpf, cep, adress_number, data_cadastro, nome_cliente, email, data_nasc, telefone, senha) FROM stdin;
    public          postgres    false    218   <j       N          0    16533    cliente_avalia 
   TABLE DATA           M   COPY public.cliente_avalia (id_cliente, nome_jogo, nota, review) FROM stdin;
    public          postgres    false    229   Yj       L          0    16516    cliente_possui 
   TABLE DATA           N   COPY public.cliente_possui (id_cliente, nome_jogo, horas_jogadas) FROM stdin;
    public          postgres    false    227   vj       G          0    16483    compra 
   TABLE DATA           X   COPY public.compra (id_compra, data_hora, valor_total, status, id_carrinho) FROM stdin;
    public          postgres    false    222   �j       A          0    16457    genero 
   TABLE DATA           A   COPY public.genero (nome_genero, description_genero) FROM stdin;
    public          postgres    false    216   �j       @          0    16448    jogo 
   TABLE DATA           U   COPY public.jogo (nome_jogo, description, price, data_launch, developer) FROM stdin;
    public          postgres    false    215   �m       P          0    16553    jogo_no_carrinho 
   TABLE DATA           N   COPY public.jogo_no_carrinho (valor_jogo, id_carrinho, nome_jogo) FROM stdin;
    public          postgres    false    231   �s       J          0    16500    jogo_tag 
   TABLE DATA           7   COPY public.jogo_tag (nome_jogo, nome_tag) FROM stdin;
    public          postgres    false    225   �s       I          0    16491 	   pagamento 
   TABLE DATA           q   COPY public.pagamento (numero_pagamento, data_pagamento, metodo, nota_fical, valor_final, id_compra) FROM stdin;
    public          postgres    false    224   �u       d           0    0    carrinho_id_carrinho_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.carrinho_id_carrinho_seq', 5, true);
          public          postgres    false    219            e           0    0    carrinho_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.carrinho_id_cliente_seq', 1, true);
          public          postgres    false    232            f           0    0    cliente_avalia_id_cliente_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cliente_avalia_id_cliente_seq', 1, false);
          public          postgres    false    228            g           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 10, true);
          public          postgres    false    217            h           0    0    cliente_possui_id_cliente_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cliente_possui_id_cliente_seq', 1, false);
          public          postgres    false    226            i           0    0    compra_id_carrinho_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.compra_id_carrinho_seq', 1, true);
          public          postgres    false    233            j           0    0    compra_id_compra_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.compra_id_compra_seq', 2, true);
          public          postgres    false    221            k           0    0     jogo_no_carrinho_id_carrinho_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.jogo_no_carrinho_id_carrinho_seq', 1, false);
          public          postgres    false    230            l           0    0    pagamento_id_compra_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pagamento_id_compra_seq', 1, true);
          public          postgres    false    234            m           0    0    pagamento_numero_pagamento_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.pagamento_numero_pagamento_seq', 2, true);
          public          postgres    false    223            �           2606    16481    carrinho carrinho_pkey 
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
       public            postgres    false    227    227            �           2606    16489    compra compra_pkey 
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
       public            postgres    false    225    225            �           2606    16499 "   pagamento pagamento_nota_fical_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_nota_fical_key UNIQUE (nota_fical);
 L   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_nota_fical_key;
       public            postgres    false    224            �           2606    16497    pagamento pagamento_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (numero_pagamento);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public            postgres    false    224            �           2606    16542 -   cliente_avalia cliente_avalia_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.cliente_avalia DROP CONSTRAINT cliente_avalia_id_cliente_fkey;
       public          postgres    false    218    4758    229            �           2606    16547 ,   cliente_avalia cliente_avalia_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.cliente_avalia DROP CONSTRAINT cliente_avalia_nome_jogo_fkey;
       public          postgres    false    229    4754    215            �           2606    16522 -   cliente_possui cliente_possui_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.cliente_possui DROP CONSTRAINT cliente_possui_id_cliente_fkey;
       public          postgres    false    218    4758    227            �           2606    16527 ,   cliente_possui cliente_possui_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.cliente_possui DROP CONSTRAINT cliente_possui_nome_jogo_fkey;
       public          postgres    false    227    4754    215            �           2606    24658    carrinho fk_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.carrinho DROP CONSTRAINT fk_cliente;
       public          postgres    false    218    4758    220            �           2606    24663    compra id_carrinho    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_carrinho FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT id_carrinho;
       public          postgres    false    222    4760    220            �           2606    16559 2   jogo_no_carrinho jogo_no_carrinho_id_carrinho_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_id_carrinho_fkey FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.jogo_no_carrinho DROP CONSTRAINT jogo_no_carrinho_id_carrinho_fkey;
       public          postgres    false    231    4760    220            �           2606    16564 0   jogo_no_carrinho jogo_no_carrinho_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.jogo_no_carrinho DROP CONSTRAINT jogo_no_carrinho_nome_jogo_fkey;
       public          postgres    false    4754    215    231            �           2606    16505     jogo_tag jogo_tag_nome_jogo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.jogo_tag DROP CONSTRAINT jogo_tag_nome_jogo_fkey;
       public          postgres    false    215    225    4754            �           2606    16510    jogo_tag jogo_tag_nome_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_tag_fkey FOREIGN KEY (nome_tag) REFERENCES public.genero(nome_genero) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.jogo_tag DROP CONSTRAINT jogo_tag_nome_tag_fkey;
       public          postgres    false    4756    225    216            E      x������ � �      C      x������ � �      N      x������ � �      L      x������ � �      G      x������ � �      A   �  x��T�nA<�_��o�! !�"�#��;q�n�XE�����	q�:?F�g6�<���f��Uv������U_��^��\�q�Q�
�k���G{��&:r������X�KR��4ݎ�)���KO�u�/�>���oV,;�`��:��:����9e��s̀��\�_I 7&���Q>r�J�ɞo8�,8{.�^x�YN?�c>^�_y=���H)��=Y���&�3,c���H�7�D�)�;��T�:�� ���X��E|��6#*q.I���D&�9�qb�5(:�+Rw�=u� ���_��O��1����Z�<�d'�3�P�dh�k�� vRK�SG3�黛�XK��3	u�Ǧ)3Y�q@TrM� ��TZ
KL��u��3�L�{��`�X#[��������%�8�j�������Kn9��4w�Y���ق�E�� �$BCsV��]��`D�$��yC��ȍ��������9g���V2�'5�a���|��z���4�1ٳ��\�ю����<Y1���2�sN�Iuڤ���?fgQ��}�����f30�0�a=8 �_�C��h)�0ʂ��v��xy�Z�4�c��I�q�M2燩Xa!�O�_]�G�������n�i����eA����33F�r�I�GƸD�,�C�[�Q���3������ȣ���d�[V�Q���d����mK{��V�=a��쵭8��K��|�n6���@]      @     x��V�r�8<�_������q�J~%qiKr�ڭ���H�M �v~g{�W�ǶeJ��n�UE�������J1!Y��T7^-��K-5��b��7VIQ�hk�0V�J9�H	m�W�VFL�y���u�K#dN����� ���j%KseGgggQ����4e��)���V\˚\<~�o�V?�,991��Z,Z�Zp�Bֹ"�q� F��P�����Ŋ:ƞ
m*�� (���?KFi
�x"~�摞<���,ǰ�,[Uꩫ�\�N+��ZKk�Wk��צZ��3���k�N���%H�	$g��$��Yp�~#��s�9��[B���xU%�hm�M��(p�'k�����F׀��4ߢ��B+-�Hz��Ǘ\9�����v������-dO�1n$S�J�6�: K�ȷ�8�|��N+�_�
!�N8%�(;��[�V�Ѝ0�_���R��eg�������|$� %��M������{d͠���NN�O�Q ^(ۂ��szR֜�9{�ى�"q��

T���@��+;4`����Â�RV���99eYteM=����R<1��ғղb>��	^����&� �L'{ ���T��#m��Y��Ӂ�7�T)��cM@�+n�m=ј�,9�LnIK�W��� �Z�ɴW��(;�fTS�*.��R���w\q��]��Ѡ�� ���u�#Ŭ�`��|T���x��:8e���8:��]��̿��)�+�.�K�=^�c65,6H��e@�C��f��c�?l�E�%U��m���L�@�<)}.�0�^�1e7m#�7}0���1
k�S^뀠F����;G��B���'�w�X)M�&�+�'�c���Z༅*�'_-z���-Tu#�����{�8��N�,̮?��f_b� ��I3��Y��|�|C����"��a|
TxL�dN7=�Dƻ��*�J���4���u[��#kU�RȺ!ջ�2��+R�M��^�r��1�	�A�.�Mz_�BQ���?3?؁��9-������c�["?�_���X<H{.�W�/���4�"c���ě3��6Hc8Dv�ub�켛\7�,�)�#&�OB��A������C��z�o��a��].�X.!i�YkfP+�Kr-�#d�p�A�P��Tܲ�`C��s�u@'>R����,i�@���g��[��n���m��i� sf(�t��W�Wk`*j�TKE��|[A N�>��06_0so�.q9��T�6�P%ity!捱���c���/Z�V�M��ǎ!���S8#�|��|kU�S�n�a��4�;���fZ���7�^lX�b���|���	6܉�w��U39���x{P�D+����i��c�[j��K���.��T�^=l����0Y�thp�����A�o-���)���(�w��v\��pש.�Q�$I�?����Z�*��H�/��W��{d� �hؤ�U�F�{�:.����{�8A���0����mv�C�&�aH����:���_�! ~      P      x������ � �      J     x�}SKn�0]G�����E �\۪�	XB����X���$eǽM�E�s�b��R��A���{Ù�BX�[Wh�&�K%a�hw5:�>�⤈���qp�C�#�w�����%LPH����aP���{���?6z÷����,��9�k���<ڣ�	�60�l\6x������֒�06�u>U	�D8ǃ�hF_��}E�0{�)��%ԣ�%u��-I���"�΁���qK�S�+!yoaBŞ��	�L�k�:4Z�N��Xv�'c��p��m{���O,��z����1;�	�LhG��!�����e�S�Z']1pj}��OI"Y�ڠ�I���]��:bpk��y�=�����^0��T:�8�Qp��� ���q<!<_6��=\�T7J�{'�S�!�3�����Vv��R���7)|��/���b���B�Mיa_:Z{�N����G��B�����k#��iK�}�F0�lx�z�����?,�ֻZ;�7�k�� ��ǰ�`}���ۛ$I���      I      x������ � �     