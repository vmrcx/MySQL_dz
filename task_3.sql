#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Группы';

INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'illo', '2006-02-22 01:21:35', '1987-01-16 15:24:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'exercitationem', '1991-05-07 18:19:00', '2001-01-05 06:16:35');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'laboriosam', '2021-04-05 18:08:47', '1999-05-01 08:16:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'sint', '2014-01-22 10:57:33', '1998-05-17 10:54:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'rem', '2022-06-24 17:57:17', '1994-07-30 18:46:59');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'explicabo', '2005-07-31 19:34:02', '1970-11-23 23:30:44');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'nihil', '1989-07-26 02:44:25', '2022-04-09 11:42:18');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (10, 10, '2001-07-11 05:46:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (10, 17, '1996-03-13 22:31:13');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (11, 11, '1989-12-22 23:44:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (11, 18, '1993-02-05 04:28:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (12, 12, '1998-11-12 02:55:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (12, 19, '1989-12-18 03:55:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (13, 13, '1977-11-05 07:37:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (14, 14, '1986-11-01 21:12:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (15, 15, '1970-11-04 19:16:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (16, 16, '1973-08-03 17:36:57');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `status_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица дружбы';

INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (10, 10, 7001, '1971-06-20 09:16:20', '2005-12-15 05:59:37', '1994-06-27 20:30:59', '1981-09-21 00:11:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (11, 11, 723531, '2017-02-25 19:57:08', '2017-05-25 20:03:09', '1997-08-22 09:27:07', '1983-12-31 00:05:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (12, 12, 852631, '2006-08-14 04:49:28', '1981-03-23 12:23:04', '1992-12-28 18:24:09', '1989-06-13 12:37:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (13, 13, 2326, '1997-10-16 01:29:15', '1997-06-25 14:10:38', '1998-05-18 23:22:12', '2010-12-29 18:03:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (14, 14, 1676, '1988-04-21 12:49:50', '2002-07-13 08:42:32', '1997-08-03 00:49:17', '2007-07-11 01:53:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (15, 15, 250994, '2002-01-18 13:44:52', '2014-05-25 05:36:51', '1980-04-18 12:29:28', '2002-04-28 10:46:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (16, 16, 20, '2005-07-07 21:12:51', '1980-02-13 08:37:34', '2003-04-12 06:09:13', '2011-01-02 16:19:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (17, 17, 48280296, '1972-01-08 11:44:59', '1973-09-24 16:43:06', '2001-09-29 09:09:48', '1985-01-23 07:44:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (18, 18, 584568, '2007-01-02 13:13:48', '1983-05-01 01:26:19', '2014-07-22 22:43:28', '1983-05-23 11:41:17');


#
# TABLE STRUCTURE FOR: friendship_statuses
#

DROP TABLE IF EXISTS `friendship_statuses`;

CREATE TABLE `friendship_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статусы дружбы';

INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'incidunt', '1989-04-20 03:31:49', '1981-07-17 22:22:42');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'enim', '1987-10-24 15:36:19', '1973-08-23 07:10:34');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'reprehenderit', '1978-06-04 19:33:38', '2017-10-31 06:18:30');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'impedit', '1988-01-03 22:02:46', '1999-07-02 16:48:37');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'id', '1979-07-23 05:44:53', '2013-02-23 09:45:31');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'accusantium', '1971-04-25 00:22:22', '2019-11-18 14:45:23');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'et', '2020-03-30 01:07:34', '2017-04-04 14:53:58');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'non', '2009-10-17 09:52:10', '2008-08-13 02:15:57');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'iure', '2003-10-31 07:24:33', '2000-05-20 09:58:40');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'deserunt', '1981-11-30 14:51:28', '1978-05-05 04:10:45');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'voluptatem', '2010-07-27 04:17:18', '1995-11-23 14:10:22');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'neque', '1978-08-17 15:56:32', '1972-05-27 08:22:12');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'aut', '1991-11-04 08:11:56', '2005-01-05 02:09:22');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'similique', '1989-09-18 10:26:28', '1982-09-05 12:30:30');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int(11) NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Метаданные файла' CHECK (json_valid(`metadata`)),
  `media_type_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';

INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (10, 10, 'saepe', 17608, NULL, 2, '2003-04-22 00:00:24', '1988-01-13 00:17:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (11, 11, 'quae', 13602, NULL, 19349, '1984-05-17 16:02:20', '2021-05-10 15:33:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (12, 12, 'odio', 12932, NULL, 238503, '1992-01-28 13:58:39', '1998-02-10 12:25:49');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (13, 13, 'labore', 57367, NULL, 19741, '1987-02-03 03:00:12', '2022-06-13 10:14:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (14, 14, 'dolorem', 93196, NULL, 4988, '2020-02-26 16:10:53', '1975-02-11 07:47:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (15, 15, 'omnis', 2728, NULL, 74, '1988-06-18 01:45:40', '2020-05-06 08:15:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (16, 16, 'temporibus', 62800, NULL, 420811, '1983-04-19 05:13:11', '1972-08-08 15:53:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (17, 17, 'ea', 43454, NULL, 20370747, '2021-08-01 23:07:26', '1971-08-07 03:34:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (18, 18, 'aut', 13095, NULL, 39, '2003-12-03 05:26:08', '2012-12-18 21:03:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (19, 19, 'consequuntur', 6827, NULL, 3, '2021-09-11 03:53:08', '2019-07-22 23:19:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (20, 10, 'reiciendis', 20475, NULL, 860, '2018-02-21 15:27:55', '1977-09-08 21:12:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (21, 11, 'exercitationem', 12992, NULL, 0, '1981-02-16 21:03:18', '1982-08-30 08:59:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (22, 12, 'minus', 86236, NULL, 43584005, '2006-06-17 11:17:14', '2004-11-12 15:51:01');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (23, 13, 'quasi', 17601, NULL, 407610377, '2001-05-06 12:54:41', '1975-01-22 23:40:11');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (24, 14, 'est', 85582, NULL, 1369344, '2003-06-11 22:01:32', '2005-06-18 22:57:45');


#
# TABLE STRUCTURE FOR: media_likes
#

DROP TABLE IF EXISTS `media_likes`;

CREATE TABLE `media_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который поставил лайк',
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на медиа файл',
  `media_likes_number` int(10) unsigned NOT NULL COMMENT 'Количество лайков на медиафайлах',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `media_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиалайки';

INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (10, 10, 10, 4294967295, '2001-03-22 09:38:23');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (11, 11, 11, 4294967295, '2019-03-02 11:13:51');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (12, 12, 12, 4294967295, '1986-06-21 00:20:09');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (13, 13, 13, 4294967295, '1977-07-06 16:38:25');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (14, 14, 14, 4294967295, '1991-12-13 00:40:23');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (15, 15, 15, 4294967295, '2017-07-26 13:55:54');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (16, 16, 16, 4294967295, '2017-12-24 00:08:00');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (17, 17, 17, 4294967295, '1983-03-12 16:57:56');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (18, 18, 18, 4294967295, '1981-01-09 21:48:44');
INSERT INTO `media_likes` (`id`, `user_id`, `media_id`, `media_likes_number`, `created_at`) VALUES (19, 19, 19, 4294967295, '2005-06-08 13:39:11');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'et', '1997-06-15 14:30:05', '2016-02-13 08:29:43');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'minus', '2011-10-08 05:30:05', '1975-02-20 07:04:46');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'dolor', '2018-07-10 04:20:25', '1995-11-16 20:47:47');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'qui', '1970-03-26 14:10:08', '2013-08-07 21:01:26');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'non', '1979-03-11 00:18:17', '1970-06-20 09:06:32');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Сообщения';

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (10, 10, 10, 'Incidunt molestiae aliquam numquam provident quo. Est aliquam ea labore eius. Ea mollitia exercitationem magni officia sunt ut. Consequatur sunt perspiciatis nisi molestias. In omnis vel voluptatum nesciunt qui iusto. Nobis dolorem esse accusamus rem possimus impedit sunt. Natus aut odio voluptatem laudantium placeat dolorem. Iste ut voluptatem dicta et veniam. Non suscipit nobis ut quod ducimus placeat qui odio. Doloribus occaecati dolorem consequatur beatae minima dolorem sit. Eum necessitatibus est culpa et. A est vel maxime odit ad itaque. Deserunt veritatis adipisci et et vel ut. Totam id ipsam consequatur quisquam quae atque velit. Fuga ab et error veniam esse. Et consequuntur qui et qui minima doloremque.', 0, 0, '1985-08-16 19:43:56', '2000-04-30 09:11:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (11, 11, 11, 'Velit eius quibusdam sapiente. Nihil provident accusamus amet deleniti nihil saepe. Ullam ipsam facilis ut id laborum laudantium sit. Nulla assumenda ut aut qui maiores vel recusandae velit. Dolor odit et qui minima. Mollitia est minus ipsum labore. Modi est magnam consectetur omnis. Est nisi dolorum eos magni ut earum. Molestiae laudantium sed pariatur enim et non necessitatibus. Laudantium animi et numquam optio. Sapiente laborum voluptates inventore quis nisi. Consequatur quod eum consectetur sit. Ducimus id vel occaecati qui. Rerum iste numquam ut eius nobis nobis aut. Sint dolore earum quia voluptas ratione eos ea. Quis est qui suscipit culpa veniam iusto aut possimus. Numquam omnis quasi nulla vel quam cupiditate nisi consectetur.', 0, 1, '1986-11-16 04:00:18', '1973-09-02 21:20:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (12, 12, 12, 'Placeat accusamus sed quia veniam. Dicta magnam atque natus neque dignissimos. Odio consequatur expedita dolores quas laudantium maiores blanditiis. Dolorum eum impedit animi sed enim quis excepturi. Illo eveniet impedit eius vel ab repudiandae. Beatae nam pariatur qui consectetur ut dolor tempore. Ab consequatur eveniet enim ea aliquam. Rerum sequi quaerat suscipit cupiditate ipsa. Quibusdam alias magnam et quae est accusantium aut. Fugit rerum at officia. Rerum adipisci ex omnis numquam eveniet eum dolorum. Et qui perferendis doloremque provident doloremque repellat. Qui sequi nulla adipisci laboriosam perspiciatis quaerat ullam. Vel nam eius dolor odit. Ducimus qui eligendi aspernatur eius. Illum provident reiciendis est pariatur voluptatibus. Mollitia sed omnis dolorum est itaque molestiae quae recusandae. Ducimus quidem et non perspiciatis. Ut deserunt quisquam occaecati et. Eligendi possimus culpa repellat fuga cum voluptatum. Dolores at quo officia eum vel. Veritatis distinctio voluptatem dolorem praesentium. Excepturi et neque aut est. Nobis quae quam omnis delectus est excepturi voluptates voluptate. Officia et blanditiis porro. Eius deserunt eaque maxime quo aut molestiae asperiores perspiciatis. Adipisci et nihil eligendi placeat.', 0, 1, '2012-05-23 20:55:40', '2001-07-18 23:34:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (13, 13, 13, 'Autem quisquam porro animi quis labore illum. Incidunt temporibus sunt nihil cum. Facere id nulla autem error libero cupiditate delectus. Sit inventore placeat itaque reiciendis sit sed aliquid alias. Sed repellendus est in non aut perferendis aut. Facere natus amet dolore voluptatem cumque. Omnis iusto dolores nulla quis labore ex. Eaque voluptates reprehenderit corporis aliquid magnam quia sint vitae. Ut praesentium cum aliquid enim et. In iure in accusantium quia asperiores. Dicta ratione iure ut voluptatum laudantium et. Est enim sit libero at. Porro omnis suscipit in rerum voluptas veniam ipsum molestiae. Accusantium magnam quo natus iure consequatur atque eveniet doloribus. Eum repellat et beatae voluptate. Quod deleniti expedita et mollitia. Natus cupiditate voluptas quo iste mollitia vel. Mollitia voluptate non officiis esse. Est ut rerum ducimus ducimus. Minus nisi eaque assumenda explicabo est sed. Maiores facilis corrupti non nisi ut blanditiis labore maxime. Quod recusandae itaque fugiat totam incidunt doloribus officiis. Optio molestiae sunt autem dolorum.', 0, 1, '1998-02-24 02:32:43', '2007-11-16 12:45:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (14, 14, 14, 'Quo qui cupiditate a repellendus. Possimus perspiciatis nisi dolorum sit est et dolore est. Nihil reprehenderit qui explicabo ipsam. Illo rerum ut eaque quam consequatur voluptatum. Id cupiditate amet praesentium praesentium. Nisi quis ut et asperiores. Sint est iure illum explicabo sequi sint. Praesentium fugiat est rerum et. Et reprehenderit dolore praesentium assumenda perferendis sapiente. Repellat et et et quam libero laboriosam. Hic accusamus est quae porro. Harum enim quo aliquam harum ut est. Voluptatem repudiandae consequatur cumque aliquid. Enim consequatur culpa laudantium sed quis nulla odit. Saepe labore neque et aut sit quo rerum. Molestiae iure animi voluptas rerum vero. Velit expedita quae molestiae vel. Consequuntur velit ut consectetur praesentium. Vel voluptas qui sed fuga. Sit dignissimos sit nulla error commodi. Repellendus quibusdam a atque corrupti quo ipsum. Reprehenderit doloribus ipsa cupiditate quia sit.', 0, 0, '1985-09-27 15:55:44', '2002-12-23 10:34:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (15, 15, 15, 'Autem ullam non cum. Repellendus delectus quasi nam suscipit consequatur. Consequatur qui sit officia nostrum. Adipisci ut quibusdam laborum. Officia cupiditate impedit nisi neque possimus sunt. Libero qui esse et itaque. Qui quia inventore sed. Suscipit dolore quasi est tempore repudiandae. Ducimus porro et eius ipsum aliquid sit deleniti. Quos at magnam qui blanditiis consectetur ea numquam. At natus maiores iusto cumque aliquid et in. Vel et voluptatem qui eligendi. Qui corporis magni culpa. Vero perspiciatis incidunt culpa vel quia.', 1, 0, '2003-03-31 00:58:30', '1997-07-15 13:40:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (16, 16, 16, 'Natus et beatae maiores eum a aut voluptatem. Et non alias minus odit recusandae autem consequatur. Accusamus est recusandae autem velit. Quidem et a doloremque qui. Aut optio voluptate quaerat temporibus. Repellat quos iure voluptatem aperiam sed voluptatibus explicabo. Sint et accusamus molestiae quis dolore impedit corrupti. Aspernatur quod aut maiores nemo maiores. Vel ut blanditiis maxime perferendis dolor est. Qui a amet commodi dolore. Quis nobis aut est et. Consequatur inventore voluptatem unde et in consequatur. Et fugit aut sed autem vitae voluptatem voluptates. Expedita molestias adipisci est omnis. Iusto vitae voluptatem fuga sit et ducimus beatae. Quidem et est minima dolores illum nisi explicabo. Aut quibusdam et nam rerum ipsa omnis eligendi. Similique est sint cupiditate autem ratione tenetur voluptas.', 1, 0, '1986-07-04 15:28:40', '2003-09-19 15:28:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (17, 17, 17, 'Sit impedit labore a nobis voluptatem. Rerum distinctio voluptates assumenda et placeat nam necessitatibus sint. Est deserunt alias et ut consequatur. Aut eos et architecto aut animi praesentium non odio. Et soluta cum architecto alias quibusdam velit possimus. Veritatis dicta aut accusamus aut maiores qui. Nihil voluptates cumque rerum quia voluptas molestiae voluptatum. Autem voluptates ea quod asperiores. Incidunt quo quisquam voluptatem vero. Et eligendi est tempora architecto fugiat soluta. Optio esse sit facere earum. Ut autem dolores vitae. Saepe laboriosam voluptatem eos adipisci qui delectus eos ea.', 1, 1, '1973-06-27 19:28:42', '2009-02-02 11:50:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (18, 18, 18, 'Ad omnis reprehenderit qui officia sed harum esse. Porro et nisi ducimus natus. Laboriosam et vitae qui et ea. Consequatur sint incidunt mollitia consequatur mollitia. Sed eaque aut dolorem. Magnam labore iusto nihil omnis impedit ut reprehenderit reiciendis. Animi inventore et autem est. Fuga quas non inventore qui eum accusantium minus. Et et doloribus officia eos accusantium voluptas quis. Veritatis reiciendis ut dolorem sunt ullam tempora nihil. Non et ipsam excepturi eligendi provident ipsa accusamus. Velit et corporis itaque qui inventore vitae voluptatem. Dolore molestiae sunt in dicta. Voluptas debitis quasi saepe quos. Nihil beatae expedita labore et ipsa ratione quo hic. Consequatur est et numquam. Suscipit est in dolor voluptatem nihil facilis explicabo. Et aut impedit reprehenderit id quaerat. Sed in fuga minus assumenda. Minima voluptatibus quae incidunt rerum quia. Nihil ab tenetur nisi sint excepturi aut voluptatem. Sunt quo itaque minima modi aut officiis. Deserunt fugit cum at corrupti id neque. Ipsam animi ad omnis exercitationem minima vero quo. Suscipit dignissimos id ea saepe aut voluptatibus corporis. Quia tempore omnis quaerat ullam ut. Est non dignissimos quia voluptatem est sed.', 1, 1, '2021-09-26 22:52:35', '1975-03-24 03:55:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (19, 19, 19, 'In laboriosam ut quibusdam similique. Recusandae velit nam error accusantium. Et ut animi sed consequatur maxime. Est dolor magni aliquam unde itaque qui. Provident quia magnam accusamus sunt. Ratione dolores facilis et perspiciatis cumque. Quia totam et qui quia est. Quae aut eveniet aut rerum totam quis. Rerum rerum aspernatur praesentium quo ad ea. Explicabo dolore dignissimos iusto occaecati quos ullam autem quia. Cupiditate vero est modi odit incidunt pariatur fugiat. Est atque eius facere in quia non. Minus aut accusantium nesciunt blanditiis. Inventore corporis voluptatem qui dignissimos deleniti. Ducimus unde possimus aspernatur dolorum dolores cupiditate aperiam ut. Alias doloremque sit ut deleniti distinctio. Quis ipsam aut odio aspernatur. Fuga ex maxime cum sit cum aut tempora. Omnis ut eius nisi libero. Atque minima quis hic impedit non qui. Laboriosam incidunt sed maxime reiciendis nisi ipsam sit. Dolores consectetur totam sequi quia nam recusandae aut. Architecto perspiciatis sint magnam explicabo ab. Neque enim itaque nam quod. Dignissimos labore repudiandae nesciunt maiores neque commodi enim. Illum et natus sit et excepturi ea aliquid.', 0, 0, '2012-11-13 18:43:01', '2005-02-10 15:28:37');


#
# TABLE STRUCTURE FOR: photo_albums
#

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название альбома',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Фотоальбомы';

INSERT INTO `photo_albums` (`id`, `name`, `user_id`, `created_at`) VALUES (3, 'minus', 10, '2019-02-19 14:07:24');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`, `created_at`) VALUES (4, 'assumenda', 11, '2015-11-18 16:15:01');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`, `created_at`) VALUES (5, 'iste', 12, '2005-03-08 07:44:27');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`, `created_at`) VALUES (6, 'eaque', 13, '2008-03-29 01:50:08');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`, `created_at`) VALUES (7, 'consequatur', 14, '2009-01-14 16:00:56');


#
# TABLE STRUCTURE FOR: photos
#

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `album_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время опубликования',
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Фотографии';

INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (10, 10, 3, '1993-08-11 10:30:58');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (11, 11, 4, '2012-03-08 19:23:31');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (12, 12, 5, '2014-05-22 17:01:37');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (13, 13, 6, '1986-04-23 18:21:50');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (14, 14, 7, '2000-02-08 03:58:43');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (15, 15, 3, '1984-06-17 05:56:28');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (16, 16, 4, '1986-02-02 06:45:11');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (17, 17, 5, '1975-06-10 21:36:15');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (18, 18, 6, '1988-12-28 18:51:29');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (19, 19, 7, '1992-08-25 00:45:02');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (20, 10, 3, '1982-08-27 09:37:27');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (21, 11, 4, '2006-01-13 02:57:25');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (22, 12, 5, '1999-05-28 05:06:02');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (23, 13, 6, '2006-12-06 17:10:37');
INSERT INTO `photos` (`id`, `user_id`, `album_id`, `created_at`) VALUES (24, 14, 7, '1979-10-10 05:18:38');


#
# TABLE STRUCTURE FOR: post_likes
#

DROP TABLE IF EXISTS `post_likes`;

CREATE TABLE `post_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который поставил лайк',
  `post_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пост',
  `post_likes_number` int(10) unsigned NOT NULL COMMENT 'Количество лайков постах',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Лайки на постах';

#
# TABLE STRUCTURE FOR: posts
#

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текст поста',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Посты';

INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (10, 10, 'Dolorem neque eius tempora id omnis eveniet dolores ut. Officia deleniti aut voluptatem. Occaecati sint ipsa error autem similique. Ducimus dolore ut sapiente vitae commodi quis rerum. Officia est blanditiis sequi debitis quam sit. Voluptatem dolorum quibusdam quaerat consequuntur nihil molestiae et eligendi. Dolorem velit harum nesciunt ipsam qui qui aut. Temporibus qui omnis officiis aut. Deserunt odit dolores numquam occaecati molestiae illo quod. Et qui quibusdam consectetur molestiae est omnis unde est. Veniam veniam ullam aut veniam. Totam laboriosam eum officia et inventore quia molestiae. Aspernatur quod dolor debitis est non aliquid. Eos aspernatur aliquam velit deleniti officia qui. Quidem in sapiente ipsam nisi optio voluptatem. Sint quibusdam at beatae qui vero. Omnis est a impedit sed voluptate. Et vel veniam deserunt et modi id facilis. Quia molestiae quia occaecati cum qui eum ab ut. Et atque ut nihil recusandae nostrum sed. Laboriosam labore voluptatum unde omnis maxime mollitia minus. Est qui qui vitae corporis. Suscipit dignissimos non voluptas harum. Aut corrupti debitis omnis tenetur aut non quis. Enim repellat dicta a quia sunt eligendi eos. Iste nesciunt labore soluta et neque. Nisi suscipit deleniti ut sed sunt voluptatem dicta. Fugiat aut blanditiis eum tempora sunt et inventore. Eos sunt rerum culpa itaque ipsum inventore. Neque nihil ut voluptatem hic voluptatem. Accusantium ab ut sunt quibusdam distinctio sunt. Dolor aliquid est cupiditate quia ut nesciunt. Velit similique possimus eaque. Cupiditate laudantium nihil et. Quidem blanditiis ullam reiciendis illo veritatis repellendus. Commodi voluptas temporibus assumenda fugit qui. Reiciendis cumque pariatur ut sed. Ea corrupti dolor pariatur voluptatibus minima quae quidem. Suscipit praesentium quos ut voluptatem illum. Inventore dolores excepturi consequatur ut. Ratione eius architecto unde maxime qui est. Et fuga sint nobis enim consectetur. Velit omnis hic facilis hic labore laboriosam. Beatae nostrum quia impedit alias. Omnis maiores odit vitae. Amet reiciendis nulla ex corporis. Neque quidem et aperiam voluptatem architecto voluptatem error. Nulla ut sequi accusantium natus reiciendis. Vel voluptate voluptate alias culpa nobis repellendus dolor deserunt. Suscipit est illo architecto sint est. Sed at rerum excepturi assumenda mollitia. Sit veniam inventore aut aliquam. Dignissimos hic hic omnis autem quis earum. Autem animi eos eligendi aliquam ut et possimus. Ullam ratione suscipit nobis. Veniam autem qui rerum repellendus. Consequatur harum consectetur accusantium perferendis. Id fugiat adipisci iste aspernatur beatae provident. Id voluptatem earum et voluptatem est nemo. Quia officia qui facere id molestiae eius. Repellendus quia sunt aut. Voluptas sunt officiis recusandae. Est est non modi laborum adipisci officiis perferendis. Sed deleniti harum voluptatem alias nobis corrupti ipsum nesciunt. Voluptas ipsam doloribus cupiditate est temporibus quos est. Omnis totam sit soluta quibusdam. Quia laborum commodi iure voluptas voluptas. Voluptates beatae necessitatibus ut possimus minima. Explicabo voluptates autem laboriosam velit. Facilis voluptate qui vel itaque molestiae eum. Et iste et rerum architecto fuga quo.', '1996-10-05 22:54:50', '2008-07-20 19:56:00');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (11, 11, 'Harum totam ipsa ipsa natus nostrum nobis aperiam. Quo deserunt sit consequatur expedita nisi et et consequatur. Quis modi cumque maxime aperiam rerum hic. Incidunt similique aperiam error. Aperiam dicta sed assumenda ut impedit praesentium eum qui. Quibusdam rerum quo quia cupiditate rerum iusto. Qui ducimus tempore aliquam totam sed et. Accusamus accusamus rerum earum rem aut. Modi omnis rem est est. Nihil labore et quaerat libero aut minima. Quia aut velit qui iste qui qui sed non. Itaque eos quidem deserunt. Consequuntur libero sunt quo veritatis fugiat eum maxime. Doloribus dolores ut magnam voluptas voluptas quia. Nulla quidem nihil sit consequatur accusamus quia. Dolorum ad id est possimus dolorem. Quia occaecati doloribus eius velit. Provident ipsum doloremque illum incidunt voluptas beatae rerum. Ex ut culpa soluta blanditiis maiores fugiat enim. Dolores doloremque accusamus est aspernatur illo amet quia. Sequi sit laboriosam quia dolore possimus. Culpa fuga error et in beatae dolorum rem. Blanditiis quod neque voluptate et expedita ea. Architecto voluptatibus harum totam. Deserunt eos autem aliquam nemo et veniam. Optio eius assumenda perspiciatis corrupti amet. Consectetur ex eaque minima saepe. Doloremque ut ipsam necessitatibus beatae blanditiis nisi earum. Ducimus aut ut facilis consequatur nemo deleniti. Eius aut illum minima ut qui laboriosam ut ab. Occaecati hic maxime sint a perferendis quaerat. Quasi esse in exercitationem ad assumenda doloremque quibusdam. Et architecto vel eum. Quas non sint id exercitationem deserunt. Provident unde quia asperiores hic excepturi autem aut. Quibusdam non corrupti aut aliquid suscipit est. Qui maiores perferendis quo quaerat. Aliquam voluptatum dolor temporibus unde et. Atque iure dolorem soluta nostrum itaque. Est et est sit aut unde esse sunt. Facere delectus pariatur aut nihil. Quia porro et voluptas exercitationem ab. Rerum eos ut repellendus ex. Hic doloremque cupiditate doloribus alias. Dolorem doloremque vel perferendis officiis omnis reiciendis. Libero ut sequi voluptatem aut et. Eum sed minus minus. Atque maxime quam debitis quos. Enim deserunt molestias sapiente architecto et aliquid. Nulla sed molestiae totam fugiat esse. Vel expedita non amet quos deserunt earum. Quos repudiandae esse molestias et qui veniam. Illum commodi dicta odit eos fuga quis. Nihil illo odit qui ea aperiam placeat. Consequatur reprehenderit voluptatum et occaecati. Quo eius ipsum eius. Quisquam fugiat enim ducimus eum dolorum officiis id. Assumenda fugiat illo sed ratione. Debitis nesciunt odio voluptatem voluptas voluptatem quia omnis et. Velit eum numquam repellendus itaque. Enim veritatis error sint molestiae omnis. Est deserunt in ut quos perferendis sit dicta.', '1981-12-14 23:04:42', '1974-10-28 14:43:19');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (12, 12, 'Aut vitae et et explicabo maiores temporibus. Consequuntur cupiditate sed et et iure dolorem. Omnis eum est ipsum qui dolores. Deleniti accusamus et suscipit magnam in voluptates libero. Fuga ipsam mollitia quo illum quo enim. Recusandae et libero rerum placeat at ipsum. Deleniti possimus illo quas dolore numquam doloremque mollitia maiores. Provident porro quibusdam aut incidunt occaecati a. Saepe sed ut doloremque mollitia. Non ut nihil nam excepturi. Molestias qui dolor dolorum. Ut id illum quia quam ipsum sit at quam. Sed corrupti mollitia et nam. Qui perferendis odit ut ut. Et et ratione cupiditate. Quia aut ea saepe iure. Nihil facilis blanditiis qui sapiente at assumenda. Nobis et aspernatur consectetur et a repudiandae. Ducimus sequi sit fuga sed eligendi neque quae. Impedit dolores sed quae quaerat ut exercitationem quo. Natus eos ea eos sunt dolores ab quo alias. Aspernatur sed nam quae impedit hic neque. Autem doloremque voluptatem repellat sint qui. Qui non accusamus facere dolore ad. Consequatur cumque cupiditate et laborum et est nemo. Atque ratione laborum deserunt neque soluta officiis sint. Qui provident fugiat est debitis veritatis modi. Fuga et repudiandae id ea. Facilis voluptate reiciendis fugit odit atque dignissimos harum est. Ipsam voluptas qui libero ea id quia porro distinctio. Consequatur expedita non quidem a voluptatem maxime.', '1990-08-07 06:12:18', '1985-01-28 06:43:00');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (13, 13, 'Quibusdam nihil suscipit id ratione nam. Enim in quidem in qui. Ut quas facere velit sint voluptas dolor. Sed alias excepturi molestiae mollitia architecto autem dolores. Doloribus aliquam modi blanditiis mollitia architecto. Perspiciatis aliquid ut laboriosam sint quis quibusdam. Quaerat a atque aut rerum inventore cum fugiat. Voluptatibus harum distinctio facilis recusandae. Quod quisquam libero vel. Ab earum incidunt quibusdam hic voluptatem nulla quas dolor. Dolorem consequuntur labore accusantium recusandae voluptas aut. Cupiditate qui facilis qui debitis nemo fugit neque. Rerum nobis animi dolor odio voluptas. In tempora accusantium dolor suscipit. Soluta qui debitis totam enim neque. Nisi et fuga enim veritatis. Iste earum quia soluta quo culpa et. Dolorem ut incidunt autem et autem. Neque non sit possimus corporis. Omnis voluptatibus reprehenderit sed sed ut dolore. Nostrum sit ullam iusto dolorem quidem incidunt est. Ut quam ipsum molestias sint vitae nulla odit. Ratione magni ut quia sit animi deleniti enim. Est sunt voluptate autem blanditiis et natus nam. Corporis minus velit molestiae odit tempora nihil necessitatibus. Sed voluptatibus voluptas modi aliquam magnam. Itaque ea ea id eum. Est nostrum laboriosam et ad qui quo. Illum dicta ut deserunt libero ullam. Magnam facilis aliquam illum impedit nostrum. Impedit quas est voluptate eligendi dolor sunt. Autem quia aut aspernatur fuga. Hic est saepe est illum aut.', '2006-04-09 01:01:29', '2018-04-14 03:05:38');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (14, 14, 'Pariatur vel ut omnis non. Laudantium quibusdam assumenda dolorem ipsam aut tempora sunt. Architecto autem vero nemo quia repellat quod. Enim quae necessitatibus culpa sit accusantium sunt. Omnis quia impedit alias ipsa. Excepturi eum assumenda ipsam esse dolor. Velit ut delectus et debitis. Ut nisi accusamus doloribus dolorum numquam facilis. Perspiciatis ea consequatur a vel deserunt. Doloribus quibusdam ea autem provident aut maiores. Est dolor fugit et unde nihil qui earum. Quia pariatur ducimus ex assumenda ea. Cum debitis explicabo rerum quis temporibus. Quia voluptatem ab excepturi aut alias et tempore. Ut nisi qui ea odio officiis nulla ea. Dolores itaque explicabo aut ut. Occaecati perferendis nihil voluptas vero. Itaque ratione nihil vitae alias est deserunt enim. Et eaque corrupti corrupti et eius ducimus corrupti. Nihil nesciunt asperiores nobis non ad iure. Rerum eligendi quis rerum eaque non asperiores et. Impedit quia consequuntur expedita dicta beatae distinctio. Architecto aut soluta quaerat repudiandae eaque dolorum est voluptas. Laudantium ea totam explicabo est. Hic at aperiam accusantium earum eos rerum. Maiores dicta corporis nihil ipsa aut. Omnis placeat eos nihil placeat. Earum a est et recusandae cum sed illo nobis. Inventore doloremque odit molestiae doloremque aut sunt. Est adipisci eum iusto magnam error perferendis nobis. Necessitatibus a commodi laborum ut nam et atque. Neque sint esse nulla eveniet unde culpa. Autem consequatur alias ea laudantium illum neque. Dicta iste culpa voluptates voluptatem est non corrupti. Et eos sint id velit libero. Eum minus quod eaque. In minima facere quis praesentium voluptas aspernatur. Quia dolorem libero sequi error dolore officia. Eum qui quia atque ipsum vero dolores minus. Molestias et at in asperiores architecto sit unde. Impedit magnam ut iure sunt delectus. Quos nam facere ex culpa tempora. Alias voluptatum harum dolorem quos et. Ex et nobis praesentium ipsam est maxime. Deleniti consequatur numquam voluptatem est. Aut enim aliquid neque et. Incidunt inventore ad omnis quisquam. Numquam molestias ea ab molestias.', '1987-10-15 06:17:06', '1975-02-09 00:15:51');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (15, 15, 'Natus est minus non explicabo. Ut eius sit occaecati ea corporis voluptatum iste. Maiores totam quis corporis odio aut voluptatem. Eum voluptate enim deserunt. Illum dolorem quae tenetur. Est voluptas beatae consequuntur magnam voluptatem voluptate est. Est earum itaque nisi consequatur. Autem qui beatae autem similique. Amet cum minus et non. Error aut est sunt dolorem quae et rerum. Dolorem ducimus et illo nihil. A qui illo aperiam illum. Iure aperiam corrupti natus aut. Rerum enim ut et sint. Ducimus eum deserunt quos voluptatem illum ea. Ea culpa perferendis pariatur velit id omnis ex. Debitis quas eos ratione officiis ratione quia dolor. Sed dolor non et optio earum autem. Vel nobis doloribus ratione corporis. Qui voluptatem fugit hic velit quos voluptatem quia perferendis. Et quibusdam voluptatibus doloribus sint enim sint non. Tenetur dolore est iusto sint perferendis ut. Ad est animi velit in voluptatum. Saepe vitae et officiis saepe excepturi. Est animi fugiat eos consectetur aut quia voluptatum. Mollitia harum temporibus in aut. Tempora est mollitia ut voluptates et. Odit cum et autem dignissimos doloribus consequuntur. Ipsum eum blanditiis fugit recusandae quia. Velit quo aut debitis aliquam dolorum cupiditate voluptatem. Saepe occaecati eos fugiat molestiae vero. Voluptatem et voluptatem libero enim dicta. Temporibus ut soluta dolor aliquam qui eos. Sint aspernatur impedit adipisci odio atque dolorem debitis. Et hic id molestiae alias. Quasi voluptatem quas possimus alias sunt. Sit nulla sit assumenda illum nihil. Aspernatur nobis aut ut magnam sequi beatae velit. Quisquam pariatur aspernatur porro est.', '1981-02-15 19:10:49', '2001-09-13 01:20:29');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (16, 16, 'Dicta iure et eos labore odit unde consequatur. Qui est amet et. Aut quidem rerum magni aut sunt debitis corporis. Quis consequatur maxime eius nam recusandae vel. Sed soluta repellendus repellendus et qui perspiciatis. Expedita laborum non perferendis corrupti possimus temporibus. Voluptatum quia aut et ad. Voluptas eaque et repellendus sit quo voluptatum. In repellendus exercitationem omnis dolores nisi eum maxime rerum. Dolorum laboriosam blanditiis aliquam dignissimos deserunt ad. Voluptatibus exercitationem animi perspiciatis quod earum. Possimus quod consectetur optio natus quisquam quaerat fugiat. Quia in accusamus cumque omnis dolore dolor. Temporibus sunt nihil voluptatibus velit saepe reiciendis. Adipisci laborum ipsa et. Est eos magni voluptatem earum. Eligendi qui atque sunt in explicabo facilis ipsum. Omnis magnam et dolores doloribus quam. At nihil et ratione id incidunt. Suscipit perferendis dolores porro amet incidunt ut non. Iste et facere necessitatibus explicabo quo qui libero. Sit facere atque qui omnis illo. Eius totam ut et commodi. Rem sint facilis commodi sit. Non amet similique autem accusantium exercitationem veritatis. Quo possimus nihil eius nobis maxime eos. Quaerat quod omnis fuga totam alias. Iure ratione et ut ut quos aliquid. Qui non aut voluptate commodi rem non officia. Rerum beatae culpa minima odit tempore ut temporibus. Doloribus et quis veniam. Facere totam rem enim quibusdam explicabo blanditiis quasi fugit. Necessitatibus accusantium est quas corrupti voluptas veritatis. Sapiente vero et deleniti sint ut possimus. Unde non molestiae ex iure id. Vel et odit asperiores laboriosam. Saepe quia minus voluptatum est amet qui facere. Est tempora excepturi magnam dicta. Ipsam temporibus maiores aut perferendis sint. Soluta ut id eos id necessitatibus qui quibusdam sint. Qui aut est iusto blanditiis. Velit rerum laudantium qui natus. Voluptas voluptas eum omnis nostrum. Nisi nulla est aut ut eos blanditiis ullam perspiciatis. Minima dolor consectetur rerum aut et. A eius ipsa non.', '1999-02-26 02:09:51', '2007-07-01 12:38:23');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (17, 17, 'Itaque est nisi non et repellat rerum autem qui. At quia sunt molestias ratione sint. Aspernatur occaecati quaerat consequuntur qui eum et doloribus. Ipsa corrupti eaque et debitis. Rerum ducimus eum labore rerum consequatur veritatis. Accusantium et dolorem deserunt culpa quas perspiciatis. Sunt suscipit consectetur voluptas et minus omnis ut. Molestiae quos fugiat totam. Quas ducimus voluptas optio sapiente est error repellat. Labore illo dolor ea voluptatibus sed. Dolor aut eum omnis molestiae sint ea recusandae. Expedita vitae qui totam. Qui nam quia id ducimus qui et totam dolor. Blanditiis debitis voluptate velit doloribus corporis aliquid. Et voluptatibus dolor et accusantium. At in doloremque sit ut. Deleniti et blanditiis quas nam. Officiis eos quisquam quidem qui officia et aut. Est distinctio modi sapiente maxime dolores. Possimus id vel sint est facilis. Nulla amet rerum cupiditate quia quia et cupiditate perspiciatis. Fuga delectus totam illum architecto fugiat incidunt. Ullam architecto voluptate rerum repellendus. Voluptas maiores libero veniam nihil eum. Exercitationem quos necessitatibus voluptatem recusandae voluptas. Maxime sequi accusantium quia sint fuga quisquam. Reprehenderit a fuga quia exercitationem deserunt. Voluptas alias iusto id corporis et. Sit natus suscipit incidunt voluptate. Ut unde ut perferendis. Itaque voluptatem mollitia ullam sit voluptatum nihil ducimus. Expedita culpa et quia esse esse. Possimus illo commodi dolorem vel. Qui eos a vero sed. Sit natus accusantium consequatur deserunt quam voluptatibus sunt. Sapiente accusamus sequi aperiam reprehenderit magni. Sed esse eos ut cupiditate aut eligendi enim. Autem ea molestiae minima inventore. Corporis consequatur autem quas et quod quasi laborum. Sed praesentium earum quia inventore iure inventore. Non fuga dignissimos nesciunt et dolor autem. Sunt perspiciatis delectus aut nemo. Nemo voluptatum tenetur blanditiis est sequi dolorem. Amet assumenda eveniet veritatis enim laborum. Est ut modi veritatis. Illo velit possimus excepturi et. Reiciendis quae et repellendus laboriosam quae. In magnam illum beatae laboriosam ut quo et qui. Quis et explicabo tenetur necessitatibus et aut ea. Sit et alias asperiores mollitia assumenda nulla. Inventore nostrum autem ab. Ad dicta ut ad dolore. Quia aut repellendus architecto. Soluta aut laudantium exercitationem ut quasi. Est quo reiciendis molestiae in officiis. Odio odio quibusdam laboriosam dicta laudantium qui qui. Cupiditate molestiae est consectetur dicta eum repellendus. Maiores deserunt quia odit. Exercitationem est in soluta.', '2007-09-26 16:28:55', '2000-02-07 14:23:01');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (18, 18, 'Fuga rerum assumenda perferendis eveniet animi rerum et sit. Explicabo at autem et temporibus expedita reprehenderit voluptatibus. Officia laudantium doloribus vero id voluptas eaque molestiae. Sed voluptate asperiores asperiores ut animi suscipit distinctio a. Aut ut cum perferendis suscipit ut non quos deleniti. Nesciunt soluta qui et debitis. Voluptatem quod quo labore minus eveniet officia et. Rerum expedita eum dolorem quis maiores odit. Sit omnis rerum molestiae et. Vel vel vel incidunt cum quia. Assumenda unde quia est sunt eos ea. Amet vitae laborum eum voluptas omnis vero ut. Dignissimos repellendus qui magnam vel. Quae officiis nemo aliquid. Non sed ipsam consequatur deserunt et voluptas dolor quo. Molestiae deleniti sed labore numquam cum. Expedita voluptas distinctio est nisi molestias id qui. Dicta quis tempore nemo cum. Aut id suscipit eos ex dolores. Illum doloremque quas unde perspiciatis quae sit. Exercitationem nemo magnam voluptatibus itaque aut qui ut exercitationem. Optio velit nobis rerum hic voluptates. Aliquid labore voluptates rerum dolore quia vero. Temporibus non est modi corrupti aut. Sunt deleniti ratione tenetur accusamus atque. Alias velit dolorem maxime rerum. Ut quis cum eos necessitatibus consequatur ex quia aspernatur. Porro illo temporibus sint eum. Quo sint porro consequuntur est cum aut. Neque sit debitis neque fuga consectetur. Sed quibusdam et sit eius. Voluptatem nihil eum mollitia similique nihil sapiente. Tenetur sapiente commodi et occaecati explicabo quibusdam et. Voluptate quis esse unde voluptate. Dolor praesentium ipsum voluptatem est voluptates ratione ratione. Fuga sint fuga deleniti tenetur. Eos magni laboriosam et molestias sequi quia. Culpa aut quasi libero corrupti ad. Ipsam sed veritatis est minima quo. Voluptas et eos quas magnam. Non expedita quos quasi et libero fugiat assumenda. Quae voluptate est quidem possimus ipsam ut. Aut culpa eos molestiae qui. Sit eius et quae quaerat itaque aut. Sapiente iure accusamus est repellat. Molestiae ea in repellendus voluptas modi. Voluptas labore vitae est quo dolorum vitae dicta. Voluptas expedita ipsam voluptatem. Quia voluptatem esse dolorum omnis nisi. Laudantium voluptas provident repudiandae atque ut inventore modi. Optio odit error dolorem sed ut tempora. Amet est sequi earum eum eos. Est est iusto aperiam et. Odio beatae recusandae quis tempora et commodi possimus quasi. Aut soluta amet sed. Modi quia dolores saepe veniam. Quos vitae nam sint at eaque. Animi non repellendus voluptates. Labore dolor amet doloremque ut. Odio dignissimos possimus aut aspernatur earum. Officiis ut velit optio dolorem facere error. Voluptatem quam voluptates facilis accusantium dicta eos. Aut rem quo harum tempora qui doloribus. Ipsam reprehenderit sit dolores dolores. Ea autem non tempora sit culpa eum placeat tempora. Totam consequatur et at ut delectus. Ducimus praesentium et temporibus omnis quaerat modi alias. Dolor totam vel molestias nemo ipsum alias. Omnis nam animi ut neque. Fugiat rerum repellat et. Molestiae tenetur quo dolores architecto perspiciatis quis sapiente.', '2014-06-19 02:24:22', '1997-05-07 01:38:19');
INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (19, 19, 'Aut voluptatem quibusdam atque voluptas occaecati molestias optio. Non quam et id et enim et qui atque. Et commodi earum vel sed voluptas voluptatum provident eveniet. Est et ut quia. Ut aspernatur placeat voluptatem adipisci velit sit. Voluptates autem at delectus accusantium. Ut ut aut nihil praesentium repellendus iste voluptatibus. Recusandae natus voluptas est quibusdam accusamus magni. Similique labore sequi similique laboriosam. Autem enim quia quia aut et ipsam et. Reiciendis explicabo nihil suscipit ab eveniet. Nisi a placeat iusto. Vel dolor voluptas ea aspernatur. Maxime quis omnis qui perspiciatis esse cum. Laudantium dignissimos iusto ipsum veritatis laudantium explicabo recusandae. Nulla pariatur at accusantium nesciunt optio et. Modi aperiam rerum ipsam libero doloribus. Esse iusto libero voluptates quo nostrum voluptas cupiditate. Dolor sit voluptatem similique veritatis expedita magnam architecto. Qui doloribus aspernatur est nam consequatur quis. Unde ullam voluptatem alias facilis libero ut. Rem animi eveniet quisquam in nam perferendis est dolorem. Fuga dignissimos neque est nulla. Ab sint sit et qui laborum. A dolorem repudiandae ab reprehenderit dignissimos. Ex assumenda voluptas et illum placeat quasi repellat. Sit id adipisci molestiae qui rerum quia. Neque dolorem laudantium impedit voluptatem. Est modi tenetur porro perferendis deserunt recusandae quas. Ea accusantium totam consequatur voluptatem quis sit porro. Laboriosam maiores numquam vitae iure dolores esse ut. Aspernatur odio quia fugiat. Sint suscipit neque neque minus aliquid et sit. Sapiente libero iusto omnis sed optio. Sequi debitis eligendi tempora repudiandae eaque aliquam. Non sed accusantium culpa dolor necessitatibus est cupiditate. Autem et aspernatur blanditiis aliquid labore ducimus numquam et. Eum eius maxime est architecto eum similique. Soluta animi sequi sunt rerum ipsam minus id aspernatur. Dolores omnis quis sed voluptas et odit est harum. Consequatur asperiores repellendus est possimus. Atque dolores sunt vero sed. Quos recusandae eos perspiciatis aut laudantium ducimus officiis. Dolor tempore eum debitis temporibus voluptatem ex optio. Consectetur autem ex quo at dolorem similique dolor unde. Eos in ducimus dolores enim labore. Omnis cumque est tempore autem dolor at qui. Corporis tenetur architecto debitis est inventore praesentium doloremque. Iste dicta iusto dolorem quibusdam. Eos aut quas debitis dolores. Iste illum unde iure placeat quae.', '1985-07-25 08:59:06', '2009-02-27 00:25:35');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `photo_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию пользователя',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текущий статус',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (10, '', '1995-07-26', 0, 'Quisquam quia et sint dolorem.', 'West Shaniaville', '4587849884131940864', '1983-11-14 20:53:32', '2006-02-03 21:03:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (11, '', '2018-09-21', 0, 'Magni quidem eius corrupti aut', 'Bergstromside', '4969932031071242240', '2020-06-19 22:20:25', '1976-11-03 03:11:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (12, '', '1990-04-04', 0, 'Ut fugit maxime eius neque aut', 'South Lesliefort', '2846828954262432256', '1983-04-06 10:58:10', '1988-01-02 03:28:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (13, '', '1993-06-21', 0, 'Odio velit dolorem voluptas no', 'North Libbyfurt', '1449337700427145984', '1987-09-27 15:28:15', '1978-01-16 06:36:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (14, '', '2000-09-04', 0, 'Blanditiis recusandae voluptat', 'Verdietown', '6601803139781218304', '1974-03-24 04:48:04', '2018-02-04 03:02:57');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (10, 'Kelley', 'Predovic', 'janelle06@example.com', '065-320-3666x99912', '2003-08-12 13:42:20', '1978-11-17 08:15:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (11, 'Delia', 'Cronin', 'cecile99@example.org', '069.012.6410', '2008-04-20 14:07:12', '1988-12-21 02:09:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (12, 'Kamille', 'Herman', 'gvon@example.com', '07413412748', '1974-11-29 18:02:18', '2004-06-20 05:43:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (13, 'Jaylon', 'Durgan', 'diamond14@example.com', '431.142.7629', '1999-07-09 13:21:50', '2016-07-16 02:25:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (14, 'Andreane', 'Crona', 'candice68@example.com', '875-201-2396x51669', '2011-02-25 13:38:31', '1985-01-05 00:35:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (15, 'Charity', 'Herzog', 'jerald.quitzon@example.com', '207.389.5647', '2006-10-18 21:49:48', '1974-08-07 06:21:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (16, 'Hyman', 'Graham', 'daniel.frederick@example.org', '(522)318-5975x9320', '1987-04-18 17:12:28', '2021-11-28 02:56:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (17, 'Marielle', 'Rowe', 'asha.quitzon@example.net', '991-060-5727', '1983-01-16 15:01:08', '2013-08-30 22:12:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (18, 'Zoe', 'Gutmann', 'lonie51@example.com', '718-013-3499', '1973-08-19 23:37:57', '1978-02-24 07:57:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (19, 'Quincy', 'Zboncak', 'vladimir.konopelski@example.com', '513.826.9539x2046', '2007-03-19 03:48:36', '2016-03-09 18:59:55');


