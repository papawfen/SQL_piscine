create table person_audit(
    created timestamp with time zone not null,
    type_event char default 'I' not null,
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

alter table person_audit add constraint ch_type_event check ( type_event in ('I','D', 'U') );

create function fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
    begin
        insert into person_audit
            select now(), 'I', NEW.*;
            return NEW;
    end;
$$ LANGUAGE plpgsql;

create trigger trg_person_insert_audit
after insert on person
for each row execute procedure fnc_trg_person_insert_audit();

insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');
