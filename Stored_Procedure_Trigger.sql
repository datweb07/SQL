/*==============STORED PROCEDURE=============*/
create database QLSV_UEH--Tạo CSDL có tên QLSV
go
use QLSV_UEH
go
/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
MaKhoa varchar(2) primary key,
TenKhoa nvarchar(30) not null,
)
/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
MaSV varchar(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7) not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar(20),
MaKhoa varchar(2) references DMKhoa(MaKhoa),
HocBong float,
)
/*===================MON HOC========================*/
create table DMMH
(
MaMH varchar(2) not null primary key,
TenMH nvarchar(25) not null,
SoTiet tinyint
)
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV varchar(3)not null references DMSV(MASV),
MaMH varchar(2)not null references DMMH(MaMH),
LanThi tinyint,
Diem decimal(4,2),
primary key(MaSV,MaMH,LanThi)
)

/*==================NHAP DU LIEU====================*/

/*==============NHAP DU LIEU DMMH=============*/
Insert  DMMH(MaMH,TenMH,SoTiet)
values('01',N'Cơ Sở Dữ Liệu',45)
Insert DMMH(MaMH,TenMH,SoTiet)
values('02',N'Trí Tuệ Nhân Tạo',45)
Insert DMMH(MaMH,TenMH,SoTiet)
values('03',N'Truyền Tin',45)
Insert DMMH(MaMH,TenMH,SoTiet)
values('04',N'Đồ Họa',60)
Insert DMMH(MaMH,TenMH,SoTiet)
values('05',N'Văn Phạm',60)

/*==============NHAP DU LIEU DMKHOA=============*/
Insert DMKhoa(MaKhoa,TenKhoa)
values('AV',N'Anh Văn')
Insert DMKhoa(MaKhoa,TenKhoa)
values('TH',N'Tin Học')
Insert DMKhoa(MaKhoa,TenKhoa)
values('TR',N'Triết')
Insert DMKhoa(MaKhoa,TenKhoa)
values('VL',N'Vật Lý')


/*==============NHAP DU LIEU DMSV=============*/


SET DATEFORMAT DMY
GO

Insert DMSV
values('A01',N'Nguyễn Thị',N'Hải',N'Nữ','23/02/1990',N'Hà Nội','TH',130000)
Insert DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02',N'Trần Văn',N'Chính',N'Nam','24/12/1992',N'Bình Định','VL',150000)
Insert DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03',N'Lê Thu Bạch',N'Yến',N'Nữ','21/02/1990',N'TP Hồ Chí Minh','TH',170000)
Insert DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04',N'Trần Anh',N'Tuấn',N'Nam','20/12/1990',N'Hà Nội','AV',80000)
Insert DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01',N'Trần Thanh',N'Mai',N'Nữ','12/08/1991',N'Hải Phòng','TR',0)
Insert DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02',N'Trần Thị Thu',N'Thủy',N'Nữ','02/01/1991',N'TP Hồ Chí Minh','AV',0)

/*==============NHAP DU LIEU BANG KET QUA=============*/

Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5)
Insert KetQua(MaSV,MaMH,LanThi,Diem)

values('B02','02',1,6)
Insert KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10)


--So sánh hai môn có cùng số tiết (dùng cách khai báo biến declare)
create procedure soSanhSoTiet(
	@maMH1 varchar(2),
	@maMH2 varchar(2)
)
as
begin
	-- Khởi tạo biến soTiet
	declare @soTiet1 int
	declare @soTiet2 int

	-- Khởi tạo biến tenMH
	declare @tenMH1 nvarchar(25)
	declare @tenMH2 nvarchar(25)

	-- Gắn giá trị của biến soTiet từ bảng DMMH
	select @soTiet1 = SoTiet, @tenMH1 = TenMH 
	from DMMH 
	where MaMH = @maMH1

	select @soTiet2 = SoTiet, @tenMH2 = TenMH 
	from DMMH 
	where MaMH = @maMH2
	print N'So sánh môn ' + @tenMH1 + N' và môn ' + @tenMH2

	-- Kiểm tra điều kiện
	if (@soTiet1 = @soTiet2)
		print N'Hai môn này cùng số tiết'
	else
		print N'Hai môn này không cùng số tiết'
end

-- Thực thi procedure soSanhSoTiet
execute soSanhSoTiet '01', '04'

-- Xóa procedure soSanhSoTiet
drop procedure soSanhSoTiet



-- Kiểm tra xem sv đậu hay rớt môn (kiểm tra masv, mamh, lanthi)
create procedure dauHayRot(
	@maSV varchar(3),
	@maMH varchar(2),
	@lanThi int,
	@ketQua nvarchar (10) output
)
as
begin
	declare @diem decimal
	select @diem = Diem 
	from KetQua 
	where MaSV = @maSV and MaMH = @maMH and LanThi = @lanThi

	if (@diem > 5)
		select @ketQua = N'Đậu'
	else
		select @ketQua = N'Rớt'
end

declare @Result nvarchar (10)
select @Result = ''
execute dauHayRot 'A01', '01', 1, @Result
output
select @Result as 'Kết Quả'




/*=============TRIGGER=============*/
create database QLBanHang
go

use QLBanHang
go

create table MatHang(
	MaMatHang nvarchar(5) primary key,
	TenHang nvarchar(50) not null,
	SoLuong int
)
go

create table NhatKyBanHang(
	STT int identity(1, 1) primary key,
	Ngay datetime,
	NguoiMua nvarchar(30),
	MaHang nvarchar(5) foreign key references MatHang(MaMatHang),
	SoLuong int,
	GiaBan money
)


create trigger tg_Them_NhatKyBanHang
on NhatKyBanHang
for insert 
as 
	update MatHang
	set MatHang.SoLuong = MatHang.SoLuong - inserted.soLuong
	from MatHang inner join inserted
	on MatHang.MaMatHang = inserted.MaHang

drop trigger tg_Them_NhatKyBanHang