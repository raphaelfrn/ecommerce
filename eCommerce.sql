-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrateurs` (
  `id_administrateurs` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `privileges` varchar(100) NOT NULL,
  PRIMARY KEY (`id_administrateurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateurs`
--

LOCK TABLES `administrateurs` WRITE;
/*!40000 ALTER TABLE `administrateurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresses_livraison`
--

DROP TABLE IF EXISTS `adresses_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresses_livraison` (
  `id_adresse_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) DEFAULT NULL,
  `adresse` varchar(255) NOT NULL,
  `code_postal` int(5) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id_adresse_livraison`),
  KEY `FK_id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `FK_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses_livraison`
--

LOCK TABLES `adresses_livraison` WRITE;
/*!40000 ALTER TABLE `adresses_livraison` DISABLE KEYS */;
INSERT INTO `adresses_livraison` VALUES (1,2,'adresse',95410,'Ville','France');
/*!40000 ALTER TABLE `adresses_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `video` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Enceintes','assets\\video\\phantom-blue.mp4','UNE CLASSE À PART.','assets/img/categories/enceinte_categorie.webp'),(2,'Barres de son','assets\\video\\immersion-bar.mp4','INTENSÉMENT IMMERSIVE.','assets/img/categories/barre_categorie.webp'),(3,'Ecouteurs','assets\\video\\Video_Tech_Gemini_2_1.mp4','LE SON PUR.\r\nRÉSOLUMENT NOMADE.','assets/img/categories/ecouteur_categorie.webp'),(4,'Amplificateurs','assets\\video\\AmpliCat.webp','LE SYSTÈME AUDIOPHILE ABSOLUE.\r\n','assets/img/categories/amphi_categorie.webp');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) DEFAULT NULL,
  `dateC` date NOT NULL,
  `total` float NOT NULL,
  `id_adresse_livraison` int(11) DEFAULT NULL,
  `etat` int(1) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `FK_id_utilisateur_commande` (`id_utilisateur`),
  KEY `FK_id_adresses_livraison` (`id_adresse_livraison`),
  CONSTRAINT `FK_id_adresses_livraison` FOREIGN KEY (`id_adresse_livraison`) REFERENCES `adresses_livraison` (`id_adresse_livraison`),
  CONSTRAINT `FK_id_utilisateur_commande` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES (1,2,'2022-08-07',2300,1,1),(2,2,'2022-08-07',5980,1,1),(3,2,'2022-08-07',1990,1,1),(4,2,'2022-08-07',1990,1,1),(5,2,'2022-08-07',1990,1,1),(6,2,'2022-08-07',1990,1,1);
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentaires` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `commentaire` varchar(255) NOT NULL,
  `note` int(5) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `FK_id_utilisateur_commentaire` (`id_utilisateur`),
  KEY `FK_id_produit_commentaire` (`id_produit`),
  CONSTRAINT `FK_id_produit_commentaire` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  CONSTRAINT `FK_id_utilisateur_commentaire` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) DEFAULT NULL,
  `Sujet` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `etat` int(1) NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `FK_id_utilisateur_contact` (`id_utilisateur`),
  CONSTRAINT `FK_id_utilisateur_contact` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordonnees`
--

DROP TABLE IF EXISTS `coordonnees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordonnees` (
  `id_coordonnees` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_coordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnees`
--

LOCK TABLES `coordonnees` WRITE;
/*!40000 ALTER TABLE `coordonnees` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordonnees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details_commande`
--

DROP TABLE IF EXISTS `details_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details_commande` (
  `id_details_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_details_commande`),
  KEY `FK_id_commande` (`id_commande`),
  KEY `FK_id_produit` (`id_produit`),
  CONSTRAINT `FK_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`),
  CONSTRAINT `FK_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_commande`
--

LOCK TABLES `details_commande` WRITE;
/*!40000 ALTER TABLE `details_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `details_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrees_en_stock`
--

DROP TABLE IF EXISTS `entrees_en_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrees_en_stock` (
  `id_entrees_en_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_fournisseur` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `dateE` date NOT NULL,
  PRIMARY KEY (`id_entrees_en_stock`),
  KEY `FK_id_fournisseur` (`id_fournisseur`),
  KEY `FK_id_produit_stock` (`id_produit`),
  CONSTRAINT `FK_id_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseurs` (`id_fournisseur`),
  CONSTRAINT `FK_id_produit_stock` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrees_en_stock`
--

LOCK TABLES `entrees_en_stock` WRITE;
/*!40000 ALTER TABLE `entrees_en_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrees_en_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoris`
--

DROP TABLE IF EXISTS `favoris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoris` (
  `id_favoris` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_favoris`),
  KEY `FK_id_utilisateur_favoris` (`id_utilisateur`),
  KEY `FK_id_produit_favoris` (`id_produit`),
  CONSTRAINT `FK_id_produit_favoris` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  CONSTRAINT `FK_id_utilisateur_favoris` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoris`
--

LOCK TABLES `favoris` WRITE;
/*!40000 ALTER TABLE `favoris` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseurs` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id_image`),
  KEY `FK_id_produit_image` (`id_produit`),
  CONSTRAINT `FK_id_produit_image` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,3,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black1.webp'),(2,3,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black2.webp'),(3,3,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black3.webp'),(4,3,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black4.webp'),(5,3,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black5.webp'),(6,4,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange1.webp'),(7,4,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange2.webp'),(8,4,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange3.webp'),(9,4,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange4.webp'),(10,4,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange6.webp'),(11,5,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White1.webp'),(12,5,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White2.webp'),(13,5,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White3.webp'),(14,5,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White4.webp'),(15,5,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White5.webp'),(16,6,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black1.webp'),(17,6,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black2.webp'),(18,6,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black3.webp'),(19,6,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black4.webp'),(20,6,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Black5.webp'),(21,7,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange1.webp'),(22,7,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange2.webp'),(23,7,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange3.webp'),(24,7,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange4.webp'),(25,7,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-Orange6.webp'),(26,8,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White1.webp'),(27,8,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White2.webp'),(28,8,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White3.webp'),(29,8,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White4.webp'),(30,8,'assets\\img\\enceintes\\Phantom-1\\Phantom-1-White5.webp'),(31,9,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black1.webp'),(32,9,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black2.webp'),(33,9,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black3.webp'),(34,9,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black4.webp'),(35,9,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black5.webp'),(36,10,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White1.webp'),(37,10,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White2.webp'),(38,10,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White3.webp'),(39,10,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White4.webp'),(40,10,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White5.webp'),(41,11,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue1.webp'),(42,11,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue2.webp'),(43,11,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue3.webp'),(44,11,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue4.webp'),(45,11,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue5.webp'),(46,12,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black1.webp'),(47,12,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black2.webp'),(48,12,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black3.webp'),(49,12,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black4.webp'),(50,12,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Black1.webp'),(51,13,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White1.webp'),(52,13,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White2.webp'),(53,13,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White3.webp'),(54,13,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White4.webp'),(55,13,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-White5.webp'),(56,14,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue1.webp'),(57,14,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue2.webp'),(58,14,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue3.webp'),(59,14,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue4.webp'),(60,14,'assets\\img\\enceintes\\Phantom-2\\Phantom-2-Blue5.webp'),(61,15,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(62,15,'assets\\img\\barre_de_son\\barreHome.png'),(63,15,'assets\\img\\barre_de_son\\barreSon.webp'),(64,15,'assets\\img\\barre_de_son\\barreSon2.webp'),(65,15,'assets\\img\\barre_de_son\\barreSon3.webp'),(66,16,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(67,16,'assets\\img\\barre_de_son\\barreHome.png'),(68,16,'assets\\img\\barre_de_son\\barreSon.webp'),(69,16,'assets\\img\\barre_de_son\\barreSon2.webp'),(70,16,'assets\\img\\barre_de_son\\barreSon3.webp'),(71,17,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(72,17,'assets\\img\\barre_de_son\\barreHome.png'),(73,17,'assets\\img\\barre_de_son\\barreSon.webp'),(74,17,'assets\\img\\barre_de_son\\barreSon2.webp'),(75,17,'assets\\img\\barre_de_son\\barreSon3.webp'),(76,18,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(77,18,'assets\\img\\barre_de_son\\barreHome.png'),(78,18,'assets\\img\\barre_de_son\\barreSon.webp'),(79,18,'assets\\img\\barre_de_son\\barreSon2.webp'),(80,18,'assets\\img\\barre_de_son\\barreSon3.webp'),(81,19,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(82,19,'assets\\img\\barre_de_son\\barreHome.png'),(83,19,'assets\\img\\barre_de_son\\barreSon.webp'),(84,19,'assets\\img\\barre_de_son\\barreSon2.webp'),(85,19,'assets\\img\\barre_de_son\\barreSon3.webp'),(86,20,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp'),(87,20,'assets\\img\\barre_de_son\\barreHome.png'),(88,20,'assets\\img\\barre_de_son\\barreSon.webp'),(89,20,'assets\\img\\barre_de_son\\barreSon2.webp'),(90,20,'assets\\img\\barre_de_son\\barreSon3.webp'),(91,21,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(92,21,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(93,21,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(94,21,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(95,22,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(96,22,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(97,22,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(98,22,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(99,23,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(100,23,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(101,23,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(102,23,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(103,24,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(104,24,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(105,24,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(106,24,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(107,25,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(108,25,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(109,25,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(110,25,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(111,26,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(112,26,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(113,26,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(114,26,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(115,27,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(116,27,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(117,27,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(118,27,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(119,28,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(120,28,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(121,28,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(122,28,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(123,29,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(124,29,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(125,29,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(126,29,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(127,30,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(128,30,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(129,30,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(130,30,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(131,31,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(132,31,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(133,31,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(134,31,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(135,32,'assets\\img\\ecouteurs\\Cepheus1-300x300.webp'),(136,32,'assets\\img\\ecouteurs\\ecouteurs2.webp'),(137,32,'assets\\img\\ecouteurs\\ecouteursWaterProof.webp'),(138,32,'assets\\img\\ecouteurs\\ecouteursZoom.webp'),(139,33,'assets\\img\\amplificateurs\\ampli\\ampli1.webp'),(140,33,'assets\\img\\amplificateurs\\ampli\\ampli2.webp'),(141,33,'assets\\img\\amplificateurs\\ampli\\ampli4.webp'),(142,33,'assets\\img\\amplificateurs\\ampli\\ampli6.webp'),(143,33,'assets\\img\\amplificateurs\\ampli\\ampli7.webp'),(144,34,'assets\\img\\amplificateurs\\ampli\\ampli1.webp'),(145,34,'assets\\img\\amplificateurs\\ampli\\ampli2.webp'),(146,34,'assets\\img\\amplificateurs\\ampli\\ampli4.webp'),(147,34,'assets\\img\\amplificateurs\\ampli\\ampli6.webp'),(148,34,'assets\\img\\amplificateurs\\ampli\\ampli7.webp'),(149,35,'assets\\img\\amplificateurs\\ampli\\ampli1.webp'),(150,35,'assets\\img\\amplificateurs\\ampli\\ampli2.webp'),(151,35,'assets\\img\\amplificateurs\\ampli\\ampli4.webp'),(152,35,'assets\\img\\amplificateurs\\ampli\\ampli6.webp'),(153,35,'assets\\img\\amplificateurs\\ampli\\ampli7.webp'),(154,36,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble1.webp'),(155,36,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble2.webp'),(156,36,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble3.webp'),(157,36,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble4.webp'),(158,36,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble5.webp'),(159,37,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble1.webp'),(160,37,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble2.webp'),(161,37,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble3.webp'),(162,37,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble4.webp'),(163,37,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble5.webp'),(164,38,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble1.webp'),(165,38,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble2.webp'),(166,38,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble3.webp'),(167,38,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble4.webp'),(168,38,'assets\\img\\amplificateurs\\ampliDouble\\ampliDouble5.webp');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `prix` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_sous_categorie` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `stock_minimum` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `FK_id_sous_categorie` (`id_sous_categorie`),
  CONSTRAINT `FK_id_sous_categorie` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categories` (`id_sous_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (3,'Phantom I Black','Ressentez l’impact physique du son comme jamais auparavant.',1990,'assets/img/enceintes/Phantom-1/Phantom-1-Black300x300.webp',1,150,15),(4,'Phantom I Orange','Une puissance indécente, des basses ultra-profondes.\r\n',2990,'assets/img/enceintes/Phantom-1/Phantom-1-Orange300x300.webp',1,150,15),(5,'Phantom I White','Une jolie enceinte.',1490,'assets/img/enceintes/Phantom-1/Phantom-1-White300x300.webp',1,150,15),(6,'Phantom I Black B','Une puissance indécente, des basses ultra-profondes.\r\n',2490,'assets/img/enceintes/Phantom-1/Phantom-1-Black300x300.webp',1,150,15),(7,'Phantom I Orange B','Pas mal',1490,'assets/img/enceintes/Phantom-1/Phantom-1-Orange300x300.webp',1,150,15),(8,'Phantom I White B','Un design et des performances de zinzin',2990,'assets/img/enceintes/Phantom-1/Phantom-1-White300x300.webp',1,150,15),(9,'Phantom II Black','La première enceinte domestique conçue pour vous immerger au plus profond du son.\r\n',1090,'assets/img/enceintes/Phantom-2/Phantom-2-Black300x300.webp',2,150,15),(10,'Phantom II White','La première enceinte domestique conçue pour vous immerger au plus profond du son.\r\n',1090,'assets/img/enceintes/Phantom-2/Phantom-2-White300x300.webp',2,150,15),(11,'Phantom II Blue','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1090,'assets/img/enceintes/Phantom-2/Phantom-2-Blue300x300.webp',2,150,15),(12,'Phantom II Black B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-2/Phantom-2-Black300x300.webp',2,150,15),(13,'Phantom II White B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-2/Phantom-2-White300x300.webp',2,150,15),(14,'Phantom II Blue B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-2/Phantom-2-Blue300x300.webp',2,150,15),(15,'Andromeda I Black','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n',3,150,15),(16,'Andromeda I Grey','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n\r\n',3,150,15),(17,'Andromeda I White','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n',3,150,15),(18,'Andromeda II Black','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n',4,150,150),(19,'Andromeda II Grey','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n',4,150,150),(20,'Andromeda II White','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets\\img\\barre_de_son\\Andromeda-1-300x300.webp\r\n\r\n',4,150,15),(21,'Cepheus I Black','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(22,'Cepheus I Blue','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(23,'Cepheus I White','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(24,'Cepheus I Black B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(25,'Cepheus I Blue B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(26,'Cepheus I White B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/ecouteurs/Cepheus1-300x300.webp',5,150,15),(27,'Cepheus II Black','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(28,'Cepheus II White','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(29,'Cepheus II Orange','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(30,'Cepheus II Black B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(31,'Cepheus II White B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(32,'Cepheus II Orange B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/ecouteurs/Cepheus2-300x300.webp',6,150,15),(33,'Persephone I Black','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets\\img\\amplificateurs\\ampli\\Persephone-1-300x300.webp',7,150,15),(34,'Persephone I Grey','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets\\img\\amplificateurs\\ampli\\Persephone-1-300x300.webp',7,150,15),(35,'Persephone I Blue','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets\\img\\amplificateurs\\ampli\\Persephone-1-300x300.webp',7,150,15),(36,'Persephone II Black','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets\\img\\amplificateurs\\ampliDouble\\Persephone-2-300x300.webp',8,150,15),(37,'Persephone II Grey','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets\\img\\amplificateurs\\ampliDouble\\Persephone-2-300x300.webp',8,150,15),(38,'Persephone II Blue','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets\\img\\amplificateurs\\ampliDouble\\Persephone-2-300x300.webp',8,150,15);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recherches`
--

DROP TABLE IF EXISTS `recherches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recherches` (
  `id_recherche` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) DEFAULT NULL,
  `mot_cle` varchar(255) NOT NULL,
  `dateR` date NOT NULL,
  PRIMARY KEY (`id_recherche`),
  KEY `FK_id_utilisateur_recherche` (`id_utilisateur`),
  CONSTRAINT `FK_id_utilisateur_recherche` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recherches`
--

LOCK TABLES `recherches` WRITE;
/*!40000 ALTER TABLE `recherches` DISABLE KEYS */;
INSERT INTO `recherches` VALUES (1,2,'oui','2022-08-03'),(2,2,'oui','2022-08-03'),(3,2,'phan','2022-08-03'),(4,2,'phan','2022-08-03'),(5,2,'phantom','2022-08-03'),(6,2,'phantom','2022-08-03'),(7,2,'phan','2022-08-03'),(8,2,'phan','2022-08-03'),(9,2,'phan','2022-08-03'),(10,2,'phan','2022-08-03'),(11,2,'phan','2022-08-03'),(12,2,'phan','2022-08-03'),(13,2,'phan','2022-08-03'),(14,2,'phan','2022-08-03'),(15,2,'ze','2022-08-03'),(16,2,'ze','2022-08-03'),(17,2,'Phantom I Black','2022-08-03'),(18,2,'Phantom I Black','2022-08-03'),(19,2,'test','2022-08-03'),(20,2,'test','2022-08-03'),(21,2,'Phan','2022-08-03'),(22,2,'Phan','2022-08-03'),(23,2,'Phan','2022-08-03'),(24,2,'Phan','2022-08-03'),(25,2,'phantom','2022-08-03'),(26,2,'phantom','2022-08-03'),(27,2,'test','2022-08-03'),(28,2,'test','2022-08-03'),(29,2,'oui','2022-08-03'),(30,2,'oui','2022-08-03'),(31,2,'requete','2022-08-03'),(32,2,'requete','2022-08-03'),(33,2,'Phantom','2022-08-03'),(34,2,'recherche34','2022-08-03'),(35,2,'recherche34','2022-08-03'),(36,2,'teston','2022-08-03'),(37,2,'rech','2022-08-03'),(38,2,'rech','2022-08-03'),(39,2,'m','2022-08-03'),(40,2,'enceint','2022-08-03'),(41,2,'ampli','2022-08-03'),(42,2,'Phantom','2022-08-03'),(43,2,'M','2022-08-03'),(44,2,'ph','2022-08-03'),(45,2,'ampli','2022-08-03'),(46,2,'androm','2022-08-03'),(47,2,'cephe','2022-08-03'),(48,2,'amplif','2022-08-03'),(49,2,'enceintes','2022-08-03'),(50,2,'phantom','2022-08-03'),(51,2,'phan','2022-08-03'),(52,2,'phantom','2022-08-03'),(53,2,'ampli','2022-08-03'),(54,2,'ampli','2022-08-03'),(55,2,'ampli','2022-08-03'),(56,2,'ecou','2022-08-03'),(57,2,'barre','2022-08-03'),(58,2,'encei','2022-08-03'),(59,2,'Phantom I','2022-08-03'),(60,2,'Phantom I','2022-08-03'),(61,2,'ressentez','2022-08-03'),(62,2,'encei','2022-08-03'),(63,2,'ampli','2022-08-03'),(64,2,'ecou','2022-08-03'),(65,2,'barre','2022-08-03'),(66,2,'Phan','2022-08-03'),(67,2,'Ress','2022-08-03'),(68,2,'Andromeda I','2022-08-03'),(69,2,'pikachu','2022-08-03'),(70,2,'Phan','2022-08-03'),(71,1,'pikachu','2022-08-03'),(72,1,'enc','2022-08-04'),(73,1,'bonjour','2022-08-05'),(74,1,'Phan','2022-08-05'),(75,2,'phan','2022-08-05'),(76,2,'pha','2022-08-05'),(77,2,'pha','2022-08-05'),(78,2,'pha','2022-08-05'),(79,2,'search=pha','2022-08-05'),(80,2,'phan','2022-08-05'),(81,2,'search=phan','2022-08-05'),(82,2,'search=phan','2022-08-05'),(83,2,'search=phan','2022-08-05'),(84,2,'ecou','2022-08-05'),(85,2,'search=ecou','2022-08-05'),(86,2,'ecou','2022-08-05'),(87,2,'ecou','2022-08-05'),(88,2,'ecou','2022-08-05'),(89,2,'phan','2022-08-05'),(90,2,'phan','2022-08-05'),(91,2,'phan','2022-08-05'),(92,2,'pers','2022-08-05'),(93,2,'pers','2022-08-05'),(94,2,'pers','2022-08-05'),(95,2,'pers','2022-08-05'),(96,2,'pers','2022-08-05'),(97,2,'pers','2022-08-05'),(98,2,'pers','2022-08-05'),(99,2,'pers','2022-08-05'),(100,2,'pers','2022-08-05'),(101,2,'phan','2022-08-05'),(102,2,'phan','2022-08-05'),(103,2,'phan','2022-08-05'),(104,2,'phan','2022-08-05'),(105,2,'phan','2022-08-05'),(106,2,'phan','2022-08-05'),(107,2,'phan','2022-08-05'),(108,2,'phan','2022-08-05'),(109,2,'phan','2022-08-05'),(110,2,'phan','2022-08-05'),(111,2,'phan','2022-08-05'),(112,2,'phan','2022-08-05'),(113,2,'phan','2022-08-05'),(114,2,'ceph','2022-08-05'),(115,2,'ceph','2022-08-05'),(116,2,'ceph','2022-08-05'),(117,1,'perseph','2022-08-05'),(118,1,'perseph','2022-08-05'),(119,1,'perseph','2022-08-05'),(120,1,'perseph','2022-08-05'),(121,1,'perseph','2022-08-05'),(122,1,'ecout','2022-08-05'),(123,1,'ecout','2022-08-05'),(124,1,'ecout','2022-08-05'),(125,1,'ceph','2022-08-05'),(126,1,'ceph','2022-08-05'),(127,1,'ceph','2022-08-05'),(128,1,'ceph','2022-08-05'),(129,1,'ceph','2022-08-05'),(130,1,'ceph','2022-08-05'),(131,1,'phan','2022-08-05'),(132,1,'phan','2022-08-05'),(133,1,'phan','2022-08-05'),(134,1,'phan','2022-08-05'),(135,1,'phan','2022-08-05'),(136,1,'phan','2022-08-05'),(137,1,'phan','2022-08-05'),(138,1,'phan','2022-08-05'),(139,1,'phan','2022-08-05'),(140,1,'phan','2022-08-05'),(141,1,'phan','2022-08-05'),(142,1,'phan','2022-08-05'),(143,1,'phan','2022-08-05'),(144,1,'phan','2022-08-05'),(145,1,'phan','2022-08-05'),(146,1,'phan','2022-08-05'),(147,1,'pers','2022-08-05'),(148,1,'pers','2022-08-05'),(149,1,'perse','2022-08-05'),(150,1,'perse','2022-08-05'),(151,1,'perse','2022-08-05'),(152,1,'cep','2022-08-05'),(153,1,'cep','2022-08-05'),(154,1,'cep','2022-08-05'),(155,1,'ceph','2022-08-05'),(156,1,'ceph','2022-08-05'),(157,1,'encein','2022-08-05'),(158,1,'encein','2022-08-05'),(159,1,'encein','2022-08-05'),(160,1,'encein','2022-08-05'),(161,2,'phan','2022-08-06'),(162,2,'phan','2022-08-06'),(163,2,'phan','2022-08-06'),(164,2,'phan','2022-08-06'),(165,2,'phan','2022-08-06'),(166,2,'phan','2022-08-06'),(167,2,'phan','2022-08-06'),(168,2,'phan','2022-08-06'),(169,2,'cepe','2022-08-06'),(170,2,'ceph','2022-08-06'),(171,2,'ceph','2022-08-06'),(172,2,'ceph','2022-08-06'),(173,2,'phan','2022-08-06'),(174,2,'phan','2022-08-06'),(175,2,'phan','2022-08-06'),(176,2,'phan','2022-08-06'),(177,2,'phan','2022-08-06'),(178,1,'phan','2022-08-06'),(179,1,'phan','2022-08-06'),(180,1,'phan','2022-08-06'),(181,1,'phan','2022-08-06'),(182,1,'phan','2022-08-06'),(183,1,'phan','2022-08-06'),(184,1,'phan','2022-08-06'),(185,1,'phan','2022-08-06'),(186,1,'phan','2022-08-06'),(187,1,'phan','2022-08-06'),(188,1,'phan','2022-08-06'),(189,1,'phan','2022-08-06'),(190,1,'phan','2022-08-06'),(191,1,'phan','2022-08-06'),(192,1,'PHAN','2022-08-06'),(193,1,'PHAN','2022-08-06'),(194,1,'PHAN','2022-08-06'),(195,1,'PHAN','2022-08-06'),(196,1,'PHAN','2022-08-06'),(197,1,'PHAN','2022-08-06'),(198,1,'PHAN','2022-08-06'),(199,1,'PHAN','2022-08-06'),(200,1,'PHAN','2022-08-06'),(201,1,'PHAN','2022-08-06'),(202,1,'PHAN','2022-08-06'),(203,1,'PHAN','2022-08-06'),(204,1,'PHAN','2022-08-06'),(205,1,'PHAN','2022-08-06'),(206,1,'PHAN','2022-08-06'),(207,1,'PHAN','2022-08-06'),(208,1,'PHAN','2022-08-06'),(209,1,'ecou','2022-08-06'),(210,1,'ecou','2022-08-06'),(211,1,'ecou','2022-08-06'),(212,1,'ecou','2022-08-06'),(213,1,'ecou','2022-08-06'),(214,1,'ecou','2022-08-06'),(215,1,'ecou','2022-08-06'),(216,1,'ecou','2022-08-06'),(217,1,'ecou','2022-08-06'),(218,1,'ecou','2022-08-06'),(219,1,'ecou','2022-08-06'),(220,1,'ecou','2022-08-06'),(221,1,'ceph','2022-08-06'),(222,1,'ceph','2022-08-06'),(223,1,'ceph','2022-08-06'),(224,1,'ceph','2022-08-06'),(225,1,'ceph','2022-08-06'),(226,1,'ceph','2022-08-06'),(227,1,'ceph','2022-08-06'),(228,1,'ceph','2022-08-06'),(229,1,'ceph','2022-08-06'),(230,1,'ceph','2022-08-06'),(231,1,'ceph','2022-08-06'),(232,1,'pan','2022-08-06'),(233,1,'phan','2022-08-06'),(234,1,'phan','2022-08-06'),(235,1,'phan','2022-08-06'),(236,1,'phan','2022-08-06'),(237,1,'phantom II','2022-08-06'),(238,1,'phantom II','2022-08-06'),(239,1,'phantom II','2022-08-06'),(240,1,'phantom II','2022-08-06'),(241,1,'phantom II','2022-08-06'),(242,1,'phantom II','2022-08-06'),(243,1,'phantom II','2022-08-06'),(244,1,'phantom II','2022-08-06');
/*!40000 ALTER TABLE `recherches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id_slides` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `sous_titre` varchar(150) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_slides`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,'Le son libéré ','Dione ','assets/video/Crop_Video_Phantom_home.mp4','produits?idSousCat=2'),(2,'\r\nChef d\'œuvre','Collection exclusive ',' assets/video/phantom-gold.mp4 ','sous-categories?idCat=1'),(3,'Ingénierie d\'excellence','Dolby Atmos','assets/video/immersion-bar.mp4',' sous-categories?idCat=2');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_categories`
--

DROP TABLE IF EXISTS `sous_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_categories` (
  `id_sous_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  PRIMARY KEY (`id_sous_categorie`),
  KEY `FK_id_categorie` (`id_categorie`),
  CONSTRAINT `FK_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categories`
--

LOCK TABLES `sous_categories` WRITE;
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` VALUES (1,'Phantom I',1,'assets/img/sous_categories/Sous_Categorie_Phantom_I_800x800.webp','assets\\video\\hp-2.mp4'),(2,'Phantom II',1,'assets/img/sous_categories/Sous_Categorie_Phantom_II_800x800.webp','assets/video/hp-2.mp4'),(3,'Andromeda I',2,'assets/img/sous_categories/Sous_Categorie_Andromeda_I_800x800.webp','assets/video/tech-twix.mp4'),(4,'Andromeda II',2,'assets/img/sous_categories/Sous_Categorie_Andromeda_II_800x800.webp','assets/video/tech-twix.mp4'),(5,'Cepheus I',3,'assets/img/sous_categories/Sous_Categorie_Cepheus_I_800x800.webp','assets/video/D_battery_usages_2x.webp'),(6,'Cepheus II ',3,'assets/img/sous_categories/Sous_Categorie_Cepheus_II_800x800.webp','assets/video/D_battery_usages_2x.webp'),(7,'Persephone I',4,'assets/img/sous_categories/Sous_Categorie_Persephone_I_800x800.webp','assets/video/Amplifers_Desktop_2880x1215.webp'),(8,'Persephone II',4,'assets/img/sous_categories/Sous_Categorie_Persephone_II_800x800.webp','assets/video/Amplifers_Desktop_2880x1215.webp');
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `date_inscription` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'invite','invite','2022-07-27','invite@invite.fr','0','invite'),(2,'Farina','Raphael','2022-08-01','raphfar@gmail.com','0123456789','n4bQgYhMfWWaL+qgxVrQFaO/TxsrC4Is0V1sFbDwCgg=');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visites`
--

DROP TABLE IF EXISTS `visites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visites` (
  `id_visite` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `dateV` date NOT NULL,
  PRIMARY KEY (`id_visite`),
  KEY `FK_id_utilisateur_visite` (`id_utilisateur`),
  KEY `FK_id_produit_visite` (`id_produit`),
  CONSTRAINT `FK_id_produit_visite` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  CONSTRAINT `FK_id_utilisateur_visite` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visites`
--

LOCK TABLES `visites` WRITE;
/*!40000 ALTER TABLE `visites` DISABLE KEYS */;
/*!40000 ALTER TABLE `visites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-07 21:27:11
