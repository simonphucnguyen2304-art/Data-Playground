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
