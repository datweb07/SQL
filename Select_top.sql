use NORTHWND
go

--select top: giới hạn số dòng (hoặc %) được trả về khi gọi lệnh Select
--lấy ra 5 dòng đầu tiên trong bảng Customers
select top 5 CustomerID from Customers
select top 10 * from Customers

--lấy ra 30% nhân viên của công ty
select top 30 percent LastName + ' ' + FirstName as nameEmployees from Employees

--lấy ra các đơn hàng với quy định là mã khách hàng không được trùng lặp, chỉ lấy 5 dòng dữ liệu đầu tiên
select distinct top 5 CustomerID from Orders

--lấy ra các sản phẩm có mã thể loại không bị trùng lặp, và chỉ lấy ra 3 dòng đầu tiên
select distinct top 3 ProductID from Products