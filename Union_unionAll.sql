use NORTHWND
go

--từ bảng OrdersDetail hãy liệt kê các đơn hàng có UnitPrice nằm trong phạm vi từ 100 đến 200
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200

--đưa ra các đơn hàng có Quantity bằng 10 hoặc 20
select od.OrderID
from [Order Details] as od
where od.Quantity in (10, 20)

--từ bảng OrdersDetail hãy liệt kê các đơn hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 VÀ đơn hàng phải có Quantity bằng 10 hoặc 20
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 and (od.Quantity in (10, 20))

--từ bảng OrdersDetail hãy liệt kê các đơn hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 HOẶC đơn hàng phải có Quantity bằng 10 hoặc 20
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 or (od.Quantity in (10, 20))

--từ bảng OrdersDetail hãy liệt kê các đơn hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 HOẶC đơn hàng phải có Quantity bằng 10 hoặc 20, có sử dụng DISTINCT
select distinct od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 or (od.Quantity in (10, 20))

--UNION: được sử dụng để kết hợp tập kết quả của 2 hay nhiều câu lệnh
--Mỗi câu lệnh bên trong phải có cùng số lượng cột
--Các cột cũng phải có kiểu dữ liệu tương tự
--Các cột trong mỗi câu lệnh cũng phải theo cùng thứ tự
/*
SELECT ... FROM ...
UNION
SELECT ... FROM ...
*/

select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union
select od.OrderID
from [Order Details] as od
where od.Quantity in (10, 20)


select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union all
select od.OrderID
from [Order Details] as od
where od.Quantity in (10, 20)


--liệt kê toàn bộ thành phố và quốc gia tổn tại trong bảng Suppliers và Customers sau đây với 2 tình huống sử dụng UNION và UNION ALL
select distinct Country
from Suppliers 
union
select distinct Country
from Customers

select distinct Country
from Suppliers 
union all
select distinct Country
from Customers

--từ bảng Customers, Suppliers, Orders hãy in ra các thông tin sau:
--lấy ra tên của thành phố và quốc gia của khách hàng có quốc gia bắt đầu bằng U
--lấy ra tên của thành phố và quốc gia của nhà cung cấp đến London
--lấy ra tên của thành phố và quốc gia của sản phẩm từ USA
select City, Country
from Customers
where Country like 'U%'
union
select City, Country
from Suppliers
where City = 'London'
union
select ShipCity, ShipCountry
from Orders
where ShipCountry = 'USA'