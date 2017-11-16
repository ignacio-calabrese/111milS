CREATE TABLE person (
	passport            integer,
	name                text,
	surname             text,
	nationality         text,
	birthday            timestamp with time zone,
	PRIMARY KEY(passport, nationality)
);

INSERT INTO person VALUES
	(2730134, 'Ana', 'Lopez', 'Paraguaya', '1976-10-30'),
	(3245287, 'Joaquìn', 'Morales', 'Argentino', '1988-02-15'),
	(1056700, 'Graciela', 'Perez', 'Colombiana', '1952-01-05'),
	(8438241, 'Gillermo', 'Suarez', 'Chileno', '1951-01-20'),
	(3542167, 'Gean Franco', 'Russo', 'Italiano', '1998-04-05'),
	(3690178, 'Mariela', 'Chavez', 'Venezolana', '2000-08-01'),
	(3478215, 'Paul', 'Smith', 'Inglès', '1992-06-30'),
	(3246783, 'Maximiliano', 'Guerra', 'Argentino', '1975-11-17'),
	(3014854, 'Germàn', 'Dìaz', 'Uruguayo', '1991-04-25'),
	(3561783, 'Alfred', 'Stevenson', 'Estodounidense', '1986-10-24'),
	(2543769, 'Alonso', 'Medina', 'Colombiano', '1999-02-12'),
	(4522371, 'Miriam', 'Fuentes', 'Argentina', '1991-01-10'),
	(2122654, 'Mònica', 'Farro', 'Uruguaya', '1965-05-09'),
	(2903428, 'Romina', 'Chapino', 'Argentina', '1949-10-21'),
	(6537639, 'Andrea', 'Di Palma', 'Italiano', '1956-10-14'),
	(1236793, 'Florencia', 'Ramos', 'Española', '2003-05-07'),
	(3788496, 'Julieta', 'Alvarez', 'Colombiana', '1997-07-11'),
	(5562390, 'Gustavo', 'Ramirez', 'Cubano', '1978-06-27'),
	(2246475, 'Lucas', 'Castelar', 'Argentino', '1969-02-22'),
	(2895641, 'Oriana', 'Duarte', 'Chilena', '2009-07-23');
	
SELECT 
	name,
	surname,
	nationality
FROM 
	person
WHERE 
	nationality != 'Colombiano'
	OR nationality != 'Colombiana'
	AND birthday BETWEEN '1995-01-01' AND '2005-12-31';
