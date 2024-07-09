SELECT address, p.name, COUNT(*)
FROM person_order INNER JOIN menu AS m ON person_order.menu_id = m.id
INNER JOIN pizzeria AS p ON m.pizzeria_id = p.id
INNER JOIN person AS p1 ON p1.id = person_order.person_id
GROUP BY address, p.name ORDER BY 1,2;