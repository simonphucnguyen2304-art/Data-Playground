-- Write your PostgreSQL query statement below
SELECT p.product_id, p.product_name
FROM Product p
LEFT JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(CASE
             WHEN s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
             THEN 1
             ELSE 0
           END) = COUNT(*);
