create database DE1_CSDL
go

use DE1_CSDL
go

create table Pilots(
	Pilot_ID varchar(10),
	Pilot_name nvarchar(100),
	Plane_type varchar(20),
	Flight_hours int
)

create table Planes(
	Plane_ID varchar(10),
	Plane_name nvarchar(100),
	Plane_type varchar(20)
)

create table Flight_Schedule(
	Pilot_ID varchar(10),
	Plane_ID varchar(10),
	Pilot_ID_Supervisor varchar(10),
	Date_flight date,
	Time_flight time
)

-- Dữ liệu mẫu cho Pilots
INSERT INTO Pilots VALUES ('P01', 'John', 'A320', 1000);
INSERT INTO Pilots VALUES ('P02', 'Anna', 'B737', 1500);
INSERT INTO Pilots VALUES ('P03', 'Mike', 'A320', 1200);

-- Dữ liệu mẫu cho Planes
INSERT INTO Planes VALUES ('PL01', 'Airbus 320 Neo', 'A320');
INSERT INTO Planes VALUES ('PL02', 'Boeing 737 Max', 'B737');
INSERT INTO Planes VALUES ('PL03', 'Airbus 320 Classic', 'A320');

-- Dữ liệu mẫu cho Flight_Schedule
INSERT INTO Flight_Schedule VALUES ('P01', 'PL01', 'P02', '2024-12-01', '08:00:00');
INSERT INTO Flight_Schedule VALUES ('P02', 'PL02', 'P03', '2024-12-02', '13:00:00');

-- Tạo khóa chính cho bảng Pilots
alter table Pilots alter column Pilot_ID varchar(10) not null
alter table Pilots add primary key (Pilot_ID)

-- Tạo khóa chỉnh cho bảng Planes
alter table Planes alter column Plane_ID varchar(10) not null
alter table Planes add primary key (Plane_ID)

-- Tạo khóa chính cho bảng Flight_Schedule
alter table Flight_Schedule alter column Pilot_ID varchar(10) not null
alter table Flight_Schedule alter column Plane_ID varchar(10) not null
alter table Flight_Schedule add primary key (Pilot_ID, Plane_ID)

-- ĐỀ 1
/*
Câu 0: Tạo khóa chính và khóa ngoại (1đ) 
Tạo khóa ngoại từ bảng Flight_Schedule tham chiếu đến bảng Planes (0.5đ)
*/
alter table Flight_Schedule add foreign key (Plane_ID) references Planes (Plane_ID)

/*
Tạo khóa chính cho bảng Planes (0.5đ)
*/
alter table Planes alter column Plane_ID varchar(10) not null
alter table Planes add primary key (Plane_ID)

/*
Câu 1: Thêm/Xoá/Sửa dữ liệu (1đ) 
a. Cập nhật dữ liệu John không vượt qua bài kiểm tra cuối khóa, nên số giờ bay bị giảm 50%.
*/
update Pilots
set Flight_hours = Flight_hours - Flight_hours * 0.5
where Pilot_name = 'John'

/*
b. Thêm dữ liệu 
Thêm thuộc tính Year vào bảng Planes để lưu trữ thông tin năm sản xuất cho từng loại máy bay. Thuộc tính này có kiểu Int
*/
alter table Planes add Year int

/*
Câu 2: Truy vấn (3.5đ) 
a. Cho biết mã số của những chiếc máy bay mà John không thể lái
*/
select Plane_ID
from Planes
where Plane_type not in(
	select Plane_type
	from Pilots
	where Pilot_name = 'John'
)

/*
b. Cho biết tên phi công không giám sát lịch bay của John
*/
select Pilot_name
from Pilots p
where p.Pilot_ID not in (
	select Pilot_ID_Supervisor
	from Flight_Schedule FS
	join Pilots p on FS.Pilot_ID = p.Pilot_ID
	where p.Pilot_name = 'John'
)
/*
Cho biết tên những phi công không có lịch bay vào buổi sáng trong tháng 12 năm 2024
*/
select Pilot_name
from Pilots P
where Pilot_ID not in(
	select Pilot_ID
	from Flight_Schedule FS
	where Month(FS.Date_flight) = 12 and 
	year(FS.Date_flight) = 2024 and 
	FS.Time_flight < '12:00:00'
)

/*
d. Cho biết số loại máy bay mà mỗi phi công có thể lái
*/
select Pilot_name ,count(Plane_type) as Total
from Pilots
group by Pilot_ID, Pilot_name


/*
Viết trigger để đảm bảo ràng buộc toàn vẹn sau
Dán code tạo trigger vào khung bên dưới:
Mỗi phi công không thể giám sát lịch bay của chính mình
Nếu vi phạm ràng buộc này hệ thống sẽ hiện câu thông báo
‘You can supvervise your filght’
Thực thi câu lệnh INSERT INTO Flight_Schedule VALUES (‘P03’, ‘PL03’,’P03’,’2025-01-12’,’8:00:00’)
*/



-- ĐỀ 2
/*
Câu 0: Tạo khóa chính và khóa ngoại (1đ) 
Tạo khóa ngoại từ bảng Flight_Schedule tham chiếu đến bảng Pilots
*/
alter table Flight_Schedule add foreign key(Pilot_ID) references Pilots(Pilot_ID)

/*
Tạo khóa chính cho bảng Flight_Schedule
*/
alter table Flight_Schedule alter column Pilot_ID varchar(10) not null
alter table Flight_Schedule alter column Plane_ID varchar(10) not null
alter table Flight_Schedule add primary key (Pilot_ID, Plane_ID)

/*
Câu 1: Thêm/Xoá/Sửa dữ liệu (1đ) 
a. Thay đổi cấu trúc bảng
Theo yêu cầu của ban quản lý, cần bổ sung thông tin giới tính cho phi công. 
Viết câu lệnh thêm thuộc tính Sex vào bảng Pilots, thuộc tính này có kiểu dữ liệu Char(1) để lưu thông tin giới tính của phi công
*/
alter table Pilots add Sex char(1)

/*
b. Cập nhật dữ liệu 
Cập nhật giới tính cho phi công tên John và Mike là F.
*/
update Pilots
set Sex = 'F'
where Pilot_name in ('John', 'Mike')

/*
Câu 2: Truy vấn (3.5đ) 
a. Cho biết mã số của những chiếc máy bay mà Mike có thể lái
*/
select Plane_ID
from Planes
where Plane_type in (
	select Plane_type
	from Pilots
	where Pilot_name = 'Mike'
)

/*
b. Cho biết tên phi công giám sát lịch bay của Anna
*/
select p.Pilot_name
from Pilots p
where p.Pilot_ID in (
	select fs.Pilot_ID_Supervisor
	from Flight_Schedule fs
	join Pilots s on fs.Pilot_ID = s.Pilot_ID
	where Pilot_name = 'Anna'
)

/*
c. Cho biết tên những phi công có lịch bay vào buổi chiều trong tháng 12 năm 2024
*/
select p.Pilot_name
from Pilots p
where Pilot_ID in (
	select fs.Pilot_ID
	from Flight_Schedule fs
	where month(fs.Date_flight) = 12 and year(fs.Date_flight) = 2024 and fs.Time_flight > '12:00:00'
)

/*
d. Cho biết số lượng lịch bay của John trong tháng 12 năm 2024
*/
select count(fs.Pilot_ID) as Total
from Flight_Schedule fs
join Pilots p on fs.Pilot_ID = p.Pilot_ID
where p.Pilot_name = 'John' and month(fs.Date_flight) = 12 and year(fs.Date_flight) = 2024


/*
Viết trigger để đảm bảo ràng buộc toàn vẹn sau:
Chỉ có thể lập lịch bay cho phi công theo đúng loại máy bay mà họ có thể lái
Nếu vi phạm điều này thì hệ thống sẽ hiện ra câu thông báo
‘Phi công không có khả năng lái loại máy bay này’
Thực thi câu lệnh INSERT INTO Flight_Schedule VALUES (‘P03’, ‘PL03’,’P01’,’2025-01-12’,’8:00:00’)
*/