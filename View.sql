--view
/*
CREATE VIEW [schema_name].[view_name] AS
SELECT [column1], [column2], ...
FROM [table_name]
WHERE [conditions]
*/
use NORTHWND
go

--tạo view
create view ThongKeTheoThang as 
select 
	year(OrderDate) as 'Năm', 
	month(OrderDate) as 'Tháng', 
	count(OrderID) as 'Số lượng'
from Orders
group by year(OrderDate), month(OrderDate)

--truy vấn đến view
 