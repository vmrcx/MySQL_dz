-- Проверка заполенения таблиц
SHOW TABLES;

--  Отключила безопасный режим для внесения изменений в таблицы
SET SQL_SAFE_UPDATES=0;

SELECT * FROM users;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at OR updated_at < '2003-11-07';

SELECT * FROM movies;
UPDATE movies SET updated_at = NOW() WHERE updated_at < created_at OR updated_at < '2003-11-07';

SELECT * FROM series;
UPDATE series SET updated_at = NOW() WHERE updated_at < created_at OR updated_at < '2003-11-07';

SELECT * FROM actors;
-- Изменение ссылки на страну
UPDATE actors SET
	country_id = FLOOR(1 + RAND()*100); 
    
SELECT * FROM directors;
-- Изменение ссылки на страну
UPDATE directors SET
	country_id = FLOOR(1 + RAND()*100); 

SET SQL_SAFE_UPDATES=1;

-- Представления 

-- Вывести название фильма и актера

CREATE VIEW movie_and_actors AS 
   SELECT 
     movies.name AS mname, 
     CONCAT(actors.first_name, ' ', actors.last_name) AS actors
   FROM movies JOIN actors ON movies.movie_id = actors.movie_id
  JOIN actors ON actors.id = actors.actor_id ORDER BY movies.movie_id;  
SELECT * FROM movie_and_actors;


-- Вывести название фильма и страну

CREATE VIEW country_of_films AS 
   SELECT 
     movies.name AS mname, 
     countries.name AS cname
   FROM movies JOIN countries ON movies.movie_id = countries.movie_id
  JOIN countries ON countries.id = countries.countries_id ORDER BY movies.movie_id;  
SELECT * FROM country_of_films;

-- Запросы

-- Средняя оценка фильма

SELECT 
movies.name AS mname,
AVG(likes.like_type) AS score 
FROM movies LEFT JOIN likes ON movies.id = likes.movie_id
GROUP BY movies.id;

-- Количество лайков, поставленных одним пользователем

 SELECT 
 CONCAT(users.first_name, ' ', users.last_name) AS user,
 COUNT(likes.like_type) AS all_score
 FROM users
 LEFT JOIN likes ON users.id = likes.user_id
 GROUP BY users.id;

-- Статус подписки

DROP PROCEDURE IF EXISTS users_subscription;

DELIMITER //
CREATE PROCEDURE users_subscription (
	id BIGINT,
	s ENUM('active', 'inactive')) 
BEGIN
	INSERT INTO subscription (user_id, status) VALUES (id, 'active');
END//
DELIMITER ;

DROP TRIGGER IF EXISTS users_subscription_from_payments;

DELIMITER //
CREATE TRIGGER users_subscription_from_payments
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
	CALL users_subscription ((SELECT user_id FROM payments WHERE created_at = NOW()), 'active');
END//
DELIMITER ;


DROP VIEW IF EXISTS subscription_status;

CREATE VIEW subscription_status AS
SELECT CONCAT(u.first_name, ' ', u.last_name) AS user, 
(CASE WHEN s.status IS NULL THEN 'inactive' ELSE s.status END)
AS status FROM users AS u
LEFT JOIN subscription AS s
ON u.id = s.user_id; 

SELECT * FROM subscription_status;


