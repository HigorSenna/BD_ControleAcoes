CREATE DATABASE  IF NOT EXISTS `controle_acoes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `controle_acoes`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: controle_acoes
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `ID_INVESTIDOR` int(11) DEFAULT NULL,
  `ID_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `DT_COMPRA` date DEFAULT NULL,
  `NM_ACAO` varchar(255) DEFAULT NULL,
  `VL_FIM_ACAO` double DEFAULT NULL,
  `VL_PAGO` double DEFAULT NULL,
  `QTD_COMPRA` int(11) DEFAULT NULL,
  `TAXAS` double DEFAULT NULL,
  `TOTAL_PAGO` double DEFAULT NULL,
  PRIMARY KEY (`ID_COMPRA`),
  KEY `FK_4dy88xu3ga9uhukupm6kfvd0s` (`ID_INVESTIDOR`),
  CONSTRAINT `FK_4dy88xu3ga9uhukupm6kfvd0s` FOREIGN KEY (`ID_INVESTIDOR`) REFERENCES `investidores` (`ID_INVESTIDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (4,66,'2016-06-15','VALE5',12.18,243.60000000000002,20,20,263.6),(4,67,'2016-06-15','VALE5',12.19,243.79999999999995,20,20,263.79999999999995),(4,68,'2016-06-21','PETR4',9.53,95.3,10,20,115.3);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_bancarias`
--

DROP TABLE IF EXISTS `contas_bancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_bancarias` (
  `ID_CONTA` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_AGENCIA` varchar(10) NOT NULL,
  `NM_BANCO` varchar(45) NOT NULL,
  `NUM_CONTA` int(11) NOT NULL,
  `SALDO` double(7,2) NOT NULL,
  PRIMARY KEY (`ID_CONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_bancarias`
--

LOCK TABLES `contas_bancarias` WRITE;
/*!40000 ALTER TABLE `contas_bancarias` DISABLE KEYS */;
INSERT INTO `contas_bancarias` VALUES (1,'a','a',0,114.20),(2,'c','c',0,533.79),(3,'g','g',0,52966.66),(4,'s','s',0,9369.40);
/*!40000 ALTER TABLE `contas_bancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicos_transacoes`
--

DROP TABLE IF EXISTS `historicos_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historicos_transacoes` (
  `ID_HISTORICO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INVESTIDOR` int(11) DEFAULT NULL,
  `NM_ACAO` varchar(45) DEFAULT NULL,
  `QTD_TOTAL` int(11) DEFAULT NULL,
  `VL_COMPRA` double(7,2) DEFAULT NULL,
  `DT_ULT_ATUALIZACAO` date DEFAULT NULL,
  PRIMARY KEY (`ID_HISTORICO`),
  KEY `FK_odknpe8216pn37oxk9ru4qgn9` (`ID_INVESTIDOR`),
  CONSTRAINT `FK_odknpe8216pn37oxk9ru4qgn9` FOREIGN KEY (`ID_INVESTIDOR`) REFERENCES `investidores` (`ID_INVESTIDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicos_transacoes`
--

LOCK TABLES `historicos_transacoes` WRITE;
/*!40000 ALTER TABLE `historicos_transacoes` DISABLE KEYS */;
INSERT INTO `historicos_transacoes` VALUES (22,4,'VALE5',10,13.19,'2016-06-15'),(23,4,'PETR4',5,11.53,'2016-06-21');
/*!40000 ALTER TABLE `historicos_transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investidores`
--

DROP TABLE IF EXISTS `investidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investidores` (
  `ID_INVESTIDOR` int(11) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(40) DEFAULT NULL,
  `LOGIN` varchar(45) DEFAULT NULL,
  `NM_INVESTIDOR` varchar(40) DEFAULT NULL,
  `profissao` varchar(45) DEFAULT NULL,
  `RG` varchar(12) DEFAULT NULL,
  `SENHA` varchar(45) DEFAULT NULL,
  `ID_CONTA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_INVESTIDOR`),
  KEY `FK_1gqsavop4wnfda7j4ba0515sg` (`ID_CONTA`),
  CONSTRAINT `FK_1gqsavop4wnfda7j4ba0515sg` FOREIGN KEY (`ID_CONTA`) REFERENCES `contas_bancarias` (`ID_CONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investidores`
--

LOCK TABLES `investidores` WRITE;
/*!40000 ALTER TABLE `investidores` DISABLE KEYS */;
INSERT INTO `investidores` VALUES (2,'0','a','a','a','a','a',1),(3,'0','c','Teste','c','c','c',2),(4,'0','g','gg','gg','gg','g',3),(5,'0','s','a','s','s','s',4);
/*!40000 ALTER TABLE `investidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `ID_VENDA` int(11) NOT NULL AUTO_INCREMENT,
  `DT_VENDA` date DEFAULT NULL,
  `ID_INVESTIDOR` int(11) DEFAULT NULL,
  `NM_ACAO` varchar(45) DEFAULT NULL,
  `QTD_VENDA` int(11) DEFAULT NULL,
  `VL_TOTAL_VENDA` double(7,2) DEFAULT NULL,
  `LUCRO_PREJUIZO` double(7,2) DEFAULT NULL,
  PRIMARY KEY (`ID_VENDA`),
  KEY `FK_swtvy68fnw87qdoqyhfbldmvh` (`ID_INVESTIDOR`),
  CONSTRAINT `FK_swtvy68fnw87qdoqyhfbldmvh` FOREIGN KEY (`ID_INVESTIDOR`) REFERENCES `investidores` (`ID_INVESTIDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (3,'2016-06-16',4,'VALE5',10,121.90,-10.00),(4,'2016-06-21',4,'PETR4',5,47.65,-10.00);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-21 23:35:31
