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
  `code_postale` int(5) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `Pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id_adresse_livraison`),
  KEY `FK_id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `FK_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses_livraison`
--

LOCK TABLES `adresses_livraison` WRITE;
/*!40000 ALTER TABLE `adresses_livraison` DISABLE KEYS */;
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
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Enceintes'),(2,'Barres de son'),(3,'Ecouteurs'),(4,'Amplificateurs');
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
  `Etat` int(1) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `FK_id_utilisateur_commande` (`id_utilisateur`),
  KEY `FK_id_adresses_livraison` (`id_adresse_livraison`),
  CONSTRAINT `FK_id_adresses_livraison` FOREIGN KEY (`id_adresse_livraison`) REFERENCES `adresses_livraison` (`id_adresse_livraison`),
  CONSTRAINT `FK_id_utilisateur_commande` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
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
INSERT INTO `produits` VALUES (3,'Phantom I Black','Ressentez l’impact physique du son comme jamais auparavant.',1990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',1,150,15),(4,'Phantom I Orange','Une puissance indécente, des basses ultra-profondes.\r\n',2990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',1,150,15),(5,'Phantom I White','Une jolie enceinte.',1490,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',1,150,15),(6,'Phantom I Black B','Une puissance indécente, des basses ultra-profondes.\r\n',2490,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',1,150,15),(7,'Phantom I Orange B','Pas mal',1490,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',1,150,15),(8,'Phantom I White B','Un design et des performances de zinzin',2990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',1,150,15),(9,'Phantom II Black','La première enceinte domestique conçue pour vous immerger au plus profond du son.\r\n',1090,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',2,150,15),(10,'Phantom II White','La première enceinte domestique conçue pour vous immerger au plus profond du son.\r\n',1090,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',2,150,15),(11,'Phantom II Blue','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1090,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',2,150,15),(12,'Phantom II Black B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',2,150,15),(13,'Phantom II White B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',2,150,15),(14,'Phantom II Blue B','La première enceinte domestique conçue pour vous immerger au plus profond du son.',1290,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp',2,150,15),(15,'Andromeda I Black','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp\r\n',3,150,15),(16,'Andromeda I Grey','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp\r\n',3,150,15),(17,'Andromeda I White','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.',4999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo1.webp\r\n',3,150,15),(18,'Andromeda II Black','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',4,150,150),(19,'Andromeda II Grey','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',4,150,150),(20,'Andromeda II White','À ses performances extrêmes, s\'ajoute un design d\'une exceptionnelle finesse : la barre de son Andromeda sait se fondre dans le décor pour laisser place à l\'action.\r\n',6999,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',4,150,15),(21,'Cepheus I Black','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(22,'Cepheus I Blue','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(23,'Cepheus I White','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',230,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(24,'Cepheus I Black B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(25,'Cepheus I Blue B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(26,'Cepheus I White B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.',180,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',5,150,15),(27,'Cepheus II Black','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(28,'Cepheus II White','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(29,'Cepheus II Orange','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',350,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(30,'Cepheus II Black B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(31,'Cepheus II White B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(32,'Cepheus II Orange B','Reprenant la signature des flasques latéraux de Phantom, le design des Cepheus est aussi épuré que la technologie qu\'ils renferment est sophistiquée. Ces écouteurs true wireless sont une création résolument nomade, qui allie excellence acoustique et esthétique.\r\n',250,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',6,150,15),(33,'Persephone I Black','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',7,150,15),(34,'Persephone I Grey','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',7,150,15),(35,'Persephone I Blue','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',14900,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',7,150,15),(36,'Persephone II Black','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',8,150,15),(37,'Persephone II Grey','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',8,150,15),(38,'Persephone II Blue','Persephone est le système audiophile le plus avancé au monde, pour les mélomanes en quête d\'une écoute raffinée et pleine d\'émotion.',7990,'assets/img/enceintes/Phantom-1/Phantom-1-Duo2.webp',8,150,15);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recherches`
--

LOCK TABLES `recherches` WRITE;
/*!40000 ALTER TABLE `recherches` DISABLE KEYS */;
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
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_slides`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
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
INSERT INTO `sous_categories` VALUES (1,'Phantom I',1),(2,'Phantom II',1),(3,'Andromeda I',2),(4,'Andromeda II',2),(5,'Cepheus I',3),(6,'Cepheus II ',3),(7,'Persephone I',4),(8,'Persephone II',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'invite','invite','2022-07-27','invite@invite.fr','0','invite');
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

-- Dump completed on 2022-07-27 16:39:52
