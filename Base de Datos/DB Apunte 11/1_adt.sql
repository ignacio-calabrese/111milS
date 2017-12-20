CREATE TABLE  a.persona (
	dni         integer,
    nombre      text
);

CREATE OR REPLACE FUNCTION a.trg_alta_persona()
RETURNS TRIGGER AS $$
BEGIN
	RAISE NOTICE 'agregamos a %, cuyo dni es %', NEW.nombre, NEW.dni;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_alta_persona AFTER INSERT ON a.persona FOR EACH ROW EXECUTE PROCEDURE a.trg_alta_persona();


CREATE OR REPLACE FUNCTION a.trg_baja_persona()
RETURNS TRIGGER AS $$
BEGIN
	raise notice 'eliminamos a %, cuyo dni era %', OLD.nombre, OLD.dni;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_baja_persona AFTER DELETE ON a.persona FOR EACH ROW EXECUTE PROCEDURE a.trg_baja_persona();


CREATE OR REPLACE FUNCTION a.trg_modificacion_persona()
RETURNS TRIGGER AS $$
BEGIN 
	IF NEW.nombre != OLD.nombre
	THEN 
		RAISE NOTICE 'se cambió el nombre: % por %', OLD.nombre, NEW.nombre;
	END IF;
	
	IF NEW.dni != OLD.dni
	THEN 
		RAISE NOTICE 'se cambió el dni: % por %', OLD.dni, NEW.dni;
	END IF;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_modificacion_persona AFTER UPDATE ON a.persona FOR EACH ROW EXECUTE PROCEDURE a.trg_modificacion_persona();

