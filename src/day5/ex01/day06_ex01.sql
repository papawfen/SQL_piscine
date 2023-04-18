WITH all_discounts AS (SELECT po.person_id, m.pizzeria_id,
                            (CASE count(po.person_id)
                                WHEN 1 THEN 10.5
                                WHEN 2 THEN 22
                                ELSE 30
                            END) AS discount
                           FROM person_order po
                           JOIN menu m ON po.menu_id = m.id
                           GROUP BY po.person_id, m.pizzeria_id
                           )

INSERT INTO person_discounts
SELECT row_number() OVER (ORDER BY dis.person_id),
       dis.person_id,
       dis.pizzeria_id,
       dis.discount
FROM all_discounts AS dis;