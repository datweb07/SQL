use NORTHWND
go

--IN: có ý nghĩa tương tự như OR, cho phép kiểm tra với nhiều giá trị cùng lúc
--NOT IN: giá trị của column khác với các giá trị đã được chỉ định

/*
lọc ra tất cả các đơn hàng với điều kiện: 
a, Đơn hàng được giao đến Germany, UK, Brazil
b, Đơn hàng được giao đến các quốc gia khác 3 quốc gia trên
*/

select * from Orders where ShipCountry in ('Germany', 'UK', 'Brazil')
select * from Orders where ShipCountry not in ('Germany', 'UK', 'Brazil')


--lấy ra các sản phẩm có mã thể loại khác với 2, 3, 4
select * from Products where CategoryID not in (2, 3, 4)

--liệt kê các nhân viên không phải là nữ từ bảng nhân viên
select * from Employees where TitleOfCourtesy not in ('Ms.', 'Mrs.')

--liệt kê các nhân viên là nữ từ bảng nhân viên
select * from Employees where TitleOfCourtesy in ('Ms.', 'Mrs.')

--lấy ra tất cả các khách hàng đến từ các thành phố: Berlin, London, Warszawa
select * from Customers where City in ('Berlin', 'London', 'Warszawa')