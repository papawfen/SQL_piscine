create function fnc_person_visits_and_eats_on_date(
                                    pperson varchar default 'Dmitriy',
                                    pprice integer default 500,
                                    pdate date default '2022-01-08')
    returns table (pizzeria_name varchar) as $$
    begin
        return QUERY
        (select distinct pizzeria.name
            from person
                join person_visits ON person_visits.person_id = person.id
                join pizzeria ON pizzeria.id = pizzeria_id
                join menu ON menu.pizzeria_id = pizzeria.id
                join person_order on person.id = person_order.person_id
        WHERE menu.price < pprice AND
                  visit_date = pdate and
                  person.name = pperson);
    end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',
    pprice := 1300, pdate := '2022-01-01');