-- atualizar o rental_duration de todos os filmes para 10 
-- para os filmes da categoria 'Comedy'
update film set
    rental_duration = 10
where film_id in (
    select f.film_id from film as f
    inner join film_category as fc on (f.film_id = fc.film_id)
    inner join category as c on (fc.category_id = c.category_id)
    where c.name = 'Comedy'
)

-- atualizar nome da cidade para 'JAVASCRIPTLANDIA' 
-- a cidade com código 180;
update city set
    city ='JAVASCRIPTLANDIA'
where city_id = 180;

-- atualizar o nome do idioma para 'Portugues Brasileiro' no lugar de 'Mandarin'
update language set
    name = 'Portugues Brasileiro'
where name = 'Mandarin';