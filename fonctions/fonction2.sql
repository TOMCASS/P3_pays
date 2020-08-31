



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