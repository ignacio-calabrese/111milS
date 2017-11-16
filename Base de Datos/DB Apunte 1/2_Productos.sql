CREATE TABLE products (
	code_id            integer PRIMARY KEY,
	category           text,
	name               text,
	description        text,
	masurement_unit    text,
	unitary_price      integer
);

INSERT INTO products VALUES
	(1, 'Almacen', 'Queso crema Casancrem', 'Queso', '300 g', 50),
	(2, 'Almacen', 'Galletitas Criollitas', 'Galletitas', 'Pack 3u 100 g', 26),
	(3, 'Almacen', 'Queso Portsalut La Serenìsima', 'Queso', '1 kg', 170),
	(4, 'Verdulerìa', 'Naranjas', 'Frutas', '1 kg', 20),
	(5, 'Carnicerìa', 'Milanesa de nalga', 'Carne', '1 kg', 120),
	(6, 'Almacen', 'Paleta Paladini', 'Fiambre', '200 g', 45),
	(7, 'Almacen', 'Yogur frutado Ser', 'Yogur', '175 g', 30),
	(8, 'Almacen', 'Agua saborizada sin gas Aquarius', 'Bebida', '2,25 L', 38),
	(9, 'Almacen', 'Jugo natural Cepita', 'Bebida', '300 cc', 17),
	(10, 'Almacen', 'Cafe Cabrales', 'Cafe', '250 g', 48),
	(11, 'Almacen', 'Yerba mate Uniòn', 'Yerba', '1 Kg', 65),
	(12, 'Almacen', 'Tè en saquitos Taraguì', 'Tè', '50u', 30),
	(13, 'Almacen', 'Tallarines Knorr', 'Pastas', '500 g', 20),
	(14, 'Perfumeria', 'Shampù Pantene', 'Shampù', '400 cc', 92),
	(15, 'Limpieza', 'Limpiador Procenex', 'Limpiador', '900 cc', 30),
	(16, 'Almacen', 'Arroz Luccetti', 'Arroz', '1 Kg', 30),
	(17, 'Almacen', 'Purè de tomate Arcor', 'Purè de tomate', '520 g', 20),
	(18, 'Limpieza', 'Jabòn en polvo Ala', 'Jabòn en polvo', '1,5 Kg', 90),
	(19, 'Perfumeria', 'Acondicionador Pantene', 'Acondicionador', '400 cc', 92),
	(20, 'Almacen', 'Tapa Pascualina Mendìa', 'Tapa Pascualina', '2u', 22);
	
SELECT 
	*
FROM 
	products
WHERE 
	category = 'Almacen'
	AND unitary_price < 100;
