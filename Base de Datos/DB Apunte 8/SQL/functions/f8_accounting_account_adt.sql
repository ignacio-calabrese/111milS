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


