CREATE VIEW vw_property AS
	SELECT 
		a.property_id "ID Propiedad", 
		a.price "Precio",
		concat(b.seller_surname,' ',b.seller_name) "Vendedor", 
		c.region_name "Región"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN region c
	ORDER BY 2 ASC;
	
SELECT * FROM vw_property; 
