-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-06-2024 a las 19:55:23
-- Versión del servidor: 8.0.37
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL,
  `tipo_cuenta` varchar(20) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  `NIP` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `telefono`, `direccion`, `fecha_registro`, `tipo_cuenta`, `saldo`, `NIP`) VALUES
(29, 'JUAN', 'MANUEL', 'GONZALEZ', 'juanmanue.gv@gmail.com', '8945665', 'Mi casa', '2024-05-30', 'Corriente', 5000.00, 123456),
(30, 'RAZIEL', 'HUERTA', 'GARCIA', 'oscarrazielhuertagarcia@gmail.com', '9531255', 'Laureles', '2024-05-30', 'Corriente', 10000.00, 200211),
(31, 'JOSE JULIAN', 'ORTIZ', 'MARTINEZ', 'joseortizmartinez62@gmail.com', '9515769989', 'Montoya', '2024-05-30', 'Corriente', 5000.00, 180304),
(32, 'KELLY', 'CRUZ', 'ALONSO', 'kellycruzalonso0410@gmail.com', '9515828766', 'tec', '2024-05-30', 'Ahorros', 2500.00, 123456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejecutivo`
--

CREATE TABLE `ejecutivo` (
  `id_ejecutivo` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `salario` decimal(16,2) NOT NULL,
  `Clave` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ejecutivo`
--

INSERT INTO `ejecutivo` (`id_ejecutivo`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `telefono`, `salario`, `Clave`) VALUES
(10, 'Juan', 'Martínez', 'García', 'juan.martinez@example.com', '+525551234567', 35000.00, 321547),
(11, 'María', 'López', 'Rodríguez', 'maria.lopez@example.com', '+528123456789', 40000.00, 874563),
(12, 'Carlos', 'Martínez', 'Fernández', 'carlos.martinez@example.com', '+523334567890', 38000.00, 675412),
(13, 'Luisa', 'Hernández', 'Díaz', 'luisa.hernandez@example.com', '+525545678901', 42000.00, 456387),
(14, 'Pedro', 'González', 'Sánchez', 'pedro.gonzalez@example.com', '+528156789012', 39000.00, 786139),
(15, 'carlos', 'adiel', 'cruz', 'adiel@gmail.com', '9511686037', 13275.43, 154826),
(16, 'jhoni', 'chigolo', 'cruz', 'jhoni@gmail.com', '951265', 16352.16, 123456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `id_gerente` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` decimal(16,2) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `sucursal_id` int DEFAULT NULL,
  `clave` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`id_gerente`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `telefono`, `fecha_contratacion`, `salario`, `departamento`, `sucursal_id`, `clave`) VALUES
(10, 'Laura', 'Gómez', 'Pérez', 'laura.gomez@example.com', '+525551234567', '2023-05-15', 50000.00, 'Ventas', 1, 567843),
(11, 'Javier', 'Díaz', 'Hernández', 'javier.diaz@example.com', '+528123456789', '2022-10-20', 55000.00, 'Operaciones', 2, 685214),
(12, 'Ana', 'Fernández', 'López', 'ana.fernandez@example.com', '+523334567890', '2024-01-08', 52000.00, 'Recursos Humanos', 3, 459628),
(13, 'Diego', 'Sánchez', 'Martínez', 'diego.sanchez@example.com', '+525545678901', '2023-08-30', 53000.00, 'Finanzas', 1, 205687),
(14, 'Sofía', 'Pérez', 'García', 'sofia.perez@example.com', '+528156789012', '2024-04-12', 51000.00, 'Marketing', 2, 156397);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `cliente_id` int NOT NULL,
  `id_tarjeta` int NOT NULL,
  `numero_tarjeta` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `saldo_disponible` decimal(15,2) NOT NULL,
  `credito` tinyint(1) NOT NULL,
  `tarjetaCredito` bigint NOT NULL,
  `limite` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`cliente_id`, `id_tarjeta`, `numero_tarjeta`, `fecha_emision`, `fecha_expiracion`, `saldo_disponible`, `credito`, `tarjetaCredito`, `limite`) VALUES
(29, 6, 00001156579441446549, '2024-05-30', '2026-05-27', 5000.00, 0, 0, 0),
(30, 7, 00004553444977182952, '2024-05-30', '2026-05-27', 10000.00, 0, 0, 0),
(31, 8, 00005329563516741987, '2024-05-30', '2026-05-27', 5000.00, 0, 0, 0),
(32, 9, 00006819431189766921, '2024-05-30', '2026-05-27', 2500.00, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`,`apellido_materno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ejecutivo`
--
ALTER TABLE `ejecutivo`
  ADD PRIMARY KEY (`id_ejecutivo`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`id_gerente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `id_cliente` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `ejecutivo`
--
ALTER TABLE `ejecutivo`
  MODIFY `id_ejecutivo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `id_gerente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id_tarjeta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
