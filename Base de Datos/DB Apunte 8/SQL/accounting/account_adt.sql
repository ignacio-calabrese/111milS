CREATE TABLE accounting.account(
	account_id	serial PRIMARY KEY,
	owner_cuit	text REFERENCES customer.person(cuit) NOT NULL,
	opening_date	timestamptz NOT NULL DEFAULT now(),
	account_type	account_type NOT NULL DEFAULT 'Caja de Ahorro',
	authorized_uncovered_balance	double precision DEFAULT 0 CHECK(authorized_uncovered_balance <= 0) NOT NULL,
	balance		double precision DEFAULT 0 CHECK(balance >= authorized_uncovered_balance) NOT NULL
);

