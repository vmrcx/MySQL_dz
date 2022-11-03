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
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) DEFAULT NULL COMMENT 'Название сериала',
  `series_description` varchar(255) DEFAULT NULL COMMENT 'Описание',
  `production_year` int unsigned NOT NULL COMMENT 'Год создания',
  `country` varchar(100) DEFAULT NULL COMMENT 'Город',
  `director` varchar(100) DEFAULT NULL COMMENT 'Режиссер',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время загрузки на сервис',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Фильм';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Триггер','Страшная трагедия вынуждает психолога-провокатора вернуться к практике. Напряженная драма с Максимом Матвеевым',2018,'Россия','Дмитрий Тюрин','2018-10-15 00:00:00','2022-03-11 00:00:00'),(2,'Ну, погоди','Нескончаемая погоня оболтуса Волка за удачливым Зайцем. Самый веселый и популярный в СССР мультсериал',1969,'СССР','','2008-01-01 00:00:00','2022-07-08 00:00:00'),(3,'Игра престолов','Рыцари, мертвецы и драконы — в эпической битве за судьбы мира. Сериал, который навсегда изменил телевидение',2011,'США','Дэвид Наттер','2011-10-10 00:00:00','2022-01-15 00:00:00'),(4,'Игра в кальмара','',2021,'Южная Корея','Хван Дон-хёк','2019-12-12 00:00:00','2022-09-18 00:00:00'),(5,'Леди Баг и Супер-кот','Подростки-супергерои спасают Париж. Мультсериал с французским акцентом о двойной жизни и первой любви',2015,'Франция','Томас Астрю','2016-10-17 00:00:00','2022-12-19 00:00:00'),(6,'Будет больно','Насыщенные трудовые будни врача родильного отделения. Бен Уишоу в драмеди от режиссера «Конца ***го мира» ',2022,'Великобритания','Люси Форбс','2022-05-07 00:00:00','2022-05-10 00:00:00'),(7,'Атака титанов: Выбор без сожалений','Шайка юного Леви идет на дело, которое изменит их жизнь. Предыстория самого популярного героя «Атаки титанов» ',2014,'Япония','Тэцуро Араки','2016-02-18 00:00:00','2022-11-03 00:00:00'),(8,'Лучшее предложение','Известного аукциониста нанимают для продажи наследства. Джеффри Раш в хитроумном искусствоведческом триллере',2012,'Италия','Джузеппе Торнаторе','2013-08-16 00:00:00','2022-10-16 00:00:00'),(9,'Бумажный дом','',2017,'Испания','Хесус Кольменар','2017-11-01 00:00:00','2022-01-01 00:00:00'),(10,'Тьма','',2017,'Германия','Баран бо Одар','2017-05-13 00:00:00','2022-01-01 00:00:00');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
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
