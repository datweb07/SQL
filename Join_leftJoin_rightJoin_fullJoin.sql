use NORTHWND
go


--INNER JOIN (JOIN): trả về tất cả các hàng khi có ít nhất 1 giá trị ở cả hai bảng
/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name
*/


--từ bảng Products và Categories, hãy in ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
--(sử dụng INNER JOIN)
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID


--từ bảng Products và Categories, hãy in ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--số lượng sản phẩm
select c.CategoryID, c.CategoryName, count(p.ProductID) as TotalProducts
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName


--từ bảng Orders và Customers, hãy in ra các thông tin sau:
--Mã đơn hàng
--Tên công ty khách hàng
select o.OrderID, c.CompanyName
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID

--LEFT OUTER JOIN (LEFT JOIN): trả lại tất cả các dòng từ bảng bên trái, và các dòng đúng với điều kiện từ bảng bên phải
--lấy ra những giá trị chung và những giá trị không có trong bảng 2
/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name
*/

--từ bảng Products và Categories, hãy đưa ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--Tên sản phẩm
--sử dụng INNER	JOIN, LEFT JOIN
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID

select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p
left join Categories as c
on c.CategoryID = p.CategoryID

select c.CategoryID, c.CategoryName, count(p.ProductID) as TotalProducts
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName

select c.CategoryID, c.CategoryName, count(p.ProductID) as TotalProducts
from Products as p
left join Categories as c
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName


--RIGHT OUTER JOIN (RIGHT JOIN): trả lại tất cả các hàng từ bảng bên phải, và các dòng thỏa mãn điều kiện từ bảng bên trái
--lấy ra những giá trị chung và không có trong bảng 1
/*
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name
*/

--sử dụng RIGHT JOIN, hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên công ty khách hàng
select o.OrderID, c.CompanyName
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID

select o.OrderID, c.CompanyName
from Orders as o
right join Customers as c
on o.CustomerID = c.CustomerID

select c.CompanyName, count(o.OrderID) as TotalOrders
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName

--FULL OUTER JOIN (FULL JOIN): trả về tất cả các dòng đúng với 1 trong các bảng
--lấy tất cả giá trị ở bảng số 1 và 2
/*
SELECT column_name
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition
*/
--từ bảng Products và Categories, hãy đưa ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--Tên sản phẩm
--sử dụng FULL OUTER JOIN
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as c
full join Products as p
on c.CategoryID = p.CategoryID

--BÀI TẬP
--(INNER JOIN): liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng Orders
select c.ContactName, e.LastName + ' ' + e.FirstName
from Customers as c
inner join Employees as e
on 
--(LEFT JOIN): liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng Products, bao gồm các sản phẩm không có nhà cung cấp
--(RIGHT JOIN): liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng Orders, bao gồm cả khách hàng không có đơn hàng
--(FULL JOIN): liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products, bao gồm cả các danh mục và nhà cung cấp không có sản phẩm

--BÀI TẬP 2:
--(INNER JOIN): liệt kê tên sản phẩm và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng OrderDetails. Sử dụng INNER JOIN để kết hợp bảng OrderDetails với các bảng liên quan để lấy thông tin sản phẩm và nhà cung cấp
--(LEFT JOIN): liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders. Bao gồm các đơn hàng không có nhân viên phụ trách. Sử dụng LEFT JOIN để kết hợp bảng Orders với bảng Employees để lấy thông tin về khách hàng và nhân viên phụ trách
--(RIGHT JOIN): liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders. Bao gồm các khách hàng không có đơn hàng. Sử dụng RIGHT JOIN để kết hợp bảng Orders với bảng Customers để lấy thông tin về khách hàng và nhân viên phụ trách
--(): liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Product. Bao gồm các danh mục và nhà cung cấp không có sản phẩm. Sử dụng FULL JOIN hoặc LEFT JOIN + RIGHT JOIN để lấy thông tin về danh mục và nhà cung cấp