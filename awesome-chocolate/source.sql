# Câu 1: Xem 10 dòng dữ liệu giao dịch để hiểu cấu trúc dữ liệu đang có.
SELECT *
FROM sales
LIMIT 10;

# Câu 2: Tìm các giao dịch có giá trị lớn hơn 150.
SELECT *
FROM sales
WHERE Amount > 150;
# Câu 3: Hiển thị danh sách các sản phẩm cùng với loại (category) của chúng.
SELECT products.Product, products.Category
FROM products; 

# Câu 4: Tìm các giao dịch có số lượng box bán ra lớn hơn 30.
SELECT *
FROM sales
WHERE Boxes > 30;

# Câu 5: Tìm các giao dịch có giá trị lớn hơn 100 và đồng thời số lượng khách hàng lớn hơn 3.
SELECT *
FROM sales
WHERE Customers > 3 AND Amount > 100

# Câu 6: Tìm các sản phẩm không thuộc nhóm “Bars”.
SELECT * 
FROM products
WHERE products.Category != 'Bars';

# Câu 7: Tìm các giao dịch xảy ra trong năm 2022.
SELECT * 
FROM sales 
WHERE YEAR(SaleDate) = 2022;

# Câu 8: Tìm các giao dịch có giá trị nằm trong khoảng từ 100 đến 300.
SELECT *
FROM sales 
WHERE Amount BETWEEN 100 AND 300;

# Câu 9: Với mỗi giao dịch, hiển thị thêm tên đội của người bán tương ứng.
SELECT  sales.*, people.Team
FROM sales 
JOIN people ON sales.SPID = sales.SPID; 

# Câu 10: Với mỗi giao dịch, hiển thị khu vực mà giao dịch đó diễn ra.
SELECT sales.*, geo.Region
FROM sales
JOIN geo ON sales.GeoID = geo.GeoID;

# Câu 11: Hiển thị thông tin giao dịch kèm theo chi phí trên mỗi box.
SELECT sales.*, products.Cost_per_box
FROM sales
JOIN products ON sales.PID = products.PID;

# Câu 12: Xem các giao dịch cùng với cả thông tin sản phẩm và người bán.
SELECT s.*, p.Product, p.Category, p.Size, p.Cost_per_box,
		pe.Salesperson, pe.Team
FROM sales s
JOIN products p ON s.PID = p.PID 
JOIN people pe ON s.SPID = pe.SPID;

# Câu 13: Tính tổng doanh thu của toàn bộ hệ thống.
SELECT SUM(Amount) AS TotalRevenue
FROM Sales;

# Câu 14: Tính giá trị trung bình của mỗi giao dịch.
SELECT AVG(Amount) AS AverageRevenue
FROM Sales;

# Câu 15: Đếm số lượng giao dịch theo từng khu vực.
SELECT g.Region, COUNT(*) AS TransactionCount
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region

# Câu 16: Tính tổng số khách hàng được phục vụ bởi mỗi nhân viên bán hàng.
SELECT pe.Salesperson, SUM(s.Customers) AS TotalCustomers
FROM sales s 
JOIN people pe ON s.SPID = pe.SPID
GROUP BY pe.Salesperson; 

# Câu 17: Những nhân viên nào có tổng doanh thu lớn hơn 1600000?
SELECT pe.Salesperson, SUM(s.Amount) AS TotalRevenue
FROM sales s 
JOIN people pe ON s.SPID = pe.SPID
GROUP BY pe.Salesperson
HAVING SUM(s.Amount) > 1600000

# Câu 18: Những sản phẩm nào được bán với tổng số lượng box lớn hơn 500?
SELECT p.Product, SUM(s.Boxes) AS TotalBoxes
FROM sales s
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
HAVING SUM(s.Boxes) > 500

# Câu 19: Tìm 5 sản phẩm có doanh thu cao nhất.
SELECT p.Product, SUM(s.Amount) AS TotalRevenue
FROM sales s 
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
ORDER BY TotalRevenue DESC
LIMIT 5; 

# Câu 20: Tìm 3 khu vực có doanh thu cao nhất, sắp xếp theo thứ tự giảm dần.
SELECT g.Region, SUM(s.Amount) AS TotalRevenue
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region 
ORDER BY TotalRevenue DESC
LIMIT 3;

