CREATE VIEW v_persons_male AS
SELECT *
FROM person AS p
WHERE p.gender= 'male';
CREATE VIEW v_persons_female AS
SELECT *
FROM person AS p
WHERE p.gender= 'female';
SELECT *
FROM v_persons_female
ORDER BY id;
SELECT *
FROM v_persons_male
ORDER BY id;