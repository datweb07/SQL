use NORTHWND
go

--order by:
/*
+ ASC: sắp xếp tăng dần (mặc định nếu không ghi)
+ DESC: sắp xếp giảm dần
*/

--liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị CompanyName từ A-Z
select * from Suppliers 
order by CompanyName asc

--liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
select UnitPrice from Products 
order by UnitPrice desc

--liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z
select *
from Employees
order by LastName, FirstName 

--lấy ra 1 sản phẩm có số lượng bán hàng cao nhất từ bảng Order Details
select distinct top 1 *
from [Order Details]
order by Quantity desc

--liệt kê danh sách các đơn đặt hàng (OrderID) trong bảng Orders theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
select *
from Orders
order by OrderDate desc

--liệt kê tên, đơn giá, số lượng trong kho (UnitInStock) của tất cả các sản phẩm trong bảng Products, theo thứ tự giảm dần của UnitInStock
select ProductName as 'Tên', UnitPrice as 'Giá', UnitsInStock as 'Số Lượng'
from Products
order by UnitsInStock desc
