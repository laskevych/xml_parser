-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: app-mysql
-- Время создания: Ноя 10 2019 г., 17:45
-- Версия сервера: 5.7.28
-- Версия PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `edrpou` char(8) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `shortname` varchar(256) NOT NULL,
  `boss` varchar(256) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `kved` varchar(1024) NOT NULL,
  `stan` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `companies_founders`
--

DROP TABLE IF EXISTS `companies_founders`;
CREATE TABLE `companies_founders` (
  `id` int(11) UNSIGNED NOT NULL,
  `company_edrpou` char(8) NOT NULL,
  `founder` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`edrpou`);

--
-- Индексы таблицы `companies_founders`
--
ALTER TABLE `companies_founders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `edrpou` (`company_edrpou`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies_founders`
--
ALTER TABLE `companies_founders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
