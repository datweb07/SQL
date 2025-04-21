use NORTHWND
go

--and: hiển thị một bản ghi nếu tất cả các điều kiện được phân tách bằng AND đều có giá trị TRUE
--or: hiển thị một bản ghi nếu có ít nhất 1 điều kiện được phân tách bằng OR có giá trị TRUE
--not: hiển thị một bản ghi nếu điều kiện có giá trị không đúng FALSE

--liệt kê tất cả các sản phẩm có số lượng trong kho (UnitsInStock) thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
select * 
from Products 
where UnitsInStock < 50 or UnitsInStock > 100

--liệt kê tất cả các đơn hàng được giao đến Brazil, đã bị giao muộn, biết ngày cần giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
select *
from Orders
where ShipCountry = 'Brazil' and ShippedDate > RequiredDate

--lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1
select * from Products where UnitPrice < 100 and not CategoryID = 1

--lấy ra tất cả đơn hàng có giá vận chuyển Freight trong khoảng [50, 100]$
select * from Orders where 50 <= Freight and Freight <= 100

--lấy ra các sản phẩm có số lượng hàng trong kho (UnitsInStock) > 20 và số lượng hàng trong đơn hàng (UnitsOnOrder) < 20
select * from Products where UnitsInStock > 20 and UnitsOnOrder < 20