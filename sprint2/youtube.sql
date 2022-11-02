-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: youtube
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
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_video` int NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.canal_UNIQUE` (`id`),
  KEY `fk_cvideos_idx` (`id_video`),
  CONSTRAINT `fk_cvideos` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_video` int NOT NULL,
  `id_usuario` int NOT NULL,
  `comentario` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.comentario_UNIQUE` (`id`),
  KEY `fk_comvideos_idx` (`id_video`),
  KEY `fk_comusuario_idx` (`id_usuario`),
  CONSTRAINT `fk_comusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_comvideos` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.etiqueta_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_etiquetas`
--

DROP TABLE IF EXISTS `grupo_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_etiquetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_etiqueta` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_etiquetas_idx` (`id_etiqueta`),
  CONSTRAINT `fk_etiquetas` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiquetas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_etiquetas`
--

LOCK TABLES `grupo_etiquetas` WRITE;
/*!40000 ALTER TABLE `grupo_etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_video` int NOT NULL,
  `like_dislike` tinyint NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.like_UNIQUE` (`id`),
  UNIQUE KEY `id.video_UNIQUE` (`id_video`),
  CONSTRAINT `fk_lvideos` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_comentarios`
--

DROP TABLE IF EXISTS `likes_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_comentario` int NOT NULL,
  `id_usuario` int NOT NULL,
  `like_dislike` tinyint NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.like.comentario_UNIQUE` (`id`),
  KEY `fk_lcusuario_idx` (`id_usuario`),
  KEY `fklccomentario_idx` (`id_comentario`),
  CONSTRAINT `fk_lcusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fklccomentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_comentarios`
--

LOCK TABLES `likes_comentarios` WRITE;
/*!40000 ALTER TABLE `likes_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
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
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_video` int NOT NULL,
  `id_usuario_playlist` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.playlist_UNIQUE` (`id`),
  KEY `fk_plvideo_idx` (`id_video`),
  KEY `fk_pusuarioplaylist_idx` (`id_usuario_playlist`),
  CONSTRAINT `fk_plvideo` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`),
  CONSTRAINT `fk_pusuarioplaylist` FOREIGN KEY (`id_usuario_playlist`) REFERENCES `usuario_playlists` (`id`)
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
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_canal` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.suscripcion_UNIQUE` (`id`),
  KEY `fk_susuario_idx` (`id_usuario`),
  KEY `fk_scanal_idx` (`id_canal`),
  CONSTRAINT `fk_scanal` FOREIGN KEY (`id_canal`) REFERENCES `canales` (`id`),
  CONSTRAINT `fk_susuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_playlists`
--

DROP TABLE IF EXISTS `usuario_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.usuario.playlist_UNIQUE` (`id`),
  KEY `fk_usplusuario_idx` (`id_usuario`),
  CONSTRAINT `fk_usplusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_playlists`
--

LOCK TABLES `usuario_playlists` WRITE;
/*!40000 ALTER TABLE `usuario_playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_de_usuario` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `sexo` int NOT NULL,
  `id_pais` int NOT NULL,
  `cp` int NOT NULL,
  `id_likes` int DEFAULT NULL,
  `id_suscripciones` int DEFAULT NULL,
  `id_playlists` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.usuario_UNIQUE` (`id`),
  KEY `fk_pais_idx` (`id_pais`),
  KEY `fk_ulikes_idx` (`id_likes`),
  KEY `fk_ususcripciones_idx` (`id_suscripciones`),
  KEY `fk_usplaylist_idx` (`id_playlists`),
  CONSTRAINT `fk_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id`),
  CONSTRAINT `fk_ulikes` FOREIGN KEY (`id_likes`) REFERENCES `likes` (`id`),
  CONSTRAINT `fk_usplaylist` FOREIGN KEY (`id_playlists`) REFERENCES `playlists` (`id`),
  CONSTRAINT `fk_ususcripciones` FOREIGN KEY (`id_suscripciones`) REFERENCES `suscripciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `titulo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` int NOT NULL,
  `nombre_archivo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `duracion` int NOT NULL,
  `thumbail` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `reproducciones` int NOT NULL,
  `likes` int NOT NULL,
  `dislikes` int NOT NULL,
  `estado` tinyint NOT NULL,
  `id_grupo_etiquetas` int DEFAULT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `id_canal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id.videos_UNIQUE` (`id`),
  KEY `fk_vusuario_idx` (`id_usuario`),
  KEY `fk_vgetiquetas_idx` (`id_grupo_etiquetas`),
  KEY `fk_vcanal_idx` (`id_canal`),
  CONSTRAINT `fk_vcanal` FOREIGN KEY (`id_canal`) REFERENCES `canales` (`id`),
  CONSTRAINT `fk_vgetiquetas` FOREIGN KEY (`id_grupo_etiquetas`) REFERENCES `grupo_etiquetas` (`id`),
  CONSTRAINT `fk_vusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 20:39:12
