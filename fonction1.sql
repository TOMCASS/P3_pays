

-- 1. Créer une fonction SQL qui retourne le pays (sous format de TABLE)
-- qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays.


-- nom_fonction	le nom de la fonction
-- list_of_paramenters	paramètres que la fonction accepte
-- return_data_type	tapez cette fonction se répète. Certains types de données SQL
-- function_body	le code de fonction
-- expression scalaire	valeur scalaire renvoyée par la fonction


-- Pour afficher l'integralité de la table :		SELECT * FROM "public"."table_country" LIMIT 300

-- 1ere requete: 

SELECT * FROM "table_country"
    WHERE country = 'China';

-- Mise en fonction:

create or replace function get_pays (pays text) 
returns table (country text,pop int, density int, med_age int)
language plpgsql
as $$
begin
return query 
select * from table_country where table_country.country = pays;
end;
$$;

-- Derrière je fais intervenir ma focntion
select * from get_pays('China')


-- 2. créer une procédure SQL qui insert un nouveau pays avec des données random (on précise uniquement le pays)

-- Explication procédure : La principale différence entre une procédure et une fonction stockée est dans l'utilisation qu'on en fait.
-- Une procédure stockée sera utilisée seule alors qu'une fonction stockée sera utilisée à l'intérieur d'une requête SQL.


CREATE or replace PROCEDURE insert_data(pays TEXT)
LANGUAGE plpgsql
AS $$
begin
INSERT INTO table_country(country,pop,density,med_age) VALUES (pays, random() * 10000, random() * 10000,random() * 10000);
end;
$$;
