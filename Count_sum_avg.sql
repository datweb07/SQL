use NORTHWND
go

/*
count(): điếm số lượng (khác null) trong 1 cột
count(*): đếm số lượng bao nhiêu dòng trong 1 cột
*/

--đếm số lượng khách hàng có trong bảng Customers
select Count(*) as 'Số khách hàng' from Customers

/*
sum(): tổng giá trị của 1 cột, 
nếu giá trị của cột là null, kết quả của hàm sum là null
*/

--tổng số tiền vận chuyển Freight của tất cả các đơn hàng
select Sum(Freight) as 'Tổng Tiền' from Orders
/*
avg(): tính giá trị trung bình cho 1 cột, 
nếu tất cả giá trị trong cột là null, kết quả của hàm avg sẽ là null
nếu chỉ một vài giá trị là null, avg sẽ bỏ qua các giá trị null và tính trung bình cho các giá trị khác
*/

--trung bình số lượng đặt hàng Quantity của tất cả các sản phẩm trong bảng Order Details


--số lượng, tổng số lượng hàng tồn kho và trung bình giá của sản phẩm có trong bảng Product
select 
count(*) as 'Số Lượng', 
sum(UnitsInStock) as 'Hàng Tồn Kho', 
avg(UnitPrice) as 'TB Giá Sản Phẩm' 
from Products

--đếm số lượng đơn hàng từ bảng Orders 
select Count(*) as 'Số Lượng' from Orders
select Count(OrderID) as 'Số Lượng' from Orders

--tính avg của cột UnitPrice, sum của cột Quantity trong bảng Order Details
select avg(UnitPrice) as 'Unit Price', sum(Quantity) as 'Sum Quantity' from [Order Details]