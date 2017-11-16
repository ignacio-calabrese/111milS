SELECT 
	max(a.price) 
FROM 
	property a 
	NATURAL INNER JOIN seller b 
WHERE 
	b.seller_name = 'Pedro' 
	AND b.seller_surname = 'Iriarte';
