CREATE TABLE provider.provider (
	name                text NOT NULL,
	cuit                text PRIMARY KEY,
	iibb                text UNIQUE,
	address             text NOT NULL
);

INSERT INTO provider.provider VALUES
	('Juan Perez', '20-23444555-2', '34222123', 'Salta 123'),
	('Ramon Vazquez', '20-20222333-4', '12342178', 'San Martín 342'),
	('Gabriel Fuentes', '22-33444555-2', '45222333', 'Buenos Aires 1324'),
	('Dario Mosquera', '22-34323456-3', '892235678', 'Rivadavia 1333');
	

