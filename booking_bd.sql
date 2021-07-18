-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Июл 18 2021 г., 08:02
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
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int(200) NOT NULL,
  `date` date DEFAULT NULL,
  `timeFrom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeTo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'START',
  `hallNumber` int(200) NOT NULL,
  `clientId` int(200) DEFAULT NULL,
  `sportId` int(100) DEFAULT NULL,
  `cost` int(200) DEFAULT NULL,
  `paymentId` int(200) DEFAULT NULL,
  `dateString` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `date`, `timeFrom`, `timeTo`, `status`, `hallNumber`, `clientId`, `sportId`, `cost`, `paymentId`, `dateString`) VALUES
(1, '2021-04-17', '14:00', '16:00', 'START', 1, 1, 3, 2000, 1, NULL),
(2, '2021-04-19', '12:00', '14:00', 'BOOKED', 2, 2, 1, 3000, 2, NULL),
(3, '2021-04-19', '17:00', '20:00', 'START', 3, 3, 2, 2500, 3, NULL),
(4, '2021-04-24', '13:00', '17:00', 'BOOKED', 2, 3, 1, 3000, 4, NULL),
(5, '2021-05-02', '16:00', '18:00', 'START', 1, 1, 3, 3000, 5, NULL),
(12, '2021-04-30', '14:00', '15:00', 'START', 1, 4, 2, 1000, NULL, NULL),
(13, '2021-05-04', '12:00', '14:00', 'START', 1, 5, 1, 2000, NULL, NULL),
(14, '2021-04-30', '20:00', '21:00', 'START', 1, 6, 3, 1000, NULL, NULL),
(15, '2021-05-01', '10:00', '12:00', 'START', 4, 7, 1, 2000, NULL, NULL),
(16, '2021-05-04', '18:00', '20:00', 'START', 1, 8, 3, 2000, NULL, NULL),
(17, '2021-04-30', '10:00', '11:00', 'START', 1, 9, 2, 1000, NULL, NULL),
(18, '2021-05-01', '12:00', '13:00', 'START', 1, 10, 2, 1000, NULL, NULL),
(19, '2021-05-05', '10:00', '11:00', 'START', 1, 11, 1, 1000, NULL, NULL),
(21, '2021-04-30', '17:00', '18:00', 'START', 1, 13, 2, 1000, NULL, NULL),
(23, '2021-04-30', '17:00', '18:00', 'START', 1, 15, 3, 1000, NULL, NULL),
(24, '2021-04-30', '17:00', '18:00', 'START', 1, 16, 1, 1000, NULL, NULL),
(25, '2021-04-30', '16:00', '17:00', 'START', 1, 17, 1, 1000, NULL, NULL),
(26, '2021-05-06', '15:00', '16:00', 'START', 1, 8, 1, 1000, NULL, NULL),
(27, '2021-05-07', '19:00', '20:00', 'START', 1, 9, 2, 1000, NULL, '07 мая 2021'),
(28, '2021-05-08', '11:00', '14:00', 'START', 1, 4, 3, 3000, NULL, '08 мая 2021'),
(29, '2021-05-08', '16:00', '17:00', 'START', 1, 6, 2, 1000, NULL, '08 мая 2021'),
(30, '2021-05-08', '14:00', '17:00', 'START', 2, 5, 3, 3000, NULL, '08 мая 2021'),
(32, '2021-05-06', '12:00', '13:00', 'START', 2, 2, 2, 1000, NULL, '06 мая 2021'),
(34, '2021-05-03', '10:00', '12:00', 'START', 2, 4, 3, 2000, NULL, '03 мая 2021'),
(35, '2021-05-18', '13:00', '16:00', 'START', 2, 12, 2, 3000, NULL, '18 мая 2021'),
(36, '2021-05-16', '13:00', '14:00', 'START', 2, 8, 2, 1000, NULL, '16 мая 2021'),
(37, '2021-05-18', '13:00', '15:00', 'START', 1, 9, 1, 2000, NULL, '18 мая 2021'),
(39, '2021-05-16', '11:00', '13:00', 'START', 1, 10, 3, 2000, NULL, '16 мая 2021'),
(40, '2021-05-22', '15:00', '18:00', 'START', 4, 12, 3, 3000, NULL, '22 мая 2021'),
(41, '2021-05-19', '16:00', '19:00', 'START', 4, 2, 1, 3000, NULL, '19 мая 2021'),
(43, '2021-05-18', '17:00', '20:00', 'START', 3, 17, 3, 3000, NULL, '18 мая 2021'),
(44, '2021-05-19', '13:00', '14:00', 'START', 4, 15, 3, 1000, NULL, '19 мая 2021'),
(46, '2021-06-04', '18:00', '20:00', 'START', 4, 13, 2, 2000, NULL, '04 июня 2021'),
(47, '2021-06-05', '15:00', '17:00', 'START', 1, 10, 2, 2000, NULL, '05 июня 2021'),
(48, '2021-06-05', '15:00', '17:00', 'START', 1, 28, 3, 2000, NULL, '05 июня 2021'),
(49, '2021-06-25', '12:00', '14:00', 'START', 1, 16, 1, 2000, NULL, '29 мая 2021'),
(50, '2021-06-05', '10:00', '11:00', 'START', 4, 17, 2, 1000, NULL, '05 июня 2021'),
(51, '2021-06-26', '14:00', '16:00', 'START', 4, 18, 2, 2000, NULL, '13 июня 2021'),
(52, '2021-06-29', '12:00', '14:00', 'START', 4, 19, 2, 2000, NULL, '19 июня 2021'),
(53, '2021-06-19', '12:00', '14:00', 'START', 2, 20, 1, 2000, NULL, '19 июня 2021'),
(59, '2021-06-26', '14:00', '17:00', 'START', 2, 21, 1, 3000, NULL, '26 июня 2021'),
(60, '2021-06-23', '11:00', '14:00', 'START', 3, 22, 2, 3600, NULL, '23 июня 2021'),
(62, '2021-06-28', '15:00', '16:00', 'START', 1, 24, 2, 1700, NULL, '28 июня 2021'),
(63, '2021-06-27', '11:00', '14:00', 'START', 1, 25, 1, 5100, NULL, '27 июня 2021'),
(64, '2021-06-24', '18:00', '20:00', 'START', 1, 26, 1, 3400, NULL, '24 июня 2021'),
(65, '2021-06-24', '12:00', '14:00', 'START', 2, 27, 1, 2900, NULL, '24 июня 2021'),
(66, '2021-06-29', '12:00', '14:00', 'START', 2, 28, 3, 2900, NULL, '29 июня 2021'),
(67, '2021-06-30', '11:00', '13:00', 'START', 3, 29, 2, 2400, NULL, '30 июня 2021'),
(69, '2021-06-30', '16:00', '17:00', 'START', 2, 31, 1, 1450, NULL, '30 июня 2021'),
(70, '2021-07-02', '13:00', '15:00', 'START', 2, 32, 1, 2900, NULL, '02 июля 2021'),
(71, '2021-07-02', '14:00', '17:00', 'START', 3, 0, 2, 3600, NULL, '02 июля 2021'),
(72, '2021-07-02', '9:00', '10:00', 'START', 3, 34, 2, 1200, NULL, '02 июля 2021'),
(73, '2021-06-30', '9:00', '10:00', 'START', 4, 35, 2, 1100, NULL, '30 июня 2021'),
(74, '2021-06-27', '13:00', '15:00', 'START', 3, 36, 2, 2400, NULL, '27 июня 2021'),
(75, '2021-06-27', '14:00', '15:00', 'START', 2, 37, 1, 1450, NULL, '27 июня 2021'),
(76, '2021-06-27', '8:00', '10:00', 'START', 3, 38, 2, 2400, NULL, '27 июня 2021'),
(77, '2021-06-27', '17:00', '19:00', 'START', 2, 39, 1, 2900, NULL, '27 июня 2021'),
(78, '2021-07-02', '16:00', '18:00', 'START', 4, 40, 2, 1800, NULL, '02 июля 2021'),
(79, '2021-06-27', '18:00', '19:00', 'START', 4, 41, 2, 1000, NULL, '27 июня 2021'),
(80, '2021-07-01', '13:00', '16:00', 'START', 1, 42, 1, 5100, NULL, '01 июля 2021'),
(81, '2021-07-03', '17:00', '19:00', 'START', 1, 43, 3, 3400, NULL, '03 июля 2021'),
(82, '2021-07-04', '10:00', '11:00', 'START', 4, 44, 2, 1000, NULL, '04 июля 2021'),
(83, '2021-07-03', '11:00', '13:00', 'START', 2, 45, 1, 2900, NULL, '03 июля 2021'),
(84, '2021-07-03', '17:00', '19:00', 'START', 2, NULL, NULL, 2900, NULL, '03 июля 2021');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(200) NOT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `phone`, `name`) VALUES
(1, '89245937793', 'Иванов Евгений'),
(2, '89147459210', 'Мягкова Елена'),
(3, ' 74242342343', 'Рисов Дмитрий'),
(4, ' 74353453453', 'Мохов Андрей'),
(5, ' 76546645465', 'Топотко Константин'),
(6, ' 74243254534', 'Александров Артём'),
(7, ' 79095675757', 'Петрова Марина'),
(8, ' 74675675675', 'Костин Дмитрий'),
(9, ' 75446456456', 'Павлова Елена'),
(10, ' 75435353534', 'Лыкова Анастасия'),
(11, ' 79847676757', 'Антонова Наталья'),
(12, ' 79995666342', 'Ливанова Евгения'),
(13, ' 74445553423', 'Липова Наталья'),
(14, ' 79095666767', 'Синичкина Юлия'),
(15, ' 75345345345', 'Романов Илья'),
(16, ' 74534535345', 'Кошкин Роман'),
(17, ' 79999583748', 'Алёхин Антон'),
(18, ' 74757934756', 'Стручкова Алина'),
(19, ' 75646546456', 'Самойленко Евгений'),
(20, ' 75575757578', 'Администратор'),
(21, ' 78677774544', 'Винилова Екатерина'),
(22, ' 79628557685', 'Любочкин Арсений'),
(23, ' 79784533356', 'Кротов Николай'),
(24, ' 79754756656', 'Константинова Алина'),
(25, ' 79764566877', 'Петрова Анна'),
(26, ' 79775466224', 'Пак Ирина'),
(27, ' 79784355578', 'Пак Инна'),
(28, ' 79999999999', 'Маслова Татьяна'),
(29, ' 76666666666', 'Потапов Илья'),
(32, ' 79333333333', 'Костин Павел'),
(34, ' 79095435589', 'Липова Анна'),
(35, ' 79241183499', 'Мишкин Олег'),
(36, ' 79872345555', 'Попова Татьяна'),
(37, ' 79874566677', 'Прокопьева Анна'),
(38, ' 79087487648', 'Попова Инна'),
(39, ' 79875646557', 'Попова Татьяна'),
(40, ' 75758678677', 'Тюрин Евгений'),
(41, ' 79888888888', 'Николаев Антон'),
(42, ' 79345367733', 'Носова Ирина'),
(43, ' 79763453453', 'Тапочкин Егор'),
(44, ' 79989878878', 'Николаев Антон'),
(45, ' 79876655566', 'Петрова Анна');

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
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iconPath` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'assets/images/hall1.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `halls`
--

INSERT INTO `halls` (`number`, `name`, `costOfHour`, `timeOpen`, `timeClose`, `length`, `width`, `description`, `address`, `phone`, `regime`, `iconPath`) VALUES
(1, 'Большой зал', 1700, 10, 20, 20, 20, 'Спортивный зал ориентирован на игру в футбол, волейбол и баскетбол. Дополнительно вашему вниманию предлагается сауна, настольный теннис, солярий. Аренда зала возможна под другие мероприятия.                                                            ', 'ул. Серышева, 15', '8 924 564 55 77', 'Ежедневно', 'big-photo.png'),
(2, 'Средний зал', 1450, 10, 19, 15, 15, 'Спортивный зал ориентирован на игру в футбол и баскетбол. Помещение хорошо отапливается и оборудовано качественным газоном                                                                                                            ', 'ул. Яшина, 15', '8 909 222 33 45', 'Пн - пт', 'unnamed.jpg'),
(3, 'Малый зал', 1200, 8, 18, 10, 10, 'Отличный уютный зал с тёплым полом и всем необходимым инвентарём                                                                                             ', 'ул. Ленина, 45', '8 914 754 89 34', 'Ежедневно', 'a53a33b0541e663e64e.jpg'),
(4, 'Детский зал', 1000, 10, 19, 20, 15, 'Зал с мягким газоном и современным спортивным инвентарём для детей                                                                                                ', 'ул. Карла-Маркса, 24', '8 924 145 99 59', 'Пн - пт', 'img_1460094910_0.jpg'),
(27, 'Универсальный зал', 3000, 10, 20, 20, 30, 'Просторный зал, оснащённый современным инвентарём и подходящий для тренировок как начинающих, так и опытных команд.            ', 'Ленина, 53', ' 74675765756', 'Ежедневно', 'cbe7b848192d2ee2b.png');

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
  `id` int(200) NOT NULL,
  `hallNumber` int(200) NOT NULL,
  `sportId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `typesofsport`
--

INSERT INTO `typesofsport` (`id`, `hallNumber`, `sportId`) VALUES
(11, 15, 1),
(12, 15, 2),
(30, 7, 2),
(31, 7, 1),
(68, 0, 1),
(69, 0, 2),
(70, 0, 1),
(71, 0, 2),
(72, 0, 1),
(73, 0, 3),
(74, 17, 1),
(75, 17, 2),
(76, 18, 1),
(77, 18, 2),
(78, 19, 1),
(79, 19, 2),
(85, 20, 1),
(86, 20, 2),
(90, 21, 1),
(91, 21, 2),
(94, 22, 1),
(95, 22, 2),
(98, 0, 1),
(99, 0, 2),
(100, 23, 1),
(101, 23, 2),
(104, 24, 1),
(105, 24, 2),
(109, 25, 1),
(110, 25, 2),
(113, 26, 1),
(114, 26, 2),
(115, 4, 2),
(116, 4, 1),
(117, 1, 1),
(118, 1, 2),
(119, 1, 3),
(120, 3, 2),
(121, 3, 3),
(122, 2, 1),
(123, 2, 3),
(124, 27, 1),
(125, 27, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`login`, `password`) VALUES
('admin', 'zxcvbn123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

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

--
-- Индексы таблицы `typesofsport`
--
ALTER TABLE `typesofsport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `halls`
--
ALTER TABLE `halls`
  MODIFY `number` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `typesofsport`
--
ALTER TABLE `typesofsport`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
