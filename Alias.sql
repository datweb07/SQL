use NORTHWND
go

--alias: đặt tên thay thế cho các cột hoặc cho các bảng
--lấy "CompanyName" và đặt tên là "Công Ty"
select CompanyName as N'Công Ty' from Customers

--lấy "PostalCode" và đặt tên là "Mã Bưu Điện"
select PostalCode as N'Mã Bưu Điện' from Suppliers

--lấy "LastName" và đặt tên là "Họ"
select LastName as N'Họ' from Employees

--lấy "FirstName" và đặt tên là "Tên"
select FirstName as N'Tên' from Employees

--nối hai cột Họ, Tên thành Họ và Tên
select FirstName 
as 'Tên', LastName as 'Họ', 
LastName + ' ' + FirstName as 'Họ và tên' 
from Employees

--lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Orders, đặt tên cho bảng là "O"
select top 15 * from Orders as O
select top 15 o.* from Orders as o

--lấy "ProductName", "SupplierID", "CategoryID" và đặt tên là "Tên sản phẩm", "Mã nhà cung cấp", "Mã thể loại"
--và đặt tên thay thế cho bảng "Products" là "p", sử dụng tên thay thế khi truy vấn các cột bên trên
--và chỉ lấy ra 5 sản phẩm đầu tiên
select top 5 ProductName as 'Tên Sản Phẩm', SupplierID as 'Mã Cung Cấp', CategoryID as 'Mã Loại' from Products as p
select distinct top 10 p.ProductName as 'Tên Sản Phẩm', o.CustomerID as 'Mã Khách Hàng' from Products as p, Orders as o