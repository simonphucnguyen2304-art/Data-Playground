-- Write your PostgreSQL query statement below
Select 
    Product.product_name, 
    s.year,
    s.price
FROM Sales AS s
INNER JOIN Product 
USING (product_id);
