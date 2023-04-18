SELECT m.pizza_name,
       m.name AS pizzeria_name_1,
       mm.name AS pizzeria_name_2,
       m.price
FROM (SELECT *
      FROM menu
      JOIN pizzeria ON pizzeria_id = pizzeria.id) m
JOIN
    (SELECT *
      FROM menu mm
      JOIN pizzeria ON pizzeria_id = pizzeria.id) mm
        ON m.price = mm.price AND m.pizza_name = mm.pizza_name AND m.name > mm.name

