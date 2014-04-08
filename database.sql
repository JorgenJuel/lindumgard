CREATE DATABASE  IF NOT EXISTS `lindum` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lindum`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: lindum
-- ------------------------------------------------------
-- Server version	5.5.34

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
  `template` varchar(255) DEFAULT NULL,
  `sidebar` tinyint(1) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `parent_url` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_innhold_forfatter` (`author`),
  CONSTRAINT `fk_innhold_forfatter` FOREIGN KEY (`author`) REFERENCES `forfatter` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innhold`
--

LOCK TABLES `innhold` WRITE;
/*!40000 ALTER TABLE `innhold` DISABLE KEYS */;
INSERT INTO `innhold` VALUES (2,'besetning-avling','Besetning og Avling','<div class=\"table-responsive\">\r\n<table class=\"full color\">\r\n        <thead>\r\n          <tr>\r\n             <th></th>\r\n             <th>Hester</th>\r\n             <th>Kuer</th>\r\n             <th>Ungfe</th>\r\n             <th>Sauer</th>\r\n             <th>Høilass</th>\r\n             <th>Hvete</th>\r\n             <th>Rug</th>\r\n             <th>Bygg</th>\r\n             <th>Havre</th>\r\n             <th>Erter</th>\r\n             <th>Poteter</th>\r\n             <th>Bl.Korn</th>\r\n           </tr> \r\n         </thead>\r\n         <tbody>\r\n           <tr>\r\n             <td>1657</td>\r\n             <td>3</td>\r\n             <td>7</td>\r\n             <td>5</td>\r\n             <td>3</td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n           </tr>\r\n           <tr>\r\n             <td>1668</td>\r\n             <td>3</td>\r\n             <td>14</td>\r\n             <td>6</td>\r\n             <td>16</td>\r\n             <td>80</td>\r\n             <td colspan=\"7\">16 Tønneså akerjord, 9 tønneså brakk</td> \r\n           </tr>\r\n           <tr>\r\n             <td>1723</td>\r\n             <td>5</td>\r\n             <td>20</td>\r\n             <td></td>\r\n             <td>14</td>\r\n             <td>60</td>\r\n             <td>1/4</td>\r\n             <td></td>\r\n             <td></td>\r\n             <td>15</td>\r\n             <td></td>\r\n             <td></td>\r\n             <td>1</td>\r\n           </tr>\r\n           <tr>\r\n             <td>1803</td>\r\n             <td>4</td>\r\n             <td>16</td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n             <td>16</td>\r\n             <td></td>\r\n             <td></td>\r\n             <td></td>\r\n           </tr>\r\n           <tr>\r\n             <td>1865</td>\r\n             <td>5</td>\r\n             <td>29</td>\r\n             <td></td>\r\n             <td>8</td>\r\n             <td></td>\r\n             <td>3 9/16</td>\r\n             <td>3</td>\r\n             <td>4 3/4</td>\r\n             <td>12 1/4</td>\r\n             <td>3/16</td>\r\n             <td>34 3/4</td>\r\n             <td></td></tr></tbody></table></div><h2>Andre oplysninger:</h2><p>I 1668 var det skog tilsvarene noen smålast og ikke noe ydningsland. Det var pålagt å plante humlehage.</p><p>I 1723 var det to husmenn. De sår tilsammen to tønner havre for to storfe (naut). Skog til husfornødenhet, fehavn hjemme. Middelmådig jordart, tungvunnen til eng.</p>      <p>I 1803 har skog til husbehov og havn god jordart.</p>','Besetning og avling ved Lindum gård i perioden 1657 til 1865','2014-04-04 19:11:25','2014-04-04 19:11:25',NULL,0,NULL,NULL,1),(3,'bruk','Bruk skilt ut av Lindum',NULL,'Ulike utskilte bruk fra Lindum Gard, bruksnummer 1','2014-04-04 22:38:17','2014-04-04 22:38:17','page-bruk.php',NULL,NULL,NULL,1),(4,'lindum-gard','Bruk 1 - Lindum Gård','\n      <img src=\"/images/gard-forminsket.jpg\" alt=\"Lindum Gård\" class=\"full\">\n      <p>Første eier av Bruk 1, gård 38 er John Larssøn. Han kjøpte gården fra sin svigerfar Nils Perssøn i 1708 og eide gården fram til 1721. Han betalte 350 riksdaler for gården (tilsvarer 3 000 000kr i dag*).</p>\n      <p>Etter Johns død i 1821 eide han også 7,5 lispund i Mehren i Lier taksert for 80 riksdaler. I år 1749 besluttet hans enke (Maren Nilsdatter) å dele godset sitt mellom sine 6 arvinger, samme år som hun døde. Lars Johnsønn kjøpte da opp sine søskens arveparter og eide hele Lindum igjen.</p>\n      <p>Lars Johnssønn var gift med Maren Larsdatter og fikk 3 barn. Den første var Lars, 1725-1795, som var vannfør, så kom Nils, 1761-1800, og Johanne Marie. Nils Larssønn endte opp med å arve gården og betale ut sine søsken. Han tok over i 1878 og eide den helt frem til 1800.</p>\n      <h2>Handel</h2>\n      <p>Videre fra 1800-tallet gikk gården i en tid med mye handel. I løpet av 14 år hadde den blitt solgt hele 5 ganger. <br>Under er en liste over eiere i den perioden.</p>\n      <ul>\n        <li>1800-1804, Nils Bentsen Winge fra solum kjøpte den for 2590 riksdaler</li>\n        <li>1804-1807, Anders Haakonsen kjøpte den for 2900 riksdaler</li>\n        <li>1807-1810, Nils Jakobsen Konnerud kjøpte den for 4600 Specidaler</li>\n        <li>1810-1813, Anders Reiersen Juel fra Eik kjøpte den for 4000 Specodaler</li>\n        <li>1813-1848, Christoffer Hansen Juel fra Eik kjøpte den for 18000 riksdaler</li>\n      </ul>\n      <p>Som vi ser kom det først i 1813 ut av denne handels-løkka. Etter dette er det familien Juel som har eid gården.</p>\n      <h2>Mot nyere tid</h2>\n      <p>Etter Christoffer fikk Anders Christoffersen Juel og broren Paul skjøte av faren sin for 2500 specidaler og oppholdsrett i 1848. Etter et par år flyttet Paul til Nordre Stokke i Sande.</p>\n      <p>Erik Christoffer Juel tok over bruket i 1894 etter hans far som døde 5 år senere. Erik ble gift med Dorothea Elise Johnsen i 1886. Han var medlem av herredstyret og hadde andre offentlige verv og ble kjent for sin hendighet i flere håndverk, samt hans fremragende skytterevner.</p>\n      <p>Anders Juel overtokk gården i 1918 av sin far. Gården hadde da 10.36marks skyld, 248 mål innmark og 50 mål havnegang. Han flyttet gårdsbygningene ned fra bakkekammen, ned mot dets nåværende plass ovenpå den lille bergavsatsen (Lindumveien 48).</p>\n      <p>De nye bygningene var i stor grad moderne, og det ble bygget praktiske uthus.</p>','Bruksnummer 1, Lindum Gård','2014-04-05 14:37:26','2014-04-05 14:37:26',NULL,NULL,'Bruk skilt ut av Lindum','bruk',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meny`
--

LOCK TABLES `meny` WRITE;
/*!40000 ALTER TABLE `meny` DISABLE KEYS */;
INSERT INTO `meny` VALUES (2,2,'Besetning og avling'),(3,3,'Bruk');
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

-- Dump completed on 2014-04-08 20:08:37
