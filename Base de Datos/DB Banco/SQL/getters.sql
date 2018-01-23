/*Getters*/

CREATE OR REPLACE FUNCTION customer.legal_person_get_cuit (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION customer.legal_person_get_legal_name (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.legal_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION customer.legal_person_get_fantasy_name (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.fantasy_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION customer.legal_person_get_constitution_date (
	IN p_legal_person             customer.legal_person
) RETURNS timestamp with time zone AS 
$$
	SELECT p_legal_person.constitution_date;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION customer.legal_person_get_iibb (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT iibb FROM customer.person WHERE cuit = p_legal_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION customer.physical_person_get_dni (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.dni;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_surname (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.surname;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_name (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_birthday (
	IN p_physical_person          customer.physical_person
) RETURNS timestamp with time zone AS
$$
	SELECT p_physical_person.birthday;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_cuit (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_age (
	IN p_physical_person          customer.physical_person
) RETURNS integer AS
$$
	SELECT date_part('years', age(now(), p_physical_person.birthday))::integer;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION customer.physical_person_get_iibb (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT iibb FROM customer.person WHERE cuit = p_physical_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;
