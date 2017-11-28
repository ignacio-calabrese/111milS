SELECT
	name,
	cuit
FROM 
	provider.provider
EXCEPT
SELECT 
	concat(name,' ',surname) "Nombre",
	cuit "CUIT"
FROM 
    customer.customer;
