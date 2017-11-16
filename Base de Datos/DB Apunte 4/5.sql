SELECT 
	sum(price) 
FROM 
	property 
WHERE 
	operation = 'Venta' 
	AND selling_timestamp IS NULL;