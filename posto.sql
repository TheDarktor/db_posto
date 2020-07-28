CREATE DATABASE  IF NOT EXISTS `posto` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `posto`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: posto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

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
-- Table structure for table `bomba`
--

DROP TABLE IF EXISTS `bomba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomba` (
  `ID_bomba` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_combustivel` varchar(20) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`ID_bomba`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomba`
--

LOCK TABLES `bomba` WRITE;
/*!40000 ALTER TABLE `bomba` DISABLE KEYS */;
INSERT INTO `bomba` VALUES (5,'Gasolina',4.1),(6,'Diesel',3.19),(7,'Gasolina Aditivada.',4.19),(8,'Etanol',2.75);
/*!40000 ALTER TABLE `bomba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa` (
  `ID_caixa` int(11) NOT NULL AUTO_INCREMENT,
  `comanda` int(11) DEFAULT NULL,
  `pagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_caixa`),
  KEY `comanda` (`comanda`),
  KEY `pagamento` (`pagamento`),
  CONSTRAINT `caixa_ibfk_1` FOREIGN KEY (`comanda`) REFERENCES `comanda` (`ID_comanda`),
  CONSTRAINT `caixa_ibfk_2` FOREIGN KEY (`pagamento`) REFERENCES `pagamento` (`ID_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Murillo Mariano'),(2,'Leandro Pirillo.'),(3,'João Gordin'),(4,'Thaís Minhau'),(5,'Amanda N.');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `ID_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) DEFAULT NULL,
  `bomba` int(11) DEFAULT NULL,
  `lavagem` int(11) DEFAULT NULL,
  `trocaoleo` int(11) DEFAULT NULL,
  `frentista` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_comanda`),
  KEY `cliente` (`cliente`),
  KEY `bomba` (`bomba`),
  KEY `lavagem` (`lavagem`),
  KEY `trocaoleo` (`trocaoleo`),
  KEY `frentista` (`frentista`),
  CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`ID_cliente`),
  CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`bomba`) REFERENCES `bomba` (`ID_bomba`),
  CONSTRAINT `comanda_ibfk_3` FOREIGN KEY (`lavagem`) REFERENCES `lavagem` (`ID_lavagem`),
  CONSTRAINT `comanda_ibfk_4` FOREIGN KEY (`trocaoleo`) REFERENCES `troca_oleo` (`ID_trocaoleo`),
  CONSTRAINT `comanda_ibfk_5` FOREIGN KEY (`frentista`) REFERENCES `frentista` (`ID_frentista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frentista`
--

DROP TABLE IF EXISTS `frentista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frentista` (
  `ID_frentista` int(11) NOT NULL AUTO_INCREMENT,
  `nome_frentista` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_frentista`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frentista`
--

LOCK TABLES `frentista` WRITE;
/*!40000 ALTER TABLE `frentista` DISABLE KEYS */;
INSERT INTO `frentista` VALUES (1,'Alan Souza'),(2,'Guilherme Pessoa'),(3,'Homero Guilherme'),(4,'Antony Peixoto'),(5,'Viana Martins'),(6,'Giovanna Daniele');
/*!40000 ALTER TABLE `frentista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lavagem`
--

DROP TABLE IF EXISTS `lavagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lavagem` (
  `ID_lavagem` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_lavagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lavagem`
--

LOCK TABLES `lavagem` WRITE;
/*!40000 ALTER TABLE `lavagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lavagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `ID_notafiscal` int(11) NOT NULL AUTO_INCREMENT,
  `caixa` int(11) DEFAULT NULL,
  `comanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_notafiscal`),
  KEY `caixa` (`caixa`),
  KEY `comanda` (`comanda`),
  CONSTRAINT `nota_fiscal_ibfk_1` FOREIGN KEY (`caixa`) REFERENCES `caixa` (`ID_caixa`),
  CONSTRAINT `nota_fiscal_ibfk_2` FOREIGN KEY (`comanda`) REFERENCES `comanda` (`ID_comanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `ID_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'Cartão de crédito',5),(2,'Carnê',2),(3,'Cheque',0),(4,'Dinheiro',0);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `ID_posto` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` int(11) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_posto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troca_oleo`
--

DROP TABLE IF EXISTS `troca_oleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `troca_oleo` (
  `ID_trocaoleo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_trocaoleo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troca_oleo`
--

LOCK TABLES `troca_oleo` WRITE;
/*!40000 ALTER TABLE `troca_oleo` DISABLE KEYS */;
/*!40000 ALTER TABLE `troca_oleo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 13:20:07
