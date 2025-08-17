CREATE TABLE person_audit(
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event char(1) NOT NULL DEFAULT 'I',
    constraint ch_type_event check (type_event IN ('I','U','D')),
    row_id bigint NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $fnc_trg_person_insert_audit$
BEGIN
IF (TG_OP = 'INSERT') 
THEN INSERT INTO person_audit SELECT CURRENT_TIMESTAMP, 'I', NEW.*;
RETURN NEW;
END IF;
RETURN NULL;
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

--SELECT * FROM person_audit;