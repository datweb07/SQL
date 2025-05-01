--Stored Procedures
--cú pháp
/*
create procedure [database_name].[schema_name].[procedure_name]
(
	[parameter_1] [datatype] [parameter_2] [datatype]...
)
as 
begin 
	[statements]
end
*/
use NORTHWND
go

--tạo một stored procedure để lấy thông tin về sản phẩm dựa trên tên sản phẩm được cung cấp
create procedure GetProductByName
	@ProductName nvarchar(100)
as
begin 
	select *
	from Products as p
	where p.ProductName = @ProductName
end

--sử dụng stored procedure
exec GetProductByName 'Chai'
exec GetProductByName 'Chang'
exec GetProductByName 'Ikura'


--tạo stored procedure để tính tổng doanh số bán hàng của 1 nhân viên dựa trên EmployeeID
create procedure GetEmployeeSalesTotal
	@EmployeeID int
as 
begin
	select sum(UnitPrice * Quantity) as TotalSales
	from Orders as o
	join [Order Details] as od on o.OrderID = od.OrderID
	where o.EmployeeID = @EmployeeID
end

--sử dụng
exec GetEmployeeSalesTotal @EmployeeID = 1
exec GetEmployeeSalesTotal @EmployeeID = 2
exec GetEmployeeSalesTotal @EmployeeID = 3


--tạo 1 stored procedure để thêm mới khách hàng vào bảng Customers
create procedure AddCustomer
	@CustomerID nvarchar(5),
	@CompanyName nvarchar(40),
	@ContactName nvarchar(30),
	@ContactTitle nvarchar(30)
as
begin 
	insert into Customers (CustomerID, CompanyName, ContactName, ContactTitle)
	values (@CustomerID, upper(@CompanyName), @ContactName, @ContactTitle)
end

--sử dụng
exec AddCustomer @CustomerID = 'NEW', @CompanyName = 'd&g', @ContactName = 'Van A', @ContactTitle = 'A'


--tạo 1 stored procedure để cập nhật giá của tất cả các sản phẩm thuộc một danh mục cụ thể
create procedure IncreasePrice
	@ProductID int,
	@PriceIncrease decimal(10, 2)
as 
begin
	update Products
	set UnitPrice = UnitPrice + @PriceIncrease
	where ProductID = @ProductID
end

--sử dụng
exec IncreasePrice @ProductID = 1, @PriceIncrease = 100

--BÀI TẬP
/*
tạo 1 stored procedure để truy xuất danh sách các đơn đặt hàng cho một khách hàng dựa trên tên khách hàng
tham số đầu vào là tên khách hàng, và stored procedure sẽ trả về danh sách các đơn đặt hàng liên quan
*/
create procedure GetListOrders
	@ContactName nvarchar(100)
as 
begin
	select o.*
	from Orders as o
	join Customers as c on o.CustomerID = c.CustomerID
	where c.ContactName = @ContactName
end

--sử dụng
exec GetListOrders @ContactName = 'Maria Anders'


/*
tạo một stored procedure để cập nhật số lượng hàng tồn kho cho 1 sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới. 
Stored Procedure này sẽ nhận vào ID sản phẩm và số lượng mới, sau đó cập nhật số lượng tồn kho trong bảng Products
*/
create procedure UpdateInventoryProducts
	@ProductID int, 
	@NewAmount int
as 
begin
	update Products_1
	set UnitsInStock = @NewAmount
	where ProductID = @ProductID
end

--sử dụng
exec UpdateInventoryProducts @ProductID = 1, @NewAmount = 999


/*
tạo stored procedure để truy xuất danh sách các sản phẩm thuộc một danh mục cụ thể và giới hạn số lượng sản phẩm trả về
tham số đầu vào bao gồm ID danh mục và số lượng sản phẩm cần trả về
*/
create procedure GetListProducts
	@OrderID int,
	@QuantityProducts int
as
begin 
	select top (@QuantityProducts)*
	from [Order Details]
	where OrderID = @OrderID
	order by ProductID
end

--sử dụng 
exec GetListProducts @OrderID = 10248, @QuantityProducts = 3

drop procedure GetListProducts

/*
tạo một stored procedure để truy xuất danh sách khách hàng dựa trên khu vực địa lý (region) hoặc quốc gia (country) của ho. 
Tham số đầu vào sẽ là khu vực địa lý hoặc quốc gia và stored procedure sẽ trả về danh sách các khách hàng trong khu vực đó
*/
create procedure GetCustomer
	@Country nvarchar(100)
as
begin
	select *
	from Customers
	where Country = @Country
end

--sử dụng
exec GetCustomer @Country = 'Germany'