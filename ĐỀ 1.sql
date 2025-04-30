--ĐỀ 1
-- Tạo cơ sở dữ liệu
CREATE DATABASE SalesDB;
GO

USE SalesDB;
GO

-- Bảng Customer
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    Address NVARCHAR(255)
);

-- Bảng Employee
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20)
);

-- Bảng Orders
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Bảng Product
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Bảng OrderDetail
CREATE TABLE OrderDetail (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Chèn dữ liệu vào bảng Customer
INSERT INTO Customer (Name, Email, Phone, Address) VALUES
('Nguyen Van A', 'a@gmail.com', '0123456789', 'Hanoi'),
('Le Thi B', 'b@gmail.com', '0987654321', 'HCM'),
('Tran Van C', 'c@gmail.com', '0345678901', 'Da Nang'),
('Pham Thi D', 'd@gmail.com', '0567890123', 'Can Tho'),
('Hoang Van E', 'e@gmail.com', '0789012345', 'Hue');

-- Chèn dữ liệu vào bảng Employee
INSERT INTO Employee (Name, Position, Email, Phone) VALUES
('Nguyen Tuan', 'Manager', 'tuan@gmail.com', '0901234567'),
('Tran Ha', 'Sales', 'ha@gmail.com', '0912345678'),
('Le Khang', 'Support', 'khang@gmail.com', '0923456789'),
('Pham Hieu', 'Sales', 'hieu@gmail.com', '0934567890'),
('Dang Phuc', 'Manager', 'phuc@gmail.com', '0945678901');

-- Chèn dữ liệu vào bảng Product
INSERT INTO Product (Name, Price, StockQuantity) VALUES
('Laptop', 15000000, 10),
('Smartphone', 8000000, 20),
('Tablet', 5000000, 15),
('Monitor', 3000000, 25),
('Keyboard', 500000, 50);

-- Chèn dữ liệu vào bảng Orders
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount) VALUES
(1, 2, '2025-03-06', 15000000),
(2, 3, '2025-03-05', 8000000),
(3, 1, '2025-03-04', 5000000),
(4, 4, '2025-03-03', 3000000),
(5, 5, '2025-03-02', 500000),
(1, 3, '2025-03-07', 20000000); -- Thêm đơn hàng mới cho khách hàng CustomerID=1

-- Chèn dữ liệu vào bảng OrderDetail
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 15000000),
(2, 2, 1, 8000000),
(3, 3, 1, 5000000),
(4, 4, 1, 3000000),
(5, 5, 1, 500000),
(6, 1, 2, 20000000); -- Thêm chi tiết đơn hàng cho đơn mới

--1)	Hiển thị danh sách các sản phẩm cùng giá của nó 
SELECT Product.Name, OrderDetail.UnitPrice
FROM OrderDetail
JOIN Product ON OrderDetail.ProductID = Product.ProductID
WHERE OrderDetail.OrderID = 1;

--2)	Truy vấn danh sách tất cả đơn hàng cùng với tên khách hàng 
select o.OrderID, c.CustomerID, c.Name
from Customer as c
join Orders as o
on c.CustomerID = o.CustomerID


/*
3)	Truy vấn chi tiết một đơn hàng cụ thể (bao gồm các thông tin: 
Mã đơn hàng chi tiết, 
Mã đơn hàng, 
Tên khách hàng, 
Tên sản phẩm, 
Số lượng, 
Đơn giá, 
Tổng giá trị đơn hàng) 
*/
select od.OrderDetailID, o.OrderID, c.Email, p.Name, od.Quantity, od.UnitPrice, o.TotalAmount
from Orders as o, Customer as c, Product as p, OrderDetail as od
where o.OrderID = od.OrderID and o.CustomerID = c.CustomerID and p.ProductID = od.ProductID

SELECT 
    od.OrderDetailID, 
    o.OrderID, 
    c.Email, 
    p.Name AS ProductName, 
    od.Quantity, 
    od.UnitPrice, 
    o.TotalAmount
FROM OrderDetail AS od
JOIN Orders AS o ON od.OrderID = o.OrderID
JOIN Customer AS c ON o.CustomerID = c.CustomerID
JOIN Product AS p ON od.ProductID = p.ProductID;

/*
4)	Truy vấn các sản phẩm có số lượng tồn kho dưới 20 
*/
select *
from Product
where Product.StockQuantity < 20

/*
5)	Truy vấn số đơn hàng của từng khách hàng 
*/

select c.CustomerID, c.Name, count(o.OrderID) as TotalOrders
from Orders as o, Customer as c
where c.CustomerID = o.CustomerID
group by c.CustomerID, c.Name

SELECT 
    c.CustomerID, 
    c.Name AS CustomerName, 
    COUNT(o.OrderID) AS OrderCount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

/*
6)	Truy vấn sản phẩm bán chạy nhất (có tổng số lượng bán cao nhất) 
*/
select p.ProductID, p.Name, sum(od.Quantity) as TotalQuantity
from OrderDetail as od, Product as p
where p.ProductID = od.ProductID
group by p.ProductID, p.Name
order by sum(od.Quantity) desc 

SELECT 
    p.ProductID, 
    p.Name AS ProductName, 
    SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalQuantitySold DESC

/*
7)	Truy vấn lấy danh sách đơn hàng do một nhân viên cụ thể xử lý 
*/
select e.EmployeeID, e.Name, o.OrderID, o.OrderDate, o.TotalAmount
from Orders as o, Employee as e
where o.EmployeeID = 2 and e.EmployeeID = o.EmployeeID

SELECT 
    o.OrderID, 
    o.CustomerID, 
    c.Name AS CustomerName, 
    o.OrderDate, 
    o.TotalAmount
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
WHERE o.EmployeeID = 2;  -- Thay "1" bằng EmployeeID của nhân viên cụ thể

/*
8)	Truy vấn lấy tổng doanh thu bán hàng trong một khoảng thời gian nhất định 
*/
select sum (TotalAmount) as TotalOrders
from Orders
where OrderDate between '2025-01-01 ' and '2025-12-31'

/*
9)	Truy vấn các đơn hàng được đặt trong một khoảng thời gian 
*/
select o.*, c.Name
from Orders as o, Customer as c
where OrderDate between '2025-01-01' and '2025-12-31' and o.CustomerID = c.CustomerID

SELECT 
    o.OrderID, 
    o.CustomerID, 
    c.Name AS CustomerName, 
    o.OrderDate, 
    o.TotalAmount
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate BETWEEN '2025-01-01' AND '2025-12-31';  -- Thay đổi ngày theo nhu cầu

/*
10)	Truy vấn chi tiêu của từng khách hàng 
*/
select c.CustomerID, c.Name, sum(o.TotalAmount) as TotalAmount
from Customer as c, Orders as o
where c.CustomerID = o.CustomerID
group by c.CustomerID, c.Name

SELECT 
    c.CustomerID, 
    c.Name AS CustomerName, 
    SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;
