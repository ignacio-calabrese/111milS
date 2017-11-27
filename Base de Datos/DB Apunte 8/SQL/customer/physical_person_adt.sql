CREATE TABLE customer.physical_person(
	dni	integer UNIQUE NOT NULL,
	surname	text NOT NULL,
	name	text NOT NULL,
	birthday	timestamptz NOT NULL,
	cuil	integer PRIMARY KEY REFERENCES customer.person(cuil) NOT NULL	
);

