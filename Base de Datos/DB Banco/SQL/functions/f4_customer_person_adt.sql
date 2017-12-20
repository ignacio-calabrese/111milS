CREATE OR REPLACE FUNCTION customer.person (
    IN p_cuit   text
) RETURNS boolean AS $$   
DECLARE 	
	cuit_count integer;
	
BEGIN 
	cuit_count := count(1) FROM customer.person WHERE cuit = p_cuit;
	
	IF cuit.count = 0 
	THEN 
		INSERT INTO customer.person(cuit) VALUES(p_cuit);
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'CUIT YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	 END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;
    
