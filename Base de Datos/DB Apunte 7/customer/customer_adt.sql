CREATE TABLE customer.customer (
	surname             text NOT NULL,
	name                text NOT NULL,
	cuit                text PRIMARY KEY,
	address             text NOT NULL
);

INSERT INTO customer.customer VALUES
	('Perez', 'Juan', '20-23444555-2', 'Salta 123'),
	('Garcia', 'Pedro', '20-25666777-2', 'San Martín 342'),
	('Vazquez', 'Ramon', '20-20222333-4', 'Junín 5643'),
    ('Rebolledo', 'Jaime', '22-18456282-1', 'Moreno 2464');
    
