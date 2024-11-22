-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 22, 2024 lúc 06:36 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chungtuban`
--

CREATE TABLE `chungtuban` (
  `IdChungtuban` int(11) NOT NULL,
  `Ngayban` date NOT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chungtumua`
--

CREATE TABLE `chungtumua` (
  `IdChungtumua` int(11) NOT NULL,
  `Ngaymua` date NOT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctchungtuban`
--

CREATE TABLE `ctchungtuban` (
  `IdCTChungtuban` int(11) NOT NULL,
  `IdChungtuban` int(11) NOT NULL,
  `IdHanghoa` int(11) NOT NULL,
  `TenHanghoa` varchar(120) NOT NULL,
  `Soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctchungtumua`
--

CREATE TABLE `ctchungtumua` (
  `IdCTChungtumua` int(11) NOT NULL,
  `IdChungtumua` int(11) NOT NULL,
  `IdHanghoa` int(11) NOT NULL,
  `TenHanghoa` varchar(120) NOT NULL,
  `Soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gia`
--

CREATE TABLE `gia` (
  `IdGia` int(11) NOT NULL,
  `Gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hanghoa`
--

CREATE TABLE `hanghoa` (
  `IdHanghoa` int(11) NOT NULL,
  `TenHanghoa` varchar(120) NOT NULL,
  `IdLoaihang` int(11) NOT NULL,
  `IdThuonghieu` int(11) NOT NULL,
  `IdGia` int(11) NOT NULL,
  `IdVideo` int(11) NOT NULL,
  `Hinhanh` longblob DEFAULT NULL,
  `Mota` text DEFAULT NULL,
  `IdThuoctinhhanghoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaihang`
--

CREATE TABLE `loaihang` (
  `IdLoaihang` int(11) NOT NULL,
  `TenLoaihang` varchar(120) NOT NULL,
  `Hinhanh` longblob DEFAULT NULL,
  `Ghichu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoctinh`
--

CREATE TABLE `thuoctinh` (
  `IdThuoctinh` int(11) NOT NULL,
  `TenThuoctinh` varchar(120) NOT NULL,
  `Hinhanh` longblob DEFAULT NULL,
  `Ghichu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoctinhhanghoa`
--

CREATE TABLE `thuoctinhhanghoa` (
  `IdThuoctinhhanghoa` int(11) NOT NULL,
  `IdThuoctinh` int(11) NOT NULL,
  `IdHanghoa` int(11) NOT NULL,
  `Giatri` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `IdThuonghieu` int(11) NOT NULL,
  `TenThuonghieu` varchar(120) NOT NULL,
  `Hinhanh` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `IdUser` int(11) NOT NULL,
  `Ten` varchar(120) DEFAULT NULL,
  `Diachi` varchar(120) DEFAULT NULL,
  `SDT` varchar(60) DEFAULT NULL,
  `Username` varchar(120) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `Giotinh` tinyint(1) NOT NULL DEFAULT 1,
  `Ngaysinh` date DEFAULT NULL,
  `Ngaydangky` date DEFAULT current_timestamp(),
  `Role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
--

CREATE TABLE `video` (
  `IdVideo` int(11) NOT NULL,
  `TenVideo` varchar(120) NOT NULL,
  `Video` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chungtuban`
--
ALTER TABLE `chungtuban`
  ADD PRIMARY KEY (`IdChungtuban`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Chỉ mục cho bảng `chungtumua`
--
ALTER TABLE `chungtumua`
  ADD PRIMARY KEY (`IdChungtumua`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Chỉ mục cho bảng `ctchungtuban`
--
ALTER TABLE `ctchungtuban`
  ADD PRIMARY KEY (`IdCTChungtuban`),
  ADD KEY `IdChungtuban` (`IdChungtuban`),
  ADD KEY `IdHanghoa` (`IdHanghoa`);

--
-- Chỉ mục cho bảng `ctchungtumua`
--
ALTER TABLE `ctchungtumua`
  ADD PRIMARY KEY (`IdCTChungtumua`),
  ADD KEY `IdChungtumua` (`IdChungtumua`),
  ADD KEY `IdHanghoa` (`IdHanghoa`);

--
-- Chỉ mục cho bảng `gia`
--
ALTER TABLE `gia`
  ADD PRIMARY KEY (`IdGia`);

--
-- Chỉ mục cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD PRIMARY KEY (`IdHanghoa`),
  ADD KEY `IdLoaihang` (`IdLoaihang`),
  ADD KEY `IdThuonghieu` (`IdThuonghieu`),
  ADD KEY `IdGia` (`IdGia`),
  ADD KEY `IdVideo` (`IdVideo`),
  ADD KEY `IdThuoctinhhanghoa` (`IdThuoctinhhanghoa`);

--
-- Chỉ mục cho bảng `loaihang`
--
ALTER TABLE `loaihang`
  ADD PRIMARY KEY (`IdLoaihang`);

--
-- Chỉ mục cho bảng `thuoctinh`
--
ALTER TABLE `thuoctinh`
  ADD PRIMARY KEY (`IdThuoctinh`);

--
-- Chỉ mục cho bảng `thuoctinhhanghoa`
--
ALTER TABLE `thuoctinhhanghoa`
  ADD PRIMARY KEY (`IdThuoctinhhanghoa`),
  ADD KEY `IdHanghoa` (`IdHanghoa`),
  ADD KEY `IdThuoctinh` (`IdThuoctinh`);

--
-- Chỉ mục cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`IdThuonghieu`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUser`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`IdVideo`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chungtuban`
--
ALTER TABLE `chungtuban`
  MODIFY `IdChungtuban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chungtumua`
--
ALTER TABLE `chungtumua`
  MODIFY `IdChungtumua` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ctchungtuban`
--
ALTER TABLE `ctchungtuban`
  MODIFY `IdCTChungtuban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ctchungtumua`
--
ALTER TABLE `ctchungtumua`
  MODIFY `IdCTChungtumua` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  MODIFY `IdHanghoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `loaihang`
--
ALTER TABLE `loaihang`
  MODIFY `IdLoaihang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuoctinh`
--
ALTER TABLE `thuoctinh`
  MODIFY `IdThuoctinh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuoctinhhanghoa`
--
ALTER TABLE `thuoctinhhanghoa`
  MODIFY `IdThuoctinhhanghoa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `IdThuonghieu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `IdVideo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chungtuban`
--
ALTER TABLE `chungtuban`
  ADD CONSTRAINT `chungtuban_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Các ràng buộc cho bảng `chungtumua`
--
ALTER TABLE `chungtumua`
  ADD CONSTRAINT `chungtumua_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Các ràng buộc cho bảng `ctchungtuban`
--
ALTER TABLE `ctchungtuban`
  ADD CONSTRAINT `ctchungtuban_ibfk_1` FOREIGN KEY (`IdChungtuban`) REFERENCES `chungtuban` (`IdChungtuban`),
  ADD CONSTRAINT `ctchungtuban_ibfk_2` FOREIGN KEY (`IdHanghoa`) REFERENCES `hanghoa` (`IdHanghoa`);

--
-- Các ràng buộc cho bảng `ctchungtumua`
--
ALTER TABLE `ctchungtumua`
  ADD CONSTRAINT `ctchungtumua_ibfk_1` FOREIGN KEY (`IdChungtumua`) REFERENCES `chungtumua` (`IdChungtumua`),
  ADD CONSTRAINT `ctchungtumua_ibfk_2` FOREIGN KEY (`IdHanghoa`) REFERENCES `hanghoa` (`IdHanghoa`);

--
-- Các ràng buộc cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`IdLoaihang`) REFERENCES `loaihang` (`IdLoaihang`),
  ADD CONSTRAINT `hanghoa_ibfk_2` FOREIGN KEY (`IdThuonghieu`) REFERENCES `thuonghieu` (`IdThuonghieu`),
  ADD CONSTRAINT `hanghoa_ibfk_3` FOREIGN KEY (`IdGia`) REFERENCES `gia` (`IdGia`),
  ADD CONSTRAINT `hanghoa_ibfk_4` FOREIGN KEY (`IdVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `hanghoa_ibfk_5` FOREIGN KEY (`IdThuoctinhhanghoa`) REFERENCES `thuoctinhhanghoa` (`IdThuoctinhhanghoa`);

--
-- Các ràng buộc cho bảng `thuoctinhhanghoa`
--
ALTER TABLE `thuoctinhhanghoa`
  ADD CONSTRAINT `thuoctinhhanghoa_ibfk_1` FOREIGN KEY (`IdHanghoa`) REFERENCES `hanghoa` (`IdHanghoa`),
  ADD CONSTRAINT `thuoctinhhanghoa_ibfk_2` FOREIGN KEY (`IdThuoctinh`) REFERENCES `thuoctinh` (`IdThuoctinh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
