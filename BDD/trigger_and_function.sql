CREATE FUNCTION check_email_exists() 
RETURNS trigger 
LANGUAGE plpgsql
AS $$
BEGIN 
  IF EXISTS(SELECT 1 FROM users WHERE email = NEW.email) THEN 
    RAISE EXCEPTION 'Cet email est déjà utilisé.';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER check_email_trigger 
BEFORE INSERT ON users 
FOR EACH ROW 
EXECUTE FUNCTION check_email_exists();
