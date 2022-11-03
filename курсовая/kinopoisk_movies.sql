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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) DEFAULT NULL COMMENT 'Название фильма',
  `movie_description` varchar(255) DEFAULT NULL COMMENT 'Описание',
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
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Майор Гром: Чумной Доктор','Честный полицейский ловит мстителя в маске, убивающего коррупционеров. Супергеройское кино по комиксу Bubble',2021,'Россия','Олег Трофим','2007-06-12 00:00:00','2012-04-23 00:00:00'),(2,'Операция «Ы» и другие приключения Шурика','',1965,'СССР','Леонид Гайдай','2018-04-19 00:00:00','2022-05-17 00:00:00'),(3,'Волк с Уолл-стрит','Восхождение циника-гедониста на бизнес-олимп 1980-х. Блистательный тандем Леонардо ДиКаприо и Мартина Скорсезе',2013,'США','Мартин Скорсезе','2005-12-12 00:00:00','2012-09-10 00:00:00'),(4,'1+1','',2011,'Франция','Оливье Накаш','2019-11-24 00:00:00','2020-08-04 00:00:00'),(5,'Паразиты','Семья бедняков обманом получает работу в доме богачей. Южнокорейская драмеди, которая взяла четыре «Оскара» ',2019,'Южная Корея','Пон Джун-хо','2020-01-01 00:00:00','2022-11-03 14:21:09'),(6,'Джентльмены ','Наркобарон хочет уйти на покой, но криминальный мир не отпускает. Успешное возвращение Гая Ричи к корням',2019,'Великобритания','Гай Ричи','2020-01-01 00:00:00','2022-03-11 00:00:00'),(7,'Унесённые призраками','Девочка должна спасти своих родителей в мире духов. Шедевр Хаяо Миядзаки, фаворит анимационных рейтингов мира',2001,'Япония','Хаяо Миядзаки','2007-03-06 00:00:00','2022-11-03 00:00:00'),(8,'Молодой Папа','Глава Ватикана ломает шаблоны и потрясает устои. Неотразимый Джуд Лоу в провокационном шоу Паоло Соррентино',2016,'Италия','Паоло Соррентино','2017-04-12 00:00:00','2022-10-10 00:00:00'),(9,'Невидимый гость','Адвокат Вирджиния пытается понять, виновен ли ее подзащитный. Разговорный детективный триллер из Испании',2016,'Испания','Ориол Паоло','2017-10-19 00:00:00','2022-11-03 00:00:00'),(10,'Достучаться до небес','Смертельно больные Мартин и Руди едут к морю на угнанной машине. Роль, сделавшая Тиля Швайгера суперзвездой',1997,'Германия','Томас Ян','2008-12-05 00:00:00','2022-04-05 00:00:00');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03 15:55:14
