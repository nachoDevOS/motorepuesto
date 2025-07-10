-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2025 a las 21:58:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `motorepuesto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `branches`
--

INSERT INTO `branches` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 'Casa matriz', '67285914', NULL, '2025-07-10 13:58:29', '2025-07-10 13:58:29', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 'Sucursal 2', '00000', NULL, '2025-07-10 13:58:38', '2025-07-10 13:58:38', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `observation`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 'Honda', 'brands\\July2025\\MPMhkX0NBwWrKEdkgh6y.png', NULL, 1, '2025-07-10 14:00:28', '2025-07-10 14:05:48', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 'Suzuki', 'brands\\July2025\\ADksXNTeCYEJc9Qvgx7D.webp', NULL, 1, '2025-07-10 14:00:36', '2025-07-10 14:08:47', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 'Generica', NULL, NULL, 1, '2025-07-10 14:00:44', '2025-07-10 14:00:44', 1, 'admin', NULL, NULL, NULL, NULL),
(4, 'Yamaha', 'brands\\July2025\\u2eY8biFslA9R5COFXN4.png', NULL, 1, '2025-07-10 14:00:58', '2025-07-10 14:08:01', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cashiers`
--

CREATE TABLE `cashiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `open_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `closeUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cashiers`
--

INSERT INTO `cashiers` (`id`, `branch_id`, `user_id`, `title`, `observation`, `status`, `open_at`, `closed_at`, `closeUser_id`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(3, 1, 3, 'Cajero', NULL, 'Abierta', '2025-07-10 11:50:53', NULL, NULL, '2025-07-10 15:41:12', '2025-07-10 15:50:53', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cashier_details`
--

CREATE TABLE `cashier_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cashier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cashierMovement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cashier_details`
--

INSERT INTO `cashier_details` (`id`, `cashier_id`, `cashierMovement_id`, `type`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(2, 3, 3, 'Apertura', '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cashier_detail_cashes`
--

CREATE TABLE `cashier_detail_cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cashierDetail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cash_value` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cashier_detail_cashes`
--

INSERT INTO `cashier_detail_cashes` (`id`, `cashierDetail_id`, `cash_value`, `quantity`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 2, 200.00, 5.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 2, 100.00, 1.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 2, 50.00, 4.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(4, 2, 20.00, 0.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(5, 2, 10.00, 0.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(6, 2, 5.00, 3.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(7, 2, 2.00, 1.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(8, 2, 1.00, 6.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(9, 2, 0.50, 5.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(10, 2, 0.20, 0.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL),
(11, 2, 0.10, 0.00, '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cashier_movements`
--

CREATE TABLE `cashier_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cashier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cashier_movements`
--

INSERT INTO `cashier_movements` (`id`, `cashier_id`, `amount`, `observation`, `type`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(3, 3, 1325.50, 'Monto de apertura de caja.', 'Ingreso', 'Pendiente', '2025-07-10 15:41:12', '2025-07-10 15:41:12', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `observation`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 'Lubricantes', NULL, 1, '2025-07-10 13:59:33', '2025-07-10 13:59:33', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 'Kid', NULL, 1, '2025-07-10 13:59:41', '2025-07-10 13:59:41', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 'Frenos', NULL, 1, '2025-07-10 13:59:45', '2025-07-10 13:59:45', 1, 'admin', NULL, NULL, NULL, NULL),
(4, 'Luces', NULL, 1, '2025-07-10 13:59:51', '2025-07-10 13:59:51', 1, 'admin', NULL, NULL, NULL, NULL),
(5, 'LLantas', NULL, 1, '2025-07-10 14:00:01', '2025-07-10 14:00:01', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(75, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 8, 'ci', 'text', 'Ci / Pasaporte', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191|unique:people\"},\"display\":{\"width\":4}}', 2),
(77, 8, 'first_name', 'text', 'Primer Nombre', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 5),
(78, 8, 'middle_name', 'text', 'Segundo Nombre (Opcional)', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 6),
(79, 8, 'paternal_surname', 'text', 'Apeliido Paterno', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 7),
(80, 8, 'maternal_surname', 'text', 'Apeliido Materno', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 8),
(81, 8, 'birth_date', 'date', 'Fecha de Nacimiento', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 3),
(82, 8, 'email', 'text', 'Email / Correo electronico', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 9),
(83, 8, 'phone', 'text', 'Telefono / Celular', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 10),
(84, 8, 'address', 'text_area', 'Dirección', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":12}}', 12),
(85, 8, 'gender', 'select_dropdown', 'Género', 0, 1, 1, 1, 1, 0, '{\"options\":{\"masculino\":\"Masculino\",\"femenino\":\"Femenino\"},\"display\":{\"width\":4},\"validation\":{\"rule\":\"required\"}}', 4),
(86, 8, 'image', 'image', 'Fotografía', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 11),
(87, 8, 'status', 'checkbox', 'Estado', 1, 1, 1, 1, 0, 0, '{\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 13),
(88, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
(89, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(90, 8, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 16),
(91, 8, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 17),
(92, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 18),
(93, 8, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 19),
(94, 8, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 20),
(95, 8, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 21),
(96, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 7),
(97, 1, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 13),
(98, 1, 'person_id', 'text', 'Person Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(99, 1, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 14),
(100, 1, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 15),
(101, 1, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 16),
(102, 1, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 17),
(103, 1, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 18),
(104, 1, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 19),
(105, 9, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(106, 9, 'name', 'text', 'Categoría', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 2),
(107, 9, 'observation', 'text_area', 'Observación / Descripción', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":12}}', 3),
(108, 9, 'status', 'checkbox', 'Estado', 1, 1, 1, 1, 0, 0, '{\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 4),
(109, 9, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 5),
(110, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(111, 9, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 7),
(112, 9, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 8),
(113, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(114, 9, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 10),
(115, 9, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 11),
(116, 9, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 12),
(117, 13, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(118, 13, 'name', 'text', 'Sucursal', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 2),
(119, 13, 'address', 'text_area', 'Dirección', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":12}}', 4),
(120, 13, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 5),
(121, 13, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 6),
(122, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(123, 13, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 8),
(124, 13, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 9),
(125, 13, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 10),
(126, 13, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 11),
(127, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(128, 14, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(129, 14, 'name', 'text', 'Marcas', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 2),
(130, 14, 'image', 'image', 'Imagen', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 3),
(131, 14, 'observation', 'text_area', 'Observación / Descripción', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":12}}', 4),
(132, 14, 'status', 'checkbox', 'Estado', 1, 1, 1, 1, 0, 0, '{\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 5),
(133, 14, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 6),
(134, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(135, 14, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 8),
(136, 14, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 9),
(137, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(138, 14, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 11),
(139, 14, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 12),
(140, 14, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 13),
(141, 15, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(142, 15, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 0, '{}', 2),
(143, 15, 'brand_id', 'text', 'Brand Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(144, 15, 'image', 'image', 'Imagen', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 10),
(145, 15, 'name', 'text', 'Accesorio / Producto', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 7),
(146, 15, 'price', 'number', 'Precio', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 9),
(147, 15, 'observation', 'text_area', 'Observación / Descripción', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":12}}', 11),
(148, 15, 'status', 'checkbox', 'Estado', 1, 1, 1, 1, 0, 0, '{\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 12),
(149, 15, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 13),
(150, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(151, 15, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 15),
(152, 15, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 16),
(153, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 17),
(154, 15, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 18),
(155, 15, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 19),
(156, 15, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 20),
(157, 15, 'item_belongsto_category_relationship', 'relationship', 'Categorias', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4},\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(158, 15, 'item_belongsto_brand_relationship', 'relationship', 'Marcas / Motocicletas', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4},\"model\":\"App\\\\Models\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(159, 15, 'item_belongsto_presentation_relationship', 'relationship', 'presentations', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4},\"model\":\"App\\\\Models\\\\Presentation\",\"table\":\"presentations\",\"type\":\"belongsTo\",\"column\":\"presentation_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(160, 15, 'presentation_id', 'text', 'Presentation Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(161, 16, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(162, 16, 'name', 'text', 'Presentación / Unidad de Medida', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required|max:191\"},\"display\":{\"width\":4}}', 2),
(163, 16, 'observation', 'text_area', 'Observation', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":12}}', 3),
(164, 16, 'status', 'checkbox', 'Estado', 1, 1, 1, 1, 0, 0, '{\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 4),
(165, 16, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 5),
(166, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(167, 16, 'registerUser_id', 'text', 'RegisterUser Id', 0, 0, 0, 0, 0, 0, '{}', 7),
(168, 16, 'registerRole', 'text', 'RegisterRole', 0, 0, 0, 0, 0, 0, '{}', 8),
(169, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(170, 16, 'deleteUser_id', 'text', 'DeleteUser Id', 0, 0, 0, 0, 0, 0, '{}', 10),
(171, 16, 'deleteRole', 'text', 'DeleteRole', 0, 0, 0, 0, 0, 0, '{}', 11),
(172, 16, 'deleteObservation', 'text', 'DeleteObservation', 0, 0, 0, 0, 0, 0, '{}', 12),
(173, 13, 'phone', 'text', 'Telefono', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"max:191\"},\"display\":{\"width\":4}}', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-10-18 18:28:26', '2025-04-07 20:18:35'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-10-18 18:28:26', '2024-10-18 18:28:26'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-10-18 18:28:26', '2024-10-18 18:28:26'),
(8, 'people', 'people', 'Persona', 'Personas', 'fa-solid fa-person', 'App\\Models\\Person', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-04-07 13:43:00', '2025-04-07 14:25:25'),
(9, 'categories', 'categories', 'Categoría', 'Categorías', 'voyager-categories', 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-07-09 23:05:54', '2025-07-09 23:09:56'),
(13, 'branches', 'branches', 'Sucursal', 'Sucursales', 'fa-solid fa-store', 'App\\Models\\Branch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-07-09 23:21:15', '2025-07-10 04:21:59'),
(14, 'brands', 'brands', 'Marca/Motocicleta', 'Marcas/Motocicletas', 'fa-solid fa-copyright', 'App\\Models\\Brand', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-07-09 23:34:16', '2025-07-10 15:19:03'),
(15, 'items', 'items', 'Accesorio / Producto', 'Accesorios / Productos', 'fa-brands fa-steam-symbol', 'App\\Models\\Item', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-07-10 01:39:28', '2025-07-10 15:14:58'),
(16, 'presentations', 'presentations', 'Presentación / Unidad de Medida', 'Presentaciones / Unidad Medidas', 'fa-solid fa-person-chalkboard', 'App\\Models\\Presentation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-07-10 01:53:18', '2025-07-10 01:58:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `presentation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `category_id`, `brand_id`, `presentation_id`, `image`, `name`, `price`, `observation`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 1, 3, 2, 'items\\July2025\\AFnWW4hwES9xEtzV36bK.png', 'Aceite Ama SAE 20W-50', 55.00, NULL, 1, '2025-07-10 14:14:40', '2025-07-10 14:14:40', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 2, 3, 3, 'items\\July2025\\JkoFPgmejEA4kG0nG8Sn.jpeg', 'Kid de Arrastre Haojin', 130.00, NULL, 1, '2025-07-10 15:03:56', '2025-07-10 15:03:56', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 'items\\July2025\\gpixaC326IkqEad12GLs.png', 'Balatas', 25.00, NULL, 1, '2025-07-10 15:06:17', '2025-07-10 15:06:17', 1, 'admin', NULL, NULL, NULL, NULL),
(4, 5, 2, 1, 'items\\July2025\\m1JmRu071KXgA46QpCA3.jpg', 'Llantas 300*18 8 Lonas', 300.00, NULL, 1, '2025-07-10 15:13:25', '2025-07-10 15:13:25', 1, 'admin', NULL, NULL, NULL, NULL),
(5, 4, 3, 1, NULL, 'Led', 25.00, NULL, 1, '2025-07-10 18:13:17', '2025-07-10 18:13:17', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_stocks`
--

CREATE TABLE `item_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `stock` decimal(10,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `item_stocks`
--

INSERT INTO `item_stocks` (`id`, `branch_id`, `item_id`, `quantity`, `stock`, `type`, `observation`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 1, 1, 10.00, 10.00, 'Ingreso', NULL, '2025-07-10 14:21:58', '2025-07-10 14:21:58', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 2, 1, 30.00, 30.00, 'Ingreso', NULL, '2025-07-10 14:22:31', '2025-07-10 14:22:31', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 1, 2, 30.00, 30.00, 'Ingreso', NULL, '2025-07-10 15:04:18', '2025-07-10 15:04:18', 1, 'admin', NULL, NULL, NULL, NULL),
(4, 2, 2, 25.00, 25.00, 'Ingreso', NULL, '2025-07-10 15:04:36', '2025-07-10 15:04:36', 1, 'admin', NULL, NULL, NULL, NULL),
(5, 2, 3, 30.00, 30.00, 'Ingreso', 'Prueba', '2025-07-10 15:06:34', '2025-07-10 15:06:34', 1, 'admin', NULL, NULL, NULL, NULL),
(6, 1, 4, 26.00, 26.00, 'Ingreso', NULL, '2025-07-10 15:16:38', '2025-07-10 15:16:38', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-07-10 13:57:21', '2025-07-10 13:57:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Inicio', '', '_self', 'fa-solid fa-house', '#000000', NULL, 1, '2024-10-18 18:28:27', '2024-10-18 20:31:13', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 6, '2024-10-18 18:28:27', '2025-07-09 23:21:38', 'voyager.media.index', NULL),
(3, 1, 'Usuarios', '', '_self', 'voyager-person', '#000000', 14, 1, '2024-10-18 18:28:27', '2024-10-18 20:33:38', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 14, 2, '2024-10-18 18:28:27', '2024-10-18 20:33:29', 'voyager.roles.index', NULL),
(5, 1, 'Herramientas', '', '_self', 'voyager-tools', '#000000', NULL, 7, '2024-10-18 18:28:27', '2025-07-10 16:32:19', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 2, '2024-10-18 18:28:27', '2025-07-09 23:21:38', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2024-10-18 18:28:27', '2025-07-09 23:21:38', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2024-10-18 18:28:27', '2025-07-09 23:21:38', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2024-10-18 18:28:27', '2025-07-09 23:21:38', 'voyager.bread.index', NULL),
(10, 1, 'Configuración', '', '_self', 'voyager-settings', '#000000', NULL, 8, '2024-10-18 18:28:27', '2025-07-10 16:32:19', 'voyager.settings.index', 'null'),
(14, 1, 'Seguridad', '', '_self', 'fa-solid fa-lock', '#000000', NULL, 6, '2024-10-18 20:33:05', '2025-07-10 16:32:19', NULL, ''),
(15, 1, 'Limpiar cache', '', '_self', 'fa-solid fa-broom', '#000000', NULL, 9, '2024-12-09 16:33:25', '2025-07-10 16:32:19', 'clear.cache', NULL),
(16, 1, 'Administración', '', '_self', 'fa-regular fa-folder-open', '#000000', NULL, 4, '2025-02-10 19:42:49', '2025-07-10 16:32:19', NULL, ''),
(18, 1, 'Personas', '', '_self', 'fa-solid fa-person', NULL, 16, 1, '2025-04-07 13:43:00', '2025-04-07 13:44:30', 'voyager.people.index', NULL),
(19, 1, 'Parámetros', '', '_self', 'voyager-params', '#000000', NULL, 5, '2025-07-09 22:57:25', '2025-07-10 16:32:19', NULL, ''),
(20, 1, 'Categorías', '', '_self', 'voyager-categories', NULL, 19, 2, '2025-07-09 23:05:54', '2025-07-10 01:53:36', 'voyager.categories.index', NULL),
(21, 1, 'Sucursales', '', '_self', 'fa-solid fa-store', NULL, 5, 1, '2025-07-09 23:21:16', '2025-07-09 23:21:38', 'voyager.branches.index', NULL),
(22, 1, 'Marcas / Motocicletas', '', '_self', 'fa-solid fa-copyright', '#000000', 19, 3, '2025-07-09 23:34:16', '2025-07-10 15:19:40', 'voyager.brands.index', 'null'),
(23, 1, 'Accesorios / Productos', '', '_self', 'fa-brands fa-steam-symbol', NULL, 19, 4, '2025-07-10 01:39:28', '2025-07-10 01:53:49', 'voyager.items.index', NULL),
(24, 1, 'Presentaciones / Unidad Medidas', '', '_self', 'fa-solid fa-person-chalkboard', NULL, 19, 1, '2025-07-10 01:53:18', '2025-07-10 01:53:36', 'voyager.presentations.index', NULL),
(25, 1, 'Cajas', '', '_self', 'fa-solid fa-cash-register', '#000000', NULL, 2, '2025-07-10 03:15:00', '2025-07-10 03:15:16', 'cashiers.index', NULL),
(26, 1, 'Ventas', '', '_self', 'fa-solid fa-cart-shopping', '#000000', NULL, 3, '2025-07-10 16:32:09', '2025-07-10 16:32:19', 'sales.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2019_12_14_000002_update_permission_table', 1),
(26, '2025_04_07_092412_create_transactions_table', 1),
(27, '2025_04_07_092413_create_people_table', 1),
(28, '2025_04_07_092414_update_user_table', 1),
(29, '2025_07_09_185235_create_categories_table', 1),
(30, '2025_07_09_185815_create_branches_table', 1),
(31, '2025_07_09_192345_create_brands_table', 1),
(32, '2025_07_09_192346_create_presentations_table', 1),
(33, '2025_07_09_212014_create_items_table', 1),
(34, '2025_07_09_222351_create_item_stocks_table', 1),
(35, '2025_07_09_230046_create_cashiers_table', 1),
(36, '2025_07_09_233432_create_cashier_movements_table', 1),
(37, '2025_07_10_003017_update_user_table', 1),
(39, '2025_07_10_113306_create_cashier_details_table', 2),
(40, '2025_07_10_113752_create_cashier_detail_cashes_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ci` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `paternal_surname` varchar(255) DEFAULT NULL,
  `maternal_surname` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(600) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `ci`, `first_name`, `middle_name`, `paternal_surname`, `maternal_surname`, `birth_date`, `email`, `phone`, `address`, `gender`, `image`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, '7633685', 'Ignacio', NULL, 'Molina', 'Guzman', '1997-03-08', NULL, '67285914', 'Trinidad', 'masculino', NULL, 1, '2025-07-10 14:30:44', '2025-07-10 14:30:44', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `keyDescription` text DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `tableDescription` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `keyDescription`, `table_name`, `tableDescription`, `created_at`, `updated_at`) VALUES
(138, 'browse_admin', 'vista de acceso al sistema', 'admin', 'Panel del Sistema', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(139, 'browse_bread', NULL, NULL, NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(140, 'browse_database', NULL, NULL, NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(141, 'browse_media', NULL, NULL, NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(142, 'browse_compass', NULL, NULL, NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(143, 'browse_clear-cache', NULL, NULL, NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(144, 'browse_menus', NULL, 'menus', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(145, 'read_menus', NULL, 'menus', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(146, 'edit_menus', NULL, 'menus', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(147, 'add_menus', NULL, 'menus', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(148, 'delete_menus', NULL, 'menus', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(149, 'browse_roles', NULL, 'roles', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(150, 'read_roles', NULL, 'roles', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(151, 'edit_roles', NULL, 'roles', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(152, 'add_roles', NULL, 'roles', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(153, 'delete_roles', NULL, 'roles', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(154, 'browse_permissions', NULL, 'permissions', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(155, 'read_permissions', NULL, 'permissions', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(156, 'edit_permissions', NULL, 'permissions', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(157, 'add_permissions', NULL, 'permissions', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(158, 'delete_permissions', NULL, 'permissions', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(159, 'browse_settings', NULL, 'settings', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(160, 'read_settings', NULL, 'settings', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(161, 'edit_settings', NULL, 'settings', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(162, 'add_settings', NULL, 'settings', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(163, 'delete_settings', NULL, 'settings', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(164, 'browse_users', NULL, 'users', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(165, 'read_users', NULL, 'users', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(166, 'edit_users', NULL, 'users', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(167, 'add_users', NULL, 'users', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(168, 'delete_users', NULL, 'users', NULL, '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(169, 'browse_cashiers', 'Ver lista de cajas', 'cashiers', 'Cajas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(170, 'read_cashiers', 'Ver detalles de cajas', 'cashiers', 'Cajas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(171, 'edit_cashiers', 'Editar información de cajas', 'cashiers', 'Cajas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(172, 'add_cashiers', 'Agregar nuevas cajas', 'cashiers', 'Cajas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(173, 'delete_cashiers', 'Eliminar cajas', 'cashiers', 'Cajas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(174, 'browse_sales', 'Ver lista de ventas', 'sales', 'Ventas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(175, 'read_sales', 'Ver detalles de ventas', 'sales', 'Ventas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(176, 'edit_sales', 'Editar información de ventas', 'sales', 'Ventas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(177, 'add_sales', 'Agregar nuevas ventas', 'sales', 'Ventas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(178, 'delete_sales', 'Eliminar ventas', 'sales', 'Ventas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(179, 'browse_people', 'Ver lista de personas', 'people', 'Personas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(180, 'read_people', 'Ver detalles de una persona', 'people', 'Personas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(181, 'edit_people', 'Editar información de personas', 'people', 'Personas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(182, 'add_people', 'Agregar nuevas personas', 'people', 'Personas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(183, 'delete_people', 'Eliminar personas', 'people', 'Personas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(184, 'browse_presentations', 'Ver lista de presentación', 'presentations', 'Presentación', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(185, 'read_presentations', 'Ver detalles de presentación', 'presentations', 'Presentación', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(186, 'edit_presentations', 'Editar información de presentación', 'presentations', 'Presentación', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(187, 'add_presentations', 'Agregar nuevas presentación', 'presentations', 'Presentación', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(188, 'delete_presentations', 'Eliminar presentación', 'presentations', 'Presentación', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(189, 'browse_categories', 'Ver lista de categorias', 'categories', 'Categorias', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(190, 'read_categories', 'Ver detalles de categorias', 'categories', 'Categorias', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(191, 'edit_categories', 'Editar información de categorias', 'categories', 'Categorias', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(192, 'add_categories', 'Agregar nuevas categorias', 'categories', 'Categorias', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(193, 'delete_categories', 'Eliminar categorias', 'categories', 'Categorias', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(194, 'browse_brands', 'Ver lista de marcas', 'brands', 'Marcas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(195, 'read_brands', 'Ver detalles de marcas', 'brands', 'Marcas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(196, 'edit_brands', 'Editar información de marcas', 'brands', 'Marcas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(197, 'add_brands', 'Agregar nuevas marcas', 'brands', 'Marcas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(198, 'delete_brands', 'Eliminar marcas', 'brands', 'Marcas', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(199, 'browse_items', 'Ver lista de accesorios / items', 'items', 'Accesorios /Items', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(200, 'read_items', 'Ver detalles de accesorios / items', 'items', 'Accesorios /Items', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(201, 'edit_items', 'Editar información de accesorios / items', 'items', 'Accesorios /Items', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(202, 'add_items', 'Agregar nuevos accesorios / items', 'items', 'Accesorios /Items', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(203, 'delete_items', 'Eliminar accesorios / items', 'items', 'Accesorios /Items', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(204, 'browse_branches', 'Ver lista de sucursales', 'branches', 'Sucursales', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(205, 'read_branches', 'Ver detalles de sucursales', 'branches', 'Sucursales', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(206, 'edit_branches', 'Editar información de sucursales', 'branches', 'Sucursales', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(207, 'add_branches', 'Agregar nuevas sucursales', 'branches', 'Sucursales', '2025-07-10 16:44:21', '2025-07-10 16:44:21'),
(208, 'delete_branches', 'Eliminar sucursales', 'branches', 'Sucursales', '2025-07-10 16:44:21', '2025-07-10 16:44:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(138, 1),
(138, 2),
(138, 3),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(143, 2),
(143, 3),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(149, 2),
(149, 3),
(150, 1),
(150, 2),
(150, 3),
(151, 1),
(151, 2),
(151, 3),
(152, 1),
(152, 2),
(152, 3),
(153, 1),
(153, 2),
(153, 3),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(159, 2),
(159, 3),
(160, 1),
(160, 2),
(160, 3),
(161, 1),
(161, 2),
(161, 3),
(162, 1),
(162, 2),
(162, 3),
(163, 1),
(163, 2),
(163, 3),
(164, 1),
(164, 2),
(164, 3),
(165, 1),
(165, 2),
(165, 3),
(166, 1),
(166, 2),
(166, 3),
(167, 1),
(167, 2),
(167, 3),
(168, 1),
(168, 2),
(168, 3),
(169, 1),
(169, 3),
(170, 1),
(170, 3),
(171, 1),
(171, 3),
(172, 1),
(172, 3),
(173, 1),
(173, 3),
(174, 1),
(174, 3),
(175, 1),
(175, 3),
(176, 1),
(176, 3),
(177, 1),
(177, 3),
(178, 1),
(178, 3),
(179, 1),
(179, 2),
(179, 3),
(180, 1),
(180, 2),
(180, 3),
(181, 1),
(181, 2),
(181, 3),
(182, 1),
(182, 2),
(182, 3),
(183, 1),
(183, 2),
(183, 3),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentations`
--

CREATE TABLE `presentations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentations`
--

INSERT INTO `presentations` (`id`, `name`, `observation`, `status`, `created_at`, `updated_at`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`) VALUES
(1, 'Pieza', NULL, 1, '2025-07-10 13:58:46', '2025-07-10 13:58:46', 1, 'admin', NULL, NULL, NULL, NULL),
(2, 'Litros', NULL, 1, '2025-07-10 13:58:51', '2025-07-10 13:58:51', 1, 'admin', NULL, NULL, NULL, NULL),
(3, 'Cajas', NULL, 1, '2025-07-10 13:58:59', '2025-07-10 13:59:04', 1, 'admin', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '2025-07-10 13:57:21', '2025-07-10 13:57:21'),
(2, 'administrador', 'Administrador', '2025-07-10 13:57:21', '2025-07-10 13:57:21'),
(3, 'ventas', 'Ventas', '2025-07-10 14:32:22', '2025-07-10 14:32:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site..title', 'Título del sitio', NULL, '', 'text', 1, 'Site'),
(2, 'site..description', 'Descripción del sitio', NULL, '', 'text', 2, 'Site'),
(3, 'site.logo', 'Logo del sitio', '', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Imagen de fondo del administrador', 'settings/July2025/J64mrPddKXEFuJr8bXnC.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Título del administrador', 'Moto Repuesto', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Descripción del administrador', 'Sistema de administracion de Ventas', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Imagen de carga del administrador', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Ícono del administrador', 'settings/July2025/1qKHBGhkFWlwXy5jHuUr.png', '', 'image', 4, 'Admin'),
(11, 'system.development', 'Sistema en Mantenimiento 503', '0', NULL, 'checkbox', 1, 'System'),
(12, 'system.payment-alert', 'Alerta de Pago', '1', NULL, 'checkbox', 1, 'System'),
(13, 'system.code', 'Código', 'https://fast-food.soluciondigital.dev', NULL, 'text', 2, 'System');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registerRole` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleteUser_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleteRole` varchar(255) DEFAULT NULL,
  `deleteObservation` text DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `status`, `person_id`, `registerUser_id`, `registerRole`, `deleted_at`, `deleteUser_id`, `deleteRole`, `deleteObservation`, `branch_id`) VALUES
(1, 1, 'Admin', 'admin@soluciondigital.dev', 'users/default.png', NULL, '$2y$10$ILLZfhsbwinK3235ceVa7O0mj3M5fr33wb3z28aDqiBWLwBfSUzYy', 's50ePpNF7KmjeTDifOaandO0P5mYpF8IAlmuMCGcIk3mjVn0OCITiXtb6xxj', '{\"locale\":\"es\"}', '2024-10-18 18:28:45', '2024-10-18 18:33:30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Administrador', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$ILLZfhsbwinK3235ceVa7O0mj3M5fr33wb3z28aDqiBWLwBfSUzYy', 's50ePpNF7KmjeTDifOaandO0P5mYpF8IAlmuMCGcIk3mjVn0OCITiXtb6xxj', '{\"locale\":\"es\"}', '2024-10-18 18:28:45', '2024-10-18 18:33:30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'Ignacio', 'ignacio@admin.com', 'users/default.png', NULL, '$2y$10$w4M6fyAzkVG7ngIDAXDzk.4GIRJ8UO3ZzwYkDvMgwrDFWmwF8PNOS', NULL, NULL, '2025-07-10 14:31:34', '2025-07-10 14:33:12', 1, 1, 1, 'admin', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `branches_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `brands_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `cashiers`
--
ALTER TABLE `cashiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashiers_branch_id_foreign` (`branch_id`),
  ADD KEY `cashiers_user_id_foreign` (`user_id`),
  ADD KEY `cashiers_closeuser_id_foreign` (`closeUser_id`),
  ADD KEY `cashiers_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `cashiers_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `cashier_details`
--
ALTER TABLE `cashier_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashier_details_cashier_id_foreign` (`cashier_id`),
  ADD KEY `cashier_details_cashiermovement_id_foreign` (`cashierMovement_id`),
  ADD KEY `cashier_details_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `cashier_details_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `cashier_detail_cashes`
--
ALTER TABLE `cashier_detail_cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashier_detail_cashes_cashierdetail_id_foreign` (`cashierDetail_id`),
  ADD KEY `cashier_detail_cashes_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `cashier_detail_cashes_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `cashier_movements`
--
ALTER TABLE `cashier_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashier_movements_cashier_id_foreign` (`cashier_id`),
  ADD KEY `cashier_movements_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `cashier_movements_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `categories_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_brand_id_foreign` (`brand_id`),
  ADD KEY `items_presentation_id_foreign` (`presentation_id`),
  ADD KEY `items_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `items_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_stocks_branch_id_foreign` (`branch_id`),
  ADD KEY `item_stocks_item_id_foreign` (`item_id`),
  ADD KEY `item_stocks_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `item_stocks_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `people_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `presentations`
--
ALTER TABLE `presentations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presentations_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `presentations_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `transactions_deleteuser_id_foreign` (`deleteUser_id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_person_id_foreign` (`person_id`),
  ADD KEY `users_registeruser_id_foreign` (`registerUser_id`),
  ADD KEY `users_deleteuser_id_foreign` (`deleteUser_id`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cashiers`
--
ALTER TABLE `cashiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cashier_details`
--
ALTER TABLE `cashier_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cashier_detail_cashes`
--
ALTER TABLE `cashier_detail_cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cashier_movements`
--
ALTER TABLE `cashier_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentations`
--
ALTER TABLE `presentations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `branches_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `brands_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cashiers`
--
ALTER TABLE `cashiers`
  ADD CONSTRAINT `cashiers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `cashiers_closeuser_id_foreign` FOREIGN KEY (`closeUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashiers_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashiers_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashiers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cashier_details`
--
ALTER TABLE `cashier_details`
  ADD CONSTRAINT `cashier_details_cashier_id_foreign` FOREIGN KEY (`cashier_id`) REFERENCES `cashiers` (`id`),
  ADD CONSTRAINT `cashier_details_cashiermovement_id_foreign` FOREIGN KEY (`cashierMovement_id`) REFERENCES `cashier_movements` (`id`),
  ADD CONSTRAINT `cashier_details_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashier_details_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cashier_detail_cashes`
--
ALTER TABLE `cashier_detail_cashes`
  ADD CONSTRAINT `cashier_detail_cashes_cashierdetail_id_foreign` FOREIGN KEY (`cashierDetail_id`) REFERENCES `cashier_details` (`id`),
  ADD CONSTRAINT `cashier_detail_cashes_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashier_detail_cashes_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cashier_movements`
--
ALTER TABLE `cashier_movements`
  ADD CONSTRAINT `cashier_movements_cashier_id_foreign` FOREIGN KEY (`cashier_id`) REFERENCES `cashiers` (`id`),
  ADD CONSTRAINT `cashier_movements_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cashier_movements_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `categories_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `items_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `items_presentation_id_foreign` FOREIGN KEY (`presentation_id`) REFERENCES `presentations` (`id`),
  ADD CONSTRAINT `items_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  ADD CONSTRAINT `item_stocks_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `item_stocks_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `item_stocks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_stocks_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `people_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `presentations`
--
ALTER TABLE `presentations`
  ADD CONSTRAINT `presentations_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `presentations_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `users_deleteuser_id_foreign` FOREIGN KEY (`deleteUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `users_registeruser_id_foreign` FOREIGN KEY (`registerUser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
