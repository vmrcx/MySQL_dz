-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

SELECT * FROM shop.users; 
SELECT * FROM sample.users; 
 
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1; 
DELETE FROM shop.users WHERE id = 1; 
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW products_catalogs AS 
SELECT p.name AS product, c.name AS catalog 
FROM products AS p 
LEFT JOIN catalogs AS c
ON p.catalog_id = c.id; 

-- Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.

CREATE USER shop_read;
CREATE USER shop;
GRANT SELECT ON shop.* to shop_read;
GRANT ALL ON shop.* to shop;

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello; 
 
DELIMITER // 
 
CREATE FUNCTION hello () 
RETURNS TINYTEXT NO SQL  
BEGIN 
 DECLARE hour INT; 
 SET hour = HOUR(NOW()); 
 CASE 
  WHEN hour BETWEEN 0 AND 5 THEN  
   RETURN "Доброй ночи"; 
  WHEN hour BETWEEN 6 AND 11 THEN  
   RETURN "Доброе утро"; 
  WHEN hour BETWEEN 12 AND 17 THEN  
   RETURN "Добрый день"; 
  WHEN hour BETWEEN 18 AND 23 THEN  
   RETURN "Добрый вечер"; 
 END CASE; 
END// 
 
DELIMITER ; 
SELECT NOW(), hello();

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER // 
 
CREATE TRIGGER validate_name_description_insert BEFORE INSERT ON products 
FOR EACH ROW BEGIN
IF NEW.name IS NULL AND NEW.description IS NULL THEN 
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Both name and description are NULL' 
END IF; 
END// 
 
INSERT INTO products 
 (name, description, price, catalog_id) 
VALUES 
(NULL, NULL, 12364.50, 6)// 
 
INSERT INTO products 
 (name, description, price, catalog_id) 
VALUES 
(NULL, 'IPS, Intel Celeron 3350, ядра: 2 х 1.1 ГГц', '19999.00', 9)//
 
INSERT INTO products 
 (name, description, price, catalog_id) 
VALUES 
('Digma EVE 14', NULL, '17999.00', 4)//