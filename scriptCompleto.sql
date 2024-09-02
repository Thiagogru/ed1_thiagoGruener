--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-01 22:11:39

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
-- TOC entry 220 (class 1259 OID 16476)
-- Name: carrinho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrinho (
    id_carrinho integer NOT NULL,
    valor_carrinho numeric(10,2),
    id_cliente integer NOT NULL
);


ALTER TABLE public.carrinho OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16475)
-- Name: carrinho_id_carrinho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrinho_id_carrinho_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: carrinho_id_carrinho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrinho_id_carrinho_seq OWNED BY public.carrinho.id_carrinho;


--
-- TOC entry 232 (class 1259 OID 24589)
-- Name: carrinho_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrinho_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrinho_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 232
-- Name: carrinho_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrinho_id_cliente_seq OWNED BY public.carrinho.id_cliente;


--
-- TOC entry 218 (class 1259 OID 16465)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
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


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16533)
-- Name: cliente_avalia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_avalia (
    id_cliente integer NOT NULL,
    nome_jogo character varying(100) NOT NULL,
    nota integer,
    review text,
    CONSTRAINT cliente_avalia_nota_check CHECK (((nota >= 0) AND (nota <= 5)))
);


ALTER TABLE public.cliente_avalia OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16532)
-- Name: cliente_avalia_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_avalia_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_avalia_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 228
-- Name: cliente_avalia_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_avalia_id_cliente_seq OWNED BY public.cliente_avalia.id_cliente;


--
-- TOC entry 217 (class 1259 OID 16464)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 227 (class 1259 OID 16516)
-- Name: cliente_possui; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_possui (
    id_cliente integer NOT NULL,
    nome_jogo character varying(100) NOT NULL,
    horas_jogadas numeric(10,2)
);


ALTER TABLE public.cliente_possui OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16515)
-- Name: cliente_possui_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_possui_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_possui_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 226
-- Name: cliente_possui_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_possui_id_cliente_seq OWNED BY public.cliente_possui.id_cliente;


--
-- TOC entry 222 (class 1259 OID 16483)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    data_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    valor_total numeric(10,2) NOT NULL,
    status character varying(100),
    id_carrinho integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24600)
-- Name: compra_id_carrinho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compra_id_carrinho_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 233
-- Name: compra_id_carrinho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_carrinho_seq OWNED BY public.compra.id_carrinho;


--
-- TOC entry 221 (class 1259 OID 16482)
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compra_id_compra_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 221
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;


--
-- TOC entry 216 (class 1259 OID 16457)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    nome_genero character varying(100) NOT NULL,
    description_genero text NOT NULL
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16448)
-- Name: jogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogo (
    nome_jogo character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    data_launch date,
    developer character varying(100) NOT NULL,
    CONSTRAINT jogo_data_launch_check CHECK ((data_launch <= CURRENT_DATE)),
    CONSTRAINT jogo_description_check CHECK ((length(description) >= 50))
);


ALTER TABLE public.jogo OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16553)
-- Name: jogo_no_carrinho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogo_no_carrinho (
    valor_jogo numeric(10,2),
    id_carrinho integer NOT NULL,
    nome_jogo character varying(100) NOT NULL
);


ALTER TABLE public.jogo_no_carrinho OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16552)
-- Name: jogo_no_carrinho_id_carrinho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jogo_no_carrinho_id_carrinho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jogo_no_carrinho_id_carrinho_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 230
-- Name: jogo_no_carrinho_id_carrinho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jogo_no_carrinho_id_carrinho_seq OWNED BY public.jogo_no_carrinho.id_carrinho;


--
-- TOC entry 225 (class 1259 OID 16500)
-- Name: jogo_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogo_tag (
    nome_jogo character varying(100) NOT NULL,
    nome_tag character varying(100) NOT NULL
);


ALTER TABLE public.jogo_tag OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16491)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagamento (
    numero_pagamento integer NOT NULL,
    data_pagamento date DEFAULT CURRENT_DATE,
    metodo character varying(7) NOT NULL,
    nota_fical character(20) NOT NULL,
    valor_final numeric(10,2) NOT NULL,
    id_compra integer NOT NULL,
    CONSTRAINT metodo CHECK (((metodo)::text = ANY ((ARRAY['boleto'::character varying, 'credito'::character varying, 'debito'::character varying, 'pix'::character varying])::text[])))
);


ALTER TABLE public.pagamento OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24611)
-- Name: pagamento_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamento_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagamento_id_compra_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 234
-- Name: pagamento_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamento_id_compra_seq OWNED BY public.pagamento.id_compra;


--
-- TOC entry 223 (class 1259 OID 16490)
-- Name: pagamento_numero_pagamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamento_numero_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagamento_numero_pagamento_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 223
-- Name: pagamento_numero_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamento_numero_pagamento_seq OWNED BY public.pagamento.numero_pagamento;


--
-- TOC entry 4735 (class 2604 OID 16479)
-- Name: carrinho id_carrinho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.carrinho_id_carrinho_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 24590)
-- Name: carrinho id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrinho ALTER COLUMN id_cliente SET DEFAULT nextval('public.carrinho_id_cliente_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 16468)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 16536)
-- Name: cliente_avalia id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_avalia ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_avalia_id_cliente_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 16519)
-- Name: cliente_possui id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_possui ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_possui_id_cliente_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16486)
-- Name: compra id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 24601)
-- Name: compra id_carrinho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id_carrinho SET DEFAULT nextval('public.compra_id_carrinho_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16556)
-- Name: jogo_no_carrinho id_carrinho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_no_carrinho ALTER COLUMN id_carrinho SET DEFAULT nextval('public.jogo_no_carrinho_id_carrinho_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16494)
-- Name: pagamento numero_pagamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN numero_pagamento SET DEFAULT nextval('public.pagamento_numero_pagamento_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 24612)
-- Name: pagamento id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id_compra SET DEFAULT nextval('public.pagamento_id_compra_seq'::regclass);


--
-- TOC entry 4760 (class 2606 OID 16481)
-- Name: carrinho carrinho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_pkey PRIMARY KEY (id_carrinho);


--
-- TOC entry 4772 (class 2606 OID 16541)
-- Name: cliente_avalia cliente_avalia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_pkey PRIMARY KEY (id_cliente, nome_jogo);


--
-- TOC entry 4758 (class 2606 OID 16474)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4770 (class 2606 OID 16521)
-- Name: cliente_possui cliente_possui_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_pkey PRIMARY KEY (id_cliente, nome_jogo);


--
-- TOC entry 4762 (class 2606 OID 16489)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 4756 (class 2606 OID 16463)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (nome_genero);


--
-- TOC entry 4774 (class 2606 OID 16558)
-- Name: jogo_no_carrinho jogo_no_carrinho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_pkey PRIMARY KEY (id_carrinho, nome_jogo);


--
-- TOC entry 4754 (class 2606 OID 16456)
-- Name: jogo jogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT jogo_pkey PRIMARY KEY (nome_jogo);


--
-- TOC entry 4768 (class 2606 OID 16504)
-- Name: jogo_tag jogo_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_pkey PRIMARY KEY (nome_jogo, nome_tag);


--
-- TOC entry 4764 (class 2606 OID 16499)
-- Name: pagamento pagamento_nota_fical_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_nota_fical_key UNIQUE (nota_fical);


--
-- TOC entry 4766 (class 2606 OID 16497)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (numero_pagamento);


--
-- TOC entry 4782 (class 2606 OID 16542)
-- Name: cliente_avalia cliente_avalia_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 16547)
-- Name: cliente_avalia cliente_avalia_nome_jogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_avalia
    ADD CONSTRAINT cliente_avalia_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;


--
-- TOC entry 4780 (class 2606 OID 16522)
-- Name: cliente_possui cliente_possui_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;


--
-- TOC entry 4781 (class 2606 OID 16527)
-- Name: cliente_possui cliente_possui_nome_jogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_possui
    ADD CONSTRAINT cliente_possui_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;


--
-- TOC entry 4776 (class 2606 OID 24606)
-- Name: compra id_carrinho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_carrinho FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho);


--
-- TOC entry 4775 (class 2606 OID 24595)
-- Name: carrinho id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 4777 (class 2606 OID 24618)
-- Name: pagamento id_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT id_compra FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra);


--
-- TOC entry 4784 (class 2606 OID 16559)
-- Name: jogo_no_carrinho jogo_no_carrinho_id_carrinho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_id_carrinho_fkey FOREIGN KEY (id_carrinho) REFERENCES public.carrinho(id_carrinho) ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 16564)
-- Name: jogo_no_carrinho jogo_no_carrinho_nome_jogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_no_carrinho
    ADD CONSTRAINT jogo_no_carrinho_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;


--
-- TOC entry 4778 (class 2606 OID 16505)
-- Name: jogo_tag jogo_tag_nome_jogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_jogo_fkey FOREIGN KEY (nome_jogo) REFERENCES public.jogo(nome_jogo) ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 16510)
-- Name: jogo_tag jogo_tag_nome_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo_tag
    ADD CONSTRAINT jogo_tag_nome_tag_fkey FOREIGN KEY (nome_tag) REFERENCES public.genero(nome_genero) ON DELETE CASCADE;


-- Completed on 2024-09-01 22:11:40

--
-- PostgreSQL database dump complete
--

