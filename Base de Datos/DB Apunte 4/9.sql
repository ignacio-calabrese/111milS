SELECT 
	b.seller_name,
	b.seller_surname, 
	b.seller_dni, 
	sum(price) AS cantidad_vendida 
FROM 
	property a 
	INNER JOIN seller b 
ON
	a.seller_dni = b.seller_dni
WHERE 
	operation = 'Venta'
	AND selling_timestamp IS NOT NULL 
GROUP BY b.seller_dni
ORDER BY sum(price) DESC
LIMIT 1; 
