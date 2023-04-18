WITH missing_menu(missing_menu) AS (SELECT *
    FROM menu
        WHERE menu.id NOT IN (SELECT menu_id FROM person_order))

SELECT pizza_name, price, pizzeria.name AS pizzeria_name
    FROM missing_menu
        JOIN pizzeria ON missing_menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;