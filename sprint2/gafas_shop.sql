-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: gafas_shop
-- ------------------------------------------------------
-- Server version	8.0.22

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_direccion` int DEFAULT NULL,
  `telefono` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `recomendado` tinyint(1) DEFAULT NULL,
  `id_cliente_recomendado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.clientes_UNIQUE` (`id`),
  KEY `fk_direccion_idx` (`id_direccion`),
  KEY `fk_usdireccion_idx` (`id_direccion`),
  KEY `fk_cliente_rec_idx` (`id_cliente_recomendado`),
  CONSTRAINT `fk_cliente_rec` FOREIGN KEY (`id_cliente_recomendado`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_usdireccion` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Alan',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Diego',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Jose',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `numero` int NOT NULL,
  `piso` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puerta` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Mitre',23,'1','2','Madrid','1231','España'),(2,'Gomez Bolaño',436,NULL,NULL,'Madrid','3232','España');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Marcos Lopez'),(2,'Juanita Papusota'),(3,'Jasinto Gomez');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `id_cristal` int DEFAULT NULL,
  `id_montura` int DEFAULT NULL,
  `id_color_montura` int DEFAULT NULL,
  `id_color_vidrio` int DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idgafas_UNIQUE` (`id`),
  KEY `fk_marca_idx` (`id_marca`),
  KEY `fk_cristal_idx` (`id_cristal`),
  KEY `fk_montura_idx` (`id_montura`),
  KEY `fk_color_montura_idx` (`id_color_montura`),
  KEY `fk_color_vidrio_idx` (`id_color_vidrio`),
  KEY `fk_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_color_montura` FOREIGN KEY (`id_color_montura`) REFERENCES `gafas_color_montura` (`id`),
  CONSTRAINT `fk_color_vidrio` FOREIGN KEY (`id_color_vidrio`) REFERENCES `gafas_color_vidrio` (`id`),
  CONSTRAINT `fk_cristal` FOREIGN KEY (`id_cristal`) REFERENCES `gafas_cristal` (`id`),
  CONSTRAINT `fk_gproveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `gafas_marca` (`id`),
  CONSTRAINT `fk_montura` FOREIGN KEY (`id_montura`) REFERENCES `gafas_montura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,1,NULL,NULL,NULL,NULL,100,1),(2,2,NULL,NULL,NULL,NULL,80,2),(3,3,NULL,NULL,NULL,NULL,120,1);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_color_montura`
--

DROP TABLE IF EXISTS `gafas_color_montura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_color_montura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montura` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_color_montura`
--

LOCK TABLES `gafas_color_montura` WRITE;
/*!40000 ALTER TABLE `gafas_color_montura` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas_color_montura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_color_vidrio`
--

DROP TABLE IF EXISTS `gafas_color_vidrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_color_vidrio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_color_vidrio`
--

LOCK TABLES `gafas_color_vidrio` WRITE;
/*!40000 ALTER TABLE `gafas_color_vidrio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas_color_vidrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_cristal`
--

DROP TABLE IF EXISTS `gafas_cristal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_cristal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `graduacion` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_cristal`
--

LOCK TABLES `gafas_cristal` WRITE;
/*!40000 ALTER TABLE `gafas_cristal` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas_cristal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_marca`
--

DROP TABLE IF EXISTS `gafas_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_marca`
--

LOCK TABLES `gafas_marca` WRITE;
/*!40000 ALTER TABLE `gafas_marca` DISABLE KEYS */;
INSERT INTO `gafas_marca` VALUES (1,'Vulk',1),(2,'Reef',1),(3,'Volvom',2);
/*!40000 ALTER TABLE `gafas_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_montura`
--

DROP TABLE IF EXISTS `gafas_montura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_montura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montura` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_montura`
--

LOCK TABLES `gafas_montura` WRITE;
/*!40000 ALTER TABLE `gafas_montura` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas_montura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_direccion` int NOT NULL,
  `telefono` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_direccion_idx` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor del Sur',1,600343203,2322232,45343),(2,'Proveedor del Norte',2,434343,2342423,43223);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_gafa` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.venta_UNIQUE` (`id`),
  KEY `id_gafa_idx` (`id_gafa`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `fk_empleado_idx` (`id_empleado`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `fk_gafa` FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (2,1,1,1,'2022-10-25 00:00:00'),(3,1,1,2,'2022-04-05 00:00:00'),(4,1,1,1,'2021-04-05 00:00:00'),(5,1,2,1,'2022-04-15 00:00:00'),(6,1,2,1,'2021-04-15 00:00:00');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 18:24:59
