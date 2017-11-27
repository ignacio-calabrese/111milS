CREATE TYPE account_type AS ENUM('Caja de Ahorro', 'Cuenta Corriente');
CREATE SCHEMA customer;
CREATE SCHEMA accounting;

CREATE TABLE customer.person(
	cuil	integer PRIMARY KEY,
	iibbn	text
);

CREATE TABLE customer.contact_information(
	contact_id	serial PRIMARY KEY,
	adress		text,	
	prone		text,
	email		text,
	cuil	integer REFERENCES customer.person(cuil)
);

CREATE TABLE customer.physical_person(
	dni	integer UNIQUE NOT NULL,
	surname	text NOT NULL,
	name	text NOT NULL,
	birthday	timestamptz NOT NULL,
	cuil	integer PRIMARY KEY REFERENCES customer.person(cuil) NOT NULL	
);

CREATE TABLE customer.legal_person(
    cuil	            integer PRIMARY KEY REFERENCES customer.person(cuil),
    legal_name	        text NOT NULL,
    fantasy_name	    text NOT NULL,
    constitution_date	timestamptz NOT NULL
);

CREATE TABLE accounting.account(
	account_id	serial PRIMARY KEY,
	owner_cuil	integer REFERENCES customer.person(cuil) NOT NULL,
	opening_date	timestamptz NOT NULL DEFAULT now(),
	account_type	account_type NOT NULL DEFAULT 'Caja de Ahorro',
	authorized_uncovered_balance	double precision DEFAULT 0 CHECK(authorized_uncovered_balance <= 0) NOT NULL,
	balance		double precision DEFAULT 0 CHECK(balance >= authorized_uncovered_balance) NOT NULL
);

CREATE TABLE accounting.movement(
	movement_id	integer PRIMARY KEY,
	movement_timestamp	timestamptz DEFAULT now(),
	movement_description	text,
	account_id	integer REFERENCES accounting.account(account_id) NOT NULL,
	quantity	double precision CHECK(quantity != 0) NOT NULL
);	

