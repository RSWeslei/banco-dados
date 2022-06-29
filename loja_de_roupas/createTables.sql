drop table if exists cartao_loja;
drop table if exists clientes;
drop table if exists enderecos;
drop table if exists cidades;
drop table if exists nota_fiscal_roupas;
drop table if exists nota_fiscal;
drop table if exists roupas;
drop table if exists categorias;

create table cidades(
    id serial primary key,
    nome varchar(60) not null,
    uf char(2) not null
);

create table enderecos(
    id serial primary key,
    cep varchar(10) not null,
    endereco varchar(200) not null,
    complemento varchar(200),
    bairro varchar(100) not null,
    numero varchar(5),
    id_cidade int not null,
    constraint fk_id_cidade_to_enderecos foreign key (id_cidade) references cidades(id) 
);

create table clientes(
    id serial primary key,
    nome varchar(100) not null,
    cpf varchar(16) not null unique,
    email varchar(100) not null unique,
    telefone varchar(15) not null,
    nascimento date not null,
    ativo boolean default false,
    id_endereco int not null,
    constraint fk_id_endereco_to_clientes foreign key (id_endereco) references enderecos(id) 
);


create table cartao_loja(
    id serial primary key,
    nome_titular varchar(100) not null,
    numero varchar(20) not null,
    cvv varchar(3) not null,
    vencimento date not null,
    id_cliente int not null,
    constraint fk_id_cliente_to_cartao_loja foreign key (id_cliente) references clientes(id) 
);

create table nota_fiscal(
    id serial primary key,
    valor numeric(15, 2),
    emissao date not null,
    numero varchar(10) not null,
    id_cliente int not null,
    constraint fk_id_cliente_to_nota_fiscal foreign key (id_cliente) references nota_fiscal(id) 
);

create table categorias(
    id serial primary key,
    nome varchar(50) not null
);

create table roupas(
    id serial primary key,
    nome varchar(50),
    cor varchar(40) not null,
    tamanho varchar(20),
    marca varchar(50),
    preco_venda numeric(15, 2) not null,
    preco_compra numeric(15, 2) not null,
    id_categoria int not null,
    constraint fk_id_categoria_to_roupas foreign key (id_categoria) references roupas(id)
);

create table nota_fiscal_roupas(
    id serial primary key,
    quantidade int not null,
    valor numeric(15, 2) not null,
    id_nota_fiscal int not null,
    id_roupa int not null,
    constraint fk_id_nota_fiscal_to_nota_fiscal_roupas foreign key (id_nota_fiscal) references nota_fiscal(id),
    constraint fk_id_roupa_to_nota_fiscal_roupas foreign key (id_roupa) references roupas(id) 
);