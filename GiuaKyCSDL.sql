--Đồ án giữa kỳ CSDL
CREATE DATABASE DO_AN_GIUA_KY
GO
USE DO_AN_GIUA_KY
GO

CREATE TABLE NhanVien (
    NhanVienID INT PRIMARY KEY IDENTITY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh BIT,
    SoDienThoai VARCHAR(15),
    Email VARCHAR(100),
    LoaiNhanVien VARCHAR(20) CHECK (LoaiNhanVien IN ('PhucVu', 'DauBep', 'QuanLy', 'ThuNgan', 'Kho')),
    TrangThai VARCHAR(20) CHECK (TrangThai IN ('DangLamViec', 'NghiViec')),
    LuongCoBan DECIMAL(10,2)
);

CREATE TABLE CaLamViec (
    CaID INT PRIMARY KEY IDENTITY,
    TenCa NVARCHAR(50),
    GioBatDau TIME,
    GioKetThuc TIME,
    LoaiCa VARCHAR(20)
);

CREATE TABLE LichLamViec (
    LichID INT PRIMARY KEY IDENTITY,
    NhanVienID INT FOREIGN KEY REFERENCES NhanVien(NhanVienID),
    CaID INT FOREIGN KEY REFERENCES CaLamViec(CaID),
    NgayLamViec DATE
);

CREATE TABLE KhuVucBan (
    KhuVucID INT PRIMARY KEY IDENTITY,
    TenKhuVuc NVARCHAR(100),
    LoaiKhuVuc NVARCHAR(50)
);

CREATE TABLE BanAn (
    BanID INT PRIMARY KEY IDENTITY,
    KhuVucID INT FOREIGN KEY REFERENCES KhuVucBan(KhuVucID),
    SoBan INT,
    TrangThai VARCHAR(20)
);

CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY IDENTITY,
    TenKH NVARCHAR(100),
    SoDienThoai VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE DatBan (
    DatBanID INT PRIMARY KEY IDENTITY,
    KhachHangID INT FOREIGN KEY REFERENCES KhachHang(KhachHangID),
    BanID INT FOREIGN KEY REFERENCES BanAn(BanID),
    ThoiGianDat DATETIME,
    TrangThai VARCHAR(20)
);

CREATE TABLE MonAn (
    MonAnID INT PRIMARY KEY IDENTITY,
    TenMon NVARCHAR(100),
    MoTa NVARCHAR(255),
    GiaBan DECIMAL(10,2),
    DonViTinh NVARCHAR(20),
    LoaiMon NVARCHAR(50),
    LaMonTheoMua BIT,
    ThangCoSanTu INT,
    ThangDen INT,
    CoSan VARCHAR(20),
    CheBienTaiBan BIT,
    MonAnDacBiet BIT,
    DiemNoiBat NVARCHAR(50),
    GiamGiaApDung DECIMAL(10,2),
    NgayCapNhatCuoi DATETIME
);

CREATE TABLE NguyenLieu (
    NguyenLieuID INT PRIMARY KEY IDENTITY,
    TenNguyenLieu NVARCHAR(100),
    DonViTinh NVARCHAR(20),
    SoLuongTonKho DECIMAL(10,2)
);

CREATE TABLE DinhLuongMonAn (
    MonAnID INT FOREIGN KEY REFERENCES MonAn(MonAnID),
    NguyenLieuID INT FOREIGN KEY REFERENCES NguyenLieu(NguyenLieuID),
    SoLuongCan DECIMAL(10,2),
    PRIMARY KEY (MonAnID, NguyenLieuID)
);

CREATE TABLE HoaDon (
    HoaDonID INT PRIMARY KEY IDENTITY,
    KhachHangID INT FOREIGN KEY REFERENCES KhachHang(KhachHangID),
    BanID INT FOREIGN KEY REFERENCES BanAn(BanID),
    ThoiGianThanhToan DATETIME,
    TongTien DECIMAL(10,2),
    PhuongThucThanhToan NVARCHAR(50)
);

CREATE TABLE DonMon (
    DonMonID INT PRIMARY KEY IDENTITY,
    HoaDonID INT FOREIGN KEY REFERENCES HoaDon(HoaDonID),
    MonAnID INT FOREIGN KEY REFERENCES MonAn(MonAnID),
    NhanVienID INT FOREIGN KEY REFERENCES NhanVien(NhanVienID),
    BanID INT FOREIGN KEY REFERENCES BanAn(BanID),
    SoLuong INT,
    ThoiDiemGoi DATETIME,
    GiaTaiThoiDiemGoi DECIMAL(10,2),
    TrangThaiMon VARCHAR(30),
    ThoiGianDuKienRaMon TIME,
    ThoiGianRaMonThucTe TIME,
    ThoiDiemGuiBep DATETIME,
    ThoiDiemPhucVu DATETIME,
    GhiChu NVARCHAR(255),
    DonMonChaID INT NULL
);

CREATE TABLE TaiKhoanNguoiDung (
    UserID INT PRIMARY KEY IDENTITY,
    NhanVienID INT FOREIGN KEY REFERENCES NhanVien(NhanVienID),
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),
    VaiTro VARCHAR(20)
);
