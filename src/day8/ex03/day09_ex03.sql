drop trigger trg_person_delete_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_insert_audit on person;

drop function fnc_trg_person_delete_audit() cascade;
drop function fnc_trg_person_update_audit() cascade;
drop function fnc_trg_person_insert_audit() cascade;

delete from person_audit where row_id = 10;

create function fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
            IF (TG_OP = 'INSERT') THEN
            insert into person_audit
                select now(), 'I', NEW.*;
                return NEW;
            ELSIF (TG_OP = 'UPDATE') THEN
            insert into person_audit
                select now(), 'U', NEW.*;
                return NEW;
            ELSIF (TG_OP = 'DELETE') THEN
            insert into person_audit
                select now(), 'D', OLD.*;
                return OLD;
        END IF;
            RETURN NULL;
    END;
$trg_person_audit$ LANGUAGE plpgsql;

create trigger trg_person_audit
after insert or update or delete on person
for each row execute procedure fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
