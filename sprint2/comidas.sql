-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: comidas
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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_producto_idx` (`id_producto`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,1,1,4);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_productos`
--

DROP TABLE IF EXISTS `cat_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_productos`
--

LOCK TABLES `cat_productos` WRITE;
/*!40000 ALTER TABLE `cat_productos` DISABLE KEYS */;
INSERT INTO `cat_productos` VALUES (1,'Bebidas'),(2,'Pizzas Napolitanas'),(3,'Pizzas Especiales'),(4,'Pizzas Integrales'),(5,'Hamburguesas');
/*!40000 ALTER TABLE `cat_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `id_direccion` int NOT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_direccion_idx` (`id_direccion`),
  CONSTRAINT `fk_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jhony','Tolengo',1,32324433),(2,'Bruce','Lee',2,93939393),(3,'Enzo','Franchescoli',3,32432243),(4,'Lorenzo','Sanchez',4,34324324);
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
  `direccion` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `cp` int NOT NULL,
  `localidad` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `provincia` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Alem 232',1234,'Moron','Buenos Aires'),(2,'Rambla Juliana 322',88,'Barcelona','Barcelona'),(3,'Via Maria 2323',88,'Barcelona','Barcelona'),(4,'Maradona 99',121,'Las Toninas','Madrid');
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
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `nif` int NOT NULL,
  `telefono` int NOT NULL,
  `id_puesto` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nif_UNIQUE` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Jorge','Mangone',3432,600232340,0),(2,'Dario','Matarolo',1212,34322323,0),(3,'Matias','Figaro',12413,453435345,1),(5,'Juliana','Velazques',4343,43543534,0);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `envio` tinyint(1) NOT NULL,
  `id_direccion` int DEFAULT NULL,
  `id_tienda` int NOT NULL,
  `id_empleado` int NOT NULL,
  `hora_entrega` datetime NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_UNIQUE` (`id_pedido`),
  KEY `fk_pcliente_idx` (`id_cliente`),
  KEY `fk_pdireccion_idx` (`id_direccion`),
  KEY `fk_pempleado_idx` (`id_empleado`),
  KEY `fk_ptienda_idx` (`id_tienda`),
  CONSTRAINT `fk_pcliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_pdireccion` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id`),
  CONSTRAINT `fk_pempleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `fk_ptienda` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2022-10-10 20:22:22',1,2,1,2,'2022-10-10 20:23:23'),(2,1,'2022-10-11 20:22:22',0,NULL,1,1,'2022-11-10 20:23:23'),(3,2,'2021-10-10 20:22:22',0,NULL,1,1,'2022-10-11 20:23:23');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_detalles`
--

DROP TABLE IF EXISTS `pedidos_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_detalles` (
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `total` float NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_dpedido_idx` (`id_pedido`),
  KEY `fk_dproducto_idx` (`id_producto`),
  CONSTRAINT `fk_dpedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_dproducto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_detalles`
--

LOCK TABLES `pedidos_detalles` WRITE;
/*!40000 ALTER TABLE `pedidos_detalles` DISABLE KEYS */;
INSERT INTO `pedidos_detalles` VALUES (1,2,5,6,30,1),(2,5,1,3,3,2),(3,3,4,4,16,3),(1,7,2,3,6,4);
/*!40000 ALTER TABLE `pedidos_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cat_productos` int NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cat_prod_idx` (`id_cat_productos`),
  CONSTRAINT `fk_cat_prod` FOREIGN KEY (`id_cat_productos`) REFERENCES `cat_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Tinto de verano','vino tinto de verano',NULL,1,10),(2,'Blue Burguer','Hamburguesa con queso azul',NULL,5,12),(3,'Pizza Margarita','Salsa de tomate, muzzarella, oregano',NULL,2,8),(4,'Pizza Napolitana','Salsa de tomate, muzzarella, tomate, oregano',NULL,2,9),(5,'Pizza Mc Queen Jr','Salsa de tomate, muzzarella, tomate, papas fritas, cebolla, morron, oregano',NULL,3,12),(6,'Pizza The Fat','Salsa de tomate, muzzarella, anana, papas fritas, dulce de leche, salsa golf, oregano',NULL,3,22),(7,'agua','agua de 1 litro marca Patito',NULL,1,1),(8,'Vino','Vino patero Catalan',NULL,1,2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'Tienda Norte'),(2,'Tienda Sur');
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 18:21:38
