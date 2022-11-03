-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: kinopoisk
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `last_name` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) DEFAULT NULL COMMENT 'Почта',
  `phone` varchar(100) DEFAULT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователь';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Элина','Цветкова','pa5h@mail.ru','7(6307)491-53-10','2007-06-12 00:00:00','2012-04-23 00:00:00'),(2,'Кирилл','Кондратьев','281av0@gmail.com','02(655)102-81-24','2005-12-12 00:00:00','2012-09-10 00:00:00'),(3,'Екатерина','Журавлева','8edmfh@outlook.com','35(06)210-49-42','2017-09-14 00:00:00','2022-11-03 14:20:10'),(4,'Руслан','Ефремов','sfn13i@mail.ru','052(26)271-05-15','2022-05-15 00:00:00','2022-11-03 14:20:10'),(5,'Платон','Сальников','g0orc3x1@outlook.com','194(142)528-48-45','2021-12-23 00:00:00','2022-03-03 00:00:00'),(6,'Алиса','Пономарева','rv7bp@gmail.com','6(2973)916-78-05','2020-01-01 00:00:00','2022-11-03 14:20:10'),(7,'Ульяна','Коновалова','93@outlook.com','54(95)103-85-51','2022-09-16 00:00:00','2022-10-10 00:00:00'),(8,'Матвей','Березин','er@gmail.com','127(42)186-47-11','2022-03-30 00:00:00','2022-10-29 00:00:00'),(9,'Семен','Фокин','o0my@gmail.com','36(122)975-22-50','2019-11-24 00:00:00','2020-08-04 00:00:00'),(10,'Лев','Лазарев','715qy08@gmail.com','51(0145)592-94-66','2018-04-19 00:00:00','2022-05-17 00:00:00');
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

-- Dump completed on 2022-11-03 15:55:15
