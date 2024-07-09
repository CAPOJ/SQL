-- session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;

--session #2
SELECT * FROM pizzeria;

--session #1
COMMIT;

--session #2
SELECT * FROM pizzeria;