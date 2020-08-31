



CREATE OR replace FUNCTION get_pays (pays TEXT) 
RETURNS TABLE (country TEXT,pop INT, density INT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country,table_country.pop,table_country.density FROM table_country WHERE table_country.country = pays;
END;
$$;
