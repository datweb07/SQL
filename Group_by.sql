use NORTHWND
go

--group by: dùng để nhóm các dòng dữ liệu có cùng giá trị 
--thường dùng chung với các hàm: count(), max(), min(), sum(), avg()

--mỗi khách hàng đã đặt bao nhiêu đơn hàng
select CustomerID, count(*) as 'TotalOrders' from Orders group by CustomerID

--tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
select SupplierID, avg(UnitPrice) as 'AveragePrice' from Products group by SupplierID

--cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsOnStock)
select CategoryID, sum( UnitsInStock) as 'TotalProduct' 
from Products 
group by CategoryID

--cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau
select ShipCity, ShipCountry, max(Freight) as 'MaxValue', min(Freight) as 'MinValue' 
from Orders 
group by ShipCity, ShipCountry
order by ShipCity asc, ShipCountry asc

--thống kê số lượng nhân viên theo từng quốc gia
select Country, count(*) as 'Số nhân viên'
from Employees 
group by Country