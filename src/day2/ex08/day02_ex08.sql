SELECT person.name
FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON menu.id = menu_id
WHERE (person.address = 'Moscow' OR person.address = 'Samara') AND
      (pizza_name = 'pepperoni pizza' OR
      pizza_name = 'mushroom pizza' OR
      (pizza_name = 'pepperoni pizza' AND
      pizza_name = 'mushroom pizza')) AND
      person.gender = 'male'
ORDER BY person.name DESC;