CREATE INDEX idx_1 ON pizzeria(rating);
SET enable_seqscan = OFF;
explain analyse
SELECT
m.pizza_name AS pizza_name,
max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING 
				AND UNBOUNDED FOLLOWING) AS k
FROM menu m
	INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id ORDER BY pizza_name,k;