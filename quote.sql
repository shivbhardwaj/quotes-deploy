-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: quote
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `quotes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_users1_idx` (`users_id`),
  KEY `fk_favorites_quotes1_idx` (`quotes_id`),
  CONSTRAINT `fk_favorites_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_quotes1` FOREIGN KEY (`quotes_id`) REFERENCES `quotes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,'0000-00-00 00:00:00','0000-00-00 00:00:00',1,3),(2,'2016-06-26 22:23:39','2016-06-26 22:23:39',1,3),(3,'2016-06-26 22:23:50','2016-06-26 22:23:50',1,3),(4,'2016-06-26 22:23:54','2016-06-26 22:23:54',1,3),(5,'2016-06-26 22:24:26','2016-06-26 22:24:26',1,3),(6,'2016-06-26 22:42:27','2016-06-26 22:42:27',1,3),(7,'2016-06-26 22:42:31','2016-06-26 22:42:31',1,3),(8,'2016-06-27 09:29:21','2016-06-27 09:29:21',1,3),(9,'2016-06-27 09:37:21','2016-06-27 09:37:21',1,3),(10,'2016-06-27 09:38:18','2016-06-27 09:38:18',1,3),(14,'2016-06-27 10:05:26','2016-06-27 10:05:26',1,1),(17,'2016-06-27 10:09:15','2016-06-27 10:09:15',1,3),(18,'2016-06-27 10:10:37','2016-06-27 10:10:37',1,1),(19,'2016-06-27 10:24:08','2016-06-27 10:24:08',1,3),(20,'2016-06-27 10:24:47','2016-06-27 10:24:47',1,3),(21,'2016-06-27 10:46:00','2016-06-27 10:46:00',1,3),(22,'2016-06-27 10:55:22','2016-06-27 10:55:22',1,1),(23,'2016-06-27 10:55:42','2016-06-27 10:55:42',1,1),(24,'2016-06-27 10:55:47','2016-06-27 10:55:47',1,1),(25,'2016-06-27 10:56:51','2016-06-27 10:56:51',1,1),(26,'2016-06-27 10:58:56','2016-06-27 10:58:56',1,1),(27,'2016-06-27 10:59:45','2016-06-27 10:59:45',1,1),(28,'2016-06-27 11:07:20','2016-06-27 11:07:20',1,1),(29,'2016-06-27 11:09:18','2016-06-27 11:09:18',1,1),(30,'2016-06-27 11:09:35','2016-06-27 11:09:35',1,1),(31,'2016-06-27 11:10:17','2016-06-27 11:10:17',1,1),(32,'2016-06-27 11:10:49','2016-06-27 11:10:49',1,1),(33,'2016-06-27 11:14:58','2016-06-27 11:14:58',1,1),(34,'2016-06-27 11:15:35','2016-06-27 11:15:35',1,1),(35,'2016-06-27 11:16:40','2016-06-27 11:16:40',1,1),(36,'2016-06-27 11:16:53','2016-06-27 11:16:53',1,1),(37,'2016-06-27 11:18:28','2016-06-27 11:18:28',1,1),(38,'2016-06-27 11:20:52','2016-06-27 11:20:52',1,1),(39,'2016-06-27 11:21:08','2016-06-27 11:21:08',1,3),(40,'2016-06-27 11:22:54','2016-06-27 11:22:54',1,3),(41,'2016-06-27 11:23:48','2016-06-27 11:23:48',1,3),(42,'2016-06-27 11:24:55','2016-06-27 11:24:55',1,3),(43,'2016-06-27 11:25:45','2016-06-27 11:25:45',1,3),(44,'2016-06-27 11:41:15','2016-06-27 11:41:15',1,1),(45,'2016-06-27 12:13:43','2016-06-27 12:13:43',1,3),(46,'2016-06-27 12:13:45','2016-06-27 12:13:45',1,3),(47,'2016-06-27 12:13:46','2016-06-27 12:13:46',1,3);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_by` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotes_users_idx` (`users_id`),
  CONSTRAINT `fk_quotes_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Neesha Bhardwaj','Celery is nature\'s floss','0000-00-00 00:00:00','0000-00-00 00:00:00',2),(2,'Pocahontas','You can paint with all the colors of the wind','0000-00-00 00:00:00','0000-00-00 00:00:00',2),(3,'Sebastian','Darlin\' it\'s better, down where it\'s wetter...under the sea!','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(6,'Dr. Seuss','Don\'t cry because it\'s over, smile because it happened.','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(7,'Oscar Wilde','Be yourself; everyone else is already taken.','0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Shivani Bhardwaj','shivani@shivani.com','Shiv','$2b$12$tJmwJ4fAy0JMe1kktm7OgeHa7oFbEfV3j/XDHkgz7K8jAxoFTKgIa','1992-06-08','2016-06-26 19:23:14','2016-06-26 19:23:14'),(2,'Neesha Bhardwaj','neesha@neesha.com','Neesh','$2b$12$TtaAJ0ygcb15K5A0CeikouRkLWOO7OVpEKsZMqemwemrll0Ru40Ka','1995-06-17','2016-06-26 19:27:13','2016-06-26 19:27:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-27 12:31:40
