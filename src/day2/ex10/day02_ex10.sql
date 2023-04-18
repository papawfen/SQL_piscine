SELECT pp.name AS person_name1,
       p.name AS person_name2,
       pp.address AS common_address
FROM person pp
JOIN (SELECT name,
       address
FROM person) p ON pp.address = p.address
WHERE p.name > pp.name
ORDER BY person_name1, person_name2, common_address;

