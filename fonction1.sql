

-- Créer une fonction SQL qui retourne le pays (sous format de TABLE)
-- qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays.


-- nom_fonction	le nom de la fonction
-- list_of_paramenters	paramètres que la fonction accepte
-- return_data_type	tapez cette fonction se répète. Certains types de données SQL
-- function_body	le code de fonction
-- expression scalaire	valeur scalaire renvoyée par la fonction


-- 1ere requete: 

SELECT * FROM "table_country"
    WHERE country = 'China';

-- Mise en fonction:

create or replace function get_pays (pays text) 
returns table (country text,pop int, density int, med_age text)
language plpgsql
as $$
begin
return query 
select * from table_country where table_country.country = pays;
end;
$$;


