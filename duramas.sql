-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2020 at 05:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duramas`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `paternal_surname` varchar(250) NOT NULL,
  `maternal_surname` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id`, `name`, `paternal_surname`, `maternal_surname`, `email`, `photo`) VALUES
(124, 'Adrian', 'Morales', 'Jimenez', 'armj1923@gmail.com', '1606226906_loader.gif'),
(128, 'Luis', 'Ramon', 'Moran', 'pramon@hotmail.com', '1606401458_testi3.png');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `real_code` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `name`, `price`, `real_code`, `image`) VALUES
(17, 'scriptcase', '25.85', 'CXVDFSV', '1606317955_testi2.png'),
(19, 'Adrian Ricardo', '150.00', 'AC154', 'product.png'),
(20, 'Travertino', '78896.36', 'PULL', '1606344758_top.png'),
(27, 'Prueb tes', '250.36', 'ARMJ1923', '1606400858_loader.gif');

-- --------------------------------------------------------

--
-- Table structure for table `productos_detalle`
--

CREATE TABLE `productos_detalle` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `environment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos_detalle`
--

INSERT INTO `productos_detalle` (`id`, `id_producto`, `name`, `description`, `environment`) VALUES
(1, 19, 'Textura', 'Producto de detalle de prueba', 'imagen_detalle.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblventas`
--

CREATE TABLE `tblventas` (
  `ID` int(11) NOT NULL,
  `clave_transaccion` varchar(250) NOT NULL,
  `paypal_datos` text NOT NULL,
  `fecha` datetime NOT NULL,
  `correo` varchar(5000) NOT NULL,
  `total` decimal(60,2) NOT NULL,
  `estado` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblventas`
--

INSERT INTO `tblventas` (`ID`, `clave_transaccion`, `paypal_datos`, `fecha`, `correo`, `total`, `estado`) VALUES
(1, '12345678910', '', '2020-11-11 11:07:17', 'armj1923@gmail.com', '700.00', 'pendiente'),
(2, '12345678910', '', '2020-11-11 11:07:17', 'armj1923@gmail.com', '700.00', 'pendiente'),
(3, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 11:20:40', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(4, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 11:25:31', 'armj1923@gmail.com', '348.32', 'pendiente'),
(5, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 11:26:04', 'armj1923@gmail.com', '348.32', 'pendiente'),
(6, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 11:30:39', 'desarrollador@duramas.com.ec', '1429.39', 'pendiente'),
(7, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:07:52', 'adrianmj9@hotmail.com', '1429.39', 'pendiente'),
(8, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:12:32', 'armj1923@gmail.com', '1429.39', 'pendiente'),
(9, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:21:25', 'armj1923@gmail.com', '1429.39', 'pendiente'),
(10, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:22:49', 'armj1923@gmail.com', '1429.39', 'pendiente'),
(11, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:23:53', 'armj1923@gmail.com', '1429.39', 'pendiente'),
(12, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:25:08', 'armj1923@gmail.com', '1429.39', 'pendiente'),
(13, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:25:29', 'armj1923@gmail.com', '50.36', 'pendiente'),
(14, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:38:10', 'armj1923@gmail.com', '50.36', 'pendiente'),
(15, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:40:07', 'armj1923@gmail.com', '50.36', 'pendiente'),
(16, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:43:11', 'armj1923@gmail.com', '50.36', 'pendiente'),
(17, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:43:23', 'armj1923@gmail.com', '50.36', 'pendiente'),
(18, 'm9v1qomli1br4ocr00im6', '', '2020-11-11 12:44:42', 'armj1923@gmail.com', '50.36', 'pendiente'),
(19, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:44:57', 'armj1923@gmail.com', '50.36', 'pendiente'),
(20, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:45:07', 'armj1923@gmail.com', '50.36', 'pendiente'),
(21, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:45:19', 'armj1923@gmail.com', '50.36', 'pendiente'),
(22, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:46:45', 'armj1923@gmail.com', '50.36', 'pendiente'),
(23, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:52:44', 'armj1923@gmail.com', '50.36', 'pendiente'),
(24, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 12:52:51', 'armj1923@gmail.com', '50.36', 'pendiente'),
(25, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 13:01:51', 'armj1923@gmail.com', '50.36', 'pendiente'),
(26, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 13:03:56', 'armj1923@gmail.com', '50.36', 'pendiente'),
(27, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 13:04:42', 'armj1923@gmail.com', '50.36', 'pendiente'),
(28, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 13:04:53', 'armj1923@gmail.com', '50.36', 'pendiente'),
(29, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 14:19:36', 'adriantest@gmail.com', '1353.67', 'pendiente'),
(30, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 14:47:22', 'desarrollador@duramas.com.ec', '1104.03', 'pendiente'),
(31, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 14:47:41', 'desarrollador@duramas.com.ec', '1104.03', 'pendiente'),
(32, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 14:51:34', 'desarrollador@duramas.com.ec', '1104.03', 'pendiente'),
(33, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 14:54:33', 'desarrollador@duramas.com.ec', '348.32', 'pendiente'),
(34, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 14:55:20', 'desarrollador@duramas.com.ec', '1104.03', 'pendiente'),
(35, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 15:10:00', 'armj1923@gmail.com', '1104.03', 'pendiente'),
(36, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 15:11:00', 'armj1923@gmail.com', '1104.03', 'pendiente'),
(37, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 15:17:59', 'armj1923@gmail.com', '1104.03', 'pendiente'),
(38, 'm9v1qomli1br4ocr00im668egj', '', '2020-11-11 15:18:33', 'armj1923@gmail.com', '1104.03', 'pendiente'),
(39, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:21:44', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(40, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:25:42', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(41, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:25:57', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(42, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:35:08', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(43, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:36:35', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(44, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:36:52', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(45, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:37:13', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(46, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:37:23', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(47, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 15:40:54', 'desarrollador@duramas.com.ec', '1330.71', 'pendiente'),
(48, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 15:58:51', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(49, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:03:52', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(50, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:08:27', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(51, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:09:15', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(52, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:11:41', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(53, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:11:45', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(54, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:15:00', 'desarrollador@duramas.com.ec', '1305.35', 'pendiente'),
(55, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:15:14', 'nohemi.19@hotmail.com', '1005.35', 'pendiente'),
(56, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:16:06', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(57, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:17:05', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(58, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:17:38', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(59, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:18:12', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(60, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-11 16:18:51', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(61, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:30:50', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(62, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:48:49', 'armj1923@gmail.com', '1368.93', 'pendiente'),
(63, 'brqk4gvvu358atm34412186nlb', '', '2020-11-11 16:54:49', 'armj1923@gmail.com', '1320.61', 'pendiente'),
(64, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:03:41', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(65, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:06:59', 'armj1923@gmail.com', '1305.35', 'pendiente'),
(66, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:07:25', 'armj1923@gmail.com', '1404.03', 'pendiente'),
(67, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:19:24', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(68, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:30:01', 'armj1923@gmail.com', '1368.93', 'pendiente'),
(69, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 09:46:21', 'armj1923@gmail.com', '1368.93', 'pendiente'),
(70, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:14:00', 'armj1923@gmail.com', '1419.29', 'pendiente'),
(71, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:14:44', 'armj1923@gmail.com', '1419.29', 'pendiente'),
(72, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:14:52', 'armj1923@gmail.com', '1419.29', 'pendiente'),
(73, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:15:03', 'armj1923@gmail.com', '50.36', 'pendiente'),
(74, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:16:21', 'armj1923@gmail.com', '50.36', 'pendiente'),
(75, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 10:19:47', 'armj1923@gmail.com', '1119.29', 'pendiente'),
(76, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:02:16', 'armj1923@gmail.com', '48.32', 'pendiente'),
(77, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:08:53', 'armj1923@gmail.com', '1104.03', 'pendiente'),
(78, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:10:43', 'armj1923@gmail.com', '398.68', 'pendiente'),
(79, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:12:28', 'armj1923@gmail.com', '348.32', 'pendiente'),
(80, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:14:44', 'armj1923@gmail.com', '25.36', 'pendiente'),
(81, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:19:30', 'armj1923@gmail.com', '25.36', 'pendiente'),
(82, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:23:06', 'armj1923@gmail.com', '25.36', 'pendiente'),
(83, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 11:42:01', 'desarrollador@duramas.com.ec', '48.32', 'pendiente'),
(84, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:45:42', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(85, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 11:49:13', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(86, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:06:16', 'armj1923@gmail.com', '1053.67', 'pendiente'),
(87, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:07:11', 'armj1923@gmail.com', '1053.67', 'pendiente'),
(88, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:07:23', 'armj1923@gmail.com', '1053.67', 'pendiente'),
(89, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 12:10:27', 'desarrollador@duramas.com.ec', '1119.29', 'pendiente'),
(90, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 12:10:37', 'desarrollador@duramas.com.ec', '1119.29', 'pendiente'),
(91, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 12:11:15', 'desarrollador@duramas.com.ec', '1119.29', 'pendiente'),
(92, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 12:12:23', 'desarrollador@duramas.com.ec', '1119.29', 'pendiente'),
(93, '1bsudhqm82mtd1jbqgv3q1viea', '', '2020-11-12 12:12:36', 'desarrollador@duramas.com.ec', '1005.35', 'pendiente'),
(94, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:17:22', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(95, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:21:08', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(96, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:21:48', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(97, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:23:07', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(98, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:23:12', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(99, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:24:12', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(100, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:28:52', 'armj1923@gmail.com', '1100.00', 'pendiente'),
(101, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:32:21', 'armj1923@gmail.com', '2453.67', 'pendiente'),
(102, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:37:16', 'armj1923@gmail.com', '2453.67', 'pendiente'),
(103, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:53:18', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(104, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:53:38', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(105, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:53:42', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(106, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 12:54:30', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(107, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:03:09', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(108, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:03:16', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(109, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:03:20', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(110, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:20:12', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(111, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:20:20', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(112, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:20:37', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(113, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 13:47:00', 'armj1923@gmail.com', '1148.32', 'pendiente'),
(114, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6WYQAI1W923824BU426070V\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"24P94012TS8841431\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1115.26\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1115.26\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,115.26\",\"custom\":\"brqk4gvvu358atm34412186nlb#g8iC6fRddRjAkVsBS3g2nQ==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"08A0242044394761H\",\"state\":\"completed\",\"amount\":{\"total\":\"1115.26\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1115.26\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"32.64\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6WYQAI1W923824BU426070V\",\"create_time\":\"2020-11-12T19:08:05Z\",\"update_time\":\"2020-11-12T19:08:05Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/08A0242044394761H\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/08A0242044394761H/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WYQAI1W923824BU426070V\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T19:07:45Z\",\"update_time\":\"2020-11-12T19:08:05Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WYQAI1W923824BU426070V\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 14:07:32', 'armj1923@gmail.com', '1115.26', 'completo'),
(115, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6WZEGA2RG712109X370781A\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"8K655002K9535425R\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,425.36\",\"custom\":\"brqk4gvvu358atm34412186nlb#EKVAURFD/rXH4fsiuEW4cQ==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"78X83827D06194113\",\"state\":\"completed\",\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"41.64\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6WZEGA2RG712109X370781A\",\"create_time\":\"2020-11-12T19:51:14Z\",\"update_time\":\"2020-11-12T19:51:14Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/78X83827D06194113\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/78X83827D06194113/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WZEGA2RG712109X370781A\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T19:50:48Z\",\"update_time\":\"2020-11-12T19:51:14Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WZEGA2RG712109X370781A\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 14:50:42', 'armj1923@gmail.com', '1425.36', 'completo'),
(116, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6WZLNY5TT5752934571190P\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7TK303683H5763944\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,425.36\",\"custom\":\"brqk4gvvu358atm34412186nlb#y7gViD7qkDC5wBCGqdCh3g==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"5C4026624J200051K\",\"state\":\"completed\",\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"41.64\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6WZLNY5TT5752934571190P\",\"create_time\":\"2020-11-12T20:06:53Z\",\"update_time\":\"2020-11-12T20:06:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5C4026624J200051K\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5C4026624J200051K/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WZLNY5TT5752934571190P\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T20:06:15Z\",\"update_time\":\"2020-11-12T20:06:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6WZLNY5TT5752934571190P\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 15:05:56', 'armj1923@gmail.com', '1425.36', 'completo'),
(117, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W2TQI8D116448TN096430G\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7FB55948XF3648154\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,425.36\",\"custom\":\"brqk4gvvu358atm34412186nlb#SQoFl2TfhArS/8/pcI6+Ng==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"5MU45885JM578353C\",\"state\":\"completed\",\"amount\":{\"total\":\"1425.36\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1425.36\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"41.64\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W2TQI8D116448TN096430G\",\"create_time\":\"2020-11-12T21:32:12Z\",\"update_time\":\"2020-11-12T21:32:12Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5MU45885JM578353C\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5MU45885JM578353C/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W2TQI8D116448TN096430G\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T21:31:45Z\",\"update_time\":\"2020-11-12T21:32:12Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W2TQI8D116448TN096430G\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 16:31:43', 'armj1923@gmail.com', '1425.36', 'completo'),
(118, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W234Y1H6533136D885414X\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4UE00179PW5395115\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1104.03\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1104.03\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,104.03\",\"custom\":\"brqk4gvvu358atm34412186nlb#c/Uw6ABTvxKNHKU2Wl0Ipw==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"74826251M86471645\",\"state\":\"completed\",\"amount\":{\"total\":\"1104.03\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1104.03\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"32.32\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W234Y1H6533136D885414X\",\"create_time\":\"2020-11-12T21:50:03Z\",\"update_time\":\"2020-11-12T21:50:03Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/74826251M86471645\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/74826251M86471645/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W234Y1H6533136D885414X\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T21:49:39Z\",\"update_time\":\"2020-11-12T21:50:03Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W234Y1H6533136D885414X\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 16:49:37', 'armj1923@gmail.com', '1104.03', 'completo'),
(119, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3BPA73P28561G9360570S\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4YT95575YL312441F\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"2405.35\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"2405.35\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$2,405.35\",\"custom\":\"brqk4gvvu358atm34412186nlb#zvxTfpvx6wSp9ghYy3D+fw==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"8E999109DS5191150\",\"state\":\"completed\",\"amount\":{\"total\":\"2405.35\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"2405.35\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"70.06\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3BPA73P28561G9360570S\",\"create_time\":\"2020-11-12T22:01:44Z\",\"update_time\":\"2020-11-12T22:01:44Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8E999109DS5191150\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8E999109DS5191150/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3BPA73P28561G9360570S\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:01:32Z\",\"update_time\":\"2020-11-12T22:01:44Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3BPA73P28561G9360570S\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:01:15', 'armj1923@gmail.com', '2405.35', 'completo'),
(120, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 17:08:21', 'armj1923@gmail.com', '1448.32', 'pendiente'),
(121, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3E2Q1KH32306D45363947\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"19U43556R36719935\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1448.32\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1448.32\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,448.32\",\"custom\":\"brqk4gvvu358atm34412186nlb#ErwS4/fQWglVAsQKcTXo/g==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"9M702804169502637\",\"state\":\"completed\",\"amount\":{\"total\":\"1448.32\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1448.32\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"42.30\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3E2Q1KH32306D45363947\",\"create_time\":\"2020-11-12T22:09:06Z\",\"update_time\":\"2020-11-12T22:09:06Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/9M702804169502637\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/9M702804169502637/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3E2Q1KH32306D45363947\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:08:42Z\",\"update_time\":\"2020-11-12T22:09:06Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3E2Q1KH32306D45363947\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:08:40', 'armj1923@gmail.com', '1448.32', 'completo'),
(122, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 17:14:15', 'armj1923@gmail.com', '1353.67', 'pendiente'),
(123, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3JOQ1R319863M8559614L\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7H656452M06578908\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1353.67\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1353.67\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,353.67\",\"custom\":\"brqk4gvvu358atm34412186nlb#OmQkcEYLEwH3Agz1axxiAg==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"9JL05722VB5646059\",\"state\":\"completed\",\"amount\":{\"total\":\"1353.67\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1353.67\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"39.56\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3JOQ1R319863M8559614L\",\"create_time\":\"2020-11-12T22:18:48Z\",\"update_time\":\"2020-11-12T22:18:48Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/9JL05722VB5646059\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/9JL05722VB5646059/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3JOQ1R319863M8559614L\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:18:34Z\",\"update_time\":\"2020-11-12T22:18:48Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3JOQ1R319863M8559614L\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:18:12', 'armj1923@gmail.com', '1353.67', 'completo'),
(124, 'brqk4gvvu358atm34412186nlb', '', '2020-11-12 17:31:22', 'armj1923@gmail.com', '1404.03', 'pendiente'),
(125, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3PUY7WV365854K750345T\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"6MA60531VR5089902\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1404.03\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1404.03\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,404.03\",\"custom\":\"brqk4gvvu358atm34412186nlb#vMMjCi0qtSqUfg5fnUyrLg==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"34Y02032NT635232Y\",\"state\":\"completed\",\"amount\":{\"total\":\"1404.03\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1404.03\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"41.02\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3PUY7WV365854K750345T\",\"create_time\":\"2020-11-12T22:32:00Z\",\"update_time\":\"2020-11-12T22:32:00Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/34Y02032NT635232Y\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/34Y02032NT635232Y/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3PUY7WV365854K750345T\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:31:47Z\",\"update_time\":\"2020-11-12T22:32:00Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3PUY7WV365854K750345T\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:31:43', 'armj1923@gmail.com', '1404.03', 'completo'),
(126, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3TDQ62C49648BK8376058\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"80C05810KR710912W\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,100.00\",\"custom\":\"brqk4gvvu358atm34412186nlb#wWtcjI+3De2+Pvs+/tU8bA==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"6SP33382N7581004F\",\"state\":\"completed\",\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"32.20\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3TDQ62C49648BK8376058\",\"create_time\":\"2020-11-12T22:39:23Z\",\"update_time\":\"2020-11-12T22:39:23Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/6SP33382N7581004F\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/6SP33382N7581004F/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3TDQ62C49648BK8376058\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:39:10Z\",\"update_time\":\"2020-11-12T22:39:23Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3TDQ62C49648BK8376058\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:38:52', 'armj1923@gmail.com', '1100.00', 'completo'),
(127, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3UCY74U41940T42928158\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"03Y001779R859221D\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,100.00\",\"custom\":\"brqk4gvvu358atm34412186nlb#VHfsPiHGjRM7AqUyu07xjw==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"5FJ222535U858830K\",\"state\":\"completed\",\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"32.20\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3UCY74U41940T42928158\",\"create_time\":\"2020-11-12T22:41:27Z\",\"update_time\":\"2020-11-12T22:41:27Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5FJ222535U858830K\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5FJ222535U858830K/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3UCY74U41940T42928158\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:41:15Z\",\"update_time\":\"2020-11-12T22:41:27Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3UCY74U41940T42928158\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:41:08', 'armj1923@gmail.com', '1100.00', 'completo'),
(128, 'brqk4gvvu358atm34412186nlb', '{\"id\":\"PAYID-L6W3UVQ08X72938FR631732B\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"3BG07419V88963424\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"adrian-comprador@duramas.com.ec\",\"first_name\":\"Adrian\",\"last_name\":\"Morales\",\"payer_id\":\"HLWWGFNNM5J32\",\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"},\"phone\":\"4084068897\",\"country_code\":\"US\"}},\"transactions\":[{\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"XQ762ZW9KW95L\",\"email\":\"duramas-empresa@duramas.com.ec\"},\"description\":\"Compra de productos a Duramas:$1,100.00\",\"custom\":\"brqk4gvvu358atm34412186nlb#HDKdHR6LP1ue8EZU5n5fEg==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"Adrian Morales\",\"line1\":\"1 Main St\",\"city\":\"San Jose\",\"state\":\"CA\",\"postal_code\":\"95131\",\"country_code\":\"US\"}},\"related_resources\":[{\"sale\":{\"id\":\"3LD19808UB439922L\",\"state\":\"completed\",\"amount\":{\"total\":\"1100.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"1100.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"32.20\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L6W3UVQ08X72938FR631732B\",\"create_time\":\"2020-11-12T22:42:44Z\",\"update_time\":\"2020-11-12T22:42:44Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3LD19808UB439922L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3LD19808UB439922L/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3UVQ08X72938FR631732B\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-11-12T22:42:30Z\",\"update_time\":\"2020-11-12T22:42:44Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L6W3UVQ08X72938FR631732B\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-11-12 17:42:23', 'armj1923@gmail.com', '1100.00', 'completo');

-- --------------------------------------------------------

--
-- Table structure for table `tblventa_detalle`
--

CREATE TABLE `tblventa_detalle` (
  `ID` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_unitario` decimal(20,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descargado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`) VALUES
(1, 'admin', 'admin'),
(2, 'amorales', '12345678');

-- --------------------------------------------------------

-- Indexes for dumped tables
--

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos_detalle`
--
ALTER TABLE `productos_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_detalle_producto` (`id_producto`);

--
-- Indexes for table `tblventas`
--
ALTER TABLE `tblventas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblventa_detalle`
--
ALTER TABLE `tblventa_detalle`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `productos_detalle`
--
ALTER TABLE `productos_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblventas`
--
ALTER TABLE `tblventas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `tblventa_detalle`
--
ALTER TABLE `tblventa_detalle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos_detalle`
--
ALTER TABLE `productos_detalle`
  ADD CONSTRAINT `fk_producto_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblventa_detalle`
--
ALTER TABLE `tblventa_detalle`
  ADD CONSTRAINT `fk_venta_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `tblventas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
