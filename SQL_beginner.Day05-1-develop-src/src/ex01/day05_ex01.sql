SET enable_seqscan = OFF;
explain analyse
SELECT m.pizza_name AS pizza_name,
        pz.name AS pizzeria_name
FROM menu m INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id;