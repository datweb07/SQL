use NORTHWND
go


--từ bảng Products và Categories, hãy in ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p, Categories as c
where c.CategoryID = p.CategoryID


--từ bảng Employees và Orders, hãy in ra các thông tin sau:
--Mã nhân viên
--Tên nhân viên
--Số lượng đơn hàng mà nhân viên bán được
select o.EmployeeID, e.LastName + ' ' + e.FirstName as 'FullName', count(o.OrderID) as 'TotalOrders'
from Orders as o, Employees as e
where o.EmployeeID = e.EmployeeID
group by o.EmployeeID, e.LastName, e.FirstName


--từ bảng Customers và Orders, hãy in ra các thông tin sau:
--Mã số khách hàng
--Tên công ty
--Tên liên hệ
--Số lượng đơn hàng đã mua
--Với điều kiên quốc gia của khách hàng là UK
select c.CustomerID, c.CompanyName, c.ContactName, count(o.OrderID) as 'TotalOrders'
from Customers as c, Orders as o
where c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName, c.ContactName


--từ bảng Orders và Shippers, hãy in ra các thông tin sau:
--Mã nhà vận chuyển
--Tên công ty vận chuyển
--Tổng số tiền được vận chuyển (sum Freight)
--và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần
select s.ShipperID, s.CompanyName, sum(o.Freight) as 'TotalFreight'
from Orders as o, Shippers as s
where s.ShipperID = o.ShipVia
group by s.ShipperID, s.CompanyName
order by  sum(o.Freight) desc


--từ bảng Products và Suppliers, hãy in ra các thông tin sau:
--Mã nhà cung cấp
--Tên công ty
--Tổng số các sản phẩm khác nhau đã cung cấp
--và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất
select top 1 s.SupplierID, s.CompanyName, count(p.ProductID) as 'TotalProducts'
from Products as p, Suppliers as s
where s.SupplierID = p.SupplierID
group by s.SupplierID, s.CompanyName
order by count(p.ProductID) desc


--từ bảng Orders và Orders Details, hãy in ra các thông tin sau:
--Mã đơn hàng
--Tổng số tiền sản phẩm của đơn hàng đó
select o.OrderID, sum(od.Quantity * od.UnitPrice) as Total
from Orders as o, [Order Details] as od
where o.OrderID = od.OrderID
group by o.OrderID


--từ bảng Orders Details, Orders, Employees, hãy in ra các thông tin sau:
--Mã đơn hàng
--Tên nhân viên
--Tổng số tiền sản phẩm của đơn hàng
select o.OrderID, e.LastName + ' ' + e.FirstName as FullName, sum(od.Quantity * od.UnitPrice) as TotalPrice
from [Order Details] as od, Orders as o, Employees as e
where o.EmployeeID = e.EmployeeID and o.OrderID = od.OrderID
group by o.OrderID, e.LastName + ' ' + e.FirstName

--từ bảng Orders, Customers, Shippers, hãy in ra các thông tin sau:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ ra các đơn hàng được giao đến UK trong năm 1997
select o.OrderID, c.ContactName, s.CompanyName
from Orders as o, Customers as c, Shippers as s
where year(o.ShippedDate) = 1997 and ShipCountry = 'UK' and o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID


SELECT O.OrderID, C.CompanyName AS [CUSTOMER NAME], S.CompanyName
FROM ORDERS AS O, Customers AS C, Shippers AS S
WHERE O.CustomerID = C.CustomerID AND S.ShipperID = O.ShipVia AND O.ShipCountry = 'UK' AND YEAR(O.ShippedDate) = 1997;