use NORTHWND
go
--cú pháp delete
/*
delete from table_name where condition
*/
select *
into Customers_1
from Customers

--xóa đi khách hàng có mã 'ALFKI'
delete from Customers_1 
where CustomerID like 'ALFKI'


select distinct Country from Customers_1
--xóa đi toàn bộ khách hàng có quốc gia bắt đầu bằng U
delete from Customers_1
where Country like 'U%'

--xóa sạch một bảng
delete from Customers_1


--tạo bảng NewOrdes từ bảng Orders và xóa đi đơn hàng có OrderID = 10248
select *
into NewOrders
from Orders

delete from NewOrders where OrderID like '10248'

--tạo bảng NewProducts từ bảng Products và xóa đi sản phẩm có UnitsInStock = 0
select *
into NewProducts
from Products

delete from NewProducts where UnitsInStock like '0'