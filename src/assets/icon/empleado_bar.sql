-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2024 a las 16:16:42
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurant`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_bar`
--

CREATE TABLE `empleado_bar` (
  `id_empleado_bar` int(11) NOT NULL,
  `id_bar` int(11) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado_bar`
--

INSERT INTO `empleado_bar` (`id_empleado_bar`, `id_bar`, `usuario`, `nombre`, `apellido`, `estado`) VALUES
(1, 1, 'admin', 'admin', 'admin', 'Activo'),
(2, 2, 'admin1', 'admin1', 'admin1', 'Activo'),
(3, 3, 'admin2', 'admin2', 'admin2', 'Activo'),
(4, 4, 'admin3', 'admin3', 'admin3', 'Activo'),
(5, 5, 'admin4', 'admin4', 'admin4', 'Activo'),
(6, 1, '789', 'pedro', 'zuares', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  ADD PRIMARY KEY (`id_empleado_bar`),
  ADD KEY `id_bar` (`id_bar`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  MODIFY `id_empleado_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  ADD CONSTRAINT `empleado_bar_ibfk_2` FOREIGN KEY (`id_bar`) REFERENCES `bar` (`id_bar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
