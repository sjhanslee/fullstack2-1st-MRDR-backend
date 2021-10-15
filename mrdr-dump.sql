-- MySQL dump 10.13  Distrib 8.0.26, for macos11.4 (arm64)
--
-- Host: localhost    Database: mrdr
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('a7e17db9-1c97-476d-930f-50a925d207f0','236a1d361056863f82a4a13e46a68eb8551d21565cc3a44e36634ac558b95b34','2021-10-14 21:29:16.253','20211010112106_add_column_detail_image_url_to_prdouct_model',NULL,NULL,'2021-10-14 21:29:16.242',1),('e8c6beab-7320-46c0-8510-3d66770fa0a7','5a09932ccfc671e5699de6edf241db754105bb12fddae274ef1ce3b0af078302','2021-10-14 21:29:16.382','20211012071038_modfiy_model_about_color_image_cart',NULL,NULL,'2021-10-14 21:29:16.254',1),('ffe54368-859f-40a6-a926-babdc8e8199c','8e074801175b7f188d60539bff251b963fbc29c1fb9c6cd7845bdbb76f0220c6','2021-10-14 21:29:16.241','20211010044826_init_all_tables',NULL,NULL,'2021-10-14 21:29:16.048',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `user_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_fkey` (`user_id`),
  KEY `carts_product_option_id_fkey` (`product_option_id`),
  CONSTRAINT `carts_product_option_id_fkey` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `carts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,1,12),(2,2,1,29),(3,2,1,29),(4,1,1,13);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'블레이징옐로우','#E5D050'),(2,'딥웰','#181F32'),(3,'퓨전코랄','#EF8869'),(4,'울트라마린','#2A3268'),(5,'코랄퍼플','#C19FC5'),(6,'웜블랙','#202022'),(7,'우드카키','#785D52'),(8,'비스타블루','#95A5D8'),(9,'써머핑크','#F0CEC9'),(10,'그레이','#6B666C'),(11,'휘바민트','#A6B8B0'),(12,'아보카도오일','#B2972C'),(13,'퍼플헤더','#C7BFD0'),(14,'매트블루','#B4C2C7'),(15,'선셋퍼플','#6C4379'),(16,'푸시아핑크','#DF6B85');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_types`
--

DROP TABLE IF EXISTS `image_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_types`
--

LOCK TABLES `image_types` WRITE;
/*!40000 ALTER TABLE `image_types` DISABLE KEYS */;
INSERT INTO `image_types` VALUES (1,'option'),(2,'detail');
/*!40000 ALTER TABLE `image_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_categories_type_category_id_fkey` (`type_category_id`),
  CONSTRAINT `main_categories_type_category_id_fkey` FOREIGN KEY (`type_category_id`) REFERENCES `type_categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (1,'레깅스',1),(2,'스커트 & 드레스',1),(3,'팬츠',1);
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color_images`
--

DROP TABLE IF EXISTS `product_color_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_type_id` int NOT NULL,
  `product_color_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_color_images_product_color_id_fkey` (`product_color_id`),
  KEY `product_color_images_image_type_id_fkey` (`image_type_id`),
  CONSTRAINT `product_color_images_image_type_id_fkey` FOREIGN KEY (`image_type_id`) REFERENCES `image_types` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_color_images_product_color_id_fkey` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color_images`
--

LOCK TABLES `product_color_images` WRITE;
/*!40000 ALTER TABLE `product_color_images` DISABLE KEYS */;
INSERT INTO `product_color_images` VALUES (1,'https://user-images.githubusercontent.com/88504900/137419255-a05d58be-cb57-4807-b2bc-abee0df111ab.png',1,20),(2,'https://user-images.githubusercontent.com/88504900/137419253-9da18cae-3b5f-42ec-949b-3e19f5dbc266.png',1,5),(3,'https://user-images.githubusercontent.com/88504900/137419261-55d04e39-207d-48f7-9141-d5fc7d140799.png',1,13),(4,'https://user-images.githubusercontent.com/88504900/137419218-c8d955e1-92a3-4231-a357-5169fd9e651b.png',1,1),(5,'https://user-images.githubusercontent.com/88504900/137419256-cb5e36d9-62a6-4fc9-9930-b1be898c5f19.png',1,14),(6,'https://user-images.githubusercontent.com/88504900/137419266-d56bc144-f624-48f6-9022-b6863a6bede7.png',1,23),(7,'https://user-images.githubusercontent.com/88504900/137419271-95928ac2-a391-48d8-ab55-93fc0c9b60da.png',1,3),(8,'https://user-images.githubusercontent.com/88504900/137419252-c342a19b-c50c-4ff2-967e-4ad77efa0e8f.png',1,19),(9,'https://user-images.githubusercontent.com/88504900/137420188-5720d561-bfe4-4be2-9024-7cb78b80d5ee.png',1,8),(10,'https://user-images.githubusercontent.com/88504900/137419251-d31b257b-5efc-45cb-9b40-59d9204c5d52.png',1,10),(11,'https://user-images.githubusercontent.com/88504900/137419264-093a6b98-d426-43f1-a771-c5cb331c794e.png',1,15),(12,'https://user-images.githubusercontent.com/88504900/137419265-943c31b3-b62d-4d35-86b0-efaa4191c1cd.png',1,6),(13,'https://user-images.githubusercontent.com/88504900/137419268-04360c61-0645-45f8-8cf6-7a50115e899b.png',1,4),(14,'https://user-images.githubusercontent.com/88504900/137419260-40bcea90-d9db-4821-837d-0740c6bca558.png',1,7),(15,'https://user-images.githubusercontent.com/88504900/137420191-3103cc10-9d5a-4b87-a46d-cbe87a171417.png',1,2),(16,'https://user-images.githubusercontent.com/88504900/137420190-94310acd-5aec-420b-9799-0dc69cbaf5a2.png',1,22),(17,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(18,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(19,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(20,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(21,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(22,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(23,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(24,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(25,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(26,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(27,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(28,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(29,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(30,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(31,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(32,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(33,'https://user-images.githubusercontent.com/88504900/137421984-a94113bd-2f13-4ee4-9caf-f552e28c7a32.jpg',2,4),(34,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(35,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(36,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(37,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(38,'https://user-images.githubusercontent.com/88504900/137421990-dc929cac-94c7-4998-8aff-ac0dad46e5f5.jpg',2,5),(39,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(40,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(41,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(42,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(43,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(44,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(45,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(46,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(47,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(48,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(49,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(50,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(51,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(52,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(53,'https://user-images.githubusercontent.com/88504900/137421993-613d249c-f4c3-4a99-9c32-2b33e8404d39.jpg',2,8),(54,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(55,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(56,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(57,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(58,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(59,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(60,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(61,'https://user-images.githubusercontent.com/88504900/137421996-ce2ccf22-c6bd-4603-8f9e-151164b7d4d9.jpg',2,2),(62,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(63,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(64,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(65,'https://user-images.githubusercontent.com/88504900/137421995-b838d7ca-2c3f-48ad-8396-14039875b003.jpg',2,3),(66,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(67,'https://user-images.githubusercontent.com/88504900/137421997-47f40a45-e089-424e-8f1e-fee19adb3ea6.jpg',2,6),(68,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(69,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(70,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(71,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(72,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(73,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(74,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(75,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(76,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(77,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(78,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1),(79,'https://user-images.githubusercontent.com/88504900/137422000-265b7028-fe5d-41b0-84bb-1ee1d6305e06.jpg',2,7),(80,'https://user-images.githubusercontent.com/88504900/137422003-14f5ff46-5e45-4523-9107-40e421dc1ee7.jpg',2,1);
/*!40000 ALTER TABLE `product_color_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_colors_product_id_fkey` (`product_id`),
  KEY `product_colors_color_id_fkey` (`color_id`),
  CONSTRAINT `product_colors_color_id_fkey` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_colors_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,1,4),(2,1,9),(3,1,3),(4,1,1),(5,1,2),(6,1,13),(7,1,11),(8,1,10),(9,9,5),(10,1,15),(11,9,3),(12,9,6),(13,1,14),(14,1,6),(15,1,12),(16,9,1),(17,9,2),(18,9,7),(19,1,8),(20,1,7),(21,9,4),(22,1,16),(23,1,5),(24,9,8);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_fkey` (`product_id`),
  CONSTRAINT `product_images_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',1),(2,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',1),(3,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',1),(4,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',1),(5,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',1),(6,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',1),(7,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',1),(8,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',1),(9,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',1),(10,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',2),(11,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',2),(12,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',2),(13,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',2),(14,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',3),(15,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',3),(16,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',3),(17,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',3),(18,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',3),(19,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',3),(20,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',2),(21,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',3),(22,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',3),(23,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',4),(24,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',5),(25,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',2),(26,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',4),(27,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',4),(28,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',5),(29,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',4),(30,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',4),(31,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',5),(32,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',4),(33,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',4),(34,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',3),(35,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',6),(36,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',2),(37,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',6),(38,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',5),(39,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',6),(40,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',2),(41,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',6),(42,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',5),(43,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',2),(44,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',4),(45,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',5),(46,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',6),(47,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',6),(48,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',7),(49,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',5),(50,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',5),(51,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',4),(52,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',6),(53,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',5),(54,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',6),(55,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',6),(56,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',7),(57,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',7),(58,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',7),(59,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',7),(60,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',7),(61,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',7),(62,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',7),(63,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',8),(64,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',7),(65,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',8),(66,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',8),(67,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',8),(68,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',8),(69,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',13),(70,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',8),(71,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',10),(72,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',8),(73,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',11),(74,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',13),(75,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',8),(76,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',10),(77,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',10),(78,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',8),(79,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',10),(80,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',11),(81,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',11),(82,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',11),(83,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',11),(84,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',11),(85,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',11),(86,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',13),(87,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',13),(88,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',13),(89,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',13),(90,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',13),(91,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',16),(92,'https://user-images.githubusercontent.com/88504900/137406244-81cdb748-8cad-44d1-84cb-6e2501890127.png',16),(93,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',13),(94,'https://user-images.githubusercontent.com/88504900/137406290-6e211d45-584f-45e9-b783-c4e113271355.jpg',16),(95,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',16),(96,'https://user-images.githubusercontent.com/88504900/137406303-f60c58ac-872b-4fe6-8346-3bb5ad75397d.jpg',16),(97,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',16),(98,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',16),(99,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',13),(100,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',16),(101,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',16),(102,'https://user-images.githubusercontent.com/88504900/137406285-800910ec-8347-4227-9a4c-d1d0bfb02659.jpg',10),(103,'https://user-images.githubusercontent.com/88504900/137406313-79097eeb-a1f7-4584-bfeb-7b01b087ffde.jpg',10),(104,'https://user-images.githubusercontent.com/88504900/137406322-a9ad0396-7cb6-4440-af22-1f6f898a2f5e.jpg',10),(105,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',10),(106,'https://user-images.githubusercontent.com/88504900/137406341-5e443c7e-3521-4bf2-88e0-2e444d546fbc.jpg',11),(107,'https://user-images.githubusercontent.com/88504900/137406333-8985661d-10a3-4b9a-ad51-1e35b45e7f47.jpg',11),(108,'https://user-images.githubusercontent.com/88504900/137406324-ec5f4c18-75cf-4a84-aea1-f7751f2ba231.jpg',10),(109,'https://user-images.githubusercontent.com/88504900/137407484-52f9fbaf-119f-4049-b013-d187b9ca06cc.jpg',17),(110,'https://user-images.githubusercontent.com/88504900/137407474-7a66407a-9749-4c86-8095-2ba0806dda12.jpg',9),(111,'https://user-images.githubusercontent.com/88504900/137407474-7a66407a-9749-4c86-8095-2ba0806dda12.jpg',18),(112,'https://user-images.githubusercontent.com/88504900/137407484-52f9fbaf-119f-4049-b013-d187b9ca06cc.jpg',12),(113,'https://user-images.githubusercontent.com/88504900/137407474-7a66407a-9749-4c86-8095-2ba0806dda12.jpg',17),(114,'https://user-images.githubusercontent.com/88504900/137407484-52f9fbaf-119f-4049-b013-d187b9ca06cc.jpg',9),(115,'https://user-images.githubusercontent.com/88504900/137407474-7a66407a-9749-4c86-8095-2ba0806dda12.jpg',12),(116,'https://user-images.githubusercontent.com/88504900/137407474-7a66407a-9749-4c86-8095-2ba0806dda12.jpg',14),(117,'https://user-images.githubusercontent.com/88504900/137407484-52f9fbaf-119f-4049-b013-d187b9ca06cc.jpg',18),(118,'https://user-images.githubusercontent.com/88504900/137407484-52f9fbaf-119f-4049-b013-d187b9ca06cc.jpg',15),(119,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',20),(120,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',21),(121,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',22),(122,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',19),(123,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',23),(124,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',27),(125,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',24),(126,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',28),(127,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',26),(128,'https://user-images.githubusercontent.com/88504900/137408172-d68120da-3389-433b-b70c-9727a68b280b.jpg',25);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_options_product_id_fkey` (`product_id`),
  KEY `product_options_color_id_fkey` (`color_id`),
  KEY `product_options_size_id_fkey` (`size_id`),
  CONSTRAINT `product_options_color_id_fkey` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_options_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_options_size_id_fkey` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
INSERT INTO `product_options` VALUES (1,1,2,4),(2,1,2,1),(3,1,1,5),(4,1,1,4),(5,1,2,5),(6,1,3,1),(7,1,1,3),(8,1,3,2),(9,1,3,3),(10,1,4,2),(11,1,3,4),(12,1,1,2),(13,1,1,1),(14,1,6,1),(15,1,6,2),(16,1,3,5),(17,1,4,3),(18,1,6,3),(19,1,6,5),(20,1,7,1),(21,1,7,2),(22,1,2,3),(23,1,5,2),(24,1,5,3),(25,1,7,5),(26,1,8,1),(27,1,8,2),(28,1,2,2),(29,1,4,1),(30,1,6,4),(31,1,4,5),(32,1,4,4),(33,1,9,2),(34,1,9,4),(35,1,9,1),(36,1,5,1),(37,1,5,5),(38,1,8,4),(39,1,8,5),(40,1,9,3),(41,1,5,4),(42,1,9,5),(43,1,10,1),(44,1,7,4),(45,1,8,3),(46,1,10,2),(47,1,13,2),(48,1,7,3),(49,1,12,5),(50,1,13,1),(51,1,11,5),(52,1,12,2),(53,1,12,3),(54,1,12,4),(55,1,13,3),(56,1,12,1),(57,1,13,5),(58,1,14,2),(59,1,14,1),(60,1,14,4),(61,1,14,3),(62,1,10,3),(63,1,10,4),(64,1,14,5),(65,1,11,1),(66,1,10,5),(67,1,13,4),(68,1,16,3),(69,1,16,1),(70,1,16,4),(71,1,16,2),(72,9,1,1),(73,9,1,2),(74,9,1,3),(75,9,1,4),(76,9,1,5),(77,9,2,1),(78,1,15,2),(79,1,11,2),(80,1,15,5),(81,1,15,4),(82,1,11,3),(83,9,2,3),(84,1,15,1),(85,1,11,4),(86,9,2,2),(87,9,2,5),(88,9,2,4),(89,9,3,1),(90,9,3,2),(91,9,3,4),(92,1,15,3),(93,9,4,3),(94,9,4,1),(95,9,4,4),(96,9,4,2),(97,9,3,5),(98,9,5,2),(99,9,5,3),(100,9,4,5),(101,9,5,1),(102,9,5,4),(103,9,5,5),(104,9,6,1),(105,9,6,2),(106,9,6,3),(107,1,16,5),(108,9,3,3),(109,9,7,1),(110,9,7,2),(111,9,7,3),(112,9,7,5),(113,9,7,4),(114,9,8,1),(115,9,6,4),(116,9,8,2),(117,9,8,3),(118,9,8,4),(119,9,8,5),(120,9,6,5);
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sizes_product_id_fkey` (`product_id`),
  KEY `product_sizes_size_id_fkey` (`size_id`),
  CONSTRAINT `product_sizes_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_sizes_size_id_fkey` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (1,1,2),(2,1,3),(3,9,2),(4,9,4),(5,1,4),(6,9,3),(7,1,1),(8,1,5),(9,9,1),(10,9,5);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `sale_price` double DEFAULT NULL,
  `is_recommended` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `sub_category_id` int NOT NULL,
  `detail_image_url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_id_fkey` (`sub_category_id`),
  CONSTRAINT `products_sub_category_id_fkey` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.076','2021-10-15 07:07:06.076',3,'\'no-image\''),(2,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.080','2021-10-15 07:07:06.080',3,'\'no-image\''),(3,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.082','2021-10-15 07:07:06.082',3,'\'no-image\''),(4,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.086','2021-10-15 07:07:06.086',3,'\'no-image\''),(5,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.086','2021-10-15 07:07:06.086',3,'\'no-image\''),(6,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:07:06.089','2021-10-15 07:07:06.089',3,'\'no-image\''),(7,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.240','2021-10-15 07:10:32.240',3,'\'no-image\''),(8,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.241','2021-10-15 07:10:32.241',3,'\'no-image\''),(9,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.243','2021-10-15 07:10:32.243',3,'\'no-image\''),(10,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.243','2021-10-15 07:10:32.243',3,'\'no-image\''),(11,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.244','2021-10-15 07:10:32.244',3,'\'no-image\''),(12,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.244','2021-10-15 07:10:32.244',3,'\'no-image\''),(13,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.244','2021-10-15 07:10:32.244',3,'\'no-image\''),(14,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.246','2021-10-15 07:10:32.246',3,'\'no-image\''),(15,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.246','2021-10-15 07:10:32.246',3,'\'no-image\''),(16,'Dr.Hans 요가 레깅스',50000,30000,0,'2021-10-15 07:10:32.246','2021-10-15 07:10:32.246',3,'\'no-image\''),(17,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.246','2021-10-15 07:10:32.246',3,'\'no-image\''),(18,'[Dr.Hans Sports Edition]한스 트레이닝 바지',69000,0,0,'2021-10-15 07:10:32.248','2021-10-15 07:10:32.248',3,'\'no-image\''),(19,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:50.578','2021-10-15 07:36:50.578',3,'no-image'),(20,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:51.565','2021-10-15 07:36:51.565',3,'no-image'),(21,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:52.094','2021-10-15 07:36:52.094',3,'no-image'),(22,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:52.612','2021-10-15 07:36:52.612',3,'no-image'),(23,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:53.064','2021-10-15 07:36:53.064',3,'no-image'),(24,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:53.545','2021-10-15 07:36:53.545',3,'no-image'),(25,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:54.008','2021-10-15 07:36:54.008',3,'no-image'),(26,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:54.447','2021-10-15 07:36:54.447',3,'no-image'),(27,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:54.935','2021-10-15 07:36:54.935',3,'no-image'),(28,'MRDR JH 트레이닝 바지',69000,30000,1,'2021-10-15 07:36:55.447','2021-10-15 07:36:55.447',3,'no-image');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'0'),(2,'2'),(3,'4'),(4,'6'),(5,'8');
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `product_option_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_product_option_id_fkey` (`product_option_id`),
  CONSTRAINT `stocks_product_option_id_fkey` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,99,5),(2,111,6),(3,40,3),(4,123,7),(5,33,2),(6,0,10),(7,0,4),(8,33,15),(9,300,9),(10,100,1),(11,200,8),(12,20,12),(13,10,14),(14,0,11),(15,40,16),(16,99,18),(17,111,19),(18,10,27),(19,123,33),(20,123,20),(21,20,25),(22,0,17),(23,100,13),(24,33,28),(25,200,21),(26,20,38),(27,0,23),(28,0,30),(29,100,26),(30,200,34),(31,300,35),(32,0,36),(33,40,42),(34,111,32),(35,100,39),(36,0,24),(37,40,29),(38,10,40),(39,33,41),(40,0,49),(41,0,50),(42,100,52),(43,20,51),(44,99,31),(45,200,47),(46,0,37),(47,99,44),(48,111,45),(49,100,53),(50,300,22),(51,0,43),(52,300,48),(53,300,61),(54,0,62),(55,0,63),(56,33,54),(57,100,65),(58,10,66),(59,0,69),(60,99,70),(61,111,71),(62,200,73),(63,123,72),(64,0,75),(65,300,74),(66,0,76),(67,20,64),(68,123,46),(69,0,56),(70,40,55),(71,123,59),(72,40,68),(73,111,58),(74,20,77),(75,99,57),(76,200,60),(77,33,67),(78,100,78),(79,33,80),(80,0,82),(81,99,83),(82,111,84),(83,123,85),(84,300,87),(85,200,86),(86,0,89),(87,20,90),(88,0,88),(89,100,91),(90,40,81),(91,33,93),(92,40,94),(93,99,96),(94,111,97),(95,123,98),(96,0,95),(97,200,99),(98,300,100),(99,0,101),(100,20,103),(101,0,102),(102,100,104),(103,100,105),(104,100,79),(105,100,92),(106,33,106),(107,0,108),(108,99,109),(109,111,110),(110,123,111),(111,40,107),(112,200,112),(113,300,113),(114,0,114),(115,0,115),(116,20,116),(117,100,117),(118,100,118),(119,33,119),(120,40,120);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_main_category_id_fkey` (`main_category_id`),
  CONSTRAINT `sub_categories_main_category_id_fkey` FOREIGN KEY (`main_category_id`) REFERENCES `main_categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'8.2부 / 9부',1),(2,'5부 / 7부',1),(3,'팬츠 레깅스',1);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_categories`
--

DROP TABLE IF EXISTS `type_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_categories`
--

LOCK TABLES `type_categories` WRITE;
/*!40000 ALTER TABLE `type_categories` DISABLE KEYS */;
INSERT INTO `type_categories` VALUES (1,'하의'),(2,'용품'),(3,'상의');
/*!40000 ALTER TABLE `type_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_for_login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` datetime(3) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foreign_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foregin_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime(3) DEFAULT NULL,
  `is_email_agreed` tinyint(1) NOT NULL,
  `is_sns_agreed` tinyint(1) NOT NULL,
  `is_privacy_agreed` tinyint(1) NOT NULL,
  `is_terms_of_use_agreed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_for_login_key` (`id_for_login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test123','$2a$10$Vw0hmJMV5WVMQwY1.tvQMOQnJ14E6r.sRNABCpQs8BYDIjPnKNc5K','테스트',NULL,'test@test.com','서울시 관악구 신림동','personalUser','010 - 1234 - 1234',NULL,NULL,NULL,NULL,NULL,'2021-10-15 08:23:09.164','2021-10-15 08:23:09.164',0,NULL,1,1,1,1);
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

-- Dump completed on 2021-10-15 11:34:57
