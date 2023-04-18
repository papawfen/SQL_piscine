WITH person_orders(name, gender) AS
    (SELECT pizzeria.name, person.gender
        FROM person
        JOIN person_order ON person_id = person.id
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON pizzeria_id = pizzeria.id)

SELECT p.pizzeria_name
FROM (SELECT person_orders.name AS pizzeria_name
        FROM person_orders
        WHERE person_orders.gender = 'male'
        EXCEPT
        SELECT person_orders.name
        FROM person_orders
        WHERE person_orders.gender = 'female') p
UNION
SELECT pp.pizzeria_name
FROM (SELECT person_orders.name AS pizzeria_name
        FROM person_orders
        WHERE person_orders.gender = 'female'
        EXCEPT
        SELECT person_orders.name
        FROM person_orders
        WHERE person_orders.gender = 'male') pp
ORDER BY pizzeria_name;