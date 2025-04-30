use NORTHWND
go
--tạo ra bảng mới với sản phẩm có giá > 50
select *
into HighValueProducts
from Products
where UnitPrice > 50

--tạo bảng mới với đơn hàng được giao đến USA
select *
into ShipUSA
from Orders
where ShipCountry = 'USA'

--tạo bảng tạm thời CustomersInLondon từ bảng Customers để chứa thông tin của khách hàng có địa chỉ ở London
select *
into CustomersInLondon
from Customers
where City like 'London'