CREATE TABLE customer.contact_information(
	contact_id	serial PRIMARY KEY,
	adress		text,	
	prone		text,
	email		text,
	cuil	integer REFERENCES customer.person(cuil)
);

