use NORTHWND
go

--where: dòng để lọc các bản ghi, đáp ứng một điều kiện cụ thể
--liệt kê tất cả các nhân viên đến từ thành phố London theo thứ tự từ A-Z
select * 
from Employees
where City = 'London' 
order by LastName asc

--liệt kê tất cả các đơn hàng bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
select OrderID, ShippedDate, RequiredDate
from Orders
where ShippedDate > RequiredDate

--lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
select *
from [Order Details]
where Discount > 0.1

--liệt kê tất cả các đơn hàng được gửi đến quốc gia là "France"
select * from Orders where ShipCountry = 'France'

--liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) > 20
select * from Products where UnitsInStock > 20