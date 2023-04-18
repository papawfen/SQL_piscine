SELECT address,
       pizzeria.name AS name,
       count(person_order.person_id) AS count_of_orders
FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name, pizzeria.id, address
ORDER BY address, pizzeria.name;