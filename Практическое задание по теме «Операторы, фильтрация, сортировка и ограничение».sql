-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR (255) COMMENT 'Имя покупателя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME,
	updated_at DATETIME
) COMMENT = 'Покупатели';

SET SQL_SAFE_UPDATES = 0;

UPDATE users 
SET  
created_at = NOW(),
updated_at = NOW();

SET SQL_SAFE_UPDATES = 1;

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR (255) COMMENT 'Имя покупателя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
) COMMENT = 'Покупатели';


INSERT INTO users (name, created_at, updated_at) 
VALUES 
('Елена', '20.09.2011 11:30', '12.02.2017 18:45'),
('Кирилл', '30.07.2008 15:56', '30.03.2019 08:38'),
('Анастасия', '12.12.2012 12:12', '24.05.2020 04:44'),
('Дарья', '09.01.2007 18:25', '05.06.2022 00:02'),
('Виктория', '18.03.2019 09:00', '02.05.2020 17:50'),
('Алексей', '04.02.2009 11:11', '07.10.2018 01:35'),
('Максим', '13.09.2013 21:08', '05.07.2019 03:13'),
('Дмитрий', '31.12.2010 13:45', '01.02.2021 08:25'),
('Ася', '14.06.2011 16:52', '03.01.2020 20:03'),
('Юрий', '23.01.2014 22:55', '03.09.2019 07:58');

SET SQL_SAFE_UPDATES = 0;

UPDATE users 
SET  
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'), 
updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users 
CHANGE  
created_at creaated_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
  
ALTER TABLE users 
CHANGE  
updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; 

SET SQL_SAFE_UPDATES = 1;

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id SERIAL PRIMARY KEY,
	products_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (products_id, value) 
VALUES 
('1', '1'),
('25', '3067'),
('100', '0'),
('33', '2500'),
('57', '67'),
('15', '0');

select * from storehouses_products;

SELECT products_id, value
FROM storehouses_products 
ORDER BY CASE 
WHEN value = 0 then 1 else 0 end, value;