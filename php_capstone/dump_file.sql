-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: capstone
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Pizza','2022-05-09 10:45:52','2022-05-09 10:45:52',0),(2,'Drinks','2022-05-09 10:45:52','2022-05-09 10:45:52',0),(3,'Desserts','2022-05-09 10:45:52','2022-05-09 10:45:52',0),(4,'Sides','2022-05-09 10:45:52','2022-05-09 10:45:52',0),(5,'Sandwich','2022-05-09 10:45:52','2022-05-09 10:45:52',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2022-05-09 10:47:06 | GET | 200 | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36','2022-05-09 10:47:06'),(2,'2022-05-09 10:47:28 | GET | p=menu | 200 | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36','2022-05-09 10:47:28'),(3,'2022-05-09 10:47:30 | GET | p=index | 200 | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36','2022-05-09 10:47:30'),(4,'2022-05-09 10:47:34 | GET | p=menu | 200 | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36','2022-05-09 10:47:34');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `gst` decimal(7,2) DEFAULT NULL,
  `pst` decimal(7,2) DEFAULT NULL,
  `delivery_charges` decimal(7,2) DEFAULT NULL,
  `sub_total` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `order_status` enum('pending','completed','cancelled') DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `excerpt` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(7,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_out_of_stock` tinyint(1) NOT NULL DEFAULT 0,
  `preparing_time` decimal(10,0) DEFAULT NULL,
  `calories` varchar(255) DEFAULT NULL,
  `total_sales` bigint(20) DEFAULT NULL,
  `servings` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'BBQ Chicken Pizza','Loaded with all-white-meat chicken, bacon, fresh onions, green peppers, and mozzarella and cheddar cheese','Loaded with all-white-meat chicken, bacon...','p1.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,20.99,1,0,20,'260 calories per slice',240,2),(2,'Buffalo Chicken Wings','Buffalo Chicken Recipe is a delicious weeknight meal that utilizes just a handful of simple ingredients, such as chicken breasts, hot sauce, honey, garlic, and butter  ','Buffalo Chicken Recipe is a delicious weeknight...','p2.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,7.99,2,0,30,'232 calories per serving',500,1),(3,'Chicken Bites','A juicy piece of chicken with all white meat served with a sauce of your choice.','A juicy piece of chicken with all...','p3.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,10.99,1,0,15,'260 calories per 100gm',350,1),(4,'Creamy Garlic Pizza','Every bite is bursting with delicious creamy garlic flavor, beginning with the garlic sauce base, a six-cheese blend, and the parmesan cheese on top.','Every bite is bursting with delicious creamy...','p4.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,13.99,2,0,20,'260 calories per slice',327,2),(5,'Italian Classic Pizza','Italian sausage, pepperoni, chopped mushroom, roasted red pepper and pizza mozzarella.','Italian sausage, pepperoni, chopped...','p5.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,5.00,3,0,15,'246 calories per 100gm',238,2),(6,'Farm House Pizza','Italian sausage, crispy corn, chopped mushroom, roasted red pepper, cheddar cheeze and pizza mozzarella.','Italian sausage, crispy corn, chopped...','p6.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,13.99,2,0,15,'230 calories per slice',102,2),(7,'Garlic Bread Combo','A blend of cheddar and mozzarella cheeses baked to perfection. With marinara sauce.','A blend of cheddar and mozzarella...','p7.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,9.99,3,0,15,'150 calories per 100gm',218,1),(8,'Fat boy cheeze burger','Made with four 100% Canadian beef patties, special sauce, crisp lettuce, processed cheddar cheese, pickles, onions and hickory-smoked bacon strips on a toasted sesame seed bun.','Made with four 100% Canadian beef...','p8.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,9.99,5,0,20,'220 calories per 100gm',434,1),(9,'Spicy Potato Soft Taco','Made with soft tortilla filled with spicy roasted potato with maxican cheeze.','Made with soft tortilla filled ...','p9.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,2.99,2,0,3,'140 calories per 100gm',437,1),(10,'Crunch Wrap Supreme','Wrap made with crunchy corn tortilla, lettuce, tomatoes and cream cheeze.','Wrap made with crunchy corn tortilla...','p10.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,4.99,4,0,15,'220 calories per 100gm',434,1),(11,'Choco Lava Cake','Oven baked chocolate cakes, crunchy on the outside with molten chocolate on the inside.','Oven baked chocolate cakes...','p11.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,20.99,5,0,20,'260 calories per slice',240,2),(12,'Chicken Wings','Buffalo Chicken Recipe is a delicious weeknight meal that utilizes just a handful of simple ingredients, such as chicken breasts, hot sauce, honey, garlic, and butter  ','Buffalo Chicken Recipe is a delicious weeknight...','p12.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,6.99,1,0,26,'256 calories per serving',568,1),(13,'Spicy Chicken Nuggets','A juicy piece of chicken with all white meat served with a sauce of your choice.','A juicy piece of chicken with all...','p13.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,11.99,2,0,20,'232 calories per 100gm',350,1),(14,'Cheezy Garlic Pizza','Every bite is bursting with delicious cheesy garlic flavor, beginning with the garlic sauce base, a six-cheese blend, and the parmesan cheese on top.','Every bite is bursting with delicious cheesy...','p14.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,12.99,5,0,20,'256 calories per slice',646,2),(15,'Chicken Caesar Wrap','Italian sausage, pepperoni, chopped mushroom, roasted red pepper and pizza mozzarella.','Italian sausage, pepperoni, chopped...','p15.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,5.00,3,0,15,'246 calories per 100gm',238,1),(16,'Hot Fudge Sundae','Italian sausage, crispy corn, chopped mushroom, roasted red pepper, cheddar cheeze and pizza mozzarella.','Italian sausage, crispy corn, chopped...','p16.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,5.99,5,0,5,'267 calories per 50gm',263,1),(17,'Quarter Pounder with Cheeze','A blend of cheddar and mozzarella cheeses baked to perfection. With marinara sauce.','A blend of cheddar and mozzarella...','p17.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,7.99,2,0,15,'362 calories per 100gm',218,1),(18,'Double cheeze burger','Made with four 100% Canadian beef patties, special sauce, crisp lettuce, processed cheddar cheese, pickles, onions and hickory-smoked bacon strips on a toasted sesame seed bun.','Made with four 100% Canadian beef...','p18.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,10.99,3,0,15,'247 calories per 100gm',567,1),(19,'Double Scoop Cone','Made with soft tortilla filled with spicy roasted potato with maxican cheeze.','Made with soft tortilla filled ...','p9.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,4.99,2,0,3,'240 calories per 100gm',632,1),(20,'Strawberry Fruitopia','Wrap made with crunchy corn tortilla, lettuce, tomatoes and cream cheeze.','Wrap made with crunchy corn tortilla...','p20.jpg','2022-05-09 10:46:55','2022-05-09 10:46:55',0,2.99,4,0,5,'284 calories per serving',1321,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` char(7) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-05-09 10:48:20
