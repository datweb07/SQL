use NORTHWND
go

--từ bảng Products và Categories, hãy tìm ra các sản phẩm thuộc danh mục Seafood in ra các thông tin sau:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p, Categories as c
where c.CategoryID = p.CategoryID and c.CategoryName = 'Seafood'

--từ bảng Products và Suppliers, hãy tìm các sản phẩm được cung cấp từ Germany:
--Mã nhà cung cấp
--Quốc gia
--Mã sản phẩm
--Tên sản phẩm
select s.SupplierID, s.Country, p.ProductID, p.ProductName
from Products as p, Suppliers as s
where s.SupplierID = p.SupplierID and s.Country = 'Germany'

--từ bảng Customers, Orders, Shippers hãy in ra các thông tin sau:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--và chỉ in ra các đơn hàng của các khách hàng đến từ London
select o.OrderID, c.ContactName, s.CompanyName, c.City
from Customers as c, Orders as o, Shippers as s
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and c.City = 'London'

--từ bảng Orders, Customers, Shippers hãy in ra các thông tin sau: 
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Ngày yêu cầu chuyển hàng
--Ngày giao hàng
--Và chỉ in ra các đơn hàng bị giao muộn hơn quy định (RequiredDate > ShippedDate)
select o.OrderID, c.ContactName, s.CompanyName, day(o.RequiredDate) as DayRequired, day(o.ShippedDate) as DateShipped
from Orders as o, Customers as c, Shippers as s
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and day(o.RequiredDate) < day(o.ShippedDate)

--từ bảng Orders, Customers, Shippers hãy in ra các thông tin sau:
--Tên ShipCountry mà khách hàng không đến từ United States
--Chỉ chọn những country mà > 100 đơn hàng
--Hiển thị ShipContry và Số của sản phẩm
select o.ShipCountry, count(o.OrderID) as TotalOrders
from Orders as o, Customers as c, Shippers as s
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and c.Country <> 'USA'
group by o.ShipCountry
having  count(o.OrderID) > 100

select o.ShipCountry'Country', count(o.OrderID)'Number'
from Customers as c
	inner join Orders as o on c.CustomerID = o.CustomerID
where c.Country <> 'USA'
Group by o.ShipCountry
having count(o.OrderID) > 100