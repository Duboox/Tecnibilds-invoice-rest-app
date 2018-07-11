-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2018 a las 02:12:08
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tbapp_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dolores explicabo at soluta vel praesentium et praesentium.', '2018-02-23 04:47:49', '2018-02-23 04:47:49'),
(2, 2, 'Odit et magnam ut eum.', '2018-02-23 04:47:50', '2018-02-23 04:47:50'),
(3, 1, 'Hi Kitty', '2018-02-23 05:39:54', '2018-02-23 05:39:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `last_name`, `picture`, `company`, `address`, `phone`, `gender`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Joseph', 'Grady', 't8S4MyKP9zCExL8W.jpg', 'Hayes, Kulas and Quigley', '8254 Glenda Shores Suite 875\nJamirberg, DE 76152', '734-809-6253', 'male', 'bailey.abigayle@hotmail.com', '2018-02-23 04:47:35', '2018-02-23 05:38:56'),
(2, 'Justice', 'Cremin', 'xqVd0wZrQgCdjNo6.jpg', 'Stanton-Hilpert', '7691 Laila Courts Suite 287\nMichaelside, OK 18192-9218', '507-749-6695 x760', 'male', 'mclaughlin.cortez@abshire.com', '2018-02-23 04:47:35', '2018-02-23 05:38:34'),
(3, 'Adonis', 'Sipes', 'zceKk9XfgW04Jiyx.jpg', 'Pagac-Rowe', '898 Schuster Parkway\nPort Henryside, IA 06848', '1-957-827-9361', 'male', 'joy.mcclure@beier.com', '2018-02-23 04:47:35', '2018-02-23 05:38:14'),
(4, 'Porter', 'Ruecker', 'hoQgeZcjo5xBkML1.jpg', 'Jacobi and Sons', '514 Hodkiewicz Heights Apt. 390\nKayliland, UT 07627', '495-407-7891', 'male', 'lframi@johnson.com', '2018-02-23 04:47:35', '2018-02-23 05:37:57'),
(5, 'Lawrence', 'Dietrich', 'Uq0MZjX1iar6SyC9.jpg', 'Mitchell-Kovacek', '996 Beaulah Circles Suite 413\nKaylahmouth, NY 86572', '528-874-4573 x78235', 'male', 'luettgen.holly@harber.com', '2018-02-23 04:47:35', '2018-02-23 05:37:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `name`, `last_name`, `picture`, `address`, `phone`, `gender`, `email`, `position`, `salary`, `created_at`, `updated_at`) VALUES
(1, 'Deonte', 'Weissnat', 'aErTdF0hAdwKxecl.jpg', '342 Bins Forges\nAlbertaville, DC 06523', '+1.505.374.4620', 'male', 'vdicki@yahoo.com', 'Network Systems Analyst', '598.00', '2018-02-23 04:47:33', '2018-02-23 04:57:06'),
(2, 'Therese', 'Doyle', '69kvl6ro1lutz6HT.jpg', '549 Ashlynn Ford\nDarrellville, WI 32409', '447-618-8011 x235', 'male', 'mharber@dach.biz', 'Pipelaying Fitter', '385.00', '2018-02-23 04:47:33', '2018-02-23 04:56:15'),
(3, 'Orpha', 'Blick', 'xaUKdWacpQePKwlu.jpg', '71283 Chaya Roads\nPouroston, MT 53944', '1-771-893-4275', 'male', 'lue21@corkery.com', 'Mold Maker', '328.00', '2018-02-23 04:47:34', '2018-02-23 04:53:27'),
(4, 'Kenna', 'Pouros', '4lVE0MOr0i4MvqA0.jpg', '946 Riley Ramp Suite 658\nZackchester, SC 21616-2775', '+1-550-961-0938', 'male', 'kovacek.ernesto@gmail.com', 'Drycleaning Machine Operator', '536.00', '2018-02-23 04:47:34', '2018-02-23 04:53:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `title`, `date`, `due_date`, `discount`, `sub_total`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 'Factura para cliente adonis de Pagac-Rowe.', '2017-10-26', '2017-09-25', '5.00', '3838.00', '3833.00', '2018-02-23 04:47:47', '2018-02-23 05:18:59'),
(2, 2, 'Factura para comprador', '2017-07-05', '2017-10-17', '73.00', '4260.00', '4187.00', '2018-02-23 04:47:48', '2018-02-23 05:18:05'),
(3, 1, 'Factura para Joseph de Hayes INC', '2017-05-14', '2017-01-28', '49.00', '4993.00', '4944.00', '2018-02-23 04:47:49', '2018-02-23 05:19:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, '2018-02-23 04:47:47', '2018-02-23 04:47:47'),
(3, 1, 3, 4, '2018-02-23 04:47:48', '2018-02-23 04:47:48'),
(4, 1, 2, 3, '2018-02-23 04:47:48', '2018-02-23 04:47:48'),
(6, 2, 1, 2, '2018-02-23 04:47:48', '2018-02-23 04:47:48'),
(7, 2, 4, 4, '2018-02-23 04:47:48', '2018-02-23 04:47:48'),
(8, 2, 2, 4, '2018-02-23 04:47:48', '2018-02-23 04:47:48'),
(11, 3, 2, 6, '2018-02-23 04:47:49', '2018-02-23 04:47:49'),
(12, 3, 4, 7, '2018-02-23 04:47:49', '2018-02-23 04:47:49'),
(13, 3, 3, 4, '2018-02-23 04:47:49', '2018-02-23 04:47:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_comment_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `post_comment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(2, 1, 2, NULL, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(3, 1, 2, NULL, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(4, 4, 2, NULL, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(5, 3, NULL, 3, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(6, 5, NULL, 1, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(7, 1, NULL, 2, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(8, 1, NULL, 1, '2018-02-23 04:47:52', '2018-02-23 04:47:52'),
(9, 2, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(10, 2, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(11, 2, NULL, 2, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(12, 3, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(13, 2, NULL, 2, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(14, 5, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(15, 1, NULL, 1, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(16, 4, NULL, 2, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(17, 3, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(18, 5, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(19, 2, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(20, 3, NULL, 3, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(21, 1, NULL, 2, '2018-02-23 04:47:53', '2018-02-23 04:47:53'),
(22, 3, NULL, 2, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(23, 3, NULL, 2, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(24, 2, NULL, 3, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(25, 4, NULL, 3, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(26, 3, NULL, 1, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(27, 5, NULL, 3, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(28, 2, NULL, 3, '2018-02-23 04:47:54', '2018-02-23 04:47:54'),
(29, 5, NULL, 2, '2018-02-23 04:47:54', '2018-02-23 04:47:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(12, '2016_06_01_000004_create_oauth_clients_table', 1),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(35, '2018_02_13_212852_create_notifications_table', 9),
(36, '2014_10_12_000000_create_users_table', 10),
(37, '2018_02_02_180355_create_products_table', 10),
(38, '2018_02_05_002412_create_employees_table', 10),
(39, '2018_02_05_011143_create_customers_table', 10),
(40, '2018_02_05_012651_create_invoices_table', 10),
(41, '2018_02_05_013803_create_invoice_items_table', 10),
(42, '2018_02_07_220906_create_chat_messages_table', 10),
(43, '2018_02_12_030748_create_providers_table', 10),
(44, '2018_02_12_042216_create_posts_table', 10),
(45, '2018_02_12_042308_create_likes_table', 10),
(46, '2018_02_12_140055_create_post_comments_table', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('23939c31-6949-4dbb-8a52-79c2ff81033e', 'Tbappback\\Notifications\\NotifyPostOwner', 1, 'Tbappback\\User', '{\"post\":{\"id\":3,\"user_id\":1,\"content\":\"Agregados nuevos productos en hardware PC\'s\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 01:21:46\",\"updated_at\":\"2018-02-23 01:21:46\",\"user\":{\"id\":1,\"name\":\"Joshua Martinez.\",\"email\":\"skynessj@gmail.com\",\"picture\":\"MPq6SdpLlWCqSzNO.jpg\",\"created_at\":\"2018-02-23 00:47:30\",\"updated_at\":\"2018-02-23 00:52:00\"}},\"userComm\":{\"id\":4,\"name\":\"Alfred Rempel\",\"email\":\"kcollier@example.net\",\"picture\":\"L0gNbL9vxL0nxFHC.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 01:28:13\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:29:41', '2018-02-23 05:29:41'),
('3c68ecfa-48e5-41da-9ad5-aaa6572b334b', 'Tbappback\\Notifications\\NotifyPostOwner', 2, 'Tbappback\\User', '{\"post\":{\"id\":6,\"user_id\":2,\"content\":\"My content\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-07-11 00:10:36\",\"updated_at\":\"2018-07-11 00:10:36\",\"user\":{\"id\":2,\"name\":\"Ing. Kitty Yundt\",\"email\":\"zwuckert@example.net\",\"picture\":\"oeHBYRchIg0jwRKD.jpg\",\"created_at\":\"2018-02-23 00:47:31\",\"updated_at\":\"2018-02-23 01:24:05\"}},\"userComm\":{\"id\":2,\"name\":\"Ing. Kitty Yundt\",\"email\":\"zwuckert@example.net\",\"picture\":\"oeHBYRchIg0jwRKD.jpg\",\"created_at\":\"2018-02-23 00:47:31\",\"updated_at\":\"2018-02-23 01:24:05\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-07-11 04:10:50', '2018-07-11 04:10:50'),
('64e5c489-3f3e-47a0-ab49-96a8a8934ae8', 'Tbappback\\Notifications\\NotifyPostOwner', 5, 'Tbappback\\User', '{\"post\":{\"id\":2,\"user_id\":5,\"content\":\"Doloremque quia et optio rerum ipsa.\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 00:47:50\",\"updated_at\":\"2018-02-23 00:47:50\",\"user\":{\"id\":5,\"name\":\"Miss Lue Sanford\",\"email\":\"rahsaan.sanford@example.org\",\"picture\":\"default.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 00:47:32\"}},\"userComm\":{\"id\":1,\"name\":\"Joshua Martinez.\",\"email\":\"skynessj@gmail.com\",\"picture\":\"MPq6SdpLlWCqSzNO.jpg\",\"created_at\":\"2018-02-23 00:47:30\",\"updated_at\":\"2018-02-23 00:52:00\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:20:40', '2018-02-23 05:20:40'),
('966190db-edc1-4eee-949b-5a708c2eccab', 'Tbappback\\Notifications\\NotifyPostOwner', 1, 'Tbappback\\User', '{\"post\":{\"id\":3,\"user_id\":1,\"content\":\"Agregados nuevos productos en hardware PC\'s\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 01:21:46\",\"updated_at\":\"2018-02-23 01:21:46\",\"user\":{\"id\":1,\"name\":\"Joshua Martinez.\",\"email\":\"skynessj@gmail.com\",\"picture\":\"MPq6SdpLlWCqSzNO.jpg\",\"created_at\":\"2018-02-23 00:47:30\",\"updated_at\":\"2018-02-23 00:52:00\"}},\"userComm\":{\"id\":5,\"name\":\"Luey Standford\",\"email\":\"rahsaan.sanford@example.org\",\"picture\":\"hGAAUzsf85M9MSo6.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 01:31:40\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:33:32', '2018-02-23 05:33:32'),
('a4a8d238-5de5-4bdb-bc4c-869f0e2d2d9d', 'Tbappback\\Notifications\\NotifyPostOwner', 3, 'Tbappback\\User', '{\"post\":{\"id\":4,\"user_id\":3,\"content\":\"En la secci\\u00f3n se personal se han agregado nuevos algoritmos!\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 01:26:42\",\"updated_at\":\"2018-02-23 01:26:42\",\"user\":{\"id\":3,\"name\":\"Ing. Allen Goldner\",\"email\":\"orion11@example.org\",\"picture\":\"AFdb0JvByzXHaCVj.jpg\",\"created_at\":\"2018-02-23 00:47:31\",\"updated_at\":\"2018-02-23 01:25:55\"}},\"userComm\":{\"id\":4,\"name\":\"Alfred Rempel\",\"email\":\"kcollier@example.net\",\"picture\":\"L0gNbL9vxL0nxFHC.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 01:28:13\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:30:06', '2018-02-23 05:30:06'),
('bcae26da-c740-451a-951a-132699367337', 'Tbappback\\Notifications\\NotifyPostOwner', 1, 'Tbappback\\User', '{\"post\":{\"id\":3,\"user_id\":1,\"content\":\"Agregados nuevos productos en hardware PC\'s\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 01:21:46\",\"updated_at\":\"2018-02-23 01:21:46\",\"user\":{\"id\":1,\"name\":\"Joshua Martinez.\",\"email\":\"skynessj@gmail.com\",\"picture\":\"MPq6SdpLlWCqSzNO.jpg\",\"created_at\":\"2018-02-23 00:47:30\",\"updated_at\":\"2018-02-23 00:52:00\"}},\"userComm\":{\"id\":2,\"name\":\"Ing. Kitty Yundt\",\"email\":\"zwuckert@example.net\",\"picture\":\"oeHBYRchIg0jwRKD.jpg\",\"created_at\":\"2018-02-23 00:47:31\",\"updated_at\":\"2018-02-23 01:24:05\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:24:29', '2018-02-23 05:24:29'),
('cdcdf4d3-31ee-4d99-8a17-3526e6ac54af', 'Tbappback\\Notifications\\NotifyPostOwner', 4, 'Tbappback\\User', '{\"post\":{\"id\":5,\"user_id\":4,\"content\":\"Las ventas se han incrementado en un 40% desde la incorporaci\\u00f3n de esta app!\",\"image\":\"default.jpg\",\"video\":\"default.mp4\",\"created_at\":\"2018-02-23 01:29:21\",\"updated_at\":\"2018-02-23 01:29:21\",\"user\":{\"id\":4,\"name\":\"Alfred Rempel\",\"email\":\"kcollier@example.net\",\"picture\":\"L0gNbL9vxL0nxFHC.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 01:28:13\"}},\"userComm\":{\"id\":5,\"name\":\"Luey Standford\",\"email\":\"rahsaan.sanford@example.org\",\"picture\":\"hGAAUzsf85M9MSo6.jpg\",\"created_at\":\"2018-02-23 00:47:32\",\"updated_at\":\"2018-02-23 01:31:40\"},\"header\":\" Ha comentado tu post!\"}', NULL, '2018-02-23 05:32:35', '2018-02-23 05:32:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03038d0200aeb814aa4fc2d6cf80c4bb09eb51351a8ab478090fc2517d7578828ddf39fd507c12a5', 9, 2, NULL, '[]', 0, '2018-02-10 07:40:18', '2018-02-10 07:40:18', '2019-02-10 03:40:18'),
('03eba847bbd73a2f729008473d09407e1a9d0592ef91b6da6e615e43f63972a5ecc9eed866bdd1d2', 1, 2, NULL, '[]', 0, '2018-02-06 03:07:40', '2018-02-06 03:07:40', '2019-02-05 23:07:40'),
('058882691fcd143cc3e4d33ead97a41aefad43fbd78963c24055eed499212bf985c891c80fee1f73', 1, 2, NULL, '[]', 0, '2018-02-06 03:15:26', '2018-02-06 03:15:26', '2019-02-05 23:15:26'),
('0616f4d63a8c1fb241ddffbf1ebc3be35c094bbf4848303ee7fb93731a6a22db6124d4a2e968f102', 5, 2, NULL, '[]', 0, '2018-02-14 05:49:39', '2018-02-14 05:49:39', '2019-02-14 01:49:39'),
('0694f7634adb2d11a76080f9349ae099511a7a80385d5c22a36370c8e4057c2a1fe8b9e4858d7c9c', 1, 2, NULL, '[]', 0, '2018-02-06 03:20:10', '2018-02-06 03:20:10', '2019-02-05 23:20:10'),
('0e7f96ab5754f79408406819aef325ef7db91766a707fe5515d47e416694320550e22bfc468caa0e', 2, 2, NULL, '[]', 0, '2018-02-10 05:28:21', '2018-02-10 05:28:21', '2019-02-10 01:28:21'),
('116dc6242da20e21638e220e3ce72edbcbe6018544e037fc30f91df76b782b1ec63deb89d86eb0c9', 3, 2, NULL, '[]', 0, '2018-02-02 02:51:18', '2018-02-02 02:51:18', '2019-02-01 22:51:18'),
('13c2708ab473da7c555f24d40be1d4eb09c743d593383b6a6c91f273f3eae0bea3ff5908be6d9b32', 5, 2, NULL, '[]', 0, '2018-02-22 23:50:30', '2018-02-22 23:50:30', '2019-02-22 19:50:30'),
('1993695a74b72899e32733c1b75e4388e808b67555479d2681c1a1d3a9a11ffabb32a048fb9b600d', 6, 2, NULL, '[]', 0, '2018-02-23 02:10:06', '2018-02-23 02:10:06', '2019-02-22 22:10:06'),
('1dde4fd7d0e0e8838f422273b6a6e4ab06cd31ce162403b3b5be40b38afafbe2a9fe02edf321e0d6', 1, 2, NULL, '[]', 0, '2018-02-05 06:31:34', '2018-02-05 06:31:34', '2019-02-05 02:31:34'),
('1f3b694cb0e01585b788b76186ba3bb7ad895bd4285f91b9d74c498e2d1edd6ffdf11d2b4d898c3f', 9, 2, NULL, '[]', 0, '2018-02-14 05:42:48', '2018-02-14 05:42:48', '2019-02-14 01:42:48'),
('1f9e13e1cc6ad291e397b0e7fbca551dd88099965ae638412a96880a33c389f4f9f449f8ea13d8c3', 1, 2, NULL, '[]', 0, '2018-02-06 03:17:39', '2018-02-06 03:17:39', '2019-02-05 23:17:39'),
('22b4c0b98a6c504a8238ebbbbb53f92ca9191d37f9fbb8a2bc80516d97de6f87fd8bf82394867533', 2, 2, NULL, '[]', 0, '2018-02-10 21:19:09', '2018-02-10 21:19:09', '2019-02-10 17:19:09'),
('233ccb124ad734a8b86e8f7a4e9e4a8be1a391c7214d0a203a44d29e3978aedcd55012e3c5db9da2', 13, 2, NULL, '[]', 0, '2018-02-14 05:16:07', '2018-02-14 05:16:07', '2019-02-14 01:16:07'),
('2836e3c11ae36248ec94a7307f8ff11cad49f909284efa31a861d8be9e98490347e4e80c503fc771', 7, 2, NULL, '[]', 0, '2018-02-12 06:07:26', '2018-02-12 06:07:26', '2019-02-12 02:07:26'),
('29c9d267a6a944617b7e61fe2797fb6a98edf6ff0595e9602ddcab80f209235f70e1235b66a9a156', 7, 2, NULL, '[]', 0, '2018-02-14 05:31:54', '2018-02-14 05:31:54', '2019-02-14 01:31:54'),
('2a7988833025019a41f8e1d7300565e4c1eb6d31d7b3e9ce27f70686e0cdb1038e74145ab2932e7d', 3, 2, NULL, '[]', 0, '2018-02-03 20:34:16', '2018-02-03 20:34:16', '2019-02-03 16:34:16'),
('31c6b2496fa37f5713f4721e32ce042e2c60c7ba2e886adbea0672abaff804dc9b763e893038995d', 3, 2, NULL, '[]', 0, '2018-02-02 04:14:31', '2018-02-02 04:14:31', '2019-02-02 00:14:31'),
('32d96d010f3f58ad81b26838135f3d5bbd5762d037cf8fe4738e379cf475ab9b27334deb0d723407', 5, 2, NULL, '[]', 0, '2018-02-22 05:01:43', '2018-02-22 05:01:43', '2019-02-22 01:01:43'),
('3356aca3469baad44a576ff7665568d1968e4149fa8b83122e1c795fc388aaf9e55459e19a91dbe2', 1, 2, NULL, '[]', 0, '2018-02-06 03:23:02', '2018-02-06 03:23:02', '2019-02-05 23:23:02'),
('398823d4def89149c912ebe287f8e1986217b0d221c7d521ac12095a20cf7722dad0759438e3644f', 8, 2, NULL, '[]', 0, '2018-02-14 05:48:02', '2018-02-14 05:48:02', '2019-02-14 01:48:02'),
('3a28d2635b67ce024f74d2e4520edf9b61217ea2030c2648095034d992829c21a1b655523b8ce5d8', 1, 2, NULL, '[]', 0, '2018-02-08 01:35:31', '2018-02-08 01:35:31', '2019-02-07 21:35:31'),
('3aa0c2bc766c8d5c4c9c45892c96d50091c8daf1a894deddd9d1680bc6320be6df5b7c62f408d89c', 1, 2, NULL, '[]', 0, '2018-02-06 03:00:36', '2018-02-06 03:00:36', '2019-02-05 23:00:36'),
('3eb2800b0f0ad74edf0aa00ef26d885a267e73a26e7b1af44e669283aa0941b7d687756df6e05d4d', 3, 2, NULL, '[]', 0, '2018-02-01 07:54:04', '2018-02-01 07:54:04', '2019-02-01 03:54:04'),
('3ee9f6a729abdffc86bd7d503e47f61de455c0a0739658afb80d34849b4d9da744348849c0ed6a07', 5, 2, NULL, '[]', 0, '2018-02-14 04:55:25', '2018-02-14 04:55:25', '2019-02-14 00:55:25'),
('44752445824a08e9934740e13d61f26f92b2c314e484237f31fcf8c2f498c8836633d036e48fa343', 11, 2, NULL, '[]', 0, '2018-02-10 07:13:12', '2018-02-10 07:13:12', '2019-02-10 03:13:12'),
('496a8c7f70e4c9c7f49a79a66954f26112e142d2c9709fb8cddacc51d4169812bb749451432a197d', 3, 2, NULL, '[]', 0, '2018-02-01 07:26:45', '2018-02-01 07:26:45', '2019-02-01 03:26:45'),
('4a970a2ae58747289e4a0924784d51429ad676766a9496a2a9d407d5882084776f70604de61c2d14', 3, 2, NULL, '[]', 0, '2018-02-02 19:21:27', '2018-02-02 19:21:27', '2019-02-02 15:21:27'),
('562ab3f5dee7161cc185d52a3da7bb3e10f2d5c7c4c63e999c8232c3205e011087a72d6833402462', 11, 2, NULL, '[]', 0, '2018-02-14 05:43:57', '2018-02-14 05:43:57', '2019-02-14 01:43:57'),
('570ab3a47ae43febfd6909096d8dce7878cb4565a43d886da9ed2154b9d06e6199c1b1f8e29404b6', 3, 2, NULL, '[]', 0, '2018-02-02 02:00:00', '2018-02-02 02:00:00', '2019-02-01 22:00:00'),
('5b760b94edff5b0b245f366e42172250753121b3fccd10a9bc3c8b405ac7f3d4836c1c2fe55f4c82', 3, 2, NULL, '[]', 0, '2018-02-03 18:54:03', '2018-02-03 18:54:03', '2019-02-03 14:54:03'),
('5ccb842b1d4c214a7ab29733c9107cec64be0b340bc2bea827de83654b63ae03d777799e8d24d8e3', 1, 2, NULL, '[]', 0, '2018-02-23 04:50:06', '2018-02-23 04:50:06', '2019-02-23 00:50:06'),
('5f59291df98c2f0ba7355e04e6635a5f6c85a617dfbd1f35e1043c8f5a5de4158c215762dff24749', 6, 2, NULL, '[]', 0, '2018-02-13 04:38:41', '2018-02-13 04:38:41', '2019-02-13 00:38:41'),
('5fa0dcb9f4034c776b893f73098bf548e07bd9269ac69478fc1f0b51d2ba8163628c6f08fa6583ab', 2, 2, NULL, '[]', 0, '2018-07-11 04:06:13', '2018-07-11 04:06:13', '2019-07-11 00:06:13'),
('5ff4126e969c612aab7c8029682e3ed4e944b2f6b55694a1b08b996cccd68a04ef8fd200ab5b5bf1', 3, 2, NULL, '[]', 0, '2018-02-02 02:42:01', '2018-02-02 02:42:01', '2019-02-01 22:42:01'),
('62528a8ad0d59f8573be09011935acf1c98ae03f1673f1ac2645f7a3daf9a75b1ccb964ade2449da', 1, 2, NULL, '[]', 0, '2018-02-06 03:11:56', '2018-02-06 03:11:56', '2019-02-05 23:11:56'),
('665c01b0ccc1632e6d12776b77d98809b199b71af7e8a6185a525f0ffca52cbb75159538e5aafbc8', 1, 2, NULL, '[]', 0, '2018-02-06 03:21:29', '2018-02-06 03:21:29', '2019-02-05 23:21:29'),
('666daf522dd07fc6ed635d27a16c35424dec490dfb4a76b46e263676e588707a080b987c93472f3a', 3, 2, NULL, '[]', 0, '2018-02-02 20:17:51', '2018-02-02 20:17:51', '2019-02-02 16:17:51'),
('670a6ff8bb73915975025d5eb065bacc50dd01b9a4cca5d95e9e1eef355794681b000ad5aecf3592', 3, 2, NULL, '[]', 0, '2018-02-04 05:30:50', '2018-02-04 05:30:50', '2019-02-04 01:30:50'),
('6cceeca5764daaddc5c837c7f3ff1bbff259b37d591a26382660ac3bf641c3ce4af9536f3cd19239', 3, 2, NULL, '[]', 0, '2018-02-02 18:43:58', '2018-02-02 18:43:58', '2019-02-02 14:43:58'),
('74859f0f823f8dd2d5f8b37489df7c1f73e2c5ed3ac1feb736a055e8f287ec6f71e8589b5e79bb54', 5, 2, NULL, '[]', 0, '2018-02-13 20:30:56', '2018-02-13 20:30:56', '2019-02-13 16:30:56'),
('764283214e25addd239ca7b4b2e2990a757275d02c4b80a9a940dbaeed28131843764501504defae', 3, 2, NULL, '[]', 0, '2018-02-02 04:17:50', '2018-02-02 04:17:50', '2019-02-02 00:17:50'),
('7b6763de5d5da90b8bde8dcdd5c51c19b125a015edaabfeb93e7bb72bd72d25b30e2a6f06856003c', 3, 2, NULL, '[]', 0, '2018-02-23 05:25:14', '2018-02-23 05:25:14', '2019-02-23 01:25:14'),
('833802a047e05617a72b699c1c53661f99d626f9f68a1ff84982507630806b7cd167a1287b2580ad', 2, 2, NULL, '[]', 0, '2018-02-23 05:22:56', '2018-02-23 05:22:56', '2019-02-23 01:22:56'),
('878400c79e27265947ff09741bac99b7da56d69730553a8232c291d0e05027bd1aee01d4f784e0bb', 3, 2, NULL, '[]', 0, '2018-02-02 02:02:31', '2018-02-02 02:02:31', '2019-02-01 22:02:31'),
('8b923f808d92be078c6de478b5c13dbaacad64e909072645ab7ee45145657cfcdb3c22458df245d4', 1, 2, NULL, '[]', 0, '2018-02-06 02:56:00', '2018-02-06 02:56:00', '2019-02-05 22:56:00'),
('90b03ce49c62d31b410453bee8355e8f9faa685b3976bd77f64bbfa0dd39178c5d1e8b2c1dded210', 1, 2, NULL, '[]', 0, '2018-02-06 03:01:49', '2018-02-06 03:01:49', '2019-02-05 23:01:49'),
('9179cc09ae1d445a26eda5eeca0cb03845fa812d62ca4f0735663c3c13478296a28c133c156d6fb5', 4, 2, NULL, '[]', 0, '2018-02-10 21:19:22', '2018-02-10 21:19:22', '2019-02-10 17:19:22'),
('919ccd1dc79272fada83290c5fb2084f52273af5f9e6038d762da3591128cf600aa8cc9e64213dd6', 1, 2, NULL, '[]', 0, '2018-02-06 03:10:30', '2018-02-06 03:10:30', '2019-02-05 23:10:30'),
('937d73a14afb34ecea37e001b6f515b22442395b4da33d647ad64376cd22dbdfdbd96780fa5c2643', 1, 2, NULL, '[]', 0, '2018-02-07 16:22:05', '2018-02-07 16:22:05', '2019-02-07 12:22:05'),
('942505e28545519c6cc104d0a748d56592200ac780e421ccf26af231a6ecfb3571fb678564785053', 3, 2, NULL, '[]', 0, '2018-02-03 06:38:25', '2018-02-03 06:38:25', '2019-02-03 02:38:25'),
('a09b2ac1cc28b7618d30cdb696f039f2d3366d121173fa94061340736f355430c2d13d459d98dddc', 3, 2, NULL, '[]', 0, '2018-02-02 04:16:00', '2018-02-02 04:16:00', '2019-02-02 00:16:00'),
('a27c82d98e920be0f27576331f00e4c73b92384314b68aec001e8e8d58515a01496f5ae9cb1e1779', 5, 2, NULL, '[]', 0, '2018-02-10 21:55:24', '2018-02-10 21:55:24', '2019-02-10 17:55:24'),
('a2ec33ab1d1de9bb0b95245546d3d40df2e9f512f5acd87ac4746b8bd4c181b890984aa853d1a444', 5, 2, NULL, '[]', 0, '2018-02-18 20:21:25', '2018-02-18 20:21:25', '2019-02-18 16:21:25'),
('a4720b36a55c5bfcf04440c3947ec9f0c0fc4aefe0222c60443989fb7805e3c5bf259ecbf837af52', 1, 2, NULL, '[]', 0, '2018-02-06 03:24:19', '2018-02-06 03:24:19', '2019-02-05 23:24:19'),
('a524c2db0a99d45f9850748962c6ef894739ee63228414e74f9dc1e4c0ec958b68d0aa0bde330dc1', 3, 2, NULL, '[]', 0, '2018-02-05 04:47:19', '2018-02-05 04:47:19', '2019-02-05 00:47:19'),
('a5892a7adcf45184fa0249a9d0ad50de98edb65a9707d31dc27a07a7a7ab24a3b844bca7c7bdb464', 3, 2, NULL, '[]', 0, '2018-02-02 01:52:29', '2018-02-02 01:52:29', '2019-02-01 21:52:29'),
('a6eb1fb78c0c735c5a10c7db8aa0c91721c3fb74d1790198c23f5de3ebc1779816a6138daea077bb', 5, 2, NULL, '[]', 0, '2018-02-23 02:57:39', '2018-02-23 02:57:39', '2019-02-22 22:57:39'),
('a9a77f4d08a7fcbf678eed95c732859ff8c929a2ee6d2905f9a5438362d422711f0691642614a6d2', 8, 2, NULL, '[]', 0, '2018-02-11 19:21:20', '2018-02-11 19:21:20', '2019-02-11 15:21:20'),
('aa55f102239fc28677d2fd2a7950ac4e0650a78e3d1611628a7b00d339598841f24c58830723a160', 5, 2, NULL, '[]', 0, '2018-02-23 05:30:44', '2018-02-23 05:30:44', '2019-02-23 01:30:44'),
('ad21ae5cea88f1374ff08d7e7707f3b61a4d79516530d537f4845b120329690bfa00e8bc577e3b8d', 3, 2, NULL, '[]', 0, '2018-02-05 04:01:41', '2018-02-05 04:01:41', '2019-02-05 00:01:41'),
('b7f36dddcb38cc35bbe9797cf332a21fdb6effb225e68887010d9b8c2a1e3be782fe831b99ba78aa', 1, 2, NULL, '[]', 0, '2018-02-06 02:54:56', '2018-02-06 02:54:56', '2019-02-05 22:54:56'),
('b9145eb974bcbc6b0d39be8a6ac6d80283b5282d6d80a0df35206c89c58250762aad9dcbd4768f98', 3, 2, NULL, '[]', 0, '2018-02-02 02:21:35', '2018-02-02 02:21:35', '2019-02-01 22:21:35'),
('b9c6eb0286baa345b232313bec84c423d9bc59f3ce383ed22c4eeda75ba00f8323875a9e8d8ae328', 3, 2, NULL, '[]', 0, '2018-02-01 07:50:15', '2018-02-01 07:50:15', '2019-02-01 03:50:15'),
('ba90343624df59b0713e7ac9379cb82480853058d1b5b384dcf7fea67623748052239160e1975c45', 1, 2, NULL, '[]', 0, '2018-02-06 05:10:03', '2018-02-06 05:10:03', '2019-02-06 01:10:03'),
('bb999ca73136559d5d1a66b458e6f64726711b9a52d0ded6b766abe63cc86af21bb08ac17d83fb69', 4, 2, NULL, '[]', 0, '2018-02-23 05:27:31', '2018-02-23 05:27:31', '2019-02-23 01:27:31'),
('c04927f7255643dc4de110f3a60c287520e44fba4b421105fa69bcffe7bed3f501ca2dec76d9c0fd', 3, 2, NULL, '[]', 0, '2018-02-02 05:31:24', '2018-02-02 05:31:24', '2019-02-02 01:31:24'),
('c2d37b24ae0d4a527b7de6f4c2a7d34690afcd7c6433992084fa3a388187968110bea83178ad0908', 1, 2, NULL, '[]', 0, '2018-02-06 05:08:15', '2018-02-06 05:08:15', '2019-02-06 01:08:15'),
('c5e301f9e9220c85775037eb459ff0a22a515407ada242314ab2de8b2c8409ed021d6b37da480c3e', 1, 2, NULL, '[]', 0, '2018-02-23 05:34:18', '2018-02-23 05:34:18', '2019-02-23 01:34:18'),
('caf31b5b15194512f32fe3ada5eee134bb7e453fbaefe435222181a964c8414bc04fc816916e9207', 3, 2, NULL, '[]', 0, '2018-02-01 07:36:46', '2018-02-01 07:36:46', '2019-02-01 03:36:46'),
('d1b247cb4317b8c9335c3e7a984eac80b151a9627e70cc10d95e9cde01aff13b3b62d32434242041', 3, 2, NULL, '[]', 0, '2018-02-02 03:53:06', '2018-02-02 03:53:06', '2019-02-01 23:53:06'),
('d1f5d67ecd3a99ce20cccb581957ec4c294162d7921773711bf4e40ef0c41ffcb5f988e9d225d86b', 3, 2, NULL, '[]', 0, '2018-02-02 05:56:05', '2018-02-02 05:56:05', '2019-02-02 01:56:05'),
('d3e7481a878302215a99c625240d0385ecfb1e77d78331dc6680cdb6b2c5a1f74613cb3fdd207324', 3, 2, NULL, '[]', 0, '2018-02-04 18:58:08', '2018-02-04 18:58:08', '2019-02-04 14:58:08'),
('d587f737eebe61ae17b3ffd80065c789d35ed54d7eab0dcbeb3fb561e6e49f4e8853607410267116', 3, 2, NULL, '[]', 0, '2018-02-02 04:18:00', '2018-02-02 04:18:00', '2019-02-02 00:18:00'),
('db95335e68aa99b24d55e8c79210e5d5b3a7102a619706b158ff21afb769a151027f2dd59d5f3636', 1, 2, NULL, '[]', 0, '2018-02-06 03:12:48', '2018-02-06 03:12:48', '2019-02-05 23:12:48'),
('e5030073111e3196799318794b7ba66ea146622d5d3f5cdaaaa9d203c4dcb566663c54c5fce0a5c4', 4, 2, NULL, '[]', 0, '2018-02-12 18:21:01', '2018-02-12 18:21:01', '2019-02-12 14:21:01'),
('e6b012d08668c20a3ffa435bc8a6546ae8b01d8750d7ce4a1ed4f6de4e1b996edd3229b552a99a8a', 3, 2, NULL, '[]', 0, '2018-02-02 02:03:46', '2018-02-02 02:03:46', '2019-02-01 22:03:46'),
('e90da3876e99e554ea4b1a5a34909f09ffb625f1b2ca9317e9e2c2ad5998131c09dd7be3eb3a2621', 3, 2, NULL, '[]', 0, '2018-02-02 20:44:10', '2018-02-02 20:44:10', '2019-02-02 16:44:10'),
('ebb6d8e39e27850a2967a32fa3b61a2cf92607466380f8f167a14c74a7bac552fa34d4300f00ccb6', 6, 2, NULL, '[]', 0, '2018-02-14 04:51:47', '2018-02-14 04:51:47', '2019-02-14 00:51:47'),
('efe8a32f90feb6576835250330eb6d759fa05e1f259ce2052e973b8dec7bb1ff8cecf3a067b428eb', 5, 2, NULL, '[]', 0, '2018-02-19 05:11:19', '2018-02-19 05:11:19', '2019-02-19 01:11:19'),
('f3f30c91e4a544511e3c0890244e9d15627dac82932ab6e33a31a6c65afb977ff42281319156f6fe', 1, 2, NULL, '[]', 0, '2018-02-06 05:18:42', '2018-02-06 05:18:42', '2019-02-06 01:18:42'),
('f5335fb63a13bf0be90ed618f9e7febf1b361a009d77f278c5e52200333d813c7b6254118fb43d6e', 3, 2, NULL, '[]', 0, '2018-02-02 20:09:10', '2018-02-02 20:09:10', '2019-02-02 16:09:10'),
('fae972c9b60a1acfc9b94c1231144b166deb1aa5b71158adf342599c65e46046b9c9a808b1403bd5', 3, 2, NULL, '[]', 0, '2018-02-02 03:32:09', '2018-02-02 03:32:09', '2019-02-01 23:32:09'),
('fd81f98977ca801f363d63840e0fde602705be7a6999d1adc4ad930cec35f7dcc77f44a4695c156d', 4, 2, NULL, '[]', 0, '2018-02-14 05:45:00', '2018-02-14 05:45:00', '2019-02-14 01:45:00'),
('fdf7cf85d75516d051adbb06b9c818fe1b0e3a749a1ae69553b815e3b95035e6e1b413157a3dc3f7', 3, 2, NULL, '[]', 0, '2018-02-02 18:24:49', '2018-02-02 18:24:49', '2019-02-02 14:24:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Tbappback Personal Access Client', 'yhk4OhwsuNSp4ePeWq6ZxPMJCLmpjQSbMPiwPWI6', 'http://localhost', 1, 0, 0, '2018-02-01 06:43:37', '2018-02-01 06:43:37'),
(2, NULL, 'Tbappback Password Grant Client', 'PA54awpBfEbfr4h4eJoar4jMnmwU3RUPo7mKT6NE', 'http://localhost', 0, 1, 0, '2018-02-01 06:43:37', '2018-02-01 06:43:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-02-01 06:43:37', '2018-02-01 06:43:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0102d010c2246adfedddc05955a040c0e8d817a66bb8cdb95bc2c8c39213940f5126da4acdccc298', '1f3b694cb0e01585b788b76186ba3bb7ad895bd4285f91b9d74c498e2d1edd6ffdf11d2b4d898c3f', 0, '2019-02-14 01:42:48'),
('032de34385576fbc55e2b1ae53ba9158b804b39fb352bc790b2a39473abc08e85b4e9018f9ee147f', '1f9e13e1cc6ad291e397b0e7fbca551dd88099965ae638412a96880a33c389f4f9f449f8ea13d8c3', 0, '2019-02-05 23:17:39'),
('090446a39f0e0beb44a0fc029cadab5fb5064e9f3a607fe876e3629b443a2dc1a3020aff5420d352', 'e90da3876e99e554ea4b1a5a34909f09ffb625f1b2ca9317e9e2c2ad5998131c09dd7be3eb3a2621', 0, '2019-02-02 16:44:11'),
('118a6d4f11d7008356e508f6a70238b9051e67c1e53f329306535f129fe1476a964a4820f4dd1d68', '3a28d2635b67ce024f74d2e4520edf9b61217ea2030c2648095034d992829c21a1b655523b8ce5d8', 0, '2019-02-07 21:35:32'),
('127f937acf0a5ff43aed758b5056e0eba01d3bb2f3cf9d8e200392467601d10b51fddadea8cd99c2', '2836e3c11ae36248ec94a7307f8ff11cad49f909284efa31a861d8be9e98490347e4e80c503fc771', 0, '2019-02-12 02:07:26'),
('18358a56372eb7c5e47a7660d72a2436006bcd68fce86c6796f240afaf09b867805dadd7035f0872', '2a7988833025019a41f8e1d7300565e4c1eb6d31d7b3e9ce27f70686e0cdb1038e74145ab2932e7d', 0, '2019-02-03 16:34:16'),
('1c031208b93c9af5cdfbfceb8e8c622febd5249f5d83d89ba9120787a9bfe3e20b6841fbce6d5965', 'd587f737eebe61ae17b3ffd80065c789d35ed54d7eab0dcbeb3fb561e6e49f4e8853607410267116', 0, '2019-02-02 00:18:01'),
('213cc5d253b67af84215754d9958a5f75930aed6ad3869737a7119a12628f670fe3dea14c47ec0db', 'ad21ae5cea88f1374ff08d7e7707f3b61a4d79516530d537f4845b120329690bfa00e8bc577e3b8d', 0, '2019-02-05 00:01:42'),
('2892d0b7ef56606b0c97b9ef2d99bb8097a421a5b1489c85c39ec13507899162005b3ef6b6360dba', '670a6ff8bb73915975025d5eb065bacc50dd01b9a4cca5d95e9e1eef355794681b000ad5aecf3592', 0, '2019-02-04 01:30:50'),
('28d18609e116493d154e0be31b31211fa73b53cc5c2e33c41a7230345734d82e3aa5bc1106a294de', '22b4c0b98a6c504a8238ebbbbb53f92ca9191d37f9fbb8a2bc80516d97de6f87fd8bf82394867533', 0, '2019-02-10 17:19:11'),
('2c62dd429ee1d2d0df1d6b9a791adb2ac1cec67ae8556047f3c1b81f76ef69afb1475f6b5a660773', '5b760b94edff5b0b245f366e42172250753121b3fccd10a9bc3c8b405ac7f3d4836c1c2fe55f4c82', 0, '2019-02-03 14:54:04'),
('2dce654d890ea00629bd92495dd972f5dd33a55d84b61399ad19667a48511f58d7f82915070ddcf4', '764283214e25addd239ca7b4b2e2990a757275d02c4b80a9a940dbaeed28131843764501504defae', 0, '2019-02-02 00:17:50'),
('2fca8c77b59593a7d942867faf9391e575bbe8ca1ad14b02bbbb04226f2c3330f74f617e3676bb04', '90b03ce49c62d31b410453bee8355e8f9faa685b3976bd77f64bbfa0dd39178c5d1e8b2c1dded210', 0, '2019-02-05 23:01:49'),
('33988082794eb4cfa96d6974aa2cb7ff3a6ec86180d619e53f406715230361bca3180ce64105b081', '5ccb842b1d4c214a7ab29733c9107cec64be0b340bc2bea827de83654b63ae03d777799e8d24d8e3', 0, '2019-02-23 00:50:07'),
('36bcb8b9b51261ff9fa6be98c32f4855c17b01e16489562029c6d21301d2eb08c26ab0fe3dbeb0db', 'ebb6d8e39e27850a2967a32fa3b61a2cf92607466380f8f167a14c74a7bac552fa34d4300f00ccb6', 0, '2019-02-14 00:51:47'),
('36e7c8df29561a110ccd1789d18a4f266ecec8b0c9eeff69a21f3dd41999c435a0b3ba7a5e82eaa6', '937d73a14afb34ecea37e001b6f515b22442395b4da33d647ad64376cd22dbdfdbd96780fa5c2643', 0, '2019-02-07 12:22:05'),
('39898c8c3a640378d84f7f61a040719eb78f18b4b59b638df1304064334640a30060c970a490b871', '44752445824a08e9934740e13d61f26f92b2c314e484237f31fcf8c2f498c8836633d036e48fa343', 0, '2019-02-10 03:13:12'),
('3c71439a4f57ed0e1c31caff65aaa0364ea966f16a46b6a2f7fc6f3df9da1f33d479b9e5090ba9a1', '3aa0c2bc766c8d5c4c9c45892c96d50091c8daf1a894deddd9d1680bc6320be6df5b7c62f408d89c', 0, '2019-02-05 23:00:36'),
('3f2be3b2cf91ced14aa15c67199449ca0827ff6ffac2062f8ce681334370003a7fa2c4c1cd6c8947', '5ff4126e969c612aab7c8029682e3ed4e944b2f6b55694a1b08b996cccd68a04ef8fd200ab5b5bf1', 0, '2019-02-01 22:42:01'),
('447022193b90f4641c881425f16a45e58a5c91d1de7f57b1d03d069d1f6806b2153c3887d853cb3a', '62528a8ad0d59f8573be09011935acf1c98ae03f1673f1ac2645f7a3daf9a75b1ccb964ade2449da', 0, '2019-02-05 23:11:56'),
('4a17eaef1d4268961bab82aa1cc87ed2ee87564e1d9bbdfff703bacbee6f9619b1e27fe6bdbb6a49', 'a09b2ac1cc28b7618d30cdb696f039f2d3366d121173fa94061340736f355430c2d13d459d98dddc', 0, '2019-02-02 00:16:00'),
('4a7bea82bf74f49224fd05332080fcf4956b92ac0898b5f0541e02092acd4cfe388b1eb404fa61e3', 'a2ec33ab1d1de9bb0b95245546d3d40df2e9f512f5acd87ac4746b8bd4c181b890984aa853d1a444', 0, '2019-02-18 16:21:26'),
('4ab476573dfde2250d0af30a60f3e112e137d3f99b0e6d52b6d33a4783d774c1fcdd125ad37b5bd9', '29c9d267a6a944617b7e61fe2797fb6a98edf6ff0595e9602ddcab80f209235f70e1235b66a9a156', 0, '2019-02-14 01:31:54'),
('4b74663bc275474da608024cba38fb0d2e0f3e1a99749262e10baeb2b957bfd05a462beb866ab6a6', '562ab3f5dee7161cc185d52a3da7bb3e10f2d5c7c4c63e999c8232c3205e011087a72d6833402462', 0, '2019-02-14 01:43:57'),
('53655bcfd16a8f1ca1c669822eeab2e648d445b179d9f38786fb303868dbd86a22d923836549e60a', '74859f0f823f8dd2d5f8b37489df7c1f73e2c5ed3ac1feb736a055e8f287ec6f71e8589b5e79bb54', 0, '2019-02-13 16:30:57'),
('53f76c9dcac58b5b50584522d77e1ae5e5c49c9318e3f1849184e5293145fc6efe8656463ebe7711', '3ee9f6a729abdffc86bd7d503e47f61de455c0a0739658afb80d34849b4d9da744348849c0ed6a07', 0, '2019-02-14 00:55:25'),
('5c58186c97b0863e330c15f4f0cbefc61b0eeb3a60f3235a4c3421e1cf4fbb2025f08f7d09e0ae8b', 'bb999ca73136559d5d1a66b458e6f64726711b9a52d0ded6b766abe63cc86af21bb08ac17d83fb69', 0, '2019-02-23 01:27:31'),
('5c7d7b1327789173f4b376c117f523b89caff40469e69825c57505bcdde69d6e7d078b49b18db382', '8b923f808d92be078c6de478b5c13dbaacad64e909072645ab7ee45145657cfcdb3c22458df245d4', 0, '2019-02-05 22:56:00'),
('5cf8da7f7b8fd138419d498b836ff1bffb550018f667befff43a1b3abcc32c3059918ebc28ed3b2f', '1dde4fd7d0e0e8838f422273b6a6e4ab06cd31ce162403b3b5be40b38afafbe2a9fe02edf321e0d6', 0, '2019-02-05 02:31:34'),
('6053fb67cf3d1b4f5b1372e596bb8387e5ad05552b2fdd6f49c6f07a6a6fe3a98844c70eebad8ba1', '116dc6242da20e21638e220e3ce72edbcbe6018544e037fc30f91df76b782b1ec63deb89d86eb0c9', 0, '2019-02-01 22:51:19'),
('60a00882ad710ecd13b99e958e62e69b9ae59552b80c421a0331f0f0760c7d2d659ccc4cb6e74489', '919ccd1dc79272fada83290c5fb2084f52273af5f9e6038d762da3591128cf600aa8cc9e64213dd6', 0, '2019-02-05 23:10:31'),
('63f719266bc52cbdcc5f2cdb96eff1ee8fcd8b1323b5f42af469f0925ed5153a26239d8caba1490f', '398823d4def89149c912ebe287f8e1986217b0d221c7d521ac12095a20cf7722dad0759438e3644f', 0, '2019-02-14 01:48:02'),
('695e6e14804c30f2b69a85b3faa143514fee9fd3f7d0de19eb468fd57f19386b0e84c0c8dd66cf26', 'a9a77f4d08a7fcbf678eed95c732859ff8c929a2ee6d2905f9a5438362d422711f0691642614a6d2', 0, '2019-02-11 15:21:21'),
('6b906428c197b39d1b3b09a6f5dc9ffb6b6d6e0ddb8bd39970e9e1d5da168c6bb44e14715f68fe0a', '878400c79e27265947ff09741bac99b7da56d69730553a8232c291d0e05027bd1aee01d4f784e0bb', 0, '2019-02-01 22:02:31'),
('6d56f1f104b60746037756fc1a46868269ab99a776c0f85309e13e29402b6ddc28cf52ae28a4b2d8', 'b9145eb974bcbc6b0d39be8a6ac6d80283b5282d6d80a0df35206c89c58250762aad9dcbd4768f98', 0, '2019-02-01 22:21:35'),
('6f7d434ecf16ae31b269b76edf2068c87e511971360dd1dea0bdf42f100cdd496b081d4c22f3f385', '5f59291df98c2f0ba7355e04e6635a5f6c85a617dfbd1f35e1043c8f5a5de4158c215762dff24749', 0, '2019-02-13 00:38:41'),
('6f9ae3c4f1ecf683a3e324e4bc120a6523dddc75a0c5c7de0c295b2b26131d558f06d7716160bb1b', 'e5030073111e3196799318794b7ba66ea146622d5d3f5cdaaaa9d203c4dcb566663c54c5fce0a5c4', 0, '2019-02-12 14:21:01'),
('714dc8e2a79d1cd47544e89c8b3b74cf9611471edb30e938de55b25512894877e6e3227e2fc51398', '833802a047e05617a72b699c1c53661f99d626f9f68a1ff84982507630806b7cd167a1287b2580ad', 0, '2019-02-23 01:22:56'),
('7391a02ef062a78922006cd14131268e0fedd1c52fafe33e3b3754d8b312b62b756466419ed0f013', 'c04927f7255643dc4de110f3a60c287520e44fba4b421105fa69bcffe7bed3f501ca2dec76d9c0fd', 0, '2019-02-02 01:31:24'),
('73f8df14dffb66abb278b6c823d7c218ebc79163b69b890e120269e0d0d84ae4961e56970ec5947b', 'a524c2db0a99d45f9850748962c6ef894739ee63228414e74f9dc1e4c0ec958b68d0aa0bde330dc1', 0, '2019-02-05 00:47:19'),
('766bb7d5506a7948ee799138b157c21f3285e362113e5d8001e4c3b52120cbf1b24b5a3e522599a9', '665c01b0ccc1632e6d12776b77d98809b199b71af7e8a6185a525f0ffca52cbb75159538e5aafbc8', 0, '2019-02-05 23:21:29'),
('76b4be8902724b804b52a4718400697fd3fe3ec1f0b770aeb7595a54050e1a00ffd3a9401313c6cf', '13c2708ab473da7c555f24d40be1d4eb09c743d593383b6a6c91f273f3eae0bea3ff5908be6d9b32', 0, '2019-02-22 19:50:30'),
('78a4303ddab8400a313488cf329ecb2e2f19d88c3b48f357d2a8f6c69ff7e827458cd459f84c7cb1', 'f3f30c91e4a544511e3c0890244e9d15627dac82932ab6e33a31a6c65afb977ff42281319156f6fe', 0, '2019-02-06 01:18:42'),
('791d4eab5c7149875825ccd0ef18e0a713573a9f29270f3456430b86e65bb285b68d60f3cc4ae22e', 'a6eb1fb78c0c735c5a10c7db8aa0c91721c3fb74d1790198c23f5de3ebc1779816a6138daea077bb', 0, '2019-02-22 22:57:39'),
('7a69d40b36981bcdb08c36057c8300d79222a5c1037ce02daf1a0efc06d95109a7b8ea773a7ae0d3', '7b6763de5d5da90b8bde8dcdd5c51c19b125a015edaabfeb93e7bb72bd72d25b30e2a6f06856003c', 0, '2019-02-23 01:25:14'),
('81ffdcdc451aba3ef1de4888e0724480ddf913c57a95d2715a1e42af4dd5694e715f99b207872cad', 'a5892a7adcf45184fa0249a9d0ad50de98edb65a9707d31dc27a07a7a7ab24a3b844bca7c7bdb464', 0, '2019-02-01 21:52:29'),
('84eda5895b3189f57bffa398b2f2bd82b5ebeac0cd67330868695529ab819b7766baf7225a9cb92c', '3eb2800b0f0ad74edf0aa00ef26d885a267e73a26e7b1af44e669283aa0941b7d687756df6e05d4d', 0, '2019-02-01 03:54:04'),
('8bc1f3773984412ec761b1d067e8671adf55c695c95983af5faaa8a3094f5906f3cf190042d1ab02', '1993695a74b72899e32733c1b75e4388e808b67555479d2681c1a1d3a9a11ffabb32a048fb9b600d', 0, '2019-02-22 22:10:07'),
('8d34ec4efabe49f7e0ead374482401f89d6fbc214c6b74e74afb86f7496acf5c380bd04292b1b0b1', '6cceeca5764daaddc5c837c7f3ff1bbff259b37d591a26382660ac3bf641c3ce4af9536f3cd19239', 0, '2019-02-02 14:43:58'),
('8f059819b4171443c86a25537ce8d3a22f3ec1fd8f0a7fc3e7d55f6c96402b84092ac4003f91e531', '496a8c7f70e4c9c7f49a79a66954f26112e142d2c9709fb8cddacc51d4169812bb749451432a197d', 0, '2019-02-01 03:26:45'),
('90516c20c96bd4bb7bf36c1e7bd96638f48f8ecebb2c8a1eca17685abfe11523b5e223d5377bdf79', '3356aca3469baad44a576ff7665568d1968e4149fa8b83122e1c795fc388aaf9e55459e19a91dbe2', 0, '2019-02-05 23:23:02'),
('9081368bddf161eadb424bf11aedba152995065896b8d718ad8ccfa94da4903c2f27157d619fbf69', '0616f4d63a8c1fb241ddffbf1ebc3be35c094bbf4848303ee7fb93731a6a22db6124d4a2e968f102', 0, '2019-02-14 01:49:39'),
('939e724bdea1f7efd0297fd4d293e70f2609e70baf0b30dfcaefae4f355b19c146075d039a933db7', 'd1b247cb4317b8c9335c3e7a984eac80b151a9627e70cc10d95e9cde01aff13b3b62d32434242041', 0, '2019-02-01 23:53:07'),
('9e33c7518a8208e63774c1218ad0ab32203153d760d0a965116cad162659a8d6aac8d11f2de991a6', 'efe8a32f90feb6576835250330eb6d759fa05e1f259ce2052e973b8dec7bb1ff8cecf3a067b428eb', 0, '2019-02-19 01:11:20'),
('a105e69ba2702ff3f0c1126976a3fc19f174255f07f12c1cb1f9fe75b5aee31fa7ad282f92f0c4ba', 'c2d37b24ae0d4a527b7de6f4c2a7d34690afcd7c6433992084fa3a388187968110bea83178ad0908', 0, '2019-02-06 01:08:15'),
('a545c65970f07cf9783388eefe25a90bcad24d8f5ecedcb3e93d045f401062a6df1a605074521ecb', 'd1f5d67ecd3a99ce20cccb581957ec4c294162d7921773711bf4e40ef0c41ffcb5f988e9d225d86b', 0, '2019-02-02 01:56:05'),
('aaf253508bdfad95e5f5f9c6fa3d49b89c510d75bd7e0fe0411405b7167bec6a3d35b35cdbcf1414', '666daf522dd07fc6ed635d27a16c35424dec490dfb4a76b46e263676e588707a080b987c93472f3a', 0, '2019-02-02 16:17:51'),
('ac80079b50c6c49d6db42f5d8b39adc2948df5b07bf92fe8e98f5ad3f8dde65f2da4032433a8d702', 'a27c82d98e920be0f27576331f00e4c73b92384314b68aec001e8e8d58515a01496f5ae9cb1e1779', 0, '2019-02-10 17:55:24'),
('aff92cc23c30aa93b35d06ec289d3d1ff6aaa31f7a55bee304fad618e26993e5feda244937a2cbc2', 'e6b012d08668c20a3ffa435bc8a6546ae8b01d8750d7ce4a1ed4f6de4e1b996edd3229b552a99a8a', 0, '2019-02-01 22:03:46'),
('b7c931568a53a5252946e6c6adaa041f4d914c2d96637f39a8e98ae5a2843a11bdc71ea231b50661', '233ccb124ad734a8b86e8f7a4e9e4a8be1a391c7214d0a203a44d29e3978aedcd55012e3c5db9da2', 0, '2019-02-14 01:16:07'),
('b7d04b74809b0dd921df1cfa1e268b92717ca0154ed5a31cd00717ddb3d2738a1a65527e1073c1d6', '03eba847bbd73a2f729008473d09407e1a9d0592ef91b6da6e615e43f63972a5ecc9eed866bdd1d2', 0, '2019-02-05 23:07:41'),
('b8964338ee95e8e11586a95e4bcbf8d5be65791379a11a5cdd1210b6c319fcbe3e96fa83da8c5a39', 'db95335e68aa99b24d55e8c79210e5d5b3a7102a619706b158ff21afb769a151027f2dd59d5f3636', 0, '2019-02-05 23:12:48'),
('bb2141471bab16e39c94d4e3a5df2a0a8f2ae87cc80351141e28145d825bfa2608b17e84e3776092', '4a970a2ae58747289e4a0924784d51429ad676766a9496a2a9d407d5882084776f70604de61c2d14', 0, '2019-02-02 15:21:27'),
('bd2f89bd6842d01615b11fd7156684353f54373c753fe07e01d70b66590f5db50bccae9a0cb732fe', '03038d0200aeb814aa4fc2d6cf80c4bb09eb51351a8ab478090fc2517d7578828ddf39fd507c12a5', 0, '2019-02-10 03:40:18'),
('c188563ae184f08f1a6a9c5d026d692012f3fb00ea61e942e6b149c6c81c7271df6249b7a53f346e', 'b9c6eb0286baa345b232313bec84c423d9bc59f3ce383ed22c4eeda75ba00f8323875a9e8d8ae328', 0, '2019-02-01 03:50:15'),
('c8b4c7dc4688fd3a216fb7fce5ca767989177e9a5013f5cb6c747e53e7b70a52c1fe670d1ef94e51', '9179cc09ae1d445a26eda5eeca0cb03845fa812d62ca4f0735663c3c13478296a28c133c156d6fb5', 0, '2019-02-10 17:19:22'),
('c9b19cf5cd584a622699fab58a43ea0b52c6bfbb49a219fefd1b9033950c24239d63e743e1ff3942', '0694f7634adb2d11a76080f9349ae099511a7a80385d5c22a36370c8e4057c2a1fe8b9e4858d7c9c', 0, '2019-02-05 23:20:10'),
('cd4a868c4daecc383c8c3d00cc9dc87bdf5219225ba9ad881def3b7ef043d45130070b2fb3671399', 'fd81f98977ca801f363d63840e0fde602705be7a6999d1adc4ad930cec35f7dcc77f44a4695c156d', 0, '2019-02-14 01:45:00'),
('d032fc64230ff6ba091e658e529879314ec1e4c822000427565b4010bc836683d737914adc96de8e', '058882691fcd143cc3e4d33ead97a41aefad43fbd78963c24055eed499212bf985c891c80fee1f73', 0, '2019-02-05 23:15:27'),
('d1f3e4b4dfe9d5d6584bcc68fd1892bc451d996815f67452e6cc111da0cdf74110cb5c118a773818', '570ab3a47ae43febfd6909096d8dce7878cb4565a43d886da9ed2154b9d06e6199c1b1f8e29404b6', 0, '2019-02-01 22:00:00'),
('da674fadc92e61adaff2274f18135b580d839a65ea6b17c3344a1eca661857903d6d241545546c0a', '32d96d010f3f58ad81b26838135f3d5bbd5762d037cf8fe4738e379cf475ab9b27334deb0d723407', 0, '2019-02-22 01:01:44'),
('db7a59c40e74f4e45b6ecb5c3696cbf9fd01b9e241a41fa4caad806f8fd1258620ea4e49125d5b0f', '942505e28545519c6cc104d0a748d56592200ac780e421ccf26af231a6ecfb3571fb678564785053', 0, '2019-02-03 02:38:26'),
('dc7386639e8e80125d1adb624d384d188e0d499ff8c554fec5033f6a4ec28b161a139919b5f63d8a', 'c5e301f9e9220c85775037eb459ff0a22a515407ada242314ab2de8b2c8409ed021d6b37da480c3e', 0, '2019-02-23 01:34:18'),
('de24f484ec01056da3f6846167da9dae2526f077cdf5fd8c780e30a474b933532d2b5e8cbfcfef73', 'd3e7481a878302215a99c625240d0385ecfb1e77d78331dc6680cdb6b2c5a1f74613cb3fdd207324', 0, '2019-02-04 14:58:09'),
('df0833fda0d689bb693b6d7628c4cbd6ed4d7df2e588c8891a2e4a2c84f24b36abc9647274744cf4', '31c6b2496fa37f5713f4721e32ce042e2c60c7ba2e886adbea0672abaff804dc9b763e893038995d', 0, '2019-02-02 00:14:31'),
('e0c48a6e8ab765b5e9de4f403d1d9ade7f2b8e9b1f848019b0a415058083b3bfae77d803175e5dd1', 'caf31b5b15194512f32fe3ada5eee134bb7e453fbaefe435222181a964c8414bc04fc816916e9207', 0, '2019-02-01 03:36:46'),
('e7465485fc785878d197d56c3f3d8e800beebda0d07b90e452e24ca4e0b7780de8c8a7436ce331ab', 'b7f36dddcb38cc35bbe9797cf332a21fdb6effb225e68887010d9b8c2a1e3be782fe831b99ba78aa', 0, '2019-02-05 22:54:56'),
('eafca9c99a920c39865c72d4627e147f32b99fd317cb2660d0051377f282f488f1a001143b1624e3', '0e7f96ab5754f79408406819aef325ef7db91766a707fe5515d47e416694320550e22bfc468caa0e', 0, '2019-02-10 01:28:22'),
('ec2e9a86c59eb1188cf7965c8a91ab832c8fe1805e25b440529bb8691f50ca78115d36ca5c003cda', 'fdf7cf85d75516d051adbb06b9c818fe1b0e3a749a1ae69553b815e3b95035e6e1b413157a3dc3f7', 0, '2019-02-02 14:24:50'),
('efff7096ff50456a8945747735d6e365f02da99da6c64bf6ea3fccf3983510e8c881e44074b0f03f', 'f5335fb63a13bf0be90ed618f9e7febf1b361a009d77f278c5e52200333d813c7b6254118fb43d6e', 0, '2019-02-02 16:09:10'),
('f32f29a47a09ea193865a185052fb2784aec0784fe851ff7946a7bcbe75a394b62e159d9ed633a75', 'ba90343624df59b0713e7ac9379cb82480853058d1b5b384dcf7fea67623748052239160e1975c45', 0, '2019-02-06 01:10:03'),
('f820b1fd789f9e3af7f421950faa5142c9113a2d7700823c5868ac6a16925d333920263e8d33b79a', 'fae972c9b60a1acfc9b94c1231144b166deb1aa5b71158adf342599c65e46046b9c9a808b1403bd5', 0, '2019-02-01 23:32:09'),
('f94f6f1b7fa0610760ebc36929de95e71d0d18f47106f652e0a2477db816c6afed74bce47622d842', '5fa0dcb9f4034c776b893f73098bf548e07bd9269ac69478fc1f0b51d2ba8163628c6f08fa6583ab', 0, '2019-07-11 00:06:13'),
('f9d0ff1b3d5d3019e8121b7aea05220c1f433940f3c2802e6204f20d4c261dc719ae1935a52c7636', 'a4720b36a55c5bfcf04440c3947ec9f0c0fc4aefe0222c60443989fb7805e3c5bf259ecbf837af52', 0, '2019-02-05 23:24:19'),
('fc02c25be7572a6a8d195d214eadd3f3b88b27e6595d0dd42baf6922cd34a3d8298dd3462fcc6d09', 'aa55f102239fc28677d2fd2a7950ac4e0650a78e3d1611628a7b00d339598841f24c58830723a160', 0, '2019-02-23 01:30:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `video` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.mp4',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `image`, `video`, `created_at`, `updated_at`) VALUES
(1, 1, 'Autem aut cupiditate possimus.', 'default.jpg', 'default.mp4', '2018-02-23 04:47:50', '2018-02-23 04:47:50'),
(2, 5, 'Doloremque quia et optio rerum ipsa.', 'default.jpg', 'default.mp4', '2018-02-23 04:47:50', '2018-02-23 04:47:50'),
(3, 1, 'Agregados nuevos productos en hardware PC\'s', 'default.jpg', 'default.mp4', '2018-02-23 05:21:46', '2018-02-23 05:21:46'),
(4, 3, 'En la sección se personal se han agregado nuevos algoritmos!', 'default.jpg', 'default.mp4', '2018-02-23 05:26:42', '2018-02-23 05:26:42'),
(5, 4, 'Las ventas se han incrementado en un 40% desde la incorporación de esta app!', 'default.jpg', 'default.mp4', '2018-02-23 05:29:21', '2018-02-23 05:29:21'),
(6, 2, 'My content', 'default.jpg', 'default.mp4', '2018-07-11 04:10:36', '2018-07-11 04:10:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 'Id porro perspiciatis quia.', '2018-02-23 04:47:51', '2018-02-23 04:47:51'),
(2, 2, 3, 'Molestiae nam fugiat voluptatibus eum.', '2018-02-23 04:47:51', '2018-02-23 04:47:51'),
(3, 2, 5, 'Incidunt et et qui soluta nemo.', '2018-02-23 04:47:51', '2018-02-23 04:47:51'),
(4, 2, 1, 'Hola! :D', '2018-02-23 05:20:37', '2018-02-23 05:20:37'),
(5, 3, 2, '¡Gracias por avisar!', '2018-02-23 05:24:29', '2018-02-23 05:24:29'),
(6, 3, 4, 'Ok :)', '2018-02-23 05:29:41', '2018-02-23 05:29:41'),
(7, 4, 4, '¡Deseo verlos en producción!', '2018-02-23 05:30:06', '2018-02-23 05:30:06'),
(8, 5, 5, '¡Esta app es Increíble!', '2018-02-23 05:32:33', '2018-02-23 05:32:33'),
(9, 3, 5, 'Los acabo de ver!', '2018-02-23 05:33:31', '2018-02-23 05:33:31'),
(10, 6, 2, 'test', '2018-07-11 04:10:48', '2018-07-11 04:10:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cod` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `user_id`, `cod`, `name`, `brand`, `picture`, `description`, `rating`, `stock`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 3, 'GH67RG34', 'GPU NVIDEA TITAN Z 16GB', 'NVIDEA', 'UFp4HAIpLv54FHFU.jpg', 'GPU NVIDEA TITAN Z 16GB 2DVI 4HDMI', 5, 580, '1000.00', '2018-02-23 04:47:45', '2018-02-23 05:10:40'),
(2, 4, 'AA66HJ23', 'RAM Corsair Vengeance DDR4 16GB', 'Corsair', 'DaDckkxYYCXCNjpX.jpg', 'Memoria ram Corsair Vengeance 16GB', 3, 123, '450.00', '2018-02-23 04:47:45', '2018-02-23 05:08:35'),
(3, 4, 'AA56FG23', 'SSD WD BLUE 1TB SATA', 'Western Digital', 'A0V5tMnEp78Y5fbV.jpg', 'SSD Western Digital 1TB', 3, 553, '372.00', '2018-02-23 04:47:45', '2018-02-23 05:06:26'),
(4, 1, '06339197', 'GPU Tesla 6GB HDMI Green', 'TESLA', 'ZVf0wF4S6osm8cJE.jpg', 'Tarjeta de video tesla 4 puertos HDMI, 6gb', 5, 286, '115.00', '2018-02-23 04:47:46', '2018-02-23 05:04:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `name`, `last_name`, `picture`, `company`, `address`, `phone`, `gender`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Charles', 'Gibson', 'B8b2MznGoVKjQP8p.jpg', 'Koelpin-Fisher', '64104 Shayne Light Suite 355\nSouth Kristahaven, LA 30702', '+16137562235', 'male', 'gbuckridge@white.com', '2018-02-23 04:47:39', '2018-02-23 05:02:26'),
(2, 'Silas', 'Jakubowski', 'rn7t42Ap6A0eygDm.jpg', 'Labadie-Gutmann', '996 Toy Lodge Suite 144\nPagacshire, MS 24447', '(683) 645-1558 x52661', 'male', 'aiyana05@kassulke.org', '2018-02-23 04:47:40', '2018-02-23 05:02:01'),
(3, 'Kevin', 'Rodriguez', 'N9ryF2YFjuTHIVdx.jpg', 'Schinner Ltd', '6299 Osinski Views\nNorth Marvinburgh, WV 71869-9813', '(259) 689-8584 x788', 'male', 'rempel.rachel@yahoo.com', '2018-02-23 04:47:40', '2018-02-23 05:01:42'),
(4, 'Vena', 'Williamson', 'iup0qp8eppu3yUTC.jpg', 'Schiller Group', '82362 Belle Mount\nNew Godfreyview, ID 53922-3134', '(962) 305-3659 x431', 'male', 'monroe68@hayes.net', '2018-02-23 04:47:41', '2018-02-23 05:01:19'),
(5, 'Colten', 'Klein', 'PA4mCTPApHb6L4BN.jpg', 'Haley Inc', '8180 Armstrong Branch\nNew Gregorioport, IN 68341-8229', '678.215.5038', 'male', 'orville.stark@gmail.com', '2018-02-23 04:47:41', '2018-02-23 05:00:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `picture`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Joshua Martinez.', 'skynessj@gmail.com', 'MPq6SdpLlWCqSzNO.jpg', '$2y$10$AlgcFl7.rrWJ0Fx79U8ADuhzGHOtxuf5ns5kNGttM3KcbKVkZDN1e', 'k70GUeoTXu', '2018-02-23 04:47:30', '2018-02-23 04:52:00'),
(2, 'Ing. Kitty Yundt', 'zwuckert@example.net', 'oeHBYRchIg0jwRKD.jpg', '$2y$10$AlgcFl7.rrWJ0Fx79U8ADuhzGHOtxuf5ns5kNGttM3KcbKVkZDN1e', 'JrTON90bEV', '2018-02-23 04:47:31', '2018-02-23 05:24:05'),
(3, 'Ing. Allen Goldner', 'orion11@example.org', 'AFdb0JvByzXHaCVj.jpg', '$2y$10$AlgcFl7.rrWJ0Fx79U8ADuhzGHOtxuf5ns5kNGttM3KcbKVkZDN1e', 'E5lLa4HKMo', '2018-02-23 04:47:31', '2018-02-23 05:25:55'),
(4, 'Alfred Rempel', 'kcollier@example.net', 'L0gNbL9vxL0nxFHC.jpg', '$2y$10$AlgcFl7.rrWJ0Fx79U8ADuhzGHOtxuf5ns5kNGttM3KcbKVkZDN1e', 't0FpCf9cQw', '2018-02-23 04:47:32', '2018-02-23 05:28:13'),
(5, 'Luey Standford', 'rahsaan.sanford@example.org', 'hGAAUzsf85M9MSo6.jpg', '$2y$10$AlgcFl7.rrWJ0Fx79U8ADuhzGHOtxuf5ns5kNGttM3KcbKVkZDN1e', 'B69gE5g3Hq', '2018-02-23 04:47:32', '2018-02-23 05:31:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
