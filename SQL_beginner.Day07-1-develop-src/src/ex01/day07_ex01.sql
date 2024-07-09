SELECT p.name, COUNT(*) AS "count_of_visits"
FROM person_visits INNER JOIN person AS p ON p.id = person_visits.person_id
GROUP BY p.name
ORDER BY 2 desc,1 asc
LIMIT 4;
