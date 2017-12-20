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
    


