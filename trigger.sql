



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
