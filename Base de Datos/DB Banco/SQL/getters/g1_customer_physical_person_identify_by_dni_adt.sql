CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_dni (
	IN p_dni            text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE dni = p_dni;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;
