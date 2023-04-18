WITH all_visits AS (SELECT pizzeria.name AS pizzeria_name,
                            count(person_visits.person_id) AS count_of_visits
                           FROM person_visits
                           JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                           GROUP BY pizzeria.name
                           ORDER BY count_of_visits DESC LIMIT 3),

all_orders AS (SELECT pizzeria.name AS pizzeria_name,
                            count(person_order.person_id) AS count_of_orders
                           FROM person_order
                           JOIN menu ON person_order.menu_id = menu.id
                           JOIN pizzeria ON pizzeria_id = pizzeria.id
                           GROUP BY pizzeria.name
                           ORDER BY count_of_orders DESC LIMIT 3)

SELECT visit.pizzeria_name,
       visit.count_of_visits AS count, 'visit' AS action_type
FROM all_visits AS visit
UNION ALL
SELECT orders.pizzeria_name,
       orders.count_of_orders, 'order' AS action_type
FROM all_orders AS orders
ORDER BY action_type, count DESC;