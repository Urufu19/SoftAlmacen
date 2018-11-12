-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2018 a las 06:48:32
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idordencompra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `idcategoria`, `codigo`, `nombre`, `precio_venta`, `stock`, `descripcion`, `unidad`, `marca`, `modelo`, `serie`, `condicion`, `created_at`, `updated_at`, `idordencompra`) VALUES
(1, 1, '00245', 'loguitech', '20.00', 544, 'teclado model km90', 'Unidad', 'Logitech', 'Mouse Gamer', '15132132132132132', 1, NULL, NULL, 1),
(2, 3, 'MN-P78', 'placa asus', '250.00', 503, 'placas standar', '', 'Asus', 'Gamer', '456456', 1, '2018-09-08 02:44:29', '2018-09-08 02:44:29', 1),
(3, 2, 'CMYK-45-10', 'GL Monitor de 4k', '1500.00', 499, 'monitor de alta resolucion', '', 'Asus', 'Gamer', '456456', 1, '2018-09-08 02:45:13', '2018-09-08 02:45:13', 1),
(5, 1, 'tec11546', 'TECLADO RAZER', '20.00', 47, NULL, 'Unidad', 'RAZER', 'GAMER', '123123', 1, '2018-11-09 18:23:08', '2018-11-09 18:23:08', 2),
(8, 1, 'TEC-21013', 'TECLADO RAZER 2', '50.00', 47, NULL, 'Unidad', 'RAZER', 'GAMER', '85465465465', 1, '2018-11-10 19:26:18', '2018-11-11 01:46:12', 1),
(9, 6, 'sadasdasd', 'COMPUTADORA', '250.00', 49, NULL, 'Unidad', 'RAZER', 'GAMER', '5465465456', 1, '2018-11-12 03:21:36', '2018-11-12 03:21:36', 1),
(10, 1, 'PAPEL', 'PAPEL BOND 500H', '3.50', 14, NULL, 'Unidad', 'STANFORD', '75 GRAMOS', NULL, 1, '2018-11-12 04:19:09', '2018-11-12 04:19:09', 1),
(11, 4, 'Uuggffrr', 'Jhg66hh', '50.00', 50, NULL, 'Unidad', 'Tv', 'Tv', '6886667', 1, '2018-11-12 05:20:20', '2018-11-12 05:20:20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 'Teclados', 'teclados gamers', 1, NULL, NULL),
(2, 'Monitores', 'todos tipo de monitores', 1, '2018-09-08 02:43:35', '2018-09-08 02:43:35'),
(3, 'MotherBoards', 'placas madre gamers', 1, '2018-09-08 02:43:55', '2018-09-08 02:43:55'),
(4, 'Laptops', 'laptops de marca Hp, Lenovo, Asus, Acer, Toshiba, Dell', 1, '2018-09-10 22:23:16', '2018-09-10 22:23:16'),
(5, 'Fundas', 'fundas de laptop, impresoras y pc', 1, '2018-09-10 22:23:50', '2018-09-10 22:23:50'),
(6, 'CATT', 'CAT', 1, '2018-11-02 04:06:24', '2018-11-02 04:06:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingresos`
--

CREATE TABLE `detalle_ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idingreso` int(10) UNSIGNED NOT NULL,
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ingresos`
--

INSERT INTO `detalle_ingresos` (`id`, `idingreso`, `idarticulo`, `cantidad`, `precio`) VALUES
(5, 4, 2, 100, '220.00'),
(6, 4, 1, 100, '20.00'),
(7, 5, 2, 50, '10.00'),
(8, 5, 1, 20, '20.00'),
(9, 6, 1, 50, '50.00'),
(10, 6, 2, 10, '250.00'),
(11, 6, 3, 5, '1250.00'),
(12, 7, 3, 1, '1500.00'),
(13, 8, 1, 10, '20.00'),
(14, 9, 3, 1, '1250.00'),
(15, 10, 3, 1, '2000.00'),
(16, 10, 2, 1, '250.00'),
(17, 11, 3, 1, '2000.00'),
(18, 11, 2, 1, '250.00'),
(19, 12, 2, 5, '250.00');

--
-- Disparadores `detalle_ingresos`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingresos` FOR EACH ROW BEGIN
 UPDATE articulos SET stock = stock + NEW.cantidad 
 WHERE articulos.id = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idventa` int(10) UNSIGNED NOT NULL,
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `idventa`, `idarticulo`, `cantidad`, `precio`, `descuento`) VALUES
(1, 1, 1, 10, '25.00', '0.00'),
(2, 2, 2, 1, '250.00', '0.00'),
(3, 2, 3, 1, '1500.00', '0.00'),
(4, 2, 1, 1, '20.00', '0.00'),
(5, 3, 1, 50, '20.00', '0.00'),
(6, 4, 1, 1, '20.00', '1.00'),
(7, 4, 2, 1, '250.00', '5.00'),
(8, 4, 3, 1, '1500.00', '20.00'),
(9, 5, 3, 2, '1500.00', '0.00'),
(10, 6, 3, 1, '1500.00', '0.00'),
(11, 7, 3, 2, '1500.00', '0.00'),
(12, 8, 3, 1, '1500.00', '0.00'),
(13, 9, 3, 1, '1500.00', '0.00'),
(14, 10, 2, 1, '250.00', '0.00'),
(15, 10, 1, 1, '20.00', '0.00'),
(16, 11, 2, 1, '250.00', '0.00'),
(17, 11, 1, 1, '20.00', '0.00'),
(18, 12, 8, 2, '50.15', NULL),
(19, 13, 8, 2, '50.00', NULL),
(20, 13, 5, 2, '20.00', NULL),
(21, 13, 3, 2, '1500.00', NULL),
(22, 13, 2, 1, '250.00', NULL),
(23, 13, 1, 3, '20.00', NULL),
(24, 14, 9, 1, '250.00', NULL),
(25, 14, 8, 1, '50.00', NULL),
(26, 14, 5, 1, '20.00', NULL),
(27, 14, 3, 1, '1500.00', NULL),
(28, 14, 2, 1, '250.00', NULL),
(29, 14, 1, 1, '20.00', NULL),
(30, 15, 10, 1, '3.50', NULL),
(31, 15, 9, 1, '250.00', NULL),
(32, 15, 8, 1, '50.00', NULL),
(33, 15, 5, 1, '20.00', NULL),
(34, 15, 3, 1, '1500.00', NULL),
(35, 15, 2, 1, '250.00', NULL),
(36, 15, 1, 1, '20.00', NULL),
(37, 16, 11, 1, '50.00', NULL);

--
-- Disparadores `detalle_ventas`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
 UPDATE articulos SET stock = stock - NEW.cantidad
 WHERE articulos.id = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(4, 7, 1, 'BOLETA', '0001', '00004', '2018-06-01 00:00:00', '0.18', '24000.00', 'Anulado', '2018-09-09 06:57:17', '2018-09-09 07:07:39'),
(5, 3, 1, 'BOLETA', '0001', '00005', '2018-05-02 00:00:00', '0.18', '900.00', 'Anulado', '2018-09-09 07:23:08', '2018-09-09 07:23:26'),
(6, 3, 1, 'BOLETA', '0001', '00006', '2018-07-04 00:00:00', '0.18', '11250.00', 'Registrado', '2018-09-10 03:12:41', '2018-09-10 03:12:41'),
(7, 7, 1, 'BOLETA', '0001', '00005', '2018-09-10 00:00:00', '0.18', '1500.00', 'Registrado', '2018-09-10 03:46:47', '2018-09-10 03:46:47'),
(8, 3, 1, 'BOLETA', '0001', '00006', '2018-09-09 00:00:00', '0.18', '200.00', 'Registrado', '2018-09-10 04:27:00', '2018-09-10 04:27:00'),
(9, 7, 1, 'BOLETA', '0001', '00008', '2018-09-10 00:00:00', '0.18', '1250.00', 'Registrado', '2018-09-10 05:38:17', '2018-09-10 05:38:17'),
(10, 3, 1, 'BOLETA', '00012', '0003', '2018-11-02 00:00:00', '0.00', '2250.00', 'Registrado', '2018-11-02 05:07:31', '2018-11-02 05:07:31'),
(11, 3, 1, 'BOLETA', '00012', '0003', '2018-11-02 00:00:00', '0.00', '2250.00', 'Registrado', '2018-11-02 05:07:32', '2018-11-02 05:07:32'),
(12, 3, 1, 'BOLETA', '001', '00122', '2018-11-09 00:00:00', '0.00', '1250.00', 'Registrado', '2018-11-09 14:44:45', '2018-11-09 14:44:45');

--
-- Disparadores `ingresos`
--
DELIMITER $$
CREATE TRIGGER `tr_udpStockIngresoAnular` AFTER UPDATE ON `ingresos` FOR EACH ROW BEGIN
 UPDATE articulos a
 JOIN detalle_ingresos di
 ON di.idarticulo = a.id
 AND di.idingreso = new.id
 SET a.stock = a.stock - di.cantidad;
 
END
$$
DELIMITER ;

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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2018_02_20_171225_create_categorias_table', 1),
(3, '2018_02_22_235257_create_articulos_table', 1),
(4, '2018_02_27_143638_create_personas_table', 1),
(5, '2018_03_06_024616_create_proveedores_table', 1),
(6, '2018_03_13_133425_create_roles_table', 1),
(7, '2018_03_14_000000_create_users_table', 1),
(8, '2018_09_07_150703_create_ingresos_table', 1),
(9, '2018_09_07_150819_create_detalle_ingresos_table', 1),
(10, '2018_09_09_033145_create_ventas_table', 2),
(11, '2018_09_09_033241_create_detalle_ventas_table', 2),
(12, '2018_09_09_214633_create_notifications_table', 3);

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
('01ddeb26-cb7a-480a-a70c-8d46e59dd134', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 05:38:17', '2018-09-10 05:38:17'),
('07066aa2-8198-4a1d-93fc-3c16e43ccab6', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 00:01:21', '2018-11-12 00:01:21'),
('0f2de4a1-ae81-4d80-b440-c47b9e2645d5', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-09 14:44:48', '2018-11-09 14:44:48'),
('0fd337f6-2aa6-4258-b277-39d82eacea9e', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-11-12 05:17:06', '2018-11-12 00:01:20', '2018-11-12 05:17:06'),
('12ee1930-fe16-4cfd-b2f8-79263702eea2', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 04:27:01', '2018-09-10 04:27:01'),
('160976ed-c113-4d17-bcdb-6c83bd73b399', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-11-10 19:21:48', '2018-11-09 14:44:46', '2018-11-10 19:21:48'),
('18976400-e90c-4d79-a38b-a4fcb436edcc', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 05:38:17', '2018-09-10 05:38:17'),
('250ff7aa-710e-4d8a-90a5-99ab17fdbbd1', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:45:36', '2018-09-10 04:27:01', '2018-09-10 05:45:36'),
('2daaa555-de6e-4b35-9955-2d1e58f925f0', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":2,\"msj\":\"Ingresos\"}}}', '2018-11-05 16:13:34', '2018-11-02 05:07:32', '2018-11-05 16:13:34'),
('2f25b2d2-a00d-4b80-bd33-f131b8459584', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 22:04:12', '2018-09-10 22:04:12'),
('30ff0cd5-e415-4569-8179-78e45a4f8a8c', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-10-27 12:29:27', '2018-10-26 17:53:50', '2018-10-27 12:29:27'),
('3634c8bf-f1df-4c88-9abc-5d55e744480c', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-10-26 17:53:51', '2018-10-26 17:53:51'),
('3d9eaa7c-3a19-4759-93e9-9f3a5d3b6d49', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:23:09', '2018-09-10 04:56:57', '2018-09-10 05:23:09'),
('3ee696e5-119e-4fbb-b5d8-72933c3dc7e9', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-10-26 17:51:23', '2018-09-10 05:46:11', '2018-10-26 17:51:23'),
('470c8032-ef72-4efd-a17b-5663f6a040a7', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":4,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:23:09', '2018-09-10 03:46:47', '2018-09-10 05:23:09'),
('4cd4dccf-82c1-4abb-a40b-61943fe08938', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:45:36', '2018-09-10 04:56:57', '2018-09-10 05:45:36'),
('56d24345-05af-4a7e-b380-c16c0e79a9c5', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-11-12 05:17:06', '2018-11-12 03:22:30', '2018-11-12 05:17:06'),
('5c1d8bae-b014-48cd-8d0c-7aa560eceeb9', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-11-12 05:17:06', '2018-11-12 04:20:58', '2018-11-12 05:17:06'),
('649bb1e2-bd92-4415-99ac-893cd1eb5ac3', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-11-05 16:13:34', '2018-11-02 05:07:31', '2018-11-05 16:13:34'),
('66a3662a-c355-4167-a34a-21ddbac8fac1', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":2,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-02 05:07:32', '2018-11-02 05:07:32'),
('684458fa-75ec-4a51-b06e-4c1dbd965273', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 04:56:57', '2018-09-10 04:56:57'),
('68c801b2-54c2-4759-a094-7de1418c00ab', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 05:21:34', '2018-11-12 05:21:34'),
('68cb19b4-085e-4e9a-ab1e-132899c661c6', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 04:20:59', '2018-11-12 04:20:59'),
('6ba62dfd-d568-43e0-a549-dd9fde0771f3', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 21:40:15', '2018-09-10 21:40:15'),
('79dccaf7-e743-4197-b835-01ec67d1dbc0', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-10-27 12:29:27', '2018-10-26 17:53:48', '2018-10-27 12:29:27'),
('7d9dbf52-d255-4eec-a3e7-521b045c8008', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 00:01:21', '2018-11-12 00:01:21'),
('8131e7e4-9496-4978-b7d1-d90e044985c4', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-10-26 17:53:49', '2018-10-26 17:53:49'),
('815a62b9-2041-4659-85c6-43802ad9192c', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 04:20:59', '2018-11-12 04:20:59'),
('82bf1601-2d2f-4dba-959a-3eb585a4261a', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-11 06:17:35', '2018-11-11 06:17:35'),
('8576a7a5-54e7-42ae-adaa-ac0a5e167420', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":3,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:45:36', '2018-09-10 03:12:41', '2018-09-10 05:45:36'),
('86cdc8d7-871e-43be-a615-3dae7a5a4c3b', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-11 06:17:35', '2018-11-11 06:17:35'),
('873a7350-0270-45ca-9749-65722c670804', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-10-26 17:51:23', '2018-09-10 05:38:17', '2018-10-26 17:51:23'),
('8c79e522-6acd-4924-9c71-30bdcaab2406', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 03:22:31', '2018-11-12 03:22:31'),
('8ca22592-976f-46cd-9e76-156e4d741ec0', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 22:04:12', '2018-09-10 22:04:12'),
('8ff5f5ae-e4f0-4ab9-8d79-417aa9193c7b', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-10-26 17:51:22', '2018-09-10 21:40:14', '2018-10-26 17:51:22'),
('90518822-036c-47de-9ddf-fe113fee9d1c', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":3,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:23:09', '2018-09-10 03:12:41', '2018-09-10 05:23:09'),
('91e6592a-1d16-4ce8-a307-853f6c7ec989', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 05:21:34', '2018-11-12 05:21:34'),
('937507e2-ba31-4bc5-b3bf-ac950d9d80a5', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-02 05:07:32', '2018-11-02 05:07:32'),
('9506035b-637a-4f08-84b0-51faf42ffefc', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 03:22:31', '2018-11-12 03:22:31'),
('95118b06-d210-4f80-a0f8-e9f6f481345f', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-10-26 17:53:49', '2018-10-26 17:53:49'),
('9dadb61b-8165-43d9-91ba-58bbd205f1cc', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 21:59:05', '2018-09-10 21:59:05'),
('a0c4696b-16c8-4178-8f77-ab2d8c93245d', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 05:46:11', '2018-09-10 05:46:11'),
('a2230723-7ccf-43ea-b1f8-9cf618d27e44', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-10-26 17:53:52', '2018-10-26 17:53:52'),
('a3b0afd2-99be-40f8-83ba-f70d4af58f48', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":5,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:23:09', '2018-09-10 04:27:01', '2018-09-10 05:23:09'),
('a7e8a01f-f5ee-4104-9188-5c6695dbbb4a', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-10-26 17:51:22', '2018-09-10 21:59:04', '2018-10-26 17:51:22'),
('ae106c99-8990-4f72-a2f5-09274e201b43', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 05:46:11', '2018-09-10 05:46:11'),
('b3304c5c-e163-482a-a26b-84c5692b3cf8', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 21:40:15', '2018-09-10 21:40:15'),
('c0f36d6b-9120-4837-b83d-f380851c87f4', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":4,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', '2018-10-26 17:51:22', '2018-09-10 22:04:11', '2018-10-26 17:51:22'),
('c5020933-b8a6-44d2-b823-032cd9edcfa9', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":2,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-02 05:07:33', '2018-11-02 05:07:33'),
('c741f666-57d6-4c65-9959-edbd57ce3508', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-12 05:21:34', '2018-11-12 05:21:34'),
('cef4c8e1-53e0-4fde-9381-de23287aa224', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-09 14:44:48', '2018-11-09 14:44:48'),
('d2d26885-a007-4202-9d5a-fb7cf440e9d4', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 21:59:05', '2018-09-10 21:59:05'),
('e3308d17-d631-49b6-b4f8-c02aa4226466', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":4,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 03:46:47', '2018-09-10 03:46:47'),
('e8673ed8-6ab6-4651-9d9b-1d7e08741e43', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":4,\"msj\":\"Ingresos\"}}}', '2018-09-10 05:45:36', '2018-09-10 03:46:47', '2018-09-10 05:45:36'),
('f0eed6a3-b7a4-4f0c-962c-f208aaabb142', 'App\\Notifications\\NotifyAdmin', 5, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":3,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":3,\"msj\":\"Ingresos\"}}}', NULL, '2018-09-10 03:12:41', '2018-09-10 03:12:41'),
('f80a5a0d-6356-4ccc-945c-5492eadfed2e', 'App\\Notifications\\NotifyAdmin', 6, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-11-02 05:07:32', '2018-11-02 05:07:32'),
('fa932c8e-3711-4aaa-842c-61b44c459719', 'App\\Notifications\\NotifyAdmin', 1, 'App\\User', '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":0,\"msj\":\"Ingresos\"}}}', '2018-11-12 05:17:06', '2018-11-11 06:17:34', '2018-11-12 05:17:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `referencia` varchar(500) NOT NULL,
  `condicion` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_compra`
--

INSERT INTO `orden_compra` (`id`, `numero`, `nombre`, `fecha`, `direccion`, `descripcion`, `referencia`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 5671, 'OD 056 COMPRA DE MATERIALES EDIT', '16-18-2018', 'AV. EDIT', 'COMPRA DE MATERIALES EDIT', 'MEGATEK EDIT', '1', NULL, '2018-11-02 04:05:35'),
(2, 21, 'QAW', '01213-12-12', 'AV-123', 'ASDAD', 'QWEQWE', '1', '2018-11-02 04:06:02', '2018-11-02 04:06:02');

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
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oficina` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `oficina`, `created_at`, `updated_at`) VALUES
(1, 'angel', 'DNI', '72154871', 'calle los naranjos 852', '54328730', 'angeltotocayo_257@hotmail.com', 'JEFE DE AREA DE ENFERMERIA TECNICA', 'ENFERMERIA TECNICA', NULL, NULL),
(2, 'juan carlos', 'DNI', '54215485', 'Av. simon bolivar 410', '54328730', 'juan@gmail.com', '', '', NULL, NULL),
(3, 'ELECTRONICS S.A.C.', 'RUC', '10585621457', 'Calle los jirasoles 20', '458521', 'electronics@hotmail.com', 'JEFE DE AREA DE ENFERMERIA TECNICA', 'ENFERMERIA TECNICA', NULL, NULL),
(4, 'Daniel', 'DNI', '45852541', 'Calle los tombos 63', '05478541', 'daniel@gmail.com', '', '', '2018-09-07 21:17:24', '2018-09-07 21:17:24'),
(5, 'Jose', 'DNI', '30225415', 'Calle Perales 221', '556699', 'jose@gmail.com', '', '', '2018-09-07 21:19:08', '2018-09-07 21:19:08'),
(6, 'Maximo', 'DNI', '30662512', 'Av la marina 120', '221155', 'maximo@gmail.com', '', '', '2018-09-07 21:20:16', '2018-09-07 21:20:16'),
(7, 'ITD tecnology', 'RUC', '20548452584', 'Calle Octavio Muñoz Najar 215', '354896', 'itd@gmail.com', '', '', '2018-09-07 23:20:08', '2018-09-07 23:20:08'),
(8, 'Yimy Huamancusi Campos', 'DNI', '70037833', 'Av. Nueva Generacion Mz D Lt 2', '966190596', 'yimydavidhc@gmail.com', 'Jefe de Almacen', 'Almacen', '2018-11-11 04:19:00', '2018-11-11 04:19:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `contacto`, `telefono_contacto`) VALUES
(3, 'Martin quiñones', '584721'),
(7, 'Daniela Chamuco', '452512');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Administrador', 'Administradores de área', 1),
(2, 'Vendedor', 'Vendedor área venta', 1),
(3, 'Almacenero', 'Almacenero área compras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `idrol` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `condicion`, `idrol`, `remember_token`) VALUES
(1, 'admin', '$2y$12$fQVExSFUFZCNs.9xClllau9VAWQGMJZq7KNTQ14DgpO2djOIiEeVi', 1, 1, '6eDnQkVoII8YGRZd1bVYP3G0gTC9kalxScfIqQfo34XlgeYNIM0zmxkJcRUG'),
(5, 'jose', '$2y$10$/NCWJJ9aD60bi.KG/Nu4seGwesgiisIKb1k6eVHyM7mldYTyNfm8u', 1, 3, ''),
(6, 'maxi', '$2y$10$Doyn0rEKDWS76NiZHxzjIu53u7VL5MDbGndautuyKv8iBygVDq1De', 1, 2, 'JaMiM71ZZDQiqPhOgqMNAZN6nn2TA2hqwOySO0LNaJidezJBD64caBVnL4qo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcliente` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` date NOT NULL,
  `asunto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `asunto`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'BOLETA', '001', '0001', '2018-05-01', NULL, '18.00', '100.00', 'Anulado', NULL, '2018-09-09 23:35:19'),
(2, 6, 1, 'BOLETA', '0001', '00002', '2018-06-05', NULL, '0.18', '1770.00', 'Anulado', '2018-09-09 23:05:01', '2018-09-09 23:41:05'),
(3, 6, 1, 'BOLETA', '0001', '0003', '2018-05-07', NULL, '0.18', '1000.00', 'Anulado', '2018-09-09 23:19:37', '2018-10-26 18:09:59'),
(4, 4, 1, 'BOLETA', '0001', '00005', '2018-09-09', NULL, '0.18', '1744.00', 'Registrado', '2018-09-09 23:37:59', '2018-09-09 23:37:59'),
(5, 7, 6, 'BOLETA', '0001', '0007', '2018-09-09', NULL, '0.18', '3000.00', 'Registrado', '2018-09-10 04:56:57', '2018-09-10 04:56:57'),
(6, 4, 6, 'BOLETA', '0001', '00009', '2018-09-10', NULL, '0.18', '1500.00', 'Registrado', '2018-09-10 05:46:11', '2018-09-10 05:46:11'),
(7, 6, 1, 'BOLETA', '0001', '00009', '2018-09-10', NULL, '0.18', '3000.00', 'Registrado', '2018-09-10 21:40:13', '2018-09-10 21:40:13'),
(8, 3, 1, 'BOLETA', '0001', '0010', '2018-09-10', NULL, '0.18', '1500.00', 'Registrado', '2018-09-10 21:59:04', '2018-09-10 21:59:04'),
(9, 7, 1, 'BOLETA', '0001', '00011', '2018-09-10', NULL, '0.18', '1500.00', 'Registrado', '2018-09-10 22:04:11', '2018-09-10 22:04:11'),
(10, 3, 1, 'FACTURA', '0012', '00012', '2018-10-26', NULL, '0.18', '270.00', 'Registrado', '2018-10-26 17:53:48', '2018-10-26 17:53:48'),
(11, 3, 1, 'FACTURA', '0012', '00012', '2018-10-26', NULL, '0.18', '270.00', 'Registrado', '2018-10-26 17:53:50', '2018-10-26 17:53:50'),
(12, 8, 1, 'PECOZA', NULL, '00012', '2018-11-10', NULL, NULL, '100.30', 'Registrado', '2018-11-11 06:17:34', '2018-11-11 06:17:34'),
(13, 8, 1, 'PECOZA', NULL, '0012', '2018-11-11', NULL, NULL, '3450.00', 'Registrado', '2018-11-12 00:01:20', '2018-11-12 00:01:20'),
(14, 8, 1, 'PECOZA', NULL, '0013', '2018-11-12', 'SEGUIMIENTO DE EGRESADOS 2018', NULL, '2090.00', 'Registrado', '2018-11-12 03:22:30', '2018-11-12 03:22:30'),
(15, 8, 1, 'PECOZA', NULL, '00015', '2018-11-12', 'SEGUIMIENTO DE EGRESADOS', NULL, '2093.50', 'Registrado', '2018-11-12 04:20:58', '2018-11-12 04:20:58'),
(16, 8, 1, 'PECOSA', NULL, '00016', '2018-12-11', 'Movimirnt', NULL, '50.00', 'Registrado', '2018-11-12 05:21:34', '2018-11-12 05:21:34');

--
-- Disparadores `ventas`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVentaAnular` AFTER UPDATE ON `ventas` FOR EACH ROW BEGIN
 UPDATE articulos a
   JOIN detalle_ventas dv
   ON dv.idarticulo = a.id
   AND dv.idventa = NEW.id
   SET a.stock = a.stock+dv.cantidad;
   
  END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articulos_nombre_unique` (`nombre`),
  ADD KEY `articulos_idcategoria_foreign` (`idcategoria`),
  ADD KEY `articulos_idordencompra_foreign` (`idordencompra`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ingresos_idingreso_foreign` (`idingreso`),
  ADD KEY `detalle_ingresos_idarticulo_foreign` (`idarticulo`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_idventa_foreign` (`idventa`),
  ADD KEY `detalle_ventas_idarticulo_foreign` (`idarticulo`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_idproveedor_foreign` (`idproveedor`),
  ADD KEY `ingresos_idusuario_foreign` (`idusuario`);

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
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD KEY `proveedores_id_foreign` (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD KEY `users_id_foreign` (`id`),
  ADD KEY `users_idrol_foreign` (`idrol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_idcliente_foreign` (`idcliente`),
  ADD KEY `ventas_idusuario_foreign` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_idcategoria_foreign` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `articulos_idordencompra_foreign` FOREIGN KEY (`idordencompra`) REFERENCES `orden_compra` (`id`);

--
-- Filtros para la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD CONSTRAINT `detalle_ingresos_idarticulo_foreign` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `detalle_ingresos_idingreso_foreign` FOREIGN KEY (`idingreso`) REFERENCES `ingresos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_idarticulo_foreign` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `detalle_ventas_idventa_foreign` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_idproveedor_foreign` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `ingresos_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `ventas_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
