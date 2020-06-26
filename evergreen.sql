-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 26 2020 г., 11:00
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `evergreen`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `new` tinyint(4) NOT NULL DEFAULT 0,
  `hit` tinyint(4) NOT NULL DEFAULT 0,
  `stock` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `name`, `price`, `image`, `category_id`, `created_at`, `updated_at`, `new`, `hit`, `stock`) VALUES
(2, 'qashqai', 700000, 'http://127.0.0.1:8000/storage/cars/armpI4vthmK73pthzegY7YhdpDBvpde7HdMtL7wX.jpeg', 3, '2020-06-24 15:04:38', '2020-06-24 15:04:38', 1, 1, 0),
(3, 'Juke', 200000, 'http://127.0.0.1:8000/storage/cars/xpaXOLjfLQIIlPQVbBdNvfjczaoJBkPAogdX8PVU.jpeg', 3, '2020-06-25 04:22:25', '2020-06-25 04:22:25', 0, 1, 0),
(4, 'Mustang', 700000, 'http://127.0.0.1:8000/storage/cars/S9w9A2Cnkk0Jw1otl6mjdoW4iL8pyyRk7ekzykJL.jpeg', 6, '2020-06-25 04:23:54', '2020-06-25 04:23:54', 0, 0, 1),
(5, 'Benz', 100000, 'http://127.0.0.1:8000/storage/cars/96gwXFzGwL3NIpuA8k6Ry15CLyIin8ZaPLIGH1MH.jpeg', 1, '2020-06-25 04:29:24', '2020-06-25 04:29:24', 0, 1, 0),
(6, 'R8', 400000, 'http://127.0.0.1:8000/storage/cars/oQInCdKXOOlzx7GfAkO3XVn3DL6eKNjkfLH3Pqod.jpeg', 4, '2020-06-25 04:30:51', '2020-06-25 04:30:51', 1, 0, 1),
(7, 'Q7', 300000, 'http://127.0.0.1:8000/storage/cars/Ze1oGpLzbgQZMbxchKdjMbCLvuaPWK0saC4KUeEi.jpeg', 4, '2020-06-25 04:31:24', '2020-06-25 04:31:24', 0, 0, 0),
(8, 'GTR', 15000000, 'http://127.0.0.1:8000/storage/cars/gRehq3htKCRVnXyWT5ZoEuVdDbDm7g0W8cV9QhQS.jpeg', 3, '2020-06-25 04:32:16', '2020-06-25 04:32:16', 1, 1, 1),
(9, 'Raptor', 1450000, 'http://127.0.0.1:8000/storage/cars/vgVsevY2BpEO2hK9tEx1mFDOgjn476l9otUAYq92.jpeg', 6, '2020-06-25 05:14:10', '2020-06-25 05:14:10', 1, 0, 1),
(10, 'Kuga', 567000, 'http://127.0.0.1:8000/storage/cars/lOAmE8kMDxpzYoPAmZcRoTOTQ70yvTZlpSJGXd3O.jpeg', 6, '2020-06-25 05:17:37', '2020-06-25 05:17:37', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `car_category`
--

CREATE TABLE `car_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_id` tinyint(4) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `car_category`
--

INSERT INTO `car_category` (`id`, `car_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(3, 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mercedes', '2020-06-24 14:53:20', '2020-06-24 14:53:20'),
(2, 'BMW', '2020-06-24 14:53:25', '2020-06-24 14:53:25'),
(3, 'Nissan', '2020-06-24 14:53:33', '2020-06-24 14:53:33'),
(4, 'Audi', '2020-06-24 14:53:37', '2020-06-24 14:53:37'),
(6, 'Ford', '2020-06-25 04:08:16', '2020-06-25 04:08:16');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2020_06_24_160400_create_car_category_table', 1),
(21, '2014_10_12_000000_create_users_table', 2),
(22, '2014_10_12_100000_create_password_resets_table', 2),
(23, '2019_08_19_000000_create_failed_jobs_table', 2),
(24, '2020_06_23_181401_create_cars_table', 2),
(25, '2020_06_23_182038_create_categories_table', 2),
(26, '2020_06_24_150708_alter_table_cars', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `car_category`
--
ALTER TABLE `car_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `car_category`
--
ALTER TABLE `car_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
