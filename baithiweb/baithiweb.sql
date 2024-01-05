-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2024 lúc 04:11 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `baithiweb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `qty`) VALUES
(3, 10001, 101, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(100) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `order_amount` float NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `product_qty`, `order_amount`, `order_date`, `status`) VALUES
(205, 10004, 102, 1, 55000, '2024-01-05 22:08:25', 'Đã xác nhận'),
(206, 10005, 102, 1, 50000, '2024-01-05 22:08:25', 'Đã xác nhận'),
(207, 10006, 102, 1, 60000, '2024-01-05 22:08:25', 'Đã xác nhận');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `category` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `desc` longtext NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `title`, `price`, `qty`, `desc`, `image`) VALUES
(10001, 1001, 'Bún Tái', 40000, 20, 'Bún Huế vị tái vừa', 'product_1.jpg'),
(10002, 1001, 'Bún Tái Bắp', 30000, 24, 'Bún bò Huế với thăn bò vừa tái', 'product_2.jpg'),
(10003, 1001, 'Bún Tái Chả Cua', 50000, 30, 'Bún Huế với thịt thăn và bánh cua vừa tái', 'product_3.png'),
(10004, 1002, 'Bún Bắp', 40000, 13, 'Bún bắp bò Huế', 'product_4.jpg'),
(10005, 1002, 'Bún Bắp Chả Cua', 35000, 30, 'Bún bò bắp bánh đa cua Huế', 'product_5.jpg'),
(10006, 1003, 'Bún Bắp Giò Heo', 45000, 15, 'Bún bò Huế chân giò heo', 'product_6.jpg'),
(10007, 1003, 'Bún Giò Heo', 25000, 36, 'Bún chả giò Huế', 'product_7.jpg'),
(10008, 1004, 'Bún Giò Heo Chả Cua', 40000, 17, 'Bún Huế chân giò và bánh đa cua', 'product_8.jpg'),
(10009, 1004, 'Bún Chả Cua', 45000, 30, 'Bún chả cua Huế', 'product_9.jpg'),
(10010, 1004, 'Bún Bò Giò Đặc Biệt', 55000, 50, 'Bún Huế (topping đầy đủ)', 'product_10.jpg'),
(10011, 1005, 'Mì Quảng Cá', 30000, 19, 'Mì Cá Quảng Nam', 'product_11.jpg'),
(10012, 1005, 'Mì Quảng Gà', 30000, 42, 'Mì gà Quảng Nam', 'product_12.jpg'),
(10013, 1006, 'Hủ Tiếu Khô', 30000, 15, 'Bún khô xá xíu tôm thịt viên', 'product_13.jpg'),
(10014, 1006, 'Hủ Tiếu Bò Kho', 35000, 32, 'bún bò hầm nước sốt', 'product_14.jpg'),
(10015, 1006, 'Phở Tái', 40000, 40, 'Phở Tái Thịt Bò', 'product_15.jpg'),
(10016, 1006, 'Phở Tái Nạm', 35000, 35, 'Phở Tái Thịt Bò, chả lụa', 'product_16.png'),
(10017, 1006, 'Phở Tái Bắp', 35000, 36, 'Phở Thịt Bò, Bắp', 'product_17.jpg'),
(10018, 1006, 'Phở Bắp', 40000, 25, 'Phở nấu với bắp', 'product_18.jpg'),
(10019, 1007, 'Phở Bắp Nạm', 45000, 26, 'Phở nấu với bắp và chả lụa', 'product_19.jpg'),
(10020, 1007, 'Phở Nạm', 40000, 12, 'Phở nấu với chả lụa', 'product_20.jpg'),
(10021, 1007, 'Phở Nạm Gầu', 50000, 24, 'Phở nấu với chả và gầu', 'product_21.png'),
(10022, 1007, 'Phở Gầu', 45000, 45, 'Phở nấu với Gầu', 'product_22.jpg'),
(10023, 1007, 'Bún Ốc Hà Nội', 35000, 45, 'Bún ốc giác, chả và nấm hương', 'product_23.jpg'),
(10024, 1007, 'Bún Chả Hà Nội', 35000, 50, 'Bún chả cá, cà rốt và thịt bò hầm', 'product_24.jpg'),
(10025, 1008, 'Miến Xào Cua', 25000, 38, 'Bún nấu với thanh cua', 'product_25.png'),
(10026, 1008, 'Mì Xào Hải Sản', 35000, 32, 'Mì Xào mực, tôm, cá...', 'product_26.jpg'),
(10027, 1008, 'Mì Xào Bò', 40000, 29, 'Mì xào thịt bò', 'product_27.jpg'),
(10028, 1009, 'Bánh Mì Ốp La', 10000, 30, 'Bánh mì kèm trứng ốp la lồng đào, thịt bò ', 'product_28.jpg'),
(10029, 1009, 'Bánh Mì Bò Kho', 15000, 40, 'Bánh mì kèm thịt bò kho', 'product_29.jpg'),
(10030, 1010, 'Trà Chanh Bạc Hà', 25000, 32, 'Nước trà chanh bạc hà giải khát', 'product_30.jpg'),
(10031, 1010, 'Soda Chanh Đường', 30000, 45, 'Nước giải khát', 'product_31.jpg'),
(10032, 1010, 'Nước Cam Tươi', 10000, 35, 'Nước ép trái cây', 'product_32.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mobile`, `email`, `password`) VALUES
(101, 'anh', 'kiet', 7728314555, 'a1@gmail.com', '5ab2a25fb82f3b059ef69dac09b8e6e2'),
(102, 'vo', 'tai', 123456789, 'ss@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10033;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
