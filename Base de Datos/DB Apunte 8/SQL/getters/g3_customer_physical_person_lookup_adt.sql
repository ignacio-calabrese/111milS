CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_surname        text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE surname = p_surname;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;
