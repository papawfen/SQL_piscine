SELECT person.name, menu.pizza_name, pizzeria.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY person.name, menu.pizza_name, pizzeria.name;
