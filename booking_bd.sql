-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Мар 10 2021 г., 11:58
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `booking_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `halls`
--

CREATE TABLE `halls` (
  `number` int(200) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costOfHour` mediumint(9) NOT NULL,
  `timeOpen` int(11) NOT NULL,
  `timeClose` int(11) NOT NULL,
  `length` mediumint(9) NOT NULL,
  `width` mediumint(9) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iconPath` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `halls`
--

INSERT INTO `halls` (`number`, `name`, `costOfHour`, `timeOpen`, `timeClose`, `length`, `width`, `description`, `address`, `iconPath`) VALUES
(1, 'Большой зал', 1000, 9, 22, 20, 20, 'Спортивный зал ориентирован на игру в футбол, волейбол и баскетбол. Дополнительно вашему вниманию предлагается сауна, настольный теннис, солярий. Также аренда спортивного зала возможна практически под любое мероприятие.', 'ул. Серышева, 15', 'assets/images/hall1.png'),
(2, 'Средний зал', 800, 10, 19, 15, 15, 'Спортивный зал ориентирован на игру в футбол и баскетбол. Помещение хорошо отапливается и оборудовано качественным газоном.', 'ул. Яшина, 15', 'assets/images/hall2.png'),
(3, 'Малый зал', 1500, 9, 18, 10, 10, 'Отличный уютный зал с тёплым полом', 'ул. Ленина, 45', 'assets/images/hall3.png'),
(4, 'Детский зал', 800, 10, 20, 20, 15, 'Зал, подходящий для групповых тренировок по баскетболу и футболу для детей', 'ул. Фрунзе, 22', 'assets/images/hall4.png');

-- --------------------------------------------------------

--
-- Структура таблицы `sports`
--

CREATE TABLE `sports` (
  `id` int(100) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sports`
--

INSERT INTO `sports` (`id`, `name`) VALUES
(1, 'Футбол'),
(2, 'Волейбол'),
(3, 'Баскетбол');

-- --------------------------------------------------------

--
-- Структура таблицы `typesofsport`
--

CREATE TABLE `typesofsport` (
  `hallNumber` int(200) NOT NULL,
  `sportId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `typesofsport`
--

INSERT INTO `typesofsport` (`hallNumber`, `sportId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 3),
(4, 2),
(3, 2),
(4, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
