CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
    ON person_discounts(person_id, pizzeria_id);


SET enable_seqscan = false;

EXPLAIN ANALYZE SELECT
       person.name,
       menu.pizza_name,
       menu.price,
       menu.price - menu.price * (person_discounts.discount/100),
       pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON pizzeria.id = person_discounts.pizzeria_id
                             AND person_discounts.person_id = person_order.person_id
ORDER BY name, pizza_name;