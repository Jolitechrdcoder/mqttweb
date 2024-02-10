-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2024 a las 00:38:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mqtt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temperatura`
--

CREATE TABLE `temperatura` (
  `id` int(11) NOT NULL,
  `valor` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `temperatura`
--

INSERT INTO `temperatura` (`id`, `valor`, `fecha`) VALUES
(1, 0, '2024-02-10 22:58:34'),
(2, 0, '2024-02-10 22:59:21'),
(3, 0, '2024-02-10 22:59:23'),
(4, 0, '2024-02-10 22:59:24'),
(5, 0, '2024-02-10 23:01:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temperature_data`
--

CREATE TABLE `temperature_data` (
  `id` int(11) NOT NULL,
  `temperatura` decimal(5,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `temperature_data`
--

INSERT INTO `temperature_data` (`id`, `temperatura`, `fecha`) VALUES
(1, 0.00, '2024-02-10 23:19:28'),
(2, 0.00, '2024-02-10 23:20:11'),
(3, 1.94, '2024-02-10 23:28:52'),
(4, 6.72, '2024-02-10 23:28:59'),
(5, 24.42, '2024-02-10 23:29:17'),
(6, 1.94, '2024-02-10 23:29:52'),
(7, 24.42, '2024-02-10 23:30:00'),
(8, 1.94, '2024-02-10 23:30:52'),
(9, 24.42, '2024-02-10 23:31:19'),
(10, 122.10, '2024-02-10 23:31:34'),
(11, 1.94, '2024-02-10 23:31:53'),
(12, 122.10, '2024-02-10 23:32:44'),
(13, 1.94, '2024-02-10 23:32:53'),
(14, 122.10, '2024-02-10 23:34:13'),
(15, 48.84, '2024-02-10 23:34:27'),
(16, 1.94, '2024-02-10 23:34:53'),
(17, 1.94, '2024-02-10 23:35:53'),
(18, 1.94, '2024-02-10 23:36:53'),
(19, 1.93, '2024-02-10 23:37:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `temperatura`
--
ALTER TABLE `temperatura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temperature_data`
--
ALTER TABLE `temperature_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `temperatura`
--
ALTER TABLE `temperatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `temperature_data`
--
ALTER TABLE `temperature_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
