SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;