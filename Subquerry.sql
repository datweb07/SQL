use NORTHWND
go

--Sub Querry: hoạt động như 1 bảng ảo tạm thời, nó được sử dụng để trích xuất thông tin từ các bảng hoặc tập dữ liệu khác trong cùng 1 câu truy vấn
--liệt kê toàn bộ sản phẩm
select ProductID, ProductName, UnitPrice
from Products

--giá trung bình của các sản phẩm
select avg(UnitPrice) as AverageUnitPrice
from Products

--lọc những sản phẩm có giá > trung bình
select ProductID, ProductName, UnitPrice
from Products
where UnitPrice > 
(
	select avg(UnitPrice) as AverageUnitPrice
	from Products
)

--lọc ra những khách hàng có số đơn hàng > 10
select c.CustomerID, c.CompanyName, count(o.OrderID) as TotalOrders
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having count(o.OrderID) > 10


--subquerry
select *
from Customers
where CustomerID in 
(
	select CustomerID
	from Orders
	group by CustomerID
	having count(OrderID) > 10
)


--tính tổng tiền cho từng đơn hàng
select o.*,
(
	select sum(od.UnitPrice * od.Quantity)
	from [Order Details] as od
	where o.OrderID = od.OrderID
)
as TotalProducts
from Orders as o


--lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm
select p.ProductID, p.ProductName, 
(	
	select count(*) 
	from [Order Details] as od
	where od.ProductID = p.ProductID
)
as TotalProducts
from Products as p