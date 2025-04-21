use NORTHWND
go

--select distinct from: lấy ra các dữ liệu riêng biệt, không trùng lặp
--lấy ra tên các quốc gia khác nhau (không trùng lặp)
select distinct Country from Customers
--lấy ra mã bưu điện khác nhau
select distinct PostalCode from Suppliers
--lấy ra họ của nhân viên và cách gọi danh hiệu lịch sự
select distinct LastName, TitleOfCourtesy from Employees
--lấy mã đơn vị vận chuyển
select distinct ShipVia from Orders