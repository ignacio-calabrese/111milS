CREATE TABLE customer.legal_person(
    cuil	            integer PRIMARY KEY REFERENCES customer.person(cuil),
    legal_name	        text NOT NULL,
    fantasy_name	    text NOT NULL,
    constitution_date	timestamptz NOT NULL
);

