CREATE OR REPLACE FUNCTION customer.add_physical_person (
    IN p_cuit   text,
    IN p_iibb   text,
    IN p_dni    text,
    IN p_surname    text,
    IN p_name    text,
    IN p_birthday   timestamptz
) RETURNS void AS $$
BEGIN
    INSERT INTO customer.person(cuit, ibb) VALUES
        (p_cuit, p_iibb);
    
    INSERT INTO customer.physical_person(dni, surname, name, birthday, cuit) VALUES
        (p_dni, p_surname, p_name, p_birthday, p_cuit);
END;
$$ LANGUAGE plpgsql
SET search_path FROM CURRENT;
    

CREATE OR REPLACE FUNCTION customer.add_physical_person (
    IN p_cuit   text,
    IN p_iibb   text,
    IN p_dni    text,
    IN p_surname    text,
    IN p_name    text,
    IN p_birthday   timestamptz
) RETURNS void AS $$
DECLARE
    person_checker           integer;
    physical_person_checker  integer;
    
BEGIN
    person_checker := count(1) FROM customer.person WHERE cuit = p_cuit;
    physical_person_checker := count(1) FROM customer.physical_person WHERE dni = p_dni;
    
    IF person_checker = 0 AND physical_person_checker = 0
    THEN
        INSERT INTO customer.person(cuit, ibb) VALUES
            (p_cuit, p_iibb);
    
        INSERT INTO customer.physical_person(dni, surname, name, birthday, cuit) VALUES
            (p_dni, p_surname, p_name, p_birthday, p_cuit);
    ELSE
        RAISE NOTICE 'ERROR Ya existe un registro con ese cuit/dni';
    END IF;
END;
$$ LANGUAGE plpgsql
SET search_path FROM CURRENT;
    


CREATE OR REPLACE FUNCTION customer.person (
    IN p_cuit   text,
    IN p_iibb   text
) RETURNS boolean AS $$   
DECLARE 	
	cuit_count integer;
	iibb_count integer;

BEGIN 
	cuit_count := count(1) FROM customer.person WHERE cuit = p_cuit;
	iibb_count := count(1) FROM customer.person WHERE iibb = p_iibb;
	
	IF cuit_count = 0 AND iibb_count = 0 
	THEN 
		INSERT INTO customer.person VALUES(p_cuit, p_iibb);
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'CUIT O IIBB YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	 END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;
    
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
    
CREATE OR REPLACE FUNCTION customer.physical_person (
	IN p_dni            text,
	IN p_surname        text,
	IN p_name           text,
	IN p_birthday       timestamp with time zone,
	IN p_cuit           text,
	IN p_iibb           text DEFAULT NULL
) RETURNS boolean AS $$
DECLARE 
	dni_count           integer;
	person_ok           boolean;
	
BEGIN 
	dni_count = count(1) FROM customer.physical_person WHERE dni = p_dni;
	
	IF dni_count != 0
	THEN 
		RAISE WARNING 'YA EXISTE UNA PERSONA CON ESE DNI';
		RETURN FALSE;
	END IF;
	
	IF date_part('years', age(now(), p_birthday)) < 18
	THEN 
		RAISE WARNING 'ERROR: LA PERSONA ES MENOR DE EDAD';
		RETURN FALSE;
	END IF;
	
	IF p_iibb IS NOT NULL
	THEN
		person_ok = customer.person(p_cuit, p_iibb);
	ELSE 
		person_ok = customer.person(p_cuit);
	END IF;
	
	IF NOT person_ok 
	THEN
		RAISE WARNING 'ERROR: CUIT O IIBB YA EXISTE';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.physical_person VALUES (
			p_dni,
			p_surname,
			p_name,
			p_birthday,
			p_cuit
		);
		
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;
CREATE OR REPLACE FUNCTION customer.contact_information(
	IN p_cuit		text,
	IN p_address	text DEFAULT NULL,	
	IN p_phone		text DEFAULT NULL,
	IN p_email		text DEFAULT NULL
) RETURNS boolean AS $$
DECLARE 

BEGIN 	
	IF NOT EXISTS (SELECT 1 FROM customer.person WHERE cuit = p_cuit)
	THEN 
		RAISE WARNING 'ERROR: LA PERSONA NO EXISTE';
		RETURN FALSE;
	END IF;
	
	IF p_address IS NULL AND p_phone IS NULL AND p_email IS NULL 
	THEN
		RAISE WARNING 'ERROR: NINGUN DATO SUMINISTRADO';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.contact_information (address, phone, email, cuit)
			VALUES(p_address, p_phone, p_email, p_cuit);
		
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;




CREATE OR REPLACE FUNCTION customer.legal_person ( 
	IN p_cuit                text,
	IN p_legal_name          text,
	IN p_constitution_date   timestamp with time zone,
	IN p_iibb                text,
	IN p_fantasy_name        text DEFAULT NULL
) RETURNS boolean AS $$
BEGIN
	IF EXISTS (SELECT 1 FROM customer.legal_person WHERE cuit = p_cuit)
	THEN 
		RAISE WARNING 'ERROR: YA EXISTE UNA PERSONA LEGAL CON ESE CUIT';
		RETURN FALSE;
	END IF;
	
	IF NOT customer.person(p_cuit, p_iibb)
	THEN 
		RAISE WARNING 'ERROR: YA EXISTE UNA PERSONA CON ESE CUIT';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.legal_person
			VALUES(p_cuit, p_legal_name, p_fantasy_name, p_constitution_date);
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;
CREATE OR REPLACE FUNcTION accounting.account(
	IN p_owner_cuit	text,
	IN p_opening_date	timestamptz,
	IN p_account_type	account_type,
	IN p_authorized_uncovered_balance	double precision,
	IN p_balance		double precision 
)RETURNS boolean AS $$
DECLARE 
	p_owner_cuit	integer;
	
BEGIN 
	p_owner_cuit := count(1) FROM accounting.account WHERE owner_cuit = p_owner_cuit;

	IF p_owner_cuit != 0
	THEN
		INSERT INTO accounting.account (address, phone, email) VALUES (
			p_address,	
			p_phone,
			p_email
		);
		
		RETURN TRUE;
	ELSE	
		RAISE WARNING 'ERROR: ADDRESS YA EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql 
SET search_path FROM CURRENT;


