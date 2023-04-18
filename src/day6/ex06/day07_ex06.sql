SELECT pizzeria.name AS pizzeria_name,
            count(person_order.person_id) AS count_of_orders,
            round(avg(menu.price), 2) AS average_price,
            MAX(menu.price) AS max_price,
            MIN(menu.price) AS min_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name, pizzeria.id
ORDER BY pizzeria_name;