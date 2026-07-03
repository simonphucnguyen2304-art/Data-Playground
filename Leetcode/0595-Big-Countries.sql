-- Write your PostgreSQL query statement below
SELECT name, population, area 
FROM World 
WHERE population >= 25000000 OR area >= 3000000
GROUP BY name, population, area
