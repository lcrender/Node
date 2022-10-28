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
  `id.clientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id.direccion` int DEFAULT NULL,
  `telefono` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha.registro` datetime DEFAULT NULL,
  `recomendado` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id.cliente.recomendado` int DEFAULT NULL,
  PRIMARY KEY (`id.clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id.direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `piso` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puerta` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id.empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `id.gafas` int NOT NULL AUTO_INCREMENT,
  `id.marca` int NOT NULL,
  `id.cristal` int DEFAULT NULL,
  `id.montura` int DEFAULT NULL,
  `id.color` int DEFAULT NULL,
  `id.vidrio` int DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `id.proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id.gafas`),
  UNIQUE KEY `idgafas_UNIQUE` (`id.gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas.color.montura`
--

DROP TABLE IF EXISTS `gafas.color.montura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas.color.montura` (
  `id.gafas.color.montura` int NOT NULL AUTO_INCREMENT,
  `color.montura` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.gafas.color.montura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas.color.montura`
--

LOCK TABLES `gafas.color.montura` WRITE;
/*!40000 ALTER TABLE `gafas.color.montura` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas.color.montura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas.color.vidrio`
--

DROP TABLE IF EXISTS `gafas.color.vidrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas.color.vidrio` (
  `id.gafas.color.vidrio` int NOT NULL AUTO_INCREMENT,
  `color.vidrio` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.gafas.color.vidrio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas.color.vidrio`
--

LOCK TABLES `gafas.color.vidrio` WRITE;
/*!40000 ALTER TABLE `gafas.color.vidrio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas.color.vidrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas.cristal`
--

DROP TABLE IF EXISTS `gafas.cristal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas.cristal` (
  `id.gafas.cristal` int NOT NULL AUTO_INCREMENT,
  `graduacion` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.gafas.cristal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas.cristal`
--

LOCK TABLES `gafas.cristal` WRITE;
/*!40000 ALTER TABLE `gafas.cristal` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas.cristal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas.marca`
--

DROP TABLE IF EXISTS `gafas.marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas.marca` (
  `id.gafas.marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id.proveedor` int NOT NULL,
  PRIMARY KEY (`id.gafas.marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas.marca`
--

LOCK TABLES `gafas.marca` WRITE;
/*!40000 ALTER TABLE `gafas.marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas.marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas.montura`
--

DROP TABLE IF EXISTS `gafas.montura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas.montura` (
  `id.gafas.montura` int NOT NULL AUTO_INCREMENT,
  `montura` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id.gafas.montura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas.montura`
--

LOCK TABLES `gafas.montura` WRITE;
/*!40000 ALTER TABLE `gafas.montura` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafas.montura` ENABLE KEYS */;
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
  `id.direccion` int NOT NULL,
  `telefono` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id.venta` int NOT NULL AUTO_INCREMENT,
  `id.gafa` int NOT NULL,
  `id.cliente` int NOT NULL,
  `id.empleado` int NOT NULL,
  PRIMARY KEY (`id.venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
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

-- Dump completed on 2022-10-19 23:26:57
