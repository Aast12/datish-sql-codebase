-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: datish-db.cr1xvhuvlnw1.us-east-2.rds.amazonaws.com    Database: datish
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `admin_comunidad`
--

DROP TABLE IF EXISTS `admin_comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_comunidad` (
  `id_comunidad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_comunidad`,`id_usuario`),
  KEY `admin_usuario_comunidad_idx` (`id_usuario`),
  CONSTRAINT `admin_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`),
  CONSTRAINT `admin_usuario_comunidad` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_punto_venta`
--

DROP TABLE IF EXISTS `admin_punto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_punto_venta` (
  `id_punto_de_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_punto_de_venta`,`id_usuario`),
  KEY `usuario_admin_pventa_idx` (`id_usuario`),
  CONSTRAINT `admin_punto_venta` FOREIGN KEY (`id_punto_de_venta`) REFERENCES `punto_de_venta` (`id_punto_de_venta`),
  CONSTRAINT `usuario_admin_pventa` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agrupacion`
--

DROP TABLE IF EXISTS `agrupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion` (
  `id_agrupacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(280) NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_comunidad` int(11) NOT NULL,
  PRIMARY KEY (`id_agrupacion`),
  UNIQUE KEY `id_agrupacion_UNIQUE` (`id_agrupacion`),
  KEY `agrupacion_comunidad_idx` (`id_comunidad`),
  CONSTRAINT `agrupacion_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id_usuario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `cuerpo` varchar(4000) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_post`,`fecha_publicacion`),
  KEY `comment_post_idx` (`id_post`),
  CONSTRAINT `comment_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `comment_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comunidad`
--

DROP TABLE IF EXISTS `comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidad` (
  `id_comunidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(280) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_comunidad`),
  UNIQUE KEY `id_comunidad_UNIQUE` (`id_comunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_usuario` int(11) NOT NULL,
  `id_punto_de_venta` int(11) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `cuerpo` varchar(140) NOT NULL,
  `fijo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`,`id_punto_de_venta`,`fecha_publicacion`),
  KEY `estado_pventa_idx` (`id_punto_de_venta`),
  CONSTRAINT `estado_pventa` FOREIGN KEY (`id_punto_de_venta`) REFERENCES `punto_de_venta` (`id_punto_de_venta`),
  CONSTRAINT `estado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `estado_chk_1` CHECK ((length(`cuerpo`) > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_punto_de_venta` int(11) NOT NULL,
  `lunes` varchar(100) DEFAULT NULL,
  `martes` varchar(100) DEFAULT NULL,
  `miercoles` varchar(100) DEFAULT NULL,
  `jueves` varchar(100) DEFAULT NULL,
  `viernes` varchar(100) DEFAULT NULL,
  `sabado` varchar(100) DEFAULT NULL,
  `domingo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_punto_de_venta`),
  UNIQUE KEY `id_punto_de_venta_UNIQUE` (`id_punto_de_venta`),
  CONSTRAINT `id_punto_de_venta` FOREIGN KEY (`id_punto_de_venta`) REFERENCES `punto_de_venta` (`id_punto_de_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_repartidor` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido_UNIQUE` (`id_pedido`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `id_repartidor_idx` (`id_repartidor`),
  CONSTRAINT `pedido_repartidor` FOREIGN KEY (`id_repartidor`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_comunidad` int(11) NOT NULL,
  `cuerpo` varchar(4000) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  PRIMARY KEY (`id_post`),
  UNIQUE KEY `id_post_UNIQUE` (`id_post`),
  KEY `post_usuario_idx` (`id_usuario`),
  KEY `post_comunidad_idx` (`id_comunidad`),
  CONSTRAINT `post_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`),
  CONSTRAINT `post_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `post_chk_1` CHECK ((length(`cuerpo`) > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(280) NOT NULL,
  `costo` decimal(10,0) NOT NULL,
  `disponible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto_UNIQUE` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto_solicitado`
--

DROP TABLE IF EXISTS `producto_solicitado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_solicitado` (
  `id_producto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_pedido`),
  KEY `id_pedido_idx` (`id_pedido`),
  CONSTRAINT `prodsol_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `prodsol_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `punto_de_venta`
--

DROP TABLE IF EXISTS `punto_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `punto_de_venta` (
  `id_punto_de_venta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(280) NOT NULL DEFAULT '',
  `id_agrupacion` int(11) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `id_comunidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_punto_de_venta`),
  UNIQUE KEY `id_punto_de_venta_UNIQUE` (`id_punto_de_venta`),
  KEY `id_agrupacion_idx` (`id_agrupacion`),
  KEY `pventa_comunidad_idx` (`id_comunidad`),
  CONSTRAINT `pventa_agrupacion` FOREIGN KEY (`id_agrupacion`) REFERENCES `agrupacion` (`id_agrupacion`),
  CONSTRAINT `pventa_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_punto_de_venta` int(11) NOT NULL,
  `calificacion` decimal(10,0) NOT NULL,
  `cuerpo` varchar(4000) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  PRIMARY KEY (`id_review`),
  UNIQUE KEY `id_review_UNIQUE` (`id_review`),
  KEY `id_punto_de_venta_idx` (`id_punto_de_venta`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `review_punto_de_venta` FOREIGN KEY (`id_punto_de_venta`) REFERENCES `punto_de_venta` (`id_punto_de_venta`),
  CONSTRAINT `review_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `review_chk_1` CHECK (((`calificacion` >= 0) and (`calificacion` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
