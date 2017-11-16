SELECT 
	b.seller_name,
	b.seller_surname, 
	b.seller_dni, 
	c.region_name,
	count(b.seller_dni) AS cantidad_ventas 
FROM 
	property a 
	INNER JOIN seller b  
ON
	a.seller_dni = b.seller_dni  
	INNER JOIN region c
ON
	a.region_id = c.region_id   	
WHERE 
	operation = 'Venta'
	AND region_name= 'Barcelona'
GROUP BY 1,2,3,4
ORDER BY count(b.seller_dni) DESC
LIMIT 1; 

