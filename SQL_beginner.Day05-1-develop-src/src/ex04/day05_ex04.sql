SET enable_seqscan = OFF;
explain analyse
SELECT * FROM menu WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';