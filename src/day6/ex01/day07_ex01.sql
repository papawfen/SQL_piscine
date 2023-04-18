WITH all_visits AS (SELECT person_visits.person_id,
                            count(person_visits.person_id) AS count_of_visits
                           FROM person_visits
                           JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                           GROUP BY person_visits.person_id)

SELECT person.name,
       visit.count_of_visits
FROM all_visits AS visit
JOIN person ON person_id = person.id
ORDER BY count_of_visits DESC, person.name LIMIT 4;
