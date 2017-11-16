CREATE TABLE person (
	dni                 integer PRIMARY KEY,
	name                text NOT NULL,
	surname             text NOT NULL,
	birthday            timestamp with time zone NOT NULL,
	postal_address      text NOT NULL,
	phone_number        text,
	email               text
);

CREATE TABLE course (
	course_id           text PRIMARY KEY,
	course_name         text UNIQUE,
	description         text NOT NULL,
	price               integer CHECK(price > 0) NOT NULL
);

CREATE TABLE student (
	dni                 integer UNIQUE REFERENCES person(dni),
	student_id          text PRIMARY KEY,
	inscription_date    timestamp with time zone NOT NULL,
	course_id           text NOT NULL REFERENCES course(course_id) NOT NULL
);

CREATE TABLE professor (
	dni                 integer UNIQUE REFERENCES person(dni),
	cuil                text PRIMARY KEY,
	signing_in_date     timestamp with time zone NOT NULL,
	course_id           text NOT NULL REFERENCES course(course_id),
	schedule            integer CHECK (schedule > 0) NOT NULL,
	salary              integer CHECK (salary > 0) NOT NULL
);


SELECT 
	b.student_id, 
    a.dni,
	a.name,                
	a.surname,             
	b.course_id,
	c.course_name,
	c.description
FROM 
    person a
	NATURAL INNER JOIN student b
	NATURAL INNER JOIN course c
GROUP BY 1,2,3,4,5,6,7
ORDER BY 1 ASC;

SELECT 	
    b.cuil,
    a.dni,
	a.name,                
	a.surname,             
    b.course_id,
	c.course_name,
	c.description,
	b.schedule
FROM 
    person a
	NATURAL INNER JOIN professor b
	NATURAL INNER JOIN course c
GROUP BY 1,2,3,4,5,6,7,8
ORDER BY 1 ASC;
	
	
	
	
	
	
