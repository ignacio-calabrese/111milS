CREATE TABLE b.person (
	dni    text PRIMARY KEY,
	name   text NOT NULL,
	surname    text NOT NULL,
	birthday   date
);

CREATE TABLE b.log (
	id	serial PRIMARY KEY,
	timestamptz	timestamptz DEFAULT now(),
	detail	text
);

CREATE OR REPLACE FUNCTION b.trg_alta_persona()
RETURNS TRIGGER AS $$
BEGIN
	RAISE NOTICE 'Se agregò el dni % de nombre %, apellido % y cumpleaños %', NEW.dni, NEW.name, NEW.surname, NEW.birthday;
    INSERT INTO b.log(detail) VALUES(concat('Se agregò el dni ' ,NEW.dni, ' de nombre ' ,NEW.name, ' apellido ' ,NEW.surname,' y cumpleaños ' ,NEW.birthday));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_alta_persona AFTER INSERT ON b.person FOR EACH ROW EXECUTE PROCEDURE b.trg_alta_persona();


CREATE OR REPLACE FUNCTION b.trg_baja_persona()
RETURNS TRIGGER AS $$
BEGIN
	RAISE NOTICE 'Se eliminò el dni % de nombre %, apellido % y cumpleaños %', OLD.dni, OLD.name, OLD.surname, OLD.birthday;
	INSERT INTO b.log(detail) VALUES(concat('Se eliminò el dni ' ,OLD.dni, ' de nombre ' ,OLD.name, ' apellido ' ,OLD.surname,' y cumpleaños ' ,OLD.birthday));
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_baja_persona AFTER DELETE ON b.person FOR EACH ROW EXECUTE PROCEDURE b.trg_baja_persona();


CREATE OR REPLACE FUNCTION b.trg_modificacion_persona()
RETURNS TRIGGER AS $$
BEGIN 
	IF NEW.name != OLD.name
	THEN 
		INSERT INTO b.log(detail) VALUES(concat('se cambió el nombre: ' ,OLD.name, ' por ' ,NEW.name));
		RAISE NOTICE 'se cambió el nombre: % por %', OLD.name, NEW.name;
	END IF;
	
	IF NEW.surname != OLD.surname
	THEN 
		INSERT INTO b.log(detail) VALUES(concat('se cambió el apellido: ' ,OLD.surname, ' por ' ,NEW.surname));
		RAISE NOTICE 'se cambió el apellido: % por %', OLD.surname, NEW.surname;
	END IF;

	IF NEW.birthday != OLD.birthday
	THEN 
		INSERT INTO b.log(detail) VALUES(concat('se cambió el cumpleaños: ' ,OLD.birthday, ' por ' ,NEW.birthday));
		RAISE NOTICE 'se cambió el cumpleaños: % por %', OLD.birthday, NEW.birthday;
	END IF;
	
	IF NEW.dni != OLD.dni
	THEN 
		INSERT INTO b.log(detail) VALUES(concat('se cambió el dni: ' ,OLD.dni, ' por ' ,NEW.dni));
		RAISE NOTICE 'se cambió el dni: % por %', OLD.dni, NEW.dni;
	END IF;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_modificacion_persona AFTER UPDATE ON b.person FOR EACH ROW EXECUTE PROCEDURE b.trg_modificacion_persona();
