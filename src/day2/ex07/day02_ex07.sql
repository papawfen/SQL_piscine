SELECT pizzeria.name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE menu.price <= 800 AND
      person_visits.visit_date = '2022-01-08' AND
      person.name = 'Dmitriy';