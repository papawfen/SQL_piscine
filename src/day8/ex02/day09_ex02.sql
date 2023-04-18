create function fnc_trg_person_delete_audit() RETURNS TRIGGER AS $trg_person_delete_audit$
    begin
        insert into person_audit
            select now(), 'D', OLD.*;
            return OLD;
    end;
$trg_person_delete_audit$ LANGUAGE plpgsql;

create trigger trg_person_delete_audit
after delete on person
for each row execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
