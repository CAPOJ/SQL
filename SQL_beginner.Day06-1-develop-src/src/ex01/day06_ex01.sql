INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
row_number() OVER () AS id,
	person_id,
	m.pizzeria_id,
CASE
	WHEN COUNT(*) = 2 THEN 22
	WHEN COUNT(*) = 1 THEN 10.5
ELSE 30
END AS discount
FROM person_order INNER JOIN menu AS m ON m.id = person_order.menu_id
GROUP BY person_id, m.pizzeria_id;
select count(*) > 0 as check
from person_discounts;