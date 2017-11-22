CREATE VIEW vw_region_report AS
	SELECT
		concat(b.seller_surname,' ', b.seller_name) "Vendedor",
		c.region_name "Región",
		count(a.property_id) "Total de Propiedades",
		round(avg(a.price::numeric)) "Precio Promedio"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN region c
	GROUP BY 1, 2
	ORDER BY 1 ASC, 3 DESC;
	
SELECT * FROM vw_region_report; 
