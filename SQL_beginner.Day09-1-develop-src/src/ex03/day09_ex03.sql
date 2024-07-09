DROP trigger trg_person_delete_audit on person;
DROP trigger trg_person_update_audit on person;
DROP trigger trg_person_insert_audit on person;
drop function fnc_trg_person_delete_audit();
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_insert_audit();
truncate person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit( )
RETURNS TRIGGER AS
$BODY$
BEGIN
IF (TG_OP = 'INSERT') THEN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
ELSEIF (TG_OP = 'UPDATE') THEN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.addre
ss);
ELSE
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.addre
ss);
END IF;
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;
CREATE TRIGGER trg_person_audit
AFTER DELETE OR UPDATE OR INSERT ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit( );