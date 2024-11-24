-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2024 a las 22:12:12
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- Estructura de tabla para la tabla `gg_archivos`
--

CREATE TABLE `gg_archivos` (
  `id_archivos` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_categorias` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `ruta` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `gg_usuarios`
--

CREATE TABLE `gg_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `email` varchar(245) DEFAULT NULL,
  `usuario` varchar(245) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `insert` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gg_usuarios`
--

INSERT INTO `gg_usuarios` (`id_usuario`, `nombre`, `fechaNacimiento`, `email`, `usuario`, `password`, `insert`) VALUES
(1, 'joss', '2000-10-03', 'joss@gmail.com', 'joss', 'be8d00cc108e81a112d3242ac047c222e6c1e54f', '2024-02-07 15:10:23'),
(2, 'juan', '2024-02-04', 'juan@gmail.com', 'juan', 'b49a5780a99ea81284fc0746a78f84a30e4d5c73', '2024-02-07 15:16:33'),
(3, 'sol', '2005-01-13', 'sol@hotmail.com', 'sol', 'fbb93bb966c801b3a72230e8f3b752b62ef22929', '2024-11-24 01:26:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gg_archivos`
--
ALTER TABLE `gg_archivos`
  ADD PRIMARY KEY (`id_archivos`),
  ADD KEY `fkArchivosCategorias_idx` (`id_categorias`),
  ADD KEY `fkUsuariosArchivos_idx` (`id_usuario`);

--
-- Indices de la tabla `gg_categorias`
--
ALTER TABLE `gg_categorias`
  ADD PRIMARY KEY (`id_categorias`),
  ADD KEY `fkCategoriaUsuario_idx` (`id_usuario`);

--
-- Indices de la tabla `gg_usuarios`
--
ALTER TABLE `gg_usuarios`
  ADD PRIMARY KEY (`id_usuario`);


--
-- Restricciones para tablas volcadas
--


-- Filtros para la tabla `gg_categorias`
--
ALTER TABLE `gg_categorias`
  ADD CONSTRAINT `fkCategoriaUsuario` FOREIGN KEY (`id_usuario`) REFERENCES `gg_usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
