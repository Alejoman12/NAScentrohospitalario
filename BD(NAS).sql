-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para hospital_management
CREATE DATABASE IF NOT EXISTS `hospital_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hospital_management`;

-- Volcando estructura para tabla hospital_management.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_administrador` varchar(50) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_administrador`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.administrador: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospital_management.cita
CREATE TABLE IF NOT EXISTS `cita` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(50) NOT NULL DEFAULT '',
  `id_medico` varchar(50) NOT NULL DEFAULT '',
  `fecha_hora` datetime DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `estado` enum('Pendiente','Confirmada','Cancelada','Atendida') DEFAULT 'Pendiente',
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_cita`),
  KEY `FK_cita_paciente` (`id_paciente`),
  KEY `FK_cita_medico` (`id_medico`),
  CONSTRAINT `FK_cita_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `FK_cita_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.cita: ~0 rows (aproximadamente)
INSERT INTO `cita` (`id_cita`, `id_paciente`, `id_medico`, `fecha_hora`, `motivo`, `estado`, `activo`) VALUES
	(3, 'PAC-49', 'MED-48', '2025-10-12 12:04:00', 'Dolor de barriga', 'Pendiente', 1);

-- Volcando estructura para tabla hospital_management.historia_clinica
CREATE TABLE IF NOT EXISTS `historia_clinica` (
  `id_historia` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(50) NOT NULL DEFAULT '',
  `descripcion` text NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_historia`),
  KEY `FK_historia_clinica_paciente` (`id_paciente`),
  CONSTRAINT `FK_historia_clinica_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.historia_clinica: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospital_management.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id_medico` varchar(50) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_medico`),
  KEY `FK_medico_usuario` (`id_usuario`),
  CONSTRAINT `FK_medico_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.medico: ~0 rows (aproximadamente)
INSERT INTO `medico` (`id_medico`, `id_usuario`, `especialidad`, `telefono`, `activo`) VALUES
	('MED-48', 48, 'piedrata', '3100', 1);

-- Volcando estructura para tabla hospital_management.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `id_usuario` int(11) NOT NULL,
  `id_medico` varchar(50) DEFAULT NULL,
  `documento_identidad` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `FK_paciente_medico` (`id_medico`),
  CONSTRAINT `FK_paciente_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.paciente: ~0 rows (aproximadamente)
INSERT INTO `paciente` (`id_paciente`, `id_usuario`, `id_medico`, `documento_identidad`, `fecha_nacimiento`, `genero`, `direccion`, `telefono`, `correo`, `activo`) VALUES
	('PAC-49', 49, NULL, '1112390195', '2000-04-12', 'Masculino', 'calle 12', '3101234', 'alejandro@gmail.com', 1);

-- Volcando estructura para tabla hospital_management.recepcionista
CREATE TABLE IF NOT EXISTS `recepcionista` (
  `id_recepcionista` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `id_usuario` int(11) NOT NULL,
  `turno` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_recepcionista`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `recepcionista_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.recepcionista: ~0 rows (aproximadamente)
INSERT INTO `recepcionista` (`id_recepcionista`, `id_usuario`, `turno`, `telefono`, `activo`) VALUES
	('REP-50', 50, 'Tarde', '310120310', 0);

-- Volcando estructura para tabla hospital_management.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rol` enum('Administrador','Recepcionista','Paciente','Medico') NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `pregunta` varchar(100) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospital_management.usuario: ~4 rows (aproximadamente)
INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contrasena`, `rol`, `activo`, `pregunta`, `respuesta`) VALUES
	(26, 'samir alenadro', 'samir@gmail.com', '12345', 'Administrador', 1, '', ''),
	(48, 'nicolas cardona', 'nicolas@gmail.com', '1234', 'Medico', 1, '', ''),
	(49, 'alejandro manzano', 'alejandro@gmail.com', '123', 'Paciente', 1, '', ''),
	(50, 'sebastian corredor', 'sebastian@gmail.com', '1234', 'Recepcionista', 1, '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
