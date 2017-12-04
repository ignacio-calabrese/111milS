CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_cuit (
	IN p_cuit           text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE cuit = p_cuit;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;
