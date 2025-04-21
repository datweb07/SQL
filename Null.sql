use NORTHWND
go

--IS NULL: giá trị của column bị NULL
--IS NOT NULL: giá trị của column khác NULL (chưa chắc nó không rổng, có thể là empty)

--lấy ra tất cả các đơn hàng chưa được giao hàng 
select * from Orders where ShippedDate is null
select count(*) as 'Chưa Được Giao' from Orders where ShippedDate is null

--lấy danh sách các khách hàng có khu vực (Region) không bị NULL
select * from Customers where Region is not null

--lấy danh sách các khách hàng không có tên công ty
select * from Customers where CompanyName is null

--lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion) không NULL
select * from Orders where ShippedDate is null and ShipRegion is not null