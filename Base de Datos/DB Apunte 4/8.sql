SELECT 
	b.seller_name, 
	b.seller_surname, 
	a.seller_dni, 
	count(property_id) cantidad_ventas 
FROM 
	property a 
	NATURAL INNER JOIN seller b 
WHERE 
	operation = 'Venta'
	AND selling_timestamp IS NOT NULL 
GROUP BY 1,2,3 
ORDER BY 4 ASC 
LIMIT 1; 
