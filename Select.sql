use NORTHWND
go
--câu lệnh truy vấn lấy ra tên của tất cả các sản phẩm
select ProductName from Products
--câu lệnh truy vấn lấy ra tên products, giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị
select ProductName, UnitPrice, QuantityPerUnit from Products
--câu lệnh truy vấn lấy ra tên công ty và quốc gia của khách hàng
select CompanyName, Country from Customers
--câu lệnh truy vấn lấy ra tên công ty và số đt của tất cả nhà cung cấp hàng
select CompanyName, Phone from Suppliers
--câu lệnh truy vấn lấy ra tất cả dữ liệu của Products
select * from Products
--câu lệnh truy vấn lấy ra tất cả dữ liệu của Customers
select * from Customers
--câu lệnh truy vấn lấy ra tất cả dữ liệu của Suppliers
select * from Suppliers