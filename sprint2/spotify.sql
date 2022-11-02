-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `albumes_favoritos`
--

DROP TABLE IF EXISTS `albumes_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumes_favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_album` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.album.favorito_UNIQUE` (`id`),
  KEY `fk_falbumes_idx` (`id_album`),
  KEY `fk_fusuario_idx` (`id_usuario`),
  CONSTRAINT `fk_falbumes` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id`),
  CONSTRAINT `fk_fusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumes_favoritos`
--

LOCK TABLES `albumes_favoritos` WRITE;
/*!40000 ALTER TABLE `albumes_favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `albumes_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_artista` int NOT NULL,
  `creacion` datetime NOT NULL,
  `imagen` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.album_UNIQUE` (`id`),
  KEY `fk_artista_idx` (`id_artista`),
  CONSTRAINT `fk_artista` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.artista_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas_similares`
--

DROP TABLE IF EXISTS `artistas_similares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas_similares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_artista` int NOT NULL,
  `id_artista_simil` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.artista.similar_UNIQUE` (`id`),
  KEY `fk_sartista_idx` (`id_artista`),
  KEY `fk_simil_idx` (`id_artista_simil`),
  CONSTRAINT `fk_sartista` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`),
  CONSTRAINT `fk_simil` FOREIGN KEY (`id_artista_simil`) REFERENCES `artistas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas_similares`
--

LOCK TABLES `artistas_similares` WRITE;
/*!40000 ALTER TABLE `artistas_similares` DISABLE KEYS */;
/*!40000 ALTER TABLE `artistas_similares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_album` int NOT NULL,
  `titulo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `duracion` datetime NOT NULL,
  `reproducciones` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.cancion_UNIQUE` (`id`),
  KEY `fk_calbum_idx` (`id_album`),
  CONSTRAINT `fk_calbum` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones_favoritas`
--

DROP TABLE IF EXISTS `canciones_favoritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones_favoritas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_cancion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.cancion.favorita_UNIQUE` (`id`),
  KEY `fk_cfusuario_idx` (`id_usuario`),
  KEY `fk_cfcancion_idx` (`id_cancion`),
  CONSTRAINT `fk_cfcancion` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id`),
  CONSTRAINT `fk_cfusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones_favoritas`
--

LOCK TABLES `canciones_favoritas` WRITE;
/*!40000 ALTER TABLE `canciones_favoritas` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones_favoritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `numero_orden` int NOT NULL AUTO_INCREMENT,
  `id_suscripcion` int NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`numero_orden`),
  UNIQUE KEY `id.pagos_UNIQUE` (`numero_orden`),
  KEY `fk_psuscripcion_idx` (`id_suscripcion`),
  CONSTRAINT `fk_psuscripcion` FOREIGN KEY (`id_suscripcion`) REFERENCES `suscripcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.pais_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.paypal_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `n_canciones` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  `eliminada` tinyint(1) NOT NULL,
  `fecha_eliminada` datetime DEFAULT NULL,
  `compartida` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.playlist_UNIQUE` (`id`),
  KEY `fk_pusuario_idx` (`id_usuario`),
  CONSTRAINT `fk_pusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_compartidas`
--

DROP TABLE IF EXISTS `playlists_compartidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_compartidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_update` datetime NOT NULL,
  `id_playlist` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.playlist.compartida_UNIQUE` (`id`),
  KEY `fk_pcusuario_idx` (`id_usuario`),
  KEY `fk_pcplaylist_idx` (`id_playlist`),
  CONSTRAINT `fk_pcplaylist` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id`),
  CONSTRAINT `fk_pcusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_compartidas`
--

LOCK TABLES `playlists_compartidas` WRITE;
/*!40000 ALTER TABLE `playlists_compartidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_compartidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidos`
--

DROP TABLE IF EXISTS `seguidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.seguido_UNIQUE` (`id`),
  KEY `sk_susuario_idx` (`id_usuario`),
  KEY `fk_scartista_idx` (`id_artista`),
  CONSTRAINT `fk_scartista` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`),
  CONSTRAINT `fk_susuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidos`
--

LOCK TABLES `seguidos` WRITE;
/*!40000 ALTER TABLE `seguidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_renovacion` datetime NOT NULL,
  `forma_pago` tinyint(1) NOT NULL,
  `id_tarjeta` int DEFAULT NULL,
  `id_paypal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.suscripcion_UNIQUE` (`id`),
  KEY `fk_tarjeta_idx` (`id_tarjeta`),
  KEY `fk_paypal_idx` (`id_paypal`),
  CONSTRAINT `fk_paypal` FOREIGN KEY (`id_paypal`) REFERENCES `paypal` (`id`),
  CONSTRAINT `fk_tarjeta` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `vencimiento` datetime NOT NULL,
  `codigo` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.tarjetas_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `sexo` tinyint NOT NULL,
  `id_pais` int NOT NULL,
  `cp` int NOT NULL,
  `premium` tinyint NOT NULL,
  `id_suscripcion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.usuario_UNIQUE` (`id`),
  KEY `fk_pais_idx` (`id_pais`),
  KEY `fk_suscripcion_idx` (`id_suscripcion`),
  CONSTRAINT `fk_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id`),
  CONSTRAINT `fk_suscripcion` FOREIGN KEY (`id_suscripcion`) REFERENCES `suscripcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 21:11:19
