use NORTHWND
go

--lọc tất cả các khách hàng bắt đầu bằng chữ 'A'
select * from Customers where ContactName like 'A%'

--lọc tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'H' và có chữ thứ 2 là bất kỳ ký tự nào
select * from Customers where ContactName like 'H_%'

--lọc tất cả các hóa đơn được gửi đến thành phố có chữ cái bắt đầu là L, chữ thứ hai là u hoặc o
select * from Orders where ShipCity like 'L[u,o]%'

--lọc tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L. chữ thứ hai không phải là u hoặc o
select * from Orders where ShipCity like 'L[^u,o]%'

--lọc tất cả các đơn hàng được gửi đến thành phố có chữ bắt đầu là L, chữ cái thứ hai là các ký tự từ a-e
select * from Orders where ShipCity like 'L[a-e]%'

--lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và không chứa ký tự b
select * from Suppliers where CompanyName like 'A%' and CompanyName not like '%b%'
select * from Suppliers where CompanyName like 'A%[^b]%' 