use NORTHWND
go

--DAY(date | datetime): lấy ra dữ liệu ngày
--MONTH(date | datetime): lấy ra dữ liệu tháng
--YEAR(date | datetime): lấy ra dữ liệu năm

--số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
select CustomerID, count(OrderID) as 'TotalOrder', year(OrderDate) as 'Year'
from Orders 
where year(OrderDate) = 1997
group by CustomerID, year(OrderDate)

--lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
select *
from Orders 
where month(OrderDate) = 05 and year(OrderDate) = 1997

--lọc ra các đơn hàng được đặt hàng vào ngày 4 tháng 9 năm 1996
select *
from Orders
where 
(
	day(OrderDate) = 4 
	and month(OrderDate) = 9 
	and year(OrderDate) = 1996
)

--lấy danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần
select CustomerID, month(OrderDate) as 'Month', count(*) as 'Total'
from Orders
where year(OrderDate) = 1998
group by CustomerID, month(OrderDate)
order by month(OrderDate) asc

--lọc các đơn hàng đã được giao vào tháng 5, và sắp xếp tăng dần theo năm
select OrderID, month(ShippedDate) as 'Month'
from Orders
where month(ShippedDate) = 05
order by year(ShippedDate) asc
