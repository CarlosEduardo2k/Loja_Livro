CREATE DATABASE  IF NOT EXISTS `db_lojalivro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_lojalivro`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_lojalivro
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Carlos Eduardo Mendes Teixeira De Castro','61999551969','carloseduardo141724@gmail.com'),(3,'Carlos Eduardo Mendes Teixeira De Castro','61999551969','Qualquernomeai@gmail.com');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_compra`
--

DROP TABLE IF EXISTS `tb_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `dt_compra` datetime DEFAULT current_timestamp(),
  `total_compra` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_cliente` (`id_cliente`),
  CONSTRAINT `fk_compra_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compra`
--

LOCK TABLES `tb_compra` WRITE;
/*!40000 ALTER TABLE `tb_compra` DISABLE KEYS */;
INSERT INTO `tb_compra` VALUES (1,3,'2025-11-19 20:13:54',20.00),(2,3,'2025-11-19 20:17:01',20.00),(3,3,'2025-11-19 20:17:07',20.00),(4,3,'2025-11-19 20:18:25',20.00),(5,3,'2025-11-19 20:19:45',20.00),(6,3,'2025-11-19 20:20:50',20.00),(7,3,'2025-11-19 20:21:08',20.00),(8,3,'2025-11-19 20:23:38',40.00),(9,3,'2025-11-19 20:25:28',60.00),(10,3,'2025-11-19 20:26:15',70.00),(11,3,'2025-11-19 20:45:14',80.00),(12,3,'2025-11-19 20:46:41',30.00);
/*!40000 ALTER TABLE `tb_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_venda`
--

DROP TABLE IF EXISTS `tb_item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_item_venda` (
  `id_item_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `qtd_venda` int(11) NOT NULL,
  `valor_item` decimal(10,2) NOT NULL,
  `total_item` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item_venda`),
  KEY `fk_item_compra` (`id_compra`),
  KEY `fk_item_livro` (`id_livro`),
  CONSTRAINT `fk_item_compra` FOREIGN KEY (`id_compra`) REFERENCES `tb_compra` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_livro` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id_livro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_venda`
--

LOCK TABLES `tb_item_venda` WRITE;
/*!40000 ALTER TABLE `tb_item_venda` DISABLE KEYS */;
INSERT INTO `tb_item_venda` VALUES (1,5,8,1,20.00,20.00),(2,6,8,1,20.00,20.00),(3,7,8,1,20.00,20.00),(4,8,8,2,20.00,40.00),(5,9,8,3,20.00,60.00),(6,10,8,1,20.00,20.00),(7,10,9,1,10.00,10.00),(8,10,10,1,40.00,40.00),(9,11,10,2,40.00,80.00),(10,12,8,1,20.00,20.00),(11,12,9,1,10.00,10.00);
/*!40000 ALTER TABLE `tb_item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_livro`
--

DROP TABLE IF EXISTS `tb_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_livro` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `autor_livro` varchar(120) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  PRIMARY KEY (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_livro`
--

LOCK TABLES `tb_livro` WRITE;
/*!40000 ALTER TABLE `tb_livro` DISABLE KEYS */;
INSERT INTO `tb_livro` VALUES (8,'codigo limpo',NULL,20.00,1),(9,'java livro',NULL,10.00,1),(10,'pyton',NULL,40.00,2);
/*!40000 ALTER TABLE `tb_livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 21:06:26
