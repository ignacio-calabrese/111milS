SELECT 
	b.seller_name,
	b.seller_surname, 
	b.seller_dni, 
	c.region_name,
	count(c.region_name) AS actividad 
FROM 
	property a 
	INNER JOIN seller b  
ON
	a.seller_dni = b.seller_dni  
	INNER JOIN region c
ON
	a.region_id = c.region_id   	
WHERE 
	seller_surname = 'Estevez'
	AND seller_name = 'Luisa'
GROUP BY 1,2,3,4
ORDER BY count(c.region_name) DESC
LIMIT 1; 
