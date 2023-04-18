WITH visit(visits) AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person
                        JOIN person_visits ON person_id = person.id
                        JOIN pizzeria ON  pizzeria_id = pizzeria.id
                        WHERE person.name = 'Andrey'),

orderr(orders) AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person
                        JOIN person_order ON person_id = person.id
                        JOIN menu ON menu_id = menu.id
                        JOIN pizzeria ON pizzeria_id = pizzeria.id
                        WHERE person.name = 'Andrey')


SELECT pizzeria_name
FROM (SELECT visit.visits AS pizzeria_name
        FROM visit
        EXCEPT
      SELECT orderr.orders
        FROM orderr) p;
