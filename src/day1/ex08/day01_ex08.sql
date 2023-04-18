SELECT order_date, concat(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
NATURAL JOIN person p(person_id, name, age, gender, address)
ORDER BY order_date, person_information;