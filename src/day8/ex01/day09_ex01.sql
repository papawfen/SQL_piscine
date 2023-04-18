create function fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
    begin
        insert into person_audit
            select now(), 'U', NEW.*;
            return NEW;
    end;
$trg_person_update_audit$ LANGUAGE plpgsql;

create trigger trg_person_update_audit
after update on person
for each row execute procedure fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;