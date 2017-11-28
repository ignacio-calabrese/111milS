SELECT 
	concat(name,' ',surname) "Nombre",
	cuit "CUIT",
	address "Dirección"
FROM 
	customer.customer
UNION
SELECT
	name,
	cuit,
	address
FROM 
    provider.provider;
