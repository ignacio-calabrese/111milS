CREATE TYPE account_type AS ENUM('Caja de Ahorro', 'Cuenta Corriente');
CREATE SCHEMA customer;
CREATE SCHEMA accounting;

CREATE TABLE customer.person(
	cuit	text PRIMARY KEY,
	iibb	text UNIQUE
);

CREATE TABLE customer.contact_information(
	contact_id	serial PRIMARY KEY,
	address		text,	
	phone		text,
	email		text,
	cuit	text REFERENCES customer.person(cuit) ON DELETE CASCADE
);

CREATE TABLE customer.physical_person(
	dni	text UNIQUE NOT NULL,
	surname	text NOT NULL,
	name	text NOT NULL,
	birthday	timestamptz NOT NULL,
	cuit	text PRIMARY KEY REFERENCES customer.person(cuit)	
);

CREATE TABLE customer.legal_person(
    cuit	            text PRIMARY KEY REFERENCES customer.person(cuit),
    legal_name	        text NOT NULL,
    fantasy_name	    text,
    constitution_date	timestamptz NOT NULL
);

CREATE TABLE accounting.account(
	account_id	serial PRIMARY KEY,
	owner_cuit	text REFERENCES customer.person(cuit) NOT NULL,
	opening_date	timestamptz NOT NULL DEFAULT now(),
	account_type	account_type NOT NULL DEFAULT 'Caja de Ahorro',
	authorized_uncovered_balance	double precision DEFAULT 0 CHECK(authorized_uncovered_balance <= 0) NOT NULL,
	balance		double precision DEFAULT 0 CHECK(balance >= authorized_uncovered_balance) NOT NULL
);

CREATE TABLE accounting.movement(
	movement_id	serial PRIMARY KEY,
	movement_timestamp	timestamptz DEFAULT now() NOT NULL,
	movement_description	text NOT NULL,
	account_id	integer REFERENCES accounting.account(account_id) NOT NULL,
	quantity	double precision CHECK(quantity != 0) NOT NULL
);	

