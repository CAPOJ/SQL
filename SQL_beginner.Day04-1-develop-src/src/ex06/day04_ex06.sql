CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizzeria_name
FROM menu 
	INNER JOIN pizzeria AS p ON p.id = menu.pizzeria_id
	INNER JOIN person_visits AS v ON menu.pizzeria_id = v.pizzeria_id
	INNER JOIN person AS pe ON pe.id = v.person_id
WHERE price < 800 AND pe.name = 'Dmitriy' AND visit_date = '2022-01-08';