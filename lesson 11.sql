-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

CREATE TABLE logs (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
table_name VARCHAR(150) NOT NULL,
blank_id INT UNSIGNED NOT NULL,
blank_name VARCHAR(255)
) ENGINE = Archive;

DELIMITER //

CREATE TRIGGER users_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES (NULL, DEFAULT, "users", NEW.id, NEW.name);
END//

CREATE TRIGGER catalogs_insert AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES (NULL, DEFAULT, "catalogs", NEW.id, NEW.name);
END//

CREATE TRIGGER pruducts_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES (NULL, DEFAULT, "products", NEW.id, NEW.name);
END//

-- В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

HINCRBY addresses '127.0.0.1' 1
HGETALL addresses

HINCRBY addresses '127.0.0.2' 1
HGETALL addresses

HGET addresses '127.0.0.1'

-- При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.

HSET emails 'dara' 'daramishnova@gmail.com'
HSET emails 'borskaya' 'borskaya.ann2018@yandex.ru'
HSET emails 'galushko' 'galushko.carina@yandex.ru'

HGET emails 'galushko'

HSET users 'daramishnova@gmail.com' 'dara'
HSET users 'borskaya.ann2018@yandex.ru' 'borskaya'
HSET users 'galushko.carina@yandex.ru' 'galushko'

HGET users 'borskaya.ann2018@yandex.ru'