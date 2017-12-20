CREATE TABLE customer.contact_information(
	contact_id	serial PRIMARY KEY,
	address		text,	
	phone		text,
	email		text,
	cuit	text REFERENCES customer.person(cuit) ON DELETE CASCADE
);

