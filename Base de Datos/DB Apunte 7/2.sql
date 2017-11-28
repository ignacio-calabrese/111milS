SELECT 
	concat(name,' ',surname) "Nombre",
	cuit "CUIT"
FROM 
	customer.customer
INTERSECT
SELECT
	name,
	cuit
FROM 
    provider.provider;
