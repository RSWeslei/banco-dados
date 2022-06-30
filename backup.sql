--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)

-- Started on 2022-06-30 14:24:20 -03

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
-- TOC entry 216 (class 1259 OID 18018)
-- Name: cartao_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartao_loja (
    id integer NOT NULL,
    nome_titular character varying(100) NOT NULL,
    numero character varying(20) NOT NULL,
    cvv character varying(3) NOT NULL,
    vencimento date NOT NULL,
    id_cliente integer NOT NULL
);


ALTER TABLE public.cartao_loja OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18017)
-- Name: cartao_loja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartao_loja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartao_loja_id_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 215
-- Name: cartao_loja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartao_loja_id_seq OWNED BY public.cartao_loja.id;


--
-- TOC entry 220 (class 1259 OID 18042)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18041)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 210 (class 1259 OID 17980)
-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidades (
    id integer NOT NULL,
    nome character varying(60) NOT NULL,
    uf character(2) NOT NULL
);


ALTER TABLE public.cidades OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17979)
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidades_id_seq OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 209
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidades.id;


--
-- TOC entry 214 (class 1259 OID 18001)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(16) NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(15) NOT NULL,
    nascimento date NOT NULL,
    ativo boolean DEFAULT false,
    id_endereco integer NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18000)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 213
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 212 (class 1259 OID 17987)
-- Name: enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enderecos (
    id integer NOT NULL,
    cep character varying(10) NOT NULL,
    endereco character varying(200) NOT NULL,
    complemento character varying(200),
    bairro character varying(100) NOT NULL,
    numero character varying(5),
    id_cidade integer NOT NULL
);


ALTER TABLE public.enderecos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17986)
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 211
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- TOC entry 218 (class 1259 OID 18030)
-- Name: nota_fiscal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_fiscal (
    id integer NOT NULL,
    valor numeric(15,2),
    emissao date NOT NULL,
    numero character varying(10) NOT NULL,
    id_cliente integer NOT NULL
);


ALTER TABLE public.nota_fiscal OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18029)
-- Name: nota_fiscal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_fiscal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_fiscal_id_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 217
-- Name: nota_fiscal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_fiscal_id_seq OWNED BY public.nota_fiscal.id;


--
-- TOC entry 224 (class 1259 OID 18061)
-- Name: nota_fiscal_roupas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_fiscal_roupas (
    id integer NOT NULL,
    quantidade integer NOT NULL,
    valor numeric(15,2) NOT NULL,
    id_nota_fiscal integer NOT NULL,
    id_roupa integer NOT NULL
);


ALTER TABLE public.nota_fiscal_roupas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18060)
-- Name: nota_fiscal_roupas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_fiscal_roupas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_fiscal_roupas_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 223
-- Name: nota_fiscal_roupas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_fiscal_roupas_id_seq OWNED BY public.nota_fiscal_roupas.id;


--
-- TOC entry 222 (class 1259 OID 18049)
-- Name: roupas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roupas (
    id integer NOT NULL,
    nome character varying(50),
    cor character varying(40) NOT NULL,
    tamanho character varying(20),
    marca character varying(50),
    preco_venda numeric(15,2) NOT NULL,
    preco_compra numeric(15,2) NOT NULL,
    id_categoria integer NOT NULL
);


ALTER TABLE public.roupas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18048)
-- Name: roupas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roupas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roupas_id_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 221
-- Name: roupas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roupas_id_seq OWNED BY public.roupas.id;


--
-- TOC entry 3248 (class 2604 OID 18021)
-- Name: cartao_loja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_loja ALTER COLUMN id SET DEFAULT nextval('public.cartao_loja_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 18045)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 17983)
-- Name: cidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 18004)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 17990)
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 18033)
-- Name: nota_fiscal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal ALTER COLUMN id SET DEFAULT nextval('public.nota_fiscal_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 18064)
-- Name: nota_fiscal_roupas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_roupas ALTER COLUMN id SET DEFAULT nextval('public.nota_fiscal_roupas_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 18052)
-- Name: roupas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roupas ALTER COLUMN id SET DEFAULT nextval('public.roupas_id_seq'::regclass);


--
-- TOC entry 3426 (class 0 OID 18018)
-- Dependencies: 216
-- Data for Name: cartao_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cartao_loja VALUES (1, 'Marcos Sérgio Martins', '5153 5890 1029 3013', '864', '2023-10-29', 7);
INSERT INTO public.cartao_loja VALUES (2, 'Elisa Márcia Heloise Assunção', '5564 5798 8529 8133', '126', '2024-01-29', 46);
INSERT INTO public.cartao_loja VALUES (3, 'Luan Mário Barros', '5115 1740 9122 9470', '784', '2023-06-29', 2);
INSERT INTO public.cartao_loja VALUES (4, 'Andrea Alessandra Rebeca da Cruz', '5282 4444 9001 2430', '366', '2023-09-29', 26);
INSERT INTO public.cartao_loja VALUES (5, 'Maya Alana Emily Brito', '6555 1128 1790 6752', '984', '2032-11-14', 31);
INSERT INTO public.cartao_loja VALUES (6, 'Priscila Alice Raquel Rocha', '5041 7517 6124 6758', '718', '2029-01-25', 39);
INSERT INTO public.cartao_loja VALUES (7, 'Eloá Olivia Gabrielly Cavalcanti', '4815 2147 8457 1311', '285', '2026-12-05', 43);
INSERT INTO public.cartao_loja VALUES (8, 'Larissa Carolina Alessandra Melo', '5591 4377 6163 2353', '27', '2027-12-30', 16);
INSERT INTO public.cartao_loja VALUES (9, 'Isabelly Catarina Nicole Cavalcanti', '4389 3553 6288 3382', '306', '2026-11-25', 5);
INSERT INTO public.cartao_loja VALUES (10, 'Breno Roberto Cauê Moreira', '3552 1667 4507 8522', '238', '2029-05-24', 21);


--
-- TOC entry 3430 (class 0 OID 18042)
-- Dependencies: 220
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias VALUES (1, 'Camisas');
INSERT INTO public.categorias VALUES (2, 'Camisetas');
INSERT INTO public.categorias VALUES (3, 'Tênis');
INSERT INTO public.categorias VALUES (4, 'Calças');
INSERT INTO public.categorias VALUES (5, 'Sapatos');
INSERT INTO public.categorias VALUES (6, 'Meias');


--
-- TOC entry 3420 (class 0 OID 17980)
-- Dependencies: 210
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cidades VALUES (1, 'São Paulo', 'SP');
INSERT INTO public.cidades VALUES (2, 'Boa Vista', 'RR');
INSERT INTO public.cidades VALUES (3, 'Aracaju', 'SE');
INSERT INTO public.cidades VALUES (4, 'Aparecida de Goiânia', 'GO');
INSERT INTO public.cidades VALUES (5, 'Teresina', 'PI');
INSERT INTO public.cidades VALUES (6, 'Olinda', 'PE');
INSERT INTO public.cidades VALUES (7, 'João Pessoa', 'PB');
INSERT INTO public.cidades VALUES (8, 'Jaboatão dos Guararapes', 'PE');
INSERT INTO public.cidades VALUES (9, 'Ananindeua', 'PA');
INSERT INTO public.cidades VALUES (10, 'Várzea Grande', 'MT');
INSERT INTO public.cidades VALUES (11, 'Colatina', 'ES');
INSERT INTO public.cidades VALUES (12, 'Ariquemes', 'RO');
INSERT INTO public.cidades VALUES (13, 'Porto Alegre', 'RS');
INSERT INTO public.cidades VALUES (14, 'Fortaleza', 'CE');
INSERT INTO public.cidades VALUES (15, 'Cabo Frio', 'RJ');
INSERT INTO public.cidades VALUES (16, 'Cacoal', 'RO');
INSERT INTO public.cidades VALUES (17, 'Maceió', 'AL');
INSERT INTO public.cidades VALUES (18, 'Sarandi', 'PR');
INSERT INTO public.cidades VALUES (19, 'Imperatriz', 'MA');
INSERT INTO public.cidades VALUES (20, 'Aracruz', 'ES');
INSERT INTO public.cidades VALUES (21, 'Ji-Paraná', 'RO');
INSERT INTO public.cidades VALUES (22, 'Maceió', 'AL');
INSERT INTO public.cidades VALUES (23, 'Macapá', 'AP');
INSERT INTO public.cidades VALUES (24, 'Porto Velho', 'RO');
INSERT INTO public.cidades VALUES (25, 'Guarapari', 'ES');
INSERT INTO public.cidades VALUES (26, 'Campo Grande', 'MS');
INSERT INTO public.cidades VALUES (27, 'Porto Velho', 'RO');
INSERT INTO public.cidades VALUES (28, 'Castanhal', 'PA');
INSERT INTO public.cidades VALUES (29, 'Palhoça', 'SC');
INSERT INTO public.cidades VALUES (30, 'Parnaíba', 'PI');
INSERT INTO public.cidades VALUES (31, 'Brasília', 'DF');
INSERT INTO public.cidades VALUES (32, 'Caroebe', 'RR');
INSERT INTO public.cidades VALUES (33, 'Brasília', 'DF');
INSERT INTO public.cidades VALUES (34, 'Maceió', 'AL');
INSERT INTO public.cidades VALUES (35, 'Campo Grande', 'MS');
INSERT INTO public.cidades VALUES (36, 'Paranavaí', 'PR');
INSERT INTO public.cidades VALUES (37, 'Manaus', 'AM');
INSERT INTO public.cidades VALUES (38, 'Betim', 'MG');
INSERT INTO public.cidades VALUES (39, 'Itapetininga', 'SP');
INSERT INTO public.cidades VALUES (40, 'Goiânia', 'GO');
INSERT INTO public.cidades VALUES (41, 'Natal', 'RN');
INSERT INTO public.cidades VALUES (42, 'Santana', 'AP');
INSERT INTO public.cidades VALUES (43, 'Santa Cruz do Sul', 'RS');
INSERT INTO public.cidades VALUES (44, 'São Paulo', 'SP');
INSERT INTO public.cidades VALUES (45, 'João Pessoa', 'PB');
INSERT INTO public.cidades VALUES (46, 'Natal', 'RN');
INSERT INTO public.cidades VALUES (47, 'Belo Horizonte', 'MG');
INSERT INTO public.cidades VALUES (48, 'Brasília', 'DF');
INSERT INTO public.cidades VALUES (49, 'Paragominas', 'PA');
INSERT INTO public.cidades VALUES (50, 'Natal', 'RN');


--
-- TOC entry 3424 (class 0 OID 18001)
-- Dependencies: 214
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Luiz Danilo Pinto', '183.163.611-59', 'luiz_pinto@caporal.biz', '(88) 98880-6339', '1963-04-27', false, 35);
INSERT INTO public.clientes VALUES (2, 'Luan Mário Barros', '319.715.284-04', 'luan-barros78@accent.com.br', '(61) 99446-5372', '1976-03-07', false, 45);
INSERT INTO public.clientes VALUES (3, 'Davi Rodrigo Levi da Luz', '855.125.547-94', 'davi.rodrigo.daluz@leonardopereira.com', '(83) 98980-5545', '1960-04-20', false, 33);
INSERT INTO public.clientes VALUES (4, 'Lara Jaqueline Malu Silva', '131.557.228-19', 'lara_silva@consultoriosjc.com.br', '(79) 98385-9541', '1975-03-01', false, 42);
INSERT INTO public.clientes VALUES (5, 'Isabelly Catarina Nicole Cavalcanti', '525.375.344-33', 'isabelly-cavalcanti80@saopaulo10hotmail.com', '(85) 98615-1729', '1964-02-13', false, 17);
INSERT INTO public.clientes VALUES (6, 'Samuel Ricardo da Rocha', '699.847.532-20', 'samuel_darocha@ideiaviva.com.br', '(86) 99551-2681', '1965-01-24', false, 40);
INSERT INTO public.clientes VALUES (7, 'Marcos Sérgio Martins', '811.967.999-70', 'marcos_martins@id.uff.br', '(27) 98603-5926', '1969-06-01', false, 16);
INSERT INTO public.clientes VALUES (8, 'Heloisa Mariana Simone da Rosa', '607.816.834-75', 'heloisa_darosa@monsanto.com', '(84) 98824-1567', '1981-01-06', false, 13);
INSERT INTO public.clientes VALUES (9, 'Bárbara Sara Ramos', '607.724.198-92', 'barbarasararamos@bb.com.br', '(12) 98238-4214', '1982-03-21', false, 28);
INSERT INTO public.clientes VALUES (10, 'Ayla Analu Pires', '031.379.715-35', 'ayla.analu.pires@danielvasconcelos.com.br', '(69) 99915-2569', '1997-05-06', false, 5);
INSERT INTO public.clientes VALUES (11, 'José Iago Rezende', '585.288.160-01', 'joseiagorezende@hotmail.co.jp', '(89) 98254-2846', '1965-06-26', false, 49);
INSERT INTO public.clientes VALUES (12, 'Thiago Oliver Assunção', '177.173.161-37', 'thiago-assuncao95@power.alstom.com', '(48) 99141-9886', '1983-06-16', false, 47);
INSERT INTO public.clientes VALUES (13, 'Sandra Luana Antonella Lima', '062.281.141-07', 'sandra.luana.lima@globomail.com', '(28) 98308-6617', '1944-05-16', false, 42);
INSERT INTO public.clientes VALUES (14, 'Fábio Guilherme Aragão', '567.406.267-66', 'fabio_guilherme_aragao@commscope.com', '(63) 98414-9231', '1958-01-23', false, 19);
INSERT INTO public.clientes VALUES (15, 'Gabriela Emily de Paula', '746.157.076-57', 'gabriela_emily_depaula@utbr.com.br', '(51) 98464-9704', '1946-01-17', false, 19);
INSERT INTO public.clientes VALUES (16, 'Larissa Carolina Alessandra Melo', '010.558.255-76', 'larissa_melo@skyzepp.com', '(92) 99435-6788', '1987-01-08', false, 4);
INSERT INTO public.clientes VALUES (17, 'Jorge Marcelo Emanuel Moura', '938.398.675-17', 'jorge_moura@mpc.com.br', '(98) 98218-1321', '1989-01-08', false, 28);
INSERT INTO public.clientes VALUES (18, 'Mário Vicente Gael Santos', '190.520.728-09', 'mario-santos82@sinsesp.com.br', '(63) 98899-3260', '1998-01-12', false, 11);
INSERT INTO public.clientes VALUES (19, 'Giovana Jéssica Araújo', '740.123.148-40', 'giovanajessicaaraujo@cmfcequipamentos.com.br', '(92) 99597-6580', '1953-01-22', false, 45);
INSERT INTO public.clientes VALUES (20, 'Pedro Henrique Bento Hugo Galvão', '520.192.881-17', 'pedro_henrique_galvao@tcotecnologia.com.br', '(86) 98823-1128', '2002-01-04', false, 23);
INSERT INTO public.clientes VALUES (21, 'Breno Roberto Cauê Moreira', '950.149.357-10', 'breno_roberto_moreira@formigueiromaquinas.com.br', '(62) 98945-5422', '1975-03-23', false, 40);
INSERT INTO public.clientes VALUES (22, 'Vera Jennifer Novaes', '459.354.184-01', 'vera-novaes77@ufscar.br', '(68) 99926-4272', '1944-04-25', false, 44);
INSERT INTO public.clientes VALUES (23, 'Sônia Liz Nunes', '709.304.353-46', 'sonia_nunes@agnet.com.br', '(61) 99252-0524', '1954-04-21', false, 15);
INSERT INTO public.clientes VALUES (24, 'Bianca Lívia Camila Freitas', '982.618.297-40', 'bianca_livia_freitas@liv.com', '(31) 98471-6805', '1985-05-08', false, 39);
INSERT INTO public.clientes VALUES (25, 'Matheus Tiago Fogaça', '973.149.667-02', 'matheus_tiago_fogaca@db4.com.br', '(82) 98726-7069', '1951-05-03', false, 8);
INSERT INTO public.clientes VALUES (26, 'Andrea Alessandra Rebeca da Cruz', '374.512.615-73', 'andrea.alessandra.dacruz@acquire.com.br', '(55) 99776-1261', '1982-03-15', false, 15);
INSERT INTO public.clientes VALUES (27, 'Mariah Ana Alessandra Porto', '642.974.222-98', 'mariah-porto73@yahoo.se', '(82) 98769-1168', '1951-02-13', false, 17);
INSERT INTO public.clientes VALUES (28, 'Enrico Sebastião Carvalho', '940.900.825-52', 'enrico_sebastiao_carvalho@4now.com.br', '(47) 98195-2076', '1949-04-08', false, 34);
INSERT INTO public.clientes VALUES (29, 'Pietro Arthur Nogueira', '133.752.370-49', 'pietro.arthur.nogueira@dmadvogados.com', '(83) 98536-3943', '1983-05-22', false, 45);
INSERT INTO public.clientes VALUES (30, 'Laura Débora Sarah da Mota', '885.640.531-87', 'laura.debora.damota@cressem.com.br', '(68) 98353-1098', '1971-04-02', false, 15);
INSERT INTO public.clientes VALUES (31, 'Maya Alana Emily Brito', '894.833.185-05', 'mayaalanabrito@valeparaibano.com.br', '(62) 99976-2224', '1962-01-01', false, 10);
INSERT INTO public.clientes VALUES (32, 'Giovanni Otávio Erick Alves', '029.694.691-54', 'giovanni.otavio.alves@webin.com.br', '(85) 99663-5808', '1999-02-25', false, 42);
INSERT INTO public.clientes VALUES (33, 'Sophia Tereza Dias', '795.128.121-26', 'sophiaterezadias@advogadosempresariais.com.br', '(88) 99755-7407', '1971-03-18', false, 39);
INSERT INTO public.clientes VALUES (34, 'Sebastião Davi Rodrigues', '873.091.437-01', 'sebastiao_rodrigues@pierproj.com.br', '(44) 98735-4829', '1958-02-25', false, 45);
INSERT INTO public.clientes VALUES (35, 'Kauê Márcio Hugo Assis', '188.560.757-17', 'kaue.marcio.assis@advogadostb.com.br', '(79) 99357-9805', '1987-03-19', false, 3);
INSERT INTO public.clientes VALUES (36, 'Iago Iago Hugo Novaes', '512.278.642-99', 'iago_iago_novaes@yahoo.fr', '(21) 98703-6324', '1979-06-22', false, 46);
INSERT INTO public.clientes VALUES (37, 'Henrique Julio Victor Moraes', '063.982.280-06', 'henriquejuliomoraes@expressoforte.com.br', '(61) 98144-1919', '1944-02-13', false, 9);
INSERT INTO public.clientes VALUES (38, 'Ayla Maria Brenda Costa', '310.735.982-33', 'ayla.maria.costa@victorseguros.com.br', '(84) 99237-4606', '1990-02-22', false, 49);
INSERT INTO public.clientes VALUES (39, 'Priscila Alice Raquel Rocha', '217.390.209-10', 'priscila.alice.rocha@lonax.net', '(86) 99780-5717', '1995-05-27', false, 13);
INSERT INTO public.clientes VALUES (40, 'Simone Marlene Araújo', '941.835.631-78', 'simonemarlenearaujo@semco.com.br', '(33) 98266-5466', '1956-04-18', false, 50);
INSERT INTO public.clientes VALUES (41, 'Marcos Vinicius Tomás Levi da Rocha', '763.908.507-19', 'marcosviniciusdarocha@gmalato.com.br', '(24) 99827-9497', '1969-03-09', false, 19);
INSERT INTO public.clientes VALUES (42, 'Tomás Luan Thales Ramos', '054.487.994-50', 'tomas.luan.ramos@carreiradasilva.com', '(79) 99597-2361', '1948-02-02', false, 44);
INSERT INTO public.clientes VALUES (43, 'Eloá Olivia Gabrielly Cavalcanti', '958.283.498-64', 'eloa.olivia.cavalcanti@compecia.com.br', '(67) 99937-7129', '1967-06-14', false, 25);
INSERT INTO public.clientes VALUES (44, 'Lívia Aline Isabella Pereira', '367.297.451-00', 'liviaalinepereira@reginfo.com.br', '(83) 98243-1219', '1994-06-11', false, 22);
INSERT INTO public.clientes VALUES (45, 'Benício Leonardo Cauã da Paz', '655.852.255-10', 'benicio_leonardo_dapaz@etec.sp.gov.br', '(61) 98416-6230', '1949-03-24', false, 40);
INSERT INTO public.clientes VALUES (46, 'Elisa Márcia Heloise Assunção', '412.271.663-20', 'elisamarciaassuncao@soluxenergiasolar.com.br', '(81) 99125-1815', '1960-05-04', false, 25);
INSERT INTO public.clientes VALUES (47, 'Caroline Pietra Nina da Conceição', '933.038.840-05', 'caroline-daconceicao76@gsw.com.br', '(77) 99963-8695', '1993-03-08', false, 10);
INSERT INTO public.clientes VALUES (48, 'Sabrina Caroline Vitória Rezende', '916.809.090-02', 'sabrina_rezende@hitmail.com', '(98) 98846-8537', '1972-05-18', false, 38);
INSERT INTO public.clientes VALUES (49, 'Gabriela Analu Rita Vieira', '102.830.568-00', 'gabriela.analu.vieira@balloons.com.br', '(86) 98374-9509', '1997-01-23', false, 17);
INSERT INTO public.clientes VALUES (50, 'Marcela Bárbara Almada', '163.551.769-93', 'marcela_almada@stembalagens.com.br', '(68) 99807-8536', '1960-01-27', false, 45);
INSERT INTO public.clientes VALUES (51, 'Sophia Eliane Juliana Lima', '659.850.657-31', 'sophiaelianelima@fcacomputers.com.br', '(84) 99686-0832', '1958-04-12', false, 48);
INSERT INTO public.clientes VALUES (52, 'Ricardo Márcio Caio da Costa', '323.927.482-50', 'ricardo.marcio.dacosta@huggoromano.com', '(96) 98242-8106', '1995-04-19', false, 50);
INSERT INTO public.clientes VALUES (53, 'Clara Mariane Maria Barbosa', '399.685.255-02', 'clara_mariane_barbosa@jarretta.com', '(99) 98965-1876', '1954-05-21', false, 17);
INSERT INTO public.clientes VALUES (54, 'Alexandre Breno das Neves', '114.361.143-81', 'alexandre.breno.dasneves@droganews.com.br', '(82) 99363-6007', '1962-06-21', false, 44);
INSERT INTO public.clientes VALUES (55, 'Andreia Alice Mariana Aragão', '952.539.370-48', 'andreia.alice.aragao@betti.com.br', '(67) 99141-4067', '1974-02-07', false, 43);
INSERT INTO public.clientes VALUES (56, 'Josefa Alice Silveira', '387.425.616-20', 'josefa_alice_silveira@ideiaviva.com.br', '(83) 99648-2251', '1959-05-07', false, 12);
INSERT INTO public.clientes VALUES (57, 'Bernardo Thiago Anderson Ferreira', '040.513.234-47', 'bernardo_ferreira@cdcd.com.br', '(21) 98158-6046', '1956-02-19', false, 44);
INSERT INTO public.clientes VALUES (58, 'Vanessa Eloá Alana Carvalho', '713.843.015-93', 'vanessaeloacarvalho@deere.com', '(96) 99143-2845', '1956-05-17', false, 28);
INSERT INTO public.clientes VALUES (59, 'Gabriela Flávia Nogueira', '857.590.076-53', 'gabriela_flavia_nogueira@bitco.cc', '(68) 98673-6199', '1998-06-14', false, 36);
INSERT INTO public.clientes VALUES (60, 'Henrique Luiz Rodrigo Lopes', '251.209.158-92', 'henriqueluizlopes@yazigi.com', '(68) 98647-5376', '2003-02-02', false, 6);


--
-- TOC entry 3422 (class 0 OID 17987)
-- Dependencies: 212
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enderecos VALUES (1, '64001-535', 'Avenida Miguel Rosa', NULL, 'Frei Serafim', '279', 4);
INSERT INTO public.enderecos VALUES (2, '78720-260', 'Rua Corumbá', NULL, 'Jardim Marialva', '608', 21);
INSERT INTO public.enderecos VALUES (3, '83820-178', 'Travessa Sapopema', NULL, 'Eucaliptos', '912', 38);
INSERT INTO public.enderecos VALUES (4, '78143-372', 'Rua Araputanga', NULL, 'Mapim', '367', 5);
INSERT INTO public.enderecos VALUES (5, '58011-313', 'Rua Jânio Carlos da Silva', NULL, 'Trincheiras', '891', 24);
INSERT INTO public.enderecos VALUES (6, '69901-174', 'Travessa Manaus', NULL, 'Adalberto Aragão', '564', 3);
INSERT INTO public.enderecos VALUES (7, '69911-856', 'Rua Campo Novo', NULL, 'Ayrton Sena', '335', 2);
INSERT INTO public.enderecos VALUES (8, '79022-462', 'Travessa Cabo', NULL, 'Jardim Autonomista', '983', 22);
INSERT INTO public.enderecos VALUES (9, '68925-180', 'Rua Pedro Salvador Diniz', NULL, 'Central', '933', 35);
INSERT INTO public.enderecos VALUES (10, '84020-432', 'Rua Orfile Angelina Passetti', NULL, 'Neves', '756', 32);
INSERT INTO public.enderecos VALUES (11, '88115-660', 'Rua João Izídio de Souza', NULL, 'Serraria', '411', 46);
INSERT INTO public.enderecos VALUES (12, '41510-400', 'Alto do Oitizeiro', NULL, 'São Cristóvão', '982', 39);
INSERT INTO public.enderecos VALUES (13, '69900-351', 'Canal Canal da Maternidade', NULL, 'Ipase', '676', 40);
INSERT INTO public.enderecos VALUES (14, '74684-004', 'Rua RF 8', NULL, 'Residencial Felicidade', '172', 29);
INSERT INTO public.enderecos VALUES (15, '64081-450', 'Loteamento Cidade Nova', NULL, 'Parque Poti', '981', 29);
INSERT INTO public.enderecos VALUES (16, '59122-044', 'Rua Alto da Torre', NULL, 'Redinha', '148', 10);
INSERT INTO public.enderecos VALUES (17, '57309-780', 'Rua José Praxedes de Farias', NULL, 'Massaranduba', '373', 10);
INSERT INTO public.enderecos VALUES (18, '59129-400', 'Rua Guaporé', NULL, 'Potengi', '543', 49);
INSERT INTO public.enderecos VALUES (19, '58064-675', 'Rua Oscar de Sá Sobrinho', NULL, 'Valentina de Figueiredo', '229', 6);
INSERT INTO public.enderecos VALUES (20, '72804-220', 'Rua Americano do Brasil', NULL, 'Parque Estrela Dalva I', '109', 18);
INSERT INTO public.enderecos VALUES (21, '76904-480', 'Rua da Seosp', NULL, 'Distrito Industrial', '123', 37);
INSERT INTO public.enderecos VALUES (22, '69914-288', 'Rua Porto Alegre', NULL, 'Waldemar Maciel', '335', 1);
INSERT INTO public.enderecos VALUES (23, '49800-974', 'Rua Salvador Nogueira', NULL, 'Centro', '328', 38);
INSERT INTO public.enderecos VALUES (24, '92130-745', 'Rua Vinte e Um de Abril', NULL, 'Niterói', '955', 8);
INSERT INTO public.enderecos VALUES (25, '72420-286', 'Quadra EQ 28/32', NULL, 'Setor Oeste (Gama)', '741', 21);
INSERT INTO public.enderecos VALUES (26, '53580-210', 'Rua Rio Bigode', NULL, 'Fosfato', '455', 6);
INSERT INTO public.enderecos VALUES (27, '55121-971', 'Vila Couro D''antas', NULL, 'Couro D''antas', '427', 33);
INSERT INTO public.enderecos VALUES (28, '57071-513', 'Rua Santa Terezinha', NULL, 'Clima Bom', '975', 49);
INSERT INTO public.enderecos VALUES (29, '69310-735', 'Rua Mossoró', NULL, 'Said Salomão', '408', 2);
INSERT INTO public.enderecos VALUES (30, '97110-126', 'Rua E', NULL, 'São José', '527', 1);
INSERT INTO public.enderecos VALUES (31, '03534-090', 'Rua Padre José Blasco', NULL, 'Vila Talarico', '887', 34);
INSERT INTO public.enderecos VALUES (32, '69312-218', 'Avenida General Ataíde Teive', NULL, 'Caimbé', '849', 36);
INSERT INTO public.enderecos VALUES (33, '49037-509', 'Rua Seis', NULL, 'Aeroporto', '695', 7);
INSERT INTO public.enderecos VALUES (34, '74946-585', 'Rua Gameleira', NULL, 'Residencial Por do Sol', '914', 3);
INSERT INTO public.enderecos VALUES (35, '64058-640', 'Rua Lago da Pedra', NULL, 'Santa Lia', '398', 32);
INSERT INTO public.enderecos VALUES (36, '53060-270', 'Rua Alexandria', NULL, 'Jardim Atlântico', '859', 24);
INSERT INTO public.enderecos VALUES (37, '58059-620', 'Rua Agricultor Domingos Nunes Pereira', NULL, 'Mangabeira', '639', 17);
INSERT INTO public.enderecos VALUES (38, '54130-300', 'Rua Safira', NULL, 'Manassu', '376', 45);
INSERT INTO public.enderecos VALUES (39, '67130-460', 'Travessa WE-18', NULL, 'Cidade Nova', '828', 23);
INSERT INTO public.enderecos VALUES (40, '78110-798', 'Rua Acre', NULL, '23 de Setembro', '716', 20);
INSERT INTO public.enderecos VALUES (41, '29700-752', 'Rua Três', NULL, 'Santa Margarida', '676', 26);
INSERT INTO public.enderecos VALUES (42, '76875-544', 'Rua Caucho', NULL, 'Polo Moveleiro de Ariquemes', '597', 39);
INSERT INTO public.enderecos VALUES (43, '91330-001', 'Avenida Doutor Nilo Peçanha', NULL, 'Chácara das Pedras', '546', 37);
INSERT INTO public.enderecos VALUES (44, '60810-180', 'Rua Atilano de Moura', NULL, 'Patriolino Ribeiro', '466', 50);
INSERT INTO public.enderecos VALUES (45, '28920-017', 'Rua Lourival Franco de Oliveira', NULL, 'Jardim Esperança', '178', 49);
INSERT INTO public.enderecos VALUES (46, '76965-652', 'Rua Rio Negro', NULL, 'Teixeirão', '817', 4);
INSERT INTO public.enderecos VALUES (47, '57084-450', 'Rua Presbítero Manoel Moacir Tenório Mascarenhas', NULL, 'Benedito Bentes', '183', 24);
INSERT INTO public.enderecos VALUES (48, '87117-070', 'Rua Governador Ney Braga', NULL, 'Residencial Governador Jose Richa', '308', 45);
INSERT INTO public.enderecos VALUES (49, '65916-150', 'Rua General Gurjão', NULL, 'Bacuri', '594', 36);
INSERT INTO public.enderecos VALUES (50, '29194-168', 'Rua 15 de Novembro', NULL, 'Vila Rica', '970', 25);


--
-- TOC entry 3428 (class 0 OID 18030)
-- Dependencies: 218
-- Data for Name: nota_fiscal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nota_fiscal VALUES (1, 286.30, '2065-02-05', '81504', 2);
INSERT INTO public.nota_fiscal VALUES (2, 224.04, '1986-02-01', '955383', 49);
INSERT INTO public.nota_fiscal VALUES (3, 158.24, '2049-12-04', '491240', 43);
INSERT INTO public.nota_fiscal VALUES (4, 266.80, '2034-02-06', '858878', 18);
INSERT INTO public.nota_fiscal VALUES (5, 253.64, '2019-03-12', '443516', 37);
INSERT INTO public.nota_fiscal VALUES (6, 127.41, '2042-12-01', '932979', 43);
INSERT INTO public.nota_fiscal VALUES (7, 136.23, '2055-04-03', '267759', 10);
INSERT INTO public.nota_fiscal VALUES (8, 189.07, '1982-04-09', '141879', 26);
INSERT INTO public.nota_fiscal VALUES (9, 245.15, '1994-06-12', '699805', 21);
INSERT INTO public.nota_fiscal VALUES (10, 137.87, '2004-05-08', '303694', 40);
INSERT INTO public.nota_fiscal VALUES (11, 262.60, '2002-05-01', '858371', 41);
INSERT INTO public.nota_fiscal VALUES (12, 52.21, '2047-01-06', '434376', 21);
INSERT INTO public.nota_fiscal VALUES (13, 160.96, '2012-01-04', '947947', 29);
INSERT INTO public.nota_fiscal VALUES (14, 121.57, '2057-10-10', '121410', 35);
INSERT INTO public.nota_fiscal VALUES (15, 64.97, '1962-07-02', '718365', 43);
INSERT INTO public.nota_fiscal VALUES (16, 122.39, '2056-12-03', '477873', 14);
INSERT INTO public.nota_fiscal VALUES (17, 144.76, '2002-08-03', '637403', 45);
INSERT INTO public.nota_fiscal VALUES (18, 56.29, '2057-11-11', '982351', 47);
INSERT INTO public.nota_fiscal VALUES (19, 105.66, '2024-07-02', '828894', 23);
INSERT INTO public.nota_fiscal VALUES (20, 120.88, '2067-02-04', '270327', 39);
INSERT INTO public.nota_fiscal VALUES (21, 144.44, '2020-01-02', '791418', 43);
INSERT INTO public.nota_fiscal VALUES (22, 131.39, '2030-10-11', '333402', 47);
INSERT INTO public.nota_fiscal VALUES (23, 198.14, '2049-02-04', '777734', 24);
INSERT INTO public.nota_fiscal VALUES (24, 124.82, '2069-02-12', '235789', 16);
INSERT INTO public.nota_fiscal VALUES (25, 177.42, '2024-05-02', '865348', 4);


--
-- TOC entry 3434 (class 0 OID 18061)
-- Dependencies: 224
-- Data for Name: nota_fiscal_roupas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nota_fiscal_roupas VALUES (1, 2, 300.00, 1, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (2, 1, 45.20, 9, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (3, 2, 90.20, 1, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (4, 4, 190.00, 6, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (5, 1, 30.10, 2, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (6, 3, 50.40, 7, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (7, 1, 90.50, 4, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (8, 1, 69.65, 5, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (9, 1, 79.95, 7, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (10, 5, 83.81, 22, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (11, 3, 84.52, 3, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (12, 1, 68.49, 22, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (13, 1, 102.36, 9, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (14, 3, 73.50, 12, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (15, 2, 57.11, 2, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (16, 5, 107.05, 4, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (17, 3, 25.74, 3, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (18, 2, 17.94, 9, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (19, 3, 26.51, 12, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (20, 2, 27.66, 25, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (21, 4, 24.97, 24, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (22, 4, 20.33, 20, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (23, 4, 69.86, 20, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (24, 3, 35.75, 5, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (25, 1, 55.26, 9, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (26, 4, 15.83, 2, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (27, 4, 37.69, 2, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (28, 3, 4.37, 12, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (29, 1, 100.96, 8, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (30, 2, 55.33, 18, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (31, 5, 112.28, 18, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (32, 5, 19.30, 20, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (33, 5, 38.70, 11, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (34, 2, 30.67, 3, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (35, 1, 97.74, 15, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (36, 1, 32.76, 15, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (37, 5, 67.38, 11, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (38, 2, 65.81, 23, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (39, 1, 61.64, 3, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (40, 4, 79.72, 10, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (41, 2, 91.97, 13, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (42, 1, 96.99, 6, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (43, 3, 26.81, 5, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (44, 5, 63.34, 12, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (45, 3, 26.44, 5, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (46, 2, 50.35, 12, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (47, 5, 106.88, 10, 2);
INSERT INTO public.nota_fiscal_roupas VALUES (48, 3, 41.44, 12, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (49, 4, 43.73, 18, 1);
INSERT INTO public.nota_fiscal_roupas VALUES (50, 1, 18.79, 22, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (51, 3, 84.08, 24, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (52, 1, 99.35, 2, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (53, 2, 25.29, 12, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (54, 5, 93.70, 2, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (55, 2, 95.44, 20, 3);
INSERT INTO public.nota_fiscal_roupas VALUES (56, 3, 108.48, 18, 4);
INSERT INTO public.nota_fiscal_roupas VALUES (57, 5, 22.19, 11, 1);


--
-- TOC entry 3432 (class 0 OID 18049)
-- Dependencies: 222
-- Data for Name: roupas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roupas VALUES (1, 'Camiseta Masculina', 'Preto', 'G', 'Nike', 130.00, 90.00, 2);
INSERT INTO public.roupas VALUES (2, 'Tenis A', 'Vermelho', '42', 'Nike', 180.00, 120.00, 3);
INSERT INTO public.roupas VALUES (3, 'Camisa V', 'Azul', 'M', 'Gutti', 200.00, 150.00, 1);
INSERT INTO public.roupas VALUES (4, 'Meia E', 'Preto', '43', 'Nike', 40.00, 25.00, 6);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 215
-- Name: cartao_loja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartao_loja_id_seq', 10, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 6, true);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 209
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cidades_id_seq', 50, true);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 213
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 60, true);


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 211
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 50, true);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 217
-- Name: nota_fiscal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nota_fiscal_id_seq', 25, true);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 223
-- Name: nota_fiscal_roupas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nota_fiscal_roupas_id_seq', 57, true);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 221
-- Name: roupas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roupas_id_seq', 4, true);


--
-- TOC entry 3264 (class 2606 OID 18023)
-- Name: cartao_loja cartao_loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_loja
    ADD CONSTRAINT cartao_loja_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 18047)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 17985)
-- Name: cidades cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 18009)
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 3260 (class 2606 OID 18011)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 3262 (class 2606 OID 18007)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 17994)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 18035)
-- Name: nota_fiscal nota_fiscal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT nota_fiscal_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 18066)
-- Name: nota_fiscal_roupas nota_fiscal_roupas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_roupas
    ADD CONSTRAINT nota_fiscal_roupas_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 18054)
-- Name: roupas roupas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roupas
    ADD CONSTRAINT roupas_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 18055)
-- Name: roupas fk_id_categoria_to_roupas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roupas
    ADD CONSTRAINT fk_id_categoria_to_roupas FOREIGN KEY (id_categoria) REFERENCES public.categorias(id);


--
-- TOC entry 3273 (class 2606 OID 17995)
-- Name: enderecos fk_id_cidade_to_enderecos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT fk_id_cidade_to_enderecos FOREIGN KEY (id_cidade) REFERENCES public.cidades(id);


--
-- TOC entry 3275 (class 2606 OID 18024)
-- Name: cartao_loja fk_id_cliente_to_cartao_loja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_loja
    ADD CONSTRAINT fk_id_cliente_to_cartao_loja FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3276 (class 2606 OID 18036)
-- Name: nota_fiscal fk_id_cliente_to_nota_fiscal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT fk_id_cliente_to_nota_fiscal FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3274 (class 2606 OID 18012)
-- Name: clientes fk_id_endereco_to_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_id_endereco_to_clientes FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id);


--
-- TOC entry 3278 (class 2606 OID 18067)
-- Name: nota_fiscal_roupas fk_id_nota_fiscal_to_nota_fiscal_roupas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_roupas
    ADD CONSTRAINT fk_id_nota_fiscal_to_nota_fiscal_roupas FOREIGN KEY (id_nota_fiscal) REFERENCES public.nota_fiscal(id);


--
-- TOC entry 3279 (class 2606 OID 18072)
-- Name: nota_fiscal_roupas fk_id_roupa_to_nota_fiscal_roupas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_roupas
    ADD CONSTRAINT fk_id_roupa_to_nota_fiscal_roupas FOREIGN KEY (id_roupa) REFERENCES public.roupas(id);


-- Completed on 2022-06-30 14:24:20 -03

--
-- PostgreSQL database dump complete
--

