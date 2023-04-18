SELECT address,
   round(max(age) - (min(age)::numeric / max(age)::numeric), 2) AS formula,
   round(avg(age), 2) AS average,
   CASE
       WHEN round(max(age) - (min(age)::numeric / max(age)::numeric), 2) > round(avg(age), 2)
            THEN 'true'
        ELSE 'false'
       END AS comparison
FROM person
GROUP BY address
ORDER BY address