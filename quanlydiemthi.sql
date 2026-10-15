-- 1. Tạo CSDL mới tên là QuanLyDiemThi
CREATE DATABASE IF NOT EXISTS QuanLyDiemThi;

-- 2. Chọn CSDL QuanLyDiemThi để thao tác
USE QuanLyDiemThi;

-- 3. Tạo bảng HocSinh
CREATE TABLE IF NOT EXISTS HocSinh (
    MaHS VARCHAR(20) PRIMARY KEY,
    TenHS VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);

-- 4. Tạo bảng GiaoVien (Tạo trước để MonHoc liên kết tới)
CREATE TABLE IF NOT EXISTS GiaoVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(50),
    SDT VARCHAR(10)
);

-- 5. Tạo bảng MonHoc (Có khóa ngoại MaGV nối tới GiaoVien)
CREATE TABLE IF NOT EXISTS MonHoc (
    MaMH VARCHAR(50) PRIMARY KEY,
    TenMH VARCHAR(50),
    MaGV VARCHAR(20),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV)
);

-- 6. Tạo bảng BangDiem (Khóa chính gồm MaHS + MaMH và 2 khóa ngoại)
CREATE TABLE IF NOT EXISTS BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(50),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS, MaMH),
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);