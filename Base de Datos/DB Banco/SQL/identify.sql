/*Identificadores*/

CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_dni (
	IN p_dni            text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE dni = p_dni;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_cuit (
	IN p_cuit           text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE cuit = p_cuit;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.legal_person_identify_by_cuit (
	IN p_cuit                     text
) RETURNS customer.legal_person AS 
$$
	SELECT * FROM customer.legal_person WHERE cuit = p_cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.legal_person_identify_by_iibb (
	IN p_iibb                     text
) RETURNS customer.legal_person AS
$$
	SELECT a.* FROM customer.legal_person a NATURAL INNER JOIN customer.person b
		WHERE b.iibb = p_iibb;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;
