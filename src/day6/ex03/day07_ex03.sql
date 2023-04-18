WITH all_visits AS (SELECT pizzeria.name AS pizzeria_name,
                            count(person_visits.person_id) AS count_of_visits
                           FROM person_visits
                           JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                           GROUP BY pizzeria.name),

all_orders AS (SELECT pizzeria.name AS pizzeria_name,
                            count(person_order.person_id) AS count_of_orders
                           FROM person_order
                           JOIN menu ON person_order.menu_id = menu.id
                           JOIN pizzeria ON pizzeria_id = pizzeria.id
                           GROUP BY pizzeria.name)

SELECT visit.pizzeria_name,
       coalesce(visit.count_of_visits, 0) + coalesce(orders.count_of_orders, 0) AS count
FROM all_visits AS visit
FULL JOIN all_orders orders ON visit.pizzeria_name = orders.pizzeria_name
ORDER BY count DESC;
