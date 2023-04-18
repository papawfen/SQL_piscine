SELECT person.name AS name
FROM person
JOIN person_order ON person.id = person_id
JOIN menu ON menu_id = menu.id
WHERE person.gender = 'female' AND
      (pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza')
EXCEPT ALL (SELECT person.name FROM person)
ORDER BY name
