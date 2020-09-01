



CREATE OR replace PROCEDURE insert_data(pays TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO table_country(country,pop,density) VALUES (pays, random() * 10000, random() * 10000);
END;
$$;

