create database mysql
create table nhanvien(
		manv int not null primary key,
		hoten varchar(50) not null,
		phai varchar(50),
		ngaysinh date,
		diachi varchar(255),
		sdt varchar(10)
)

create table khachhang(
	makh int identity(1,1) not null primary key,
	tenkh varchar(50) not null,
	diachi varchar(255),
	sdt varchar(10) check (sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)



use mysql
go

