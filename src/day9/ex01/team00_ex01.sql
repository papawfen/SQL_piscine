DROP TABLE IF EXISTS cities;

CREATE TABLE cities (point1 CHAR,
                     point2 CHAR,
                     cost integer);

INSERT INTO cities VALUES ('a', 'b', 10);
INSERT INTO cities VALUES ('a', 'c', 15);
INSERT INTO cities VALUES ('a', 'd', 20);

INSERT INTO cities VALUES ('b', 'a', 10);
INSERT INTO cities VALUES ('b', 'c', 35);
INSERT INTO cities VALUES ('b', 'd', 25);

INSERT INTO cities VALUES ('c', 'a', 15);
INSERT INTO cities VALUES ('c', 'b', 35);
INSERT INTO cities VALUES ('c', 'd', 30);

INSERT INTO cities VALUES ('d', 'a', 20);
INSERT INTO cities VALUES ('d', 'b', 25);
INSERT INTO cities VALUES ('d', 'c', 30);

WITH RECURSIVE  total_cost (arr, step, cost, way) AS (
    SELECT DISTINCT point2, 0, cost, CONCAT(CAST('a' AS VARCHAR), ',', CAST(point2 AS VARCHAR))
    FROM cities
    WHERE point1 = 'a'
        UNION ALL
    SELECT point2,
    dep.step + 1,
    dep.cost + arr.cost,
    concat(dep.way, ',', arr.point2)
    FROM cities AS arr
    JOIN total_cost AS dep ON dep.arr = arr.point1 AND
        (way NOT LIKE CONCAT('%' ,arr.point2, '%') OR arr.point2 = 'a')
        AND arr.point1 != 'a'
)
SELECT cost AS total_cost, concat('{', way, '}') AS tour
FROM total_cost
WHERE arr = 'a' AND
      (SELECT count(p) FROM (SELECT DISTINCT point1 FROM cities) as p) - 1 = step AND
        cost = (SELECT min(cost) FROM total_cost WHERE
         (SELECT count(p) FROM (SELECT DISTINCT point1 FROM cities) as p) - 1 = step)
UNION
SELECT cost AS total_cost, concat('{', way, '}')
FROM total_cost
WHERE arr = 'a' AND
      (SELECT count(p) FROM (SELECT DISTINCT point1 FROM cities) as p) - 1 = step AND
        cost = (SELECT max(cost) FROM total_cost WHERE
         (SELECT count(p) FROM (SELECT DISTINCT point1 FROM cities) as p) - 1 = step)
ORDER BY total_cost, tour;
