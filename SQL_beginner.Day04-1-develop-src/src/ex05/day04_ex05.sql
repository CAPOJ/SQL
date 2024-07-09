CREATE VIEW v_price_with_discount AS
SELECT p.name,m.pizza_name,m.price,round(m.price - m.price * 0.1) AS discount_price
FROM person_order
	JOIN person AS p ON p.id = person_order.person_id
	JOIN menu AS m ON m.id = person_order.menu_id
ORDER BY p.name, m.pizza_name;