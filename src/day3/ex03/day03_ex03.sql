WITH person_visit(name, gender) AS
    (SELECT pizzeria.name, person.gender
        FROM person
        JOIN person_visits ON person_id = person.id
        JOIN pizzeria ON pizzeria_id = pizzeria.id)

SELECT p.pizzeria_name
FROM (SELECT person_visit.name AS pizzeria_name
        FROM person_visit
        WHERE person_visit.gender = 'male'
        EXCEPT ALL
        SELECT person_visit.name
        FROM person_visit
        WHERE person_visit.gender = 'female') p
UNION ALL
SELECT pp.pizzeria_name
FROM (SELECT person_visit.name AS pizzeria_name
        FROM person_visit
        WHERE person_visit.gender = 'female'
        EXCEPT ALL
        SELECT person_visit.name
        FROM person_visit
        WHERE person_visit.gender = 'male') pp
ORDER BY pizzeria_name;