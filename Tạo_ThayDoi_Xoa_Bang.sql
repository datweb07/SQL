create database NVDB
go

use NVDB
go

create table NhanVien(
	MaNV int not null primary key,
	HoTen varchar(50) not null,
	Phai varchar(50),
	NgaySinh varchar(255),
	DiaChi varchar(255),
	SDT varchar(10)
)
go

--Constraints: các lệnh bổ sung khi tạo bảng
/*
identity: tạo cột tự tăng
identity(seed, incremenet): tạo cột tự tăng với giá trị seed bắt đầu và increment tăng bao nhiêu qua mỗi lần
default: thiết lập giá trị mặc định cho cột
check: thiết lập ràng buộc kiểm tra cho cột
unique: thiết lập ràng buộc duy nhất cho cột
*/

create table KhachHang(
	MaKH int identity (1,1) not null primary key,
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	SDT varchar(10) check (SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

--thêm cột Email vào bảng NhanVien
alter table NhanVien
add Email varchar(100)

--đổi độ dài tối đa của HoTen
alter table NhanVien
alter column HoTen varchar(100)

--thêm ràng buộc ngày sinh phải <= ngày hôm nay
alter table NhanVien
add constraint NgaySinhCheck check (NgaySinh <= getdate())

--chỉ xóa dữ liệu trong bảng NhanVien
truncate table NhanVien


--BÀI TẬP
create table SinhVien(
	MaSV int identity(1,1) not null primary key,
	HoTen varchar(50) not null,
	Lop varchar(20),
	Nganh varchar(20),
	DiemTB float
)

alter table SinhVien
add Email varchar(100)

alter table SinhVien
alter column DiemTB decimal(2,1)

alter table SinhVien
drop column Nganh

alter table SinhVien
add constraint KiemTraDiemTB check (DiemTB >=0 and DiemTB <= 10)

alter table SinhVien
add constraint DuyNhatMaSV unique(MaSV)

truncate table SinhVien
