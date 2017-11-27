CREATE TABLE accounting.movement(
	movement_id	integer PRIMARY KEY,
	movement_timestamp	timestamptz DEFAULT now(),
	movement_description	text,
	account_id	integer REFERENCES accounting.account(account_id) NOT NULL,
	quantity	double precision CHECK(quantity != 0) NOT NULL
);	

