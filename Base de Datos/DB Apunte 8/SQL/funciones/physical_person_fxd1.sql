CREATE OR REPLACE FUNCTION customer.add_physical_person (
    IN p_cuil   text,
    IN p_iibb   text,
    IN p_dni    text,
    IN p_surname    text,
    IN p_name    text,
    IN p_birthday   timestamptz
) RETURNS void AS $$
BEGIN
    INSERT INTO customer.person(cuil, ibb) VALUES
        (p_cuil, p_iibb);
    
    INSERT INTO customer.physical_person(dni, surname, name, birthday, cuil) VALUES
        (p_dni, p_surname, p_name, p_birthday, p_cuil);
END;
$$ LANGUAGE plpgsql
SET search_path FROM CURRENT;
    

