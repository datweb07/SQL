--triggers
/*
create trigger trigger_name
on table_name
after | for {insert | update | delete}
as 
begin
	statement
end
*/
use NORTHWND
go

create trigger MakeProductNameUpperCase
on Products
after insert 
as
begin
	update Products
	set ProductName = upper(i.ProductName)
	from inserted i 
	where Products.ProductID = i.ProductID
end

--sử dụng
insert Products (ProductName, SupplierID, CategoryID)
values ('test', 1, 1)


--chặn không cho phép cập nhật số lượng sản phẩm khác 0 hoặc khác 1
update Products
set Discontinued = -1
where ProductID = 79

create trigger PreventNegativeDiscontinued
on Products
for update
as
begin
	set nocount on
	if exists (select 1 from inserted where Discontinued != 0 or Discontinued != 1)
	begin
		rollback
		raiserror('Discontinued không thể khác 0 hoặc khác 1', 16, 1)
	end
end

drop trigger PreventNegativeDiscontinued


--viết trigger để đảm bảo rằng mỗi khi có một chi tiết đơn hàng mới được thêm vào, số lượng tồn kho phải được giảm đi
create trigger UpdateProductInventory
on [Order Details]
after insert
as
begin
	update Products
	set UnitsInStock = UnitsInStock - (select Quantity from inserted where Products.ProductID = inserted.ProductID)
	where Products.ProductID in (select ProductID from inserted)
end

insert into [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
values (10248, 75, 10, 50, 0)

drop trigger UpdateProductInventory