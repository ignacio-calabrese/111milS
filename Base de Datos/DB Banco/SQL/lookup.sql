/*Bùsquedas*/

CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_surname        text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE surname = p_surname;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_name           text,
	IN p_surname        text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE (name, surname) = (p_name, p_surname);
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.legal_person_lookup_by_legal_name (
	IN p_legal_name               text
)  RETURNS SETOF customer.legal_person AS
$$
	SELECT * FROM customer.legal_person WHERE legal_name = p_legal_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.legal_person_lookup_by_fantasy_name (
	IN p_fantasy_name             text
)  RETURNS SETOF customer.legal_person AS
$$
	SELECT * FROM customer.legal_person WHERE fantasy_name = p_fantasy_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;
