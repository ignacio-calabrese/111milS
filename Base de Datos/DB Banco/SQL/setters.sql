/*Setters*/

CREATE OR REPLACE FUNCTION customer.legal_person_set_fantasy_name (
	IN p_legal_person             customer.legal_person,
	IN p_fantasy_name             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM customer.legal_person a WHERE a = p_legal_person)
	THEN 
		UPDATE customer.legal_person SET fantasy_name = p_fantasy_name
			WHERE cuit = p_legal_person.cuit;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'La persona legal ingresada NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;
