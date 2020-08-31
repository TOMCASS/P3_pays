

-- 1. Créer une fonction SQL qui retourne le pays (sous fORmat de TABLE)
-- qui cORrespond au critère passé en paramètre. Ce paramètre est le nom du pays.

-- Pour afficher l'integralité de la table :		

SELECT * FROM "public"."table_country" LIMIT 300

-- 1ere requete: 

SELECT * FROM "table_country"
WHERE country = 'China';

-- Mise en fonction:

CREATE OR replace FUNCTION get_pays (pays TEXT) 
RETURNS TABLE (country TEXT,pop INT, density INT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country,table_country.pop,table_country.density FROM table_country WHERE table_country.country = pays;
END;
$$;

-- Derrière je fais intervenir ma fonction

SELECT * FROM get_pays('China')

--------------------------------------------------------------------------------------------------------------------------

-- 2. créer une procédure SQL qui insert un nouveau pays avec des données random (on précise uniquement le pays)

-- Explication procédure : La principale différence entre une procédure et une fonction stockée est dans l'utilisation qu'on en fait.
-- Une procédure stockée sera utilisée seule alors qu'une fonction stockée sera utilisée à l'intérieur d'une requête SQL.


CREATE OR replace PROCEDURE insert_data(pays TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO table_country(country,pop,density) VALUES (pays, random() * 10000, random() * 10000);
END;
$$;

-- Derrière je fais intervenir ma procèdure

CALL insert_data('cool')

------------------------------------------------------------------------------------------------------------------------------

-- 3. configurer un trigger qui va mettre à jour la colonne de la table correspondant à la date de l'insertion

CREATE OR REPLACE FUNCTION data_upload() RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
NEW.upload := current_timestamp;
RETURN NEW;
END;
$$;


CREATE TRIGGER data_upload BEFORE INSERT OR UPDATE ON table_country      
FOR EACH ROW EXECUTE PROCEDURE data_upload();

--------------------------------------------------------------------------------------------------------------------------------

-- 4. Réaliser une fonction ou procédure stoquée pour retourner les pays qui sont regroupés par 4 tranches 
-- (à definir) de densité de population

-- Pour un pays en particulier 

CREATE OR replace function categories (pays TEXT) 
RETURNS TABLE (country TEXT,density INT, tranche TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country,table_country.density, CASE
WHEN table_country.density > 500 THEN 'tranche4'
WHEN table_country.density > 400 THEN 'tranche3'
WHEN table_country.density > 300 THEN 'tranche2'
ELSE 'tranche1' END AS tranche
FROM table_country WHERE table_country.country = pays;
END;
$$;

-- Derrière je fais intervenir ma fonction avec pour exemple la france

SELECT * FROM categories('France')


-- Pour tout les pays: 

CREATE OR replace FUNCTION categories () 
RETURNS TABLE (country TEXT,density INT, tranche TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country,table_country.density, CASE
WHEN table_country.density > 500 THEN 'tranche4'
WHEN table_country.density > 400 THEN 'tranche3'
WHEN table_country.density > 300 THEN 'tranche2'
ELSE 'tranche1' END AS tranche
FROM table_country;
END;
$$;