CREATE TABLE accounting.movement(
	movement_id	serial PRIMARY KEY,
	movement_timestamp	timestamptz DEFAULT now() NOT NULL,
	movement_description	text NOT NULL,
	account_id	integer REFERENCES accounting.account(account_id) NOT NULL,
	quantity	double precision CHECK(quantity != 0) NOT NULL
);	

