-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2022 a las 09:05:54
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_DELETE_ESTUDIANTE` (IN `p_id_estudiante` INT(11))  begin
	update estudiantes set estado = 0, fecha_modificacion = now() where id_estudiante = p_id_estudiante;
	select * from estudiantes where  id_estudiante = p_id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_DELETE_PROFESOR` (IN `p_id_profesor` INT(11))  begin
	update profesores set estado = 0, fecha_modificacion = now() where id_profesor = p_id_profesor;
	select * from profesores where id_profesor = p_id_profesor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_INSERT_ESTUDIANTE` (IN `p_nombres` VARCHAR(200), IN `p_apellidos` VARCHAR(200), IN `p_tipo_identificacion` VARCHAR(100), IN `p_numero_identificacion` INT(15), IN `p_correo` VARCHAR(100), IN `p_celular` INT(11), IN `p_edad` INT(2))  begin
	insert into estudiantes (nombres,apellidos,tipo_identificacion,numero_identificacion,correo,celular,edad,fecha_creacion,estado) values (p_nombres,p_apellidos,p_tipo_identificacion,p_numero_identificacion,p_correo,p_celular,p_edad,now(),1);
	select * from estudiantes where 
			id_estudiante = LAST_INSERT_ID()
		limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_INSERT_PROFESOR` (IN `p_nombres` VARCHAR(200), IN `p_apellidos` VARCHAR(200), IN `p_tipo_identificacion` VARCHAR(100), IN `p_numero_identificacion` INT(15), IN `p_correo` VARCHAR(100), IN `p_celular` INT(11), IN `p_materia` VARCHAR(100), IN `p_edad` INT(2))  begin
	insert into profesores (nombres,apellidos,tipo_identificacion,numero_identificacion,correo,celular,materia,edad,fecha_creacion,estado) values (p_nombres,p_apellidos,p_tipo_identificacion,p_numero_identificacion,p_correo,p_celular,p_materia,p_edad,now(),1);
	select * from profesores where 
			id_profesor = LAST_INSERT_ID()
		limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_SELECT_DOCS` ()  begin
	select * from documentos_identificacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_SELECT_ESTUDIANTE` ()  begin
	select * from estudiantes where estado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_SELECT_MATERIA` ()  begin
	select * from materias;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_SELECT_PROFESOR` ()  begin
	select * from profesores where estado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_UPDATE_ESTUDIANTE` (IN `p_id_estudiante` INT(11), IN `p_nombres` VARCHAR(200), IN `p_apellidos` VARCHAR(200), IN `p_tipo_identificacion` VARCHAR(100), IN `p_numero_identificacion` INT(15), IN `p_correo` VARCHAR(100), IN `p_celular` INT(11), IN `p_edad` INT(2))  begin
	update estudiantes set nombres = p_nombres,apellidos = p_apellidos,tipo_identificacion = p_tipo_identificacion,numero_identificacion = p_numero_identificacion,correo = p_correo,celular = p_celular,edad = p_edad,fecha_modificacion = now() where id_estudiante = p_id_estudiante;
	select * from estudiantes where 
			id_estudiante = p_id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COLEGIO_UPDATE_PROFESOR` (IN `p_id_profesor` INT(11), IN `p_nombres` VARCHAR(200), IN `p_apellidos` VARCHAR(200), IN `p_tipo_identificacion` VARCHAR(100), IN `p_numero_identificacion` INT(15), IN `p_correo` VARCHAR(100), IN `p_celular` INT(11), IN `p_materia` VARCHAR(100), IN `p_edad` INT(2))  begin
	update profesores set nombres = p_nombres,apellidos = p_apellidos,tipo_identificacion = p_tipo_identificacion,numero_identificacion = p_numero_identificacion,correo = p_correo,celular = p_celular,materia = p_materia,edad = p_edad,fecha_modificacion = now() where id_profesor = p_id_profesor;
	select * from profesores where 
			id_profesor = p_id_profesor;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_identificacion`
--

CREATE TABLE `documentos_identificacion` (
  `id_documento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentos_identificacion`
--

INSERT INTO `documentos_identificacion` (`id_documento`, `nombre`) VALUES
(1, 'Cedula De Ciudadania'),
(2, 'Cedula Extranjeria'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  `numero_identificacion` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `celular` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre`, `descripcion`) VALUES
(1, 'Matematicas', 'matematicas avanzada de 6 a 11'),
(2, 'Español', 'español'),
(3, 'Ingles', 'ingles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  `numero_identificacion` int(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `celular` int(11) NOT NULL,
  `materia` varchar(50) NOT NULL,
  `edad` int(2) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documentos_identificacion`
--
ALTER TABLE `documentos_identificacion`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documentos_identificacion`
--
ALTER TABLE `documentos_identificacion`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
