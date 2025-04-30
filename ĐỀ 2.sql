--ĐỀ 2
CREATE DATABASE QLSV
go

Use QLSV
go
CREATE TABLE LOPHOC (
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop VARCHAR(50) NOT NULL
);
go
CREATE TABLE SINHVIEN (
    MaSV VARCHAR(10) PRIMARY KEY,
    TenSV VARCHAR(50) NOT NULL,
    NgaySinh DATE,
    MaLop VARCHAR(10),
    FOREIGN KEY (MaLop) REFERENCES LOPHOC(MaLop)
);
go
CREATE TABLE MONHOC (
    MaMH VARCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(50) NOT NULL,
    SoTC INT NOT NULL
);
go
CREATE TABLE DANGKY_HP (
    MaSV VARCHAR(10),
    MaMH VARCHAR(10),
    TongSo INT NOT NULL,
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH)
);
go
CREATE TABLE DIEM (
    MaSV VARCHAR(10),
    MaMH VARCHAR(10),
    Diem FLOAT CHECK (Diem >= 0 AND Diem <= 10),
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH)
);
go
-- Chèn dữ liệu vào bảng LOPHOC
INSERT INTO LOPHOC VALUES
('L01', 'Lớp 1'),
('L02', 'Lớp 2'),
('L03', 'Lớp 3'),
('L04', 'Lớp 4'),
('L05', 'Lớp 5');
go
-- Chèn dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN VALUES
('SV01', 'Nguyen Van A', '2001-01-01', 'L01'),
('SV02', 'Tran Thi B', '2002-02-02', 'L02'),
('SV03', 'Le Van C', '2003-03-03', 'L03'),
('SV04', 'Pham Thi D', '2004-04-04', 'L04'),
('SV05', 'Hoang Van E', '2005-05-05', 'L05');
go
-- Chèn dữ liệu vào bảng MONHOC
INSERT INTO MONHOC VALUES
('MH01', 'Toan', 3),
('MH02', 'Van', 2),
('MH03', 'Anh', 3),
('MH04', 'Ly', 4),
('MH05', 'Hoa', 3);
go
-- Chèn dữ liệu vào bảng DANGKY_HP
INSERT INTO DANGKY_HP VALUES
('SV01', 'MH01', 1),
('SV02', 'MH02', 1),
('SV03', 'MH03', 1),
('SV04', 'MH04', 1),
('SV04', 'MH03', 1),
('SV05', 'MH05', 1),
('SV05', 'MH01', 1);
go
-- Chèn dữ liệu vào bảng DIEM
INSERT INTO DIEM VALUES
('SV01', 'MH01', 8.5),
('SV02', 'MH02', 7.0),
('SV03', 'MH03', 9.0),
('SV04', 'MH04', 6.5),
('SV04', 'MH03', 4.5),
('SV05', 'MH05', 7.5),
('SV05', 'MH01', 4.0);
go

/*
1)	Truy vấn danh sách tất cả sinh viên
*/
select *
from SINHVIEN

/*
2)	Truy vấn danh sách tất cả môn học 
*/
select *
from MONHOC

/*
3)	Truy vấn danh sách sinh viên và lớp học của họ
*/
select l.MaLop, s.MaSV, s.TenSV
from SINHVIEN as s
join LOPHOC as l on s.MaLop = l.MaLop

SELECT sv.MaSV, sv.TenSV, sv.NgaySinh, lh.TenLop
FROM SINHVIEN sv
JOIN LOPHOC lh ON sv.MaLop = lh.MaLop;

/*
4)	Hãy thêm cột dữ liệu lưu địa chỉ (DIACHI) của sinh viên 
*/
alter table SINHVIEN
add DIACHI nvarchar(255)

/*
5)	Hãy cho biết điểm của một sinh viên bất kỳ với môn học bất kỳ
*/
select sv.MaSV, sv.TenSV, mh.MaMH, mh.TenMH, d.Diem
from DIEM as d
join SINHVIEN as sv on d.MaSV = sv.MaSV
join MONHOC as mh on d.MaMH = mh.MaMH
where sv.MaSV = 'SV02' and mh.MaMH = 'MH02'

/*
6)	Hãy chọn ra những sinh viên có điểm môn Toán >=5
*/
select sv.MaSV, sv.TenSV, mh.MaMH, mh.TenMH, d.Diem
from DIEM as d
join SINHVIEN as sv on d.MaSV = sv.MaSV
join MONHOC as mh on d.MaMH = mh.MaMH
where mh.TenMH = 'Toan' and d.Diem >= 5

/*
7)	Hãy cho biết tổng số sinh viên đăng ký học ở mỗi học phần
*/
select mh.MaMH, mh.TenMH ,count(dk.MaSV) as TotalSV
from DANGKY_HP as dk
join MONHOC as mh on dk.MaMH = mh.MaMH
group by mh.MaMH, mh.TenMH

/*
8)	Truy vấn danh sách sinh viên cùng điểm số của họ trong từng môn học 
*/
select sv.MaSV, sv.TenSV, mh.MaMH, mh.TenMH, d.Diem
from DIEM as d
join SINHVIEN as sv on d.MaSV = sv.MaSV
join MONHOC as mh on d.MaMH = mh.MaMH

SELECT sv.MaSV, sv.TenSV, mh.MaMH, mh.TenMH, d.Diem
FROM DIEM d
JOIN SINHVIEN sv ON d.MaSV = sv.MaSV
JOIN MONHOC mh ON d.MaMH = mh.MaMH
ORDER BY sv.MaSV, mh.MaMH;

/*
9)	Truy vấn điểm trung bình của từng sinh viên
*/
select sv.MaSV, sv.TenSV, avg(d.Diem) as DiemTrungBinh
from DIEM as d
join SINHVIEN as sv on d.MaSV = sv.MaSV
group by sv.MaSV, sv.TenSV

SELECT sv.MaSV, sv.TenSV, AVG(d.Diem) AS DiemTrungBinh
FROM DIEM d
JOIN SINHVIEN sv ON d.MaSV = sv.MaSV
GROUP BY sv.MaSV, sv.TenSV;

/*
10)	Cho biết sinh viên có điểm môn toán cao nhất
*/
SELECT top 1 sv.MaSV, sv.TenSV, d.Diem
FROM DIEM d
JOIN SINHVIEN sv ON d.MaSV = sv.MaSV
where d.MaMH = 'MH01'
order by d.Diem desc

SELECT sv.MaSV, sv.TenSV, d.Diem
FROM DIEM d
JOIN SINHVIEN sv ON d.MaSV = sv.MaSV
JOIN MONHOC mh ON d.MaMH = mh.MaMH
WHERE mh.TenMH = 'Toan'
  AND d.Diem = (
      SELECT MAX(d2.Diem)
      FROM DIEM d2
      JOIN MONHOC mh2 ON d2.MaMH = mh2.MaMH
      WHERE mh2.TenMH = 'Toan'
  );

