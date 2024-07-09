CREATE MATERIALIZED VIEW traveling_salesman_problem AS
(
WITH RECURSIVE a_paths AS (SELECT from_city AS tour,
                                  from_city,
                                  to_city,
                                  cost,
                                  cost AS total_cost
                            FROM city_way
                            WHERE from_city = 'a'
                            UNION ALL
                            SELECT parrent.tour || ',' || child.from_city AS tour,
                                   child.from_city,
                                   child.to_city,
                                   parrent.cost,
                                   parrent.total_cost + child.cost AS total_cost
                            FROM city_way AS child
                                   INNER JOIN a_paths AS parrent ON child.from_city = parrent.to_city
                            WHERE tour not like '%' || child.from_city || '%')
SELECT total_cost, '{' || tour || ',' || to_city || '}' AS tour
FROM a_paths
WHERE to_city = 'a'
ORDER BY total_cost);

SELECT total_cost, tour
FROM traveling_salesman_problem
WHERE total_cost = (SELECT total_cost FROM traveling_salesman_problem ORDER BY total_cost LIMIT 1);