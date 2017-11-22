CREATE VIEW vw_selling_report AS
	SELECT
		a.property_id "ID Propiedad",
		c.property_type_name "Tipo de Propiedad",
		a.price "Precio",
		a.creation_timestamp "Fecha de Ingreso",
		a.selling_timestamp "Fecha de Venta",
		concat(b.seller_surname,' ',b.seller_name) "Vendedor",
		date_part('day', a.selling_timestamp - a.creation_timestamp) "Período de Venta en Días"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN property_type c
	WHERE
		operation ='Venta'
	ORDER BY 7 DESC;

SELECT  
	"Tipo de Propiedad",
	round(avg("Período de Venta en Días"))
FROM
	vw_selling_report
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1; 
