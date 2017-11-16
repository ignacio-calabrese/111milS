SELECT 
	a.property_id,
	a.operation,
	c.region_name,
	max(a.price) AS mas_cara 
FROM 
	property a   
	INNER JOIN region c
ON
	a.region_id = c.region_id   	
WHERE 
	operation = 'Venta'
	AND region_name= 'Lleida'
GROUP BY 1,2,3
ORDER BY max(a.price) DESC
LIMIT 1; 

