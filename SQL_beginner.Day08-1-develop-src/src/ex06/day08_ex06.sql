--session#1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--session#2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--session#1
SELECT SUM(rating) FROM pizzeria;
--session#2
INSERT INTO pizzeria
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
--session#1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
--session#1
SELECT SUM(rating) FROM pizzeria;
--session#2
SELECT SUM(rating) FROM pizzeria;