use NORTHWND
go

--Min, Max: tìm giá trị nhỏ nhất và lớn nhất của 1 cột

--tìm giá min của các sản phẩm trong bảng Products
select MIN(UnitPrice) as 'Giá Thấp Nhất' from Products

--lấy ra ngày đặt hàng gần đây nhất từ bảng Orders
select Max(OrderDate) from Orders

--tìm ra sản phẩm (mã và tên) có số hàng tồn kho (UnitsInStock) lớn nhất
--tìm số lượng hàng trong kho (UnitsInStock) lớn nhất
select Max(UnitsInStock) as 'Max' from Products

--tìm ra tuổi lớn nhất của nhân viên trong công ty
select Min(BirthDate) from Employees