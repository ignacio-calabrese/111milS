CREATE TABLE customer.legal_person(
    cuit	            text PRIMARY KEY REFERENCES customer.person(cuit),
    legal_name	        text NOT NULL,
    fantasy_name	    text,
    constitution_date	timestamptz NOT NULL
);

