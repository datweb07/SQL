use NORTHWND
go

--HAVING: lọc dữ liệu sau GROUP BY
--cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần
select CustomerID, count(OrderID) as 'Total'
from Orders
group by CustomerID
having count(OrderID) > 20
order by count(OrderID) desc

--lọc ra những nhà cung cấp sản phẩm có tổng số lượng hàng trong kho (UnitsInStock) > 30, và có trung bình đơn giá (UnitPrice) < 50
select SupplierID, sum(UnitsInStock) as 'TotalUnitsInStock', avg(UnitPrice) as 'AvgUnitPrice'
from Products
group by SupplierID
having sum(UnitsInStock) > 30 and avg(UnitPrice) < 50

--cho biết tổng số tiền vận chuyển của từng tháng, trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần
select month(ShippedDate) as 'Month', sum(Freight) as 'TotalFreight'
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by month(ShippedDate)
order by month(ShippedDate) asc

--cho biết tổng số tiền vận chuyển của từng tháng, trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần, tổng tiền vận chuyển > 1000$
select month(ShippedDate) as 'Month', sum(Freight) as 'TotalFreight'
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by month(ShippedDate)
having sum(Freight) > 1000
order by month(ShippedDate) asc

--lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng giảm dần
select ShipCity, count(OrderID) as 'Số lượng'
from Orders
group by ShipCity
having count(OrderID) > 16
order by count(OrderID) desc


