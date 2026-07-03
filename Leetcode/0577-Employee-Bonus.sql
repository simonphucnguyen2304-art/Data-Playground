-- Write your PostgreSQL query statement below
SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
    USING(empID)
WHERE b.bonus IS NULL OR b.bonus < 1000
