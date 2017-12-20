CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_name           text,
	IN p_surname        text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE (name, surname) = (p_name, p_surname);
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;
