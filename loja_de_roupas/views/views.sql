drop view if exists vw_produtos_vendidos;
create or replace view vw_produtos_vendidos as
select 
    r.nome produto, 
    c.nome as categoria, 
    count(nfr.id) as quantidade
from nota_fiscal_roupas as nfr
inner join roupas as r on (nfr.id_roupa = r.id)
inner join categorias as c on (r.id_categoria = c.id)
group by r.nome, c.nome, r.preco_venda;

select * from vw_produtos_vendidos;
----------------------------------------------------------------------------
drop view if exists vw_produtos_vendidos_lucro;
create or replace view vw_produtos_vendidos_lucro as 
select 
    r.nome, 
    ((r.preco_venda - r.preco_compra) * count(nfr.id)) as lucro 
from roupas as r
inner join nota_fiscal_roupas as nfr on (r.id = nfr.id_roupa)
group by r.nome, r.preco_venda, r.preco_compra;

select * from vw_produtos_vendidos_lucro;
----------------------------------------------------------------------------
drop view if exists vw_enderecos_clientes;
create or replace view vw_enderecos_clientes as
select 
    c.nome, 
    e.endereco, 
    e.bairro, 
    e.numero, 
    e.cep,
    cd.nome as cidade
from enderecos as e
inner join clientes as c on (e.id = c.id_endereco)
inner join cidades as cd on (e.id_cidade = cd.id)
order by c.nome;

select * from vw_enderecos_clientes;
------------------------------------------------------------------------------
drop view if exists vw_clientes_cartoes;
create or replace view vw_clientes_cartoes as
select 
    c.nome, 
    cl.nome_titular as nome_cartao, 
    cl.numero, cl.cvv, 
    cl.vencimento 
from clientes as c
inner join cartao_loja as cl on (c.id = cl.id_cliente)

select * from vw_clientes_cartoes;
--------------------------------------------------------------------------------
drop view if exists vw_notas_fiscais;
create view vw_notas_fiscais as
select 
    nf.valor, 
    nf.emissao, 
    nf.numero, 
    c.nome 
from nota_fiscal as nf
inner join clientes as c on (nf.id_cliente = c.id)
order by nf.emissao;

select * from vw_notas_fiscais;
--------------------------------------------------------------------------------
drop view if exists vw_aniversariantes;
create view vw_aniversariantes as
select 
    c.nome, 
    c.nascimento from clientes as c
where 
EXTRACT(day from c.nascimento + 8) = EXTRACT(day from now()) and
EXTRACT(month from c.nascimento) = EXTRACT(month from now());

select * from vw_aniversariantes;
--------------------------------------------------------------------------------
drop view if exists vw_listar_roupas;
create or replace view vw_listar_roupas as
select 
    r.id, 
    r.nome,
    r.cor, 
    r.tamanho, 
    r.marca, 
    c.nome as categoria
from roupas as r
inner join categorias as c on (r.id_categoria = c.id)

select * from vw_listar_roupas;
----------------------------------------------------------------------------------

drop view vw_aniversariantes;
drop view vw_clientes_cartoes;
drop view vw_enderecos_clientes;
drop view vw_notas_fiscais;
drop view vw_produtos_vendidos;
drop view vw_produtos_vendidos_lucro;
drop vw_listar_roupas;
