use NORTHWND
go

--like: lọc dữ liệu trong chuỗi
/*
có hai ký tự đại diện thường được sử dụng cùng với Like:
dấu % đại diện cho không, một hoặc nhiều ký tự
dấu _ đại diện cho một ký tự đơn
*/

--lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
select * 
from Customers
where Country like 'A%'

--lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ 'a'
select * 
from Orders
where ShipCity like '%a%'

--lọc ra tất cả các đơn hàng với điều kiện: ShipCountry like 'U_', ShipCountry like 'U%'
select * 
from Orders 
where ShipCountry like 'U_'

select * 
from Orders 
where ShipCountry like 'U%'

---lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
select * 
from Suppliers 
where CompanyName like '%b%'