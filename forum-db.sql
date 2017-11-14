-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15 ное 2017 в 00:47
-- Версия на сървъра: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum-db`
--

-- --------------------------------------------------------

--
-- Структура на таблица `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `categories`
--

INSERT INTO `categories` (`id`, `name`, `asd`) VALUES
(1, 'Test', NULL),
(4, 'Edited Football', NULL),
(6, 'Music1', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `comments`
--

INSERT INTO `comments` (`id`, `topic_id`, `description`, `date_created`, `user_id`) VALUES
(3, 9, 'tema 9 baam komentar', '2017-05-16 10:35:40', 12),
(4, 6, 'ami za 6ticata shte ima li idddddd ????', '2017-05-16 10:38:53', 12),
(5, 4, 'komentarche za topic id = 4', '2017-05-16 16:07:49', 12),
(6, 4, 'komentarche za topic id = 4asdasd', '2017-05-16 16:08:24', 12),
(7, 4, 'blqblq', '2017-05-16 16:08:46', 12),
(8, 6, 'Nqkakvo komentarche', '2017-05-17 15:57:14', 12),
(9, 9, 'hei ti malkata\r\n--Milko', '2017-06-04 14:02:45', 12),
(10, 9, 'asd', '2017-06-04 14:18:39', 12);

-- --------------------------------------------------------

--
-- Структура на таблица `fos_users`
--

CREATE TABLE `fos_users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `fos_users`
--

INSERT INTO `fos_users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `image`) VALUES
(8, 'Gaara', 'gaara', 'gaara@abv.bg', 'gaara@abv.bg', 1, NULL, '$2y$13$suK8VOGtDFidiNSMYSX0fOgbP.SmhHCU5d5V0r6Ft.3O3KNzyayt.', '2017-05-15 11:56:39', NULL, NULL, 'a:0:{}', '0a6580971c88de78098760d166771079'),
(9, 'Temari', 'temari', 'temari@abv.bg', 'temari@abv.bg', 1, NULL, '$2y$13$TxzyQ4kekaW/We9FeN/7H.TuyAPNLIwWGh210iVu8UP9PFN8t485.', '2017-05-11 19:18:51', NULL, NULL, 'a:0:{}', '7904c079aff15caaee02b30ee947a06e'),
(11, 'The JokeR', 'the joker', 'joker@abv.bg', 'joker@abv.bg', 1, NULL, '$2y$13$LzFJ4R53bCTmP2uhEFuZGuvNkZ8Q4QjxPY4nID5thIGb8pAzPFRr6', '2017-05-13 10:42:51', NULL, NULL, 'a:0:{}', '239b8806458e7bf5df57c51c5c2bdb20'),
(12, 'Rumkata97', 'rumkata97', 'panchev97@abv.bg', 'panchev97@abv.bg', 1, NULL, '$2y$13$bex5NRAKxaMtLgU/wf3T.eeu8V0utLTLvdFbmoqtgRxsMXHRuhH06', '2017-06-04 14:01:44', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', 'ff00580c451be64e1e7046899b8c81ea'),
(13, 'rumkatata', 'rumkatata', 'asd@abv.bg', 'asd@abv.bg', 1, NULL, '$2y$13$9zwebN2/OBAZd96xif/TNe2oZblZ5UsHl3xTfWcTPGc7U8WeKNFOm', '2017-09-15 22:49:43', NULL, NULL, 'a:0:{}', NULL),
(14, 'roooot', 'roooot', 'email@abv.bg', 'email@abv.bg', 1, NULL, '$2y$13$YEvvlmBEzAYy0.3ABc.kS.BuFdhcrTzZLPaMrwiWCSjIbCLTIORCe', '2017-11-15 00:16:39', NULL, NULL, 'a:0:{}', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `topics`
--

INSERT INTO `topics` (`id`, `title`, `description`, `date_created`, `category_id`, `user_id`) VALUES
(4, 'Edit Tema', 'Edit nqkakvo opisanie', '2017-05-13 10:43:05', 4, 11),
(6, 'nqmam vuobrajenie', 'interesno mi e', '2017-05-14 15:14:01', 6, 8),
(9, 'zaglavie v test', 'opisanie nqkakvo', '2017-05-15 09:36:46', 1, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3AF346685E237E06` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962A1F55203D` (`topic_id`),
  ADD KEY `IDX_5F9E962AA76ED395` (`user_id`);

--
-- Indexes for table `fos_users`
--
ALTER TABLE `fos_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_32427CF792FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_32427CF7A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_32427CF7C05FB297` (`confirmation_token`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_91F646392B36786B` (`title`),
  ADD KEY `IDX_91F6463912469DE2` (`category_id`),
  ADD KEY `IDX_91F64639A76ED395` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `fos_users`
--
ALTER TABLE `fos_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A1F55203D` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `FK_5F9E962AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_users` (`id`);

--
-- Ограничения за таблица `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `FK_91F6463912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_91F64639A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
