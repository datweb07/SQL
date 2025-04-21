use NORTHWND
go

--tính số lượng sản phẩm còn lại trong kho (UnitsInStock) sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder)
--StockRemaining = UnitsInStock - UnitsOnOrder
select (UnitsInStock - UnitsOnOrder) as StockRemaining from Products

--giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
--OrderDetailValue = UnitPrice x Quantity
select UnitPrice, Quantity, (UnitPrice * Quantity) as OrderDetailValue from [Order Details]

--tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình của các đơn hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
-- FreightRatio = AVG(Freight) / MAX(Freight)
select (avg(freight) / max(freight)) as FreightRatio from Orders

--liệt kê danh sách các sản phẩm, và giá (UnitPrice) của từng sản phẩm sẽ được giảm 10%
select ProductName, (UnitPrice * 0.9) as Price from Products