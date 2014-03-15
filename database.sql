CREATE DATABASE  IF NOT EXISTS `lindum` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lindum`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: lindum
-- ------------------------------------------------------
-- Server version	5.5.33

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
-- Table structure for table `forfatter`
--

DROP TABLE IF EXISTS `forfatter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forfatter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornavn` varchar(255) DEFAULT NULL,
  `etternavn` varchar(255) DEFAULT NULL,
  `epost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forfatter`
--

LOCK TABLES `forfatter` WRITE;
/*!40000 ALTER TABLE `forfatter` DISABLE KEYS */;
INSERT INTO `forfatter` VALUES (1,'Jørgen','Juel','jorgen@lindumgard.no');
/*!40000 ALTER TABLE `forfatter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innhold`
--

DROP TABLE IF EXISTS `innhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innhold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` text,
  `content` text,
  `excerpt` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `sidebar` tinyint(1) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_innhold_forfatter` (`author`),
  CONSTRAINT `fk_innhold_forfatter` FOREIGN KEY (`author`) REFERENCES `forfatter` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innhold`
--

LOCK TABLES `innhold` WRITE;
/*!40000 ALTER TABLE `innhold` DISABLE KEYS */;
INSERT INTO `innhold` VALUES (1,'testside','Dette er tittelen','<h2>Overskrift 2</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend, neque at vulputate porttitor, dui nisi adipiscing justo, iaculis euismod lacus mauris sit amet ligula. In ut congue justo. Proin varius enim magna, eu lacinia leo iaculis eget. Suspendisse tempor quam orci, sed pretium risus fringilla a. Quisque consectetur pulvinar enim, sed iaculis tortor elementum ut. Nullam ac fermentum sapien. Vestibulum auctor risus in leo mollis consequat. Donec condimentum eros quis mi auctor, a lacinia ante egestas.</p><h3>Så følger dette</h3><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque tristique sem leo, non consequat augue fermentum luctus. Pellentesque imperdiet magna augue, id convallis quam iaculis sed. Nulla gravida non arcu a euismod. Nam ac nulla orci. Morbi at volutpat nibh, vitae pretium magna. Duis ullamcorper ipsum ac lacus vestibulum mattis. Nunc ante felis, iaculis vel condimentum ut, ultrices non neque.</p><h4>Nå kommer 4-ern</h4><p>Sed interdum lobortis dui. Vivamus ut nisl eget nisl egestas placerat. Cras aliquam, ipsum at euismod interdum, tellus sapien dictum erat, in ultrices massa orci ultrices sapien. Mauris felis nisl, fermentum a faucibus at, gravida non risus. Morbi nec velit eu turpis consequat elementum. Praesent bibendum urna ac quam lobortis vestibulum. Nam aliquet, sapien a dapibus molestie, velit neque iaculis orci, non condimentum justo mi nec velit.</p><h5>eque porro quisquam est qui dolorem ipsum quia</h5><p>Aenean at malesuada augue. Pellentesque et rutrum mauris, euismod bibendum velit. Vestibulum ornare, purus in lobortis sagittis, orci velit lobortis orci, malesuada dignissim dolor felis vel enim. Donec ac hendrerit eros. Nulla nec elit dapibus, lacinia leo in, commodo nibh. Duis tellus dui, eleifend eu dignissim non, adipiscing vel velit. Sed porta cursus tellus eu placerat. Fusce lacinia vitae risus a pharetra. Nunc at felis purus. Morbi accumsan, nibh eget commodo pulvinar, felis enim fermentum sapien, sed aliquet eros arcu id risus. Morbi mollis ultrices felis at posuere. Morbi vel ante nec lorem malesuada molestie vel quis dui. Nunc nec purus ornare, mattis ligula sit amet, vehicula eros. Aenean vitae fermentum nulla. Proin libero neque, pretium a enim a, hendrerit mattis metus.</p>','Kort innholdsfortegnelse (excerpt)','2014-03-14 00:00:00','2014-03-14 00:00:00',0,1);
/*!40000 ALTER TABLE `innhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meny`
--

DROP TABLE IF EXISTS `meny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meny` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menyinnhold` (`item`),
  CONSTRAINT `fk_menyinnhold` FOREIGN KEY (`item`) REFERENCES `innhold` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meny`
--

LOCK TABLES `meny` WRITE;
/*!40000 ALTER TABLE `meny` DISABLE KEYS */;
INSERT INTO `meny` VALUES (1,1,'Testside');
/*!40000 ALTER TABLE `meny` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-15 12:21:03
