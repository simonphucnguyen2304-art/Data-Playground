-- Write your PostgreSQL query statement below
SELECT SalesPerson.name
FROM Orders
INNER JOIN Company 
    ON (Orders.com_id = Company.com_id AND company.name = 'RED')
RIGHT JOIN SalesPerson 
USING (Sales_id)
WHERE Orders.sales_id IS NULL 
