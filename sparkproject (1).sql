-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Ara 2025, 07:41:38
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sparkproject`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `media_path` varchar(255) DEFAULT NULL,
  `media_type` enum('text','image','video') DEFAULT 'text',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `media_path`, `media_type`, `created_at`) VALUES
(2, 1, 'a', NULL, 'text', '2025-12-22 16:10:33'),
(4, 1, 'a', '4bff015fe4a9edc99500dc5157472bf9.mp4', 'video', '2025-12-22 16:25:43'),
(5, 1, 'Deneme123', NULL, 'text', '2025-12-23 10:42:15'),
(6, 1, 'Deneme123123', '5bef69db93fbdb8f84c4105717cf9948.jpg', 'image', '2025-12-23 10:43:15'),
(7, 4, 'merhaba', NULL, 'text', '2025-12-23 10:59:10'),
(8, 4, 'selam', '0acee9247f4f321c2b2ff4940a36e240.png', 'image', '2025-12-23 10:59:56'),
(9, 1, 'BAMBAMBAM AYHANCAN', '9794cbf6c02edd8b4610575d627d7674.jpeg', 'image', '2025-12-23 13:02:05'),
(10, 1, 'kuşadası <3', 'bcb4e76b1651e200f9aabb121a433572.jpg', 'image', '2025-12-23 13:07:48'),
(11, 1, 'noluyor burada yahu', NULL, 'text', '2025-12-23 13:08:26'),
(12, 1, 'sıkıntı işler ya', NULL, 'text', '2025-12-23 13:08:34'),
(13, 1, 'ferari', '5aa4d85e571e4148cacd475e8c08e792.jpg', 'image', '2025-12-23 13:08:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT 'default_avatar.png',
  `bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `full_name`, `password`, `profile_pic`, `bio`, `created_at`) VALUES
(1, 'Vettelinkeli', 'Emiray Kılıç', '$2y$10$vfm3Ib876aV95DedMDq5KOcSv3Qslb5A4xllvXV60vbzQau7nrWcC', 'default_avatar.png', NULL, '2025-12-22 13:25:53'),
(2, 'Vettelinkeli2', 'Emiray Kılıç', '$2y$10$fZU3nZv3f3uvfspYKGU9BeCnyeLfWCWTjiUm/oyez6hdOBrxgUuwy', 'default_avatar.png', NULL, '2025-12-22 13:53:10'),
(3, 'Vettelinkeli3', 'Emiray Kılıç', '$2y$10$Ccc9N.3gFiZ.6XlwL1RwpeIllyEr3v0qHCppWWunO9tIiC.YDdkP.', 'default_avatar.png', NULL, '2025-12-22 13:53:31'),
(4, 'Ghostswatz', 'Mehmet Yıldırım', '$2y$10$WCDwf5sRLTNKtd7HuGcKPuHZZvBU./nJIhz0MToevZlV6WH2ozaWO', 'default_avatar.png', NULL, '2025-12-23 10:56:25'),
(5, 'Canerim', 'Caner Tünel', '$2y$10$CuiR52igvdNytUKD9Grb4.lyAzn1leLi6yxn18d1X8YWjVyC/XCdO', 'default_avatar.png', NULL, '2025-12-24 08:30:16');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
