-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2024 a las 16:17:33
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
-- Estructura de tabla para la tabla `bar`
--

CREATE TABLE `bar` (
  `id_bar` int(11) NOT NULL,
  `nombre_bar` varchar(50) NOT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  `desayuno_horario` varchar(50) DEFAULT NULL,
  `almuerzo_horario` varchar(50) DEFAULT NULL,
  `merienda_horario` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bar`
--

INSERT INTO `bar` (`id_bar`, `nombre_bar`, `id_ubicacion`, `desayuno_horario`, `almuerzo_horario`, `merienda_horario`, `imagen`) VALUES
(1, 'UniBar', 1, '8:00 AM - 10:00 AM', '8:00 AM - 10:00 AM', '5:00 PM - 8:00 PM', 'http://localhost:3000/upload\\1704419855518-unibarfondo.jpeg'),
(2, 'La Nena', 8, '8:00 AM - 10:00 AM', '8:00 AM - 10:00 AM', '5:00 PM - 8:00 PM', 'assets/icon/BARNENAFONDO.jpeg'),
(3, 'Bar Summer`s', 7, '8:00 AM - 10:00 AM', '12:00 PM - 3:00 PM', '5:00 PM - 8:00 PM', 'http://localhost:3000/upload\\1704419894021-SUMMERFONDO.jpeg'),
(4, 'Uni Bar2', 29, '8:00 AM - 10:00 AM', '12:00 PM - 3:00 PM', '5:00 PM - 8:00 PM', 'http://localhost:3000/upload\\1704419950153-unibar2.jpeg'),
(5, 'Bar Chiringuito', 30, '8:00 AM - 10:00 AM', '12:00 PM - 3:00 PM', '5:00 PM - 8:00 PM', 'http://localhost:3000/upload\\1704422908080-barchiringuito.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nombre_ciudad` varchar(50) NOT NULL,
  `id_provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `nombre_ciudad`, `id_provincia`) VALUES
(1, 'Quito', 1),
(2, 'Bogotá', 2),
(3, 'Sangolquí', 1),
(4, 'Machachi', 1),
(8, 'Cuenca', 3),
(9, 'Gualaceo', 3),
(10, 'Camilo Ponce Enríquez', 3),
(11, 'Azogues', 5),
(12, 'Cañar', 5),
(13, 'La Troncal', 5),
(14, 'Tulcán', 6),
(15, 'Montúfar', 6),
(16, 'Mira', 6),
(26, 'Latacunga', 8),
(27, 'Salcedo', 8),
(28, 'La Mana', 8),
(29, 'Machala', 9),
(30, 'Santa Rosa', 9),
(31, 'Pasaje', 9),
(32, 'Esmeraldas', 10),
(33, 'Río Verde', 10),
(34, 'Atacames', 10),
(35, 'Puerto Baquerizo Moreno', 11),
(36, 'Puerto Ayora', 11),
(37, 'Puerto Villamil', 11),
(38, 'Guayaquil', 12),
(39, 'Samborondón', 12),
(40, 'Durán', 12),
(41, 'Ibarra', 13),
(42, 'Otavalo', 13),
(43, 'Atuntaqui', 13),
(44, 'Loja', 14),
(45, 'Catacocha', 14),
(46, 'Zamora', 14),
(47, 'Babahoyo', 15),
(48, 'Quevedo', 15),
(49, 'Ventanas', 15),
(50, 'Portoviejo', 16),
(51, 'Manta', 16),
(52, 'Chone', 16),
(53, 'Macas', 17),
(54, 'Gualaquiza', 17),
(55, 'Sucúa', 17),
(56, 'Tena', 18),
(57, 'Baeza', 18),
(58, 'El Chaco', 18),
(59, 'Coca', 19),
(60, 'La Joya de los Sachas', 19),
(61, 'Francisco de Orellana', 19),
(62, 'Puyo', 20),
(63, 'Shell', 20),
(64, 'Mera', 20),
(68, 'Santo Domingo', 22),
(69, 'La Concordia', 22),
(70, 'La Tsáchila', 22),
(71, 'Nueva Loja', 23),
(72, 'Shushufindi', 23),
(73, 'Cuyabeno', 23),
(74, 'Ambato', 24),
(75, 'Banos', 24),
(76, 'Pelileo', 24),
(77, 'Zamora', 25),
(78, 'Yantzaza', 25),
(79, 'Zumbi', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_reserva`
--

CREATE TABLE `detalle_reserva` (
  `id_detalle_reserva` int(11) NOT NULL,
  `id_reserva` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_reserva`
--

INSERT INTO `detalle_reserva` (`id_detalle_reserva`, `id_reserva`, `id_menu`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(184, 143, 1, 1, '15.99', '15.99'),
(185, 144, 4, 1, '8.99', '8.99'),
(186, 145, 12, 1, '5.36', '5.36'),
(187, 146, 5, 2, '12.99', '25.98'),
(188, 147, 5, 1, '12.99', '12.99'),
(189, 148, 9, 1, '11.24', '11.24'),
(190, 148, 10, 1, '6.55', '6.55'),
(191, 148, 11, 1, '14.00', '14.00'),
(192, 148, 12, 1, '5.36', '5.36'),
(193, 149, 9, 1, '11.24', '11.24'),
(194, 149, 10, 1, '6.55', '6.55'),
(195, 150, 5, 1, '12.99', '12.99'),
(196, 150, 6, 1, '6.99', '6.99'),
(197, 150, 9, 1, '11.24', '11.24'),
(198, 151, 5, 3, '12.99', '38.97');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_bar` int(11) DEFAULT NULL,
  `nombre_menu` varchar(50) NOT NULL,
  `plato` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(20) DEFAULT 'Disponible',
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `id_bar`, `nombre_menu`, `plato`, `descripcion`, `precio`, `estado`, `foto`) VALUES
(1, 1, 'Desayuno', 'Plato1', 'Descripción del plato 1', '15.99', 'Agotado', 'assets/img/1.jpg'),
(4, 1, 'Desayuno', 'Huevos con tocino', 'Deliciosos huevos revueltos con tocino', '8.99', 'Disponible', 'assets/img/1.jpg'),
(5, 1, 'Almuerzo', 'Pollo a la parrilla', 'Jugoso pollo asado a la parrilla', '12.99', 'Disponible', 'assets/img/4.jpg'),
(6, 2, 'Merienda', 'Ensalada de frutas', 'Refrescante ensalada de frutas variadas', '6.99', 'Disponible', 'assets/img/3.jpg'),
(7, 1, 'Desayuno', 'Huevos con tocino', 'Deliciosos huevos revueltos con tocino', '10.52', 'Agotado', 'assets/img/2.jpg'),
(8, 1, 'Almuerzo', 'Pollo a la parrilla', 'Jugoso pollo asado a la parrilla', '11.56', 'Disponible', 'assets/img/1.jpg'),
(9, 2, 'Merienda', 'Ensalada de frutas', 'Refrescante ensalada de frutas variadas', '11.24', 'Disponible', 'assets/img/1.jpg'),
(10, 1, 'Desayuno', 'Tostadas con aguacate', 'Deliciosas tostadas con aguacate y tomate', '6.55', 'Disponible', 'assets/img/1.jpg'),
(11, 2, 'Almuerzo', 'Pizza margarita', 'Clásica pizza con salsa de tomate, mozzarella y albahaca', '14.00', 'Disponible', 'assets/img/1.jpg'),
(12, 2, 'Merienda', 'Smoothie de frutas', 'Batido refrescante de frutas mixtas', '5.36', 'Disponible', 'assets/img/5.jpg'),
(14, NULL, '', '', NULL, '0.00', 'Disponible', 'http://localhost:3000/upload\\1704395316430-barchiringuito.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`) VALUES
(1, 'Ecuador'),
(2, 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nombre_provincia` varchar(50) NOT NULL,
  `id_pais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre_provincia`, `id_pais`) VALUES
(1, 'Pichincha', 1),
(2, 'Bogotá', 2),
(3, 'Azuay', 1),
(4, 'Bolívar', 1),
(5, 'Cañar', 1),
(6, 'Carchi', 1),
(7, 'Chimborazo', 1),
(8, 'Cotopaxi', 1),
(9, 'El Oro', 1),
(10, 'Esmeraldas', 1),
(11, 'Galápagos', 1),
(12, 'Guayas', 1),
(13, 'Imbabura', 1),
(14, 'Loja', 1),
(15, 'Los Ríos', 1),
(16, 'Manabí', 1),
(17, 'Morona-Santiago', 1),
(18, 'Napo', 1),
(19, 'Orellana', 1),
(20, 'Pastaza', 1),
(22, 'Santa Elena', 1),
(23, 'Santo Domingo de los Tsáchilas', 1),
(24, 'Sucumbíos', 1),
(25, 'Tungurahua', 1),
(26, 'Zamora-Chinchipe', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_reserva` datetime NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `codigo_estado` varchar(10) DEFAULT 'N/A',
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_usuario`, `fecha_reserva`, `estado`, `codigo_estado`, `comentario`) VALUES
(143, 1, '2023-12-17 21:34:19', 'Cancelado', '2023121797', NULL),
(144, 1, '2023-12-17 21:57:28', 'Cancelado', '2023121752', NULL),
(145, 1, '2023-12-17 21:58:15', 'Cancelado', '2023121733', NULL),
(146, 1, '2023-12-17 21:59:39', 'Cancelado', '2023121748', NULL),
(147, 1, '2023-12-17 22:01:15', 'Cancelado', '2023121797', NULL),
(148, 9, '2023-12-25 23:02:35', 'Cancelado', '2023122570', NULL),
(149, 9, '2023-12-25 23:15:22', 'Cancelado', '2023122528', NULL),
(150, 9, '2023-12-29 03:15:12', 'Entregado', '2023122823', NULL),
(151, 9, '2024-01-04 02:52:45', 'Cancelado', '2024134961', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `nombre_tipo_usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `nombre_tipo_usuario`) VALUES
(1, 'Cliente'),
(2, 'Empleado'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `nombre_ubicacion` varchar(50) NOT NULL,
  `latitud` varchar(65) DEFAULT NULL,
  `longitud` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `nombre_ubicacion`, `latitud`, `longitud`) VALUES
(1, 'UniBar', '-239403.13035796105', '-8861404.047571033'),
(7, 'Bar Summer`s', '-239404.13035796105', '-8861444.047571033'),
(8, 'La Nena', '-239400.74170082717', '-8861456.65181555'),
(29, 'Uni Bar2', '-239405.51901509496', '-8861420.785285197'),
(30, 'Bar Chiringuito', '-239410.2963293628', '-8861320.35900021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `contrasena`, `nombre`, `apellido`, `cedula`, `correo`, `direccion`, `telefono`, `id_ciudad`, `id_tipo_usuario`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '1234567890', 'juan@example.com', 'Dirección 123', '12345678', 1, 3),
(2, 'admin1', 'admin1', 'admin1', 'admin1', '1234567890', 'juan@example.com', 'Dirección 123', '12345678', 1, 3),
(3, 'admin2', 'admin2', 'admin2', 'admin2', '1234567890', 'juan@example.com', 'Dirección 123', '12345678', 1, 3),
(4, 'admin4', 'admin4', 'admin4', 'admin4', 'admin4', 'juan@example.com', 'Dirección 123', '12345678', 1, 3),
(5, 'admin3', 'admin3', 'admin3', 'admin3', '1234567890', 'juan@example.com', 'Dirección 123', '12345678', 1, 3),
(6, '1234', '1234', '1234', '1234', '', '', '', '', 1, 1),
(7, '1234', '', '123', '123', '1234', '1234', '1234', '1234', 1, 1),
(8, '123', '123', 'juan', 'lopez', NULL, '123', NULL, NULL, NULL, 1),
(9, 'marco', 'marco', 'marco', 'arreaga', '1750041715', '753', '1254', '564', NULL, 2),
(10, '789', '123456789', 'pedro', 'zuares', NULL, 'steeven10f@gmail.com', NULL, NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bar`
--
ALTER TABLE `bar`
  ADD PRIMARY KEY (`id_bar`),
  ADD KEY `id_ubicacion` (`id_ubicacion`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD PRIMARY KEY (`id_detalle_reserva`),
  ADD KEY `id_pedido` (`id_reserva`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  ADD PRIMARY KEY (`id_empleado_bar`),
  ADD KEY `id_bar` (`id_bar`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_bar` (`id_bar`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_ciudad` (`id_ciudad`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bar`
--
ALTER TABLE `bar`
  MODIFY `id_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  MODIFY `id_detalle_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  MODIFY `id_empleado_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bar`
--
ALTER TABLE `bar`
  ADD CONSTRAINT `bar_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD CONSTRAINT `detalle_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `detalle_reserva_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `empleado_bar`
--
ALTER TABLE `empleado_bar`
  ADD CONSTRAINT `empleado_bar_ibfk_2` FOREIGN KEY (`id_bar`) REFERENCES `bar` (`id_bar`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_bar`) REFERENCES `bar` (`id_bar`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
