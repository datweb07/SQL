--ĐỀ 3
-- Tạo database
CREATE DATABASE DBTEST; -- Thay bằng MSSV của bạn
USE DBTEST;

-- Tạo các bảng
CREATE TABLE CONGVIEC (
    MACV CHAR(4) PRIMARY KEY,
    TENCV NVARCHAR(50),
    LUONGTHEOGIO DECIMAL(10,2)
);

CREATE TABLE NHANVIEN (
    MANV CHAR(4) PRIMARY KEY,
    MACV CHAR(4),
    HOTEN NVARCHAR(50),
    NGAYVAOLAM DATE,
    DIACHI NVARCHAR(100),
    SDT CHAR(10),
    GIOLAM INT
);

CREATE TABLE LOAISANPHAM (
    MALOAI CHAR(4) PRIMARY KEY,
    TENLOAI NVARCHAR(50)
);

CREATE TABLE SANPHAM (
    MASP CHAR(4) PRIMARY KEY,
    MALOAI CHAR(4),
    TENSP NVARCHAR(50),
    GIA DECIMAL(10,2)
);

CREATE TABLE KHACHHANG (
    MAKH CHAR(4) PRIMARY KEY,
    TENKH NVARCHAR(50),
    SDT CHAR(10),
    NGAYSINH DATE,
    DOANHSO DECIMAL(12,2),
    NGAYDK DATE
);

CREATE TABLE HOADON (
    MAHD CHAR(4) PRIMARY KEY,
    MANV CHAR(4),
    MAKH CHAR(4),
    TRIGIA DECIMAL(12,2),
    NGAYHD DATE
);

CREATE TABLE CTHD (
    MAHD CHAR(4),
    MASP CHAR(4),
    SL INT
);

CREATE TABLE PHIEUCHI (
    MAPC CHAR(4) PRIMARY KEY,
    MANV CHAR(4),
    LOAPC NVARCHAR(50),
    TRIGIA DECIMAL(12,2),
    NGAYCHI DATE
);

-- Chèn dữ liệu mẫu
INSERT INTO CONGVIEC VALUES 
('CV01', N'Thu ngân', 50000),
('CV02', N'Bồi bàn', 40000),
('CV03', N'Quản lý', 80000);

INSERT INTO NHANVIEN VALUES
('NV01', 'CV01', N'Nguyễn Văn A', '2020-01-15', N'Hà Nội', '0987654321', 300),
('NV02', 'CV01', N'Trần Thị B', '2021-03-20', N'TP.HCM', '0912345678', 280),
('NV03', 'CV02', N'Lê Văn C', '2022-05-10', N'Đà Nẵng', '0978123456', 200),
('NV04', 'CV03', N'Phạm Thị D', '2019-11-05', N'Hải Phòng', '0965432187', 350);

INSERT INTO LOAISANPHAM VALUES
('CF', N'Cà phê'),
('TS', N'Trà sữa'),
('FD', N'Đồ ăn nhanh');

INSERT INTO SANPHAM VALUES
('CF01', 'CF', N'Cà phê đen', 25000),
('CF02', 'CF', N'Cà phê sữa', 30000),
('TS01', 'TS', N'Trà sữa trân châu', 35000),
('TS02', 'TS', N'Trà sữa matcha', 40000),
('FD01', 'FD', N'Bánh mì sandwich', 20000),
('FD02', 'FD', N'Bánh ngọt', 25000);

INSERT INTO KHACHHANG VALUES
('KH01', N'Nguyễn Thị E', '0901122334', '1990-05-15', 5000000, '2021-01-10'),
('KH02', N'Trần Văn F', '0915222333', '1985-08-20', 3000000, '2022-03-05'),
('KH03', N'Lê Thị G', '0987654321', '1995-11-30', 1500000, '2023-02-15');

INSERT INTO HOADON VALUES
('HD01', 'NV01', 'KH01', 100000, '2023-05-10'),
('HD02', 'NV02', 'KH02', 75000, '2023-05-15'),
('HD03', 'NV01', 'KH03', 120000, '2023-06-20'),
('HD04', 'NV02', 'KH01', 90000, '2023-06-25');

INSERT INTO CTHD VALUES
('HD01', 'CF01', 2),
('HD01', 'TS01', 1),
('HD02', 'FD01', 3),
('HD02', 'TS02', 1),
('HD03', 'CF02', 4),
('HD04', 'TS01', 2),
('HD04', 'FD02', 1);

INSERT INTO PHIEUCHI VALUES
('PC01', 'NV04', N'Tiền điện', 5000000, '2023-05-01'),
('PC02', 'NV04', N'Tiền nước', 2000000, '2023-05-05'),
('PC03', 'NV04', N'Tiền nguyên liệu', 8000000, '2023-06-10');

/*
Tạo khóa ngoại từ bảng NHANVIEN tham chiếu đến bảng CONGVIEC
*/
alter table NHANVIEN
add foreign key (MACV) references CONGVIEC(MACV)

/*
Tạo khóa chính cho bảng CTHD
*/
alter table CTHD
alter column MAHD char(4) not null;

alter table CTHD
alter column MASP char(4) not null;

alter table CTHD
add primary key (MAHD, MASP);

alter table CTHD
add foreign key (MAHD) references HOADON(MAHD);

alter table CTHD
add foreign key (MASP) references SANPHAM(MASP);

/*
Tăng đơn giá (GIA) cho các sản phẩm có mã loại (MALOAI) là "TS" thêm 15%
*/
update SANPHAM
set GIA = GIA + GIA * 0.15
where MALOAI like 'TS'

/*
Xoá những nhân viên bồi bàn có giờ làm việc (GIOLAM) nhỏ hơn 220
*/
delete 
from NHANVIEN
where GIOLAM < 220 and MACV = 'CV02'

DELETE FROM NHANVIEN
WHERE MANV IN (
    SELECT nv.MANV 
    FROM NHANVIEN nv
    JOIN CONGVIEC cv ON nv.MACV = cv.MACV
    WHERE cv.TENCV = N'Bồi bàn' AND nv.GIOLAM < 220
);

/*
Cho biết mã khách hàng (MAKH), tên khách hàng (TENKH) mua hàng trong tháng 6/2023
*/
select kh.MAKH, kh.TENKH
from HOADON as hd
join KHACHHANG as kh on hd.MAKH = kh.MAKH
where month(hd.NGAYHD) = 06 and year(hd.NGAYHD) = 2023

/*
Cho biết tên các sản phẩm nào đã được khách hàng đặt mua với số lượng mua lớn hơn 2
*/
select sp.TENSP
from CTHD as c
join SANPHAM as sp on c.MASP = sp.MASP
where c.SL > 2

/*
Cho biết tên nhân viên không thực hiện bất kỳ phiếu chi nào
*/
 select nv.MANV, nv.HOTEN
 from NHANVIEN as nv
 where nv.MANV not in (
	select MANV
	from PHIEUCHI
 )

 /*
 Cho biết thông tin của loại sản phẩm (MALOAI, TENLOAI) được bán nhiều nhất cùng với tổng số lượng đã bán ra của loại sản phẩm này
 */
 select top 1 lsp.MALOAI, lsp.TENLOAI, sum(ct.SL) as TotalSL
 from SANPHAM as sp
 join CTHD as ct on sp.MASP = ct.MASP
 join LOAISANPHAM as lsp on sp.MALOAI = lsp.MALOAI
 group by lsp.MALOAI, lsp.TENLOAI
 order by sum(ct.SL) desc

 SELECT TOP 1 l.MALOAI, l.TENLOAI, SUM(ct.SL) AS TongSoLuong
FROM LOAISANPHAM l
JOIN SANPHAM sp ON l.MALOAI = sp.MALOAI
JOIN CTHD ct ON sp.MASP = ct.MASP
GROUP BY l.MALOAI, l.TENLOAI
ORDER BY TongSoLuong DESC;
