use NORTHWND
go

--cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần
select CustomerID, count(OrderID) as 'Số đơn hàng'
from Orders
group by CustomerID
having count(OrderID) > 20
order by count(OrderID) desc

--lọc ra các nhân viên (EmployeeID) có tổng số đơn hàng >= 100, sắp xếp theo tổng số đơn hàng giảm dần
select EmployeeID, count(OrderID) as 'Số đơn hàng'
from Orders
group by EmployeeID
having count(OrderID) >= 100
order by count(OrderID) desc

--cho biết những thể loại nào (CategoryID) có số sản phẩm khác nhau lớn hơn 11
select CategoryID, count(ProductID) as 'TotalProducts'
from Products
group by CategoryID
having count(ProductID) > 11

--cho biết những thể loại nào (CategoryID) có số tổng số lượng sản phẩm trong kho (UnitsInStock) > 350
select CategoryID, sum(UnitsInStock) as 'TotalUnitsInStock'
from Products
group by CategoryID
having sum(UnitsInStock) > 350

--hãy cho biết những quốc gia nào có nhiều hơn 7 đơn hàng
select ShipCountry, count (CustomerID) as 'TotalCustomers'
from Orders
group by ShipCountry
having count (CustomerID) > 7

--hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, sắp xếp tăng dần theo ngày giao hàng
select day(ShippedDate), count(OrderID) as 'TotalOrders'
from Orders
group by day(ShippedDate)
having count(OrderID) > 5
order by day(ShippedDate) asc

select ShippedDate, count(OrderID) as 'TotalOrders'
from Orders
group by ShippedDate
having count(OrderID) > 5
order by ShippedDate asc

--cho biết những quốc gia bắt đầu bằng chữ 'A' hoặc 'G' và có số lượng đơn hàng lớn hơn 29
select ShipCountry, count(*) as 'TotalOrders'
from Orders
where ShipCountry like 'A%' or ShipCountry like 'G%'
group by ShipCountry
having count(*) > 29

--cho biết những thành phố nào có số lượng đơn hàng được giao là khác 1 và 2, ngày đặt hàng từ ngày 1997-04-01 đến 1997-08-31
select ShipCity, count(*) as 'TotalOrders'
from Orders
where ShippedDate > '1997-04-01' and ShippedDate < '1997-08-31'
group by ShipCity
having count(*) not in (1,2)

Select  ShipCity, Count(*)  as  'TotalOrder'
From  Orders
where  OrderDate  between '1997-04-01' and  '1997-08-31'
group  by  ShipCity
having  Count(*) not  in  (1,2)