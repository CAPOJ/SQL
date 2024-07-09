--session#1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session#2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session#1
SELECT SUM(rating) FROM pizzeria;
--session#2
INSERT INTO pizzeria
VALUES (10, 'Kazan Pizza', 5);
COMMIT;
--session#1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
--session#1
SELECT SUM(rating) FROM pizzeria;
--session#2
SELECT SUM(rating) FROM pizzeria;