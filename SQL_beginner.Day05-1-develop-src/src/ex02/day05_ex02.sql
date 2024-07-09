SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT * FROM person WHERE UPPER(name) = 'Kate';