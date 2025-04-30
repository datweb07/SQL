--cú pháp update
/*
update table_name
set column1 = value1, column2 = value2,...
where condition
*/
use NORTHWND
go

select *
into Customers_1
from Customers

--cập nhật địa chỉ của khách hàng có mã là 'ALFKI'
update Customers_1
set Address = 'VN'
where CustomerID = 'ALFKI'

--tăng giá hết toàn bộ sản phẩm lên 10%
select *
into Products_1
from Products

update Products_1
set UnitPrice = UnitPrice + UnitPrice * 0.1

--cập nhật thông tin của sản phẩm có ProductID = 7 trong bảng Products để thay đổi tên sản phẩm thành "Máy tính xách tay mới" và giá bán thành 899$
update Products_1
set ProductName = 'Máy tính xách tay mới', UnitPrice = 999
where ProductID = 7


--cập nhật quốc gia 'Pháp' của tất cả các khách hàng có thành phố là Paris trong bảng Customers
update Customers_1
set Country = 'Pháp'
where City = 'Paris'