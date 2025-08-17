CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $fnc_trg_person_audit$
BEGIN
IF (TG_OP = 'DELETE') 
THEN INSERT INTO person_audit SELECT CURRENT_TIMESTAMP, 'D', OLD.*;
ELSIF (TG_OP = 'UPDATE') 
THEN INSERT INTO person_audit SELECT CURRENT_TIMESTAMP, 'U', NEW.*;
ELSIF (TG_OP = 'INSERT') 
THEN INSERT INTO person_audit SELECT CURRENT_TIMESTAMP, 'I', NEW.*;
END IF;
RETURN NULL;
END;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER DELETE OR UPDATE OR INSERT ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

--SELECT * FROM person_audit;