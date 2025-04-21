use NORTHWND
go

--between: chọn các giá trị trong một phạm vi nhất định, có thể là số, văn bản, ngày tháng
--lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20$
select * from Products where UnitPrice between 10 and 20

--lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian từ 1996-07-01 đến 1996-07-31
select * from Orders where ShippedDate between '1996-07-01' and '1996-07-31'

--tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong khoảng thời gian từ 1996-07-01 đến 1996-07-31
select sum(Freight) as 'Tổng Tiền' from Orders where OrderDate between '1996-07-01' and '1996-07-31'

--lấy danh sách các đơn hàng có ngày đặt hàng trong khoảng từ 01-01-1997 đến 31-12-1997 và được vận chuyển bằng đường tàu thủy (ShipVia = 3)
select * from Orders where OrderDate between '1997-01-01' and '1997-12-31' and ShipVia = 3