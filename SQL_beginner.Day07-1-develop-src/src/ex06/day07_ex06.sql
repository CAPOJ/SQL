SELECT p.name, COUNT(*) AS count_of_orders, round(avg(m.price),2) AS average_price,
	MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order INNER JOIN menu AS m ON person_order.menu_id = m.id
INNER JOIN pizzeria AS p ON m.pizzeria_id = p.id
GROUP BY p.name ORDER BY 1;
