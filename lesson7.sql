-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

insert into orders (user_id)
select id from users where name = 'Олейников Константин';

insert into orders_products (order_id, product_id, total)
select last_insert_id(), id, 10 from products
where name in ('Фитнес-браслет Smarterra FitMaster Color');

insert into orders (user_id)
select id from users where name = 'Емельянов Георгий';

insert into orders_products (order_id, product_id, total)
select last_insert_id(), id, 3 from products
where name in ('Бойлер косвенного нагрева HAJDU ID 25 A');

insert into orders (user_id)
select id from users where name = 'Фимин Матвей';

insert into orders_products (order_id, product_id, total)
select last_insert_id(), id, 2 from products
where name in ('Платформа ASUS Mini PC AS PN41-BBC080MC BGA1338');

select users.id, users.name, orders.created_at
from users
join orders on users.id = orders.user_id;


-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	catalogs.name AS 'Каталог', 
    products.name AS 'Товары', 
    products.price AS 'Цена'
FROM products
JOIN catalogs ON catalogs.id = products.catalog_id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
id SERIAL PRIMARY KEY,
from_city VARCHAR(255),
to_city VARCHAR(255)
)

INSERT INTO flights (from_city, to_city) 
VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
id SERIAL PRIMARY KEY,
lable VARCHAR(255),
name VARCHAR(255)
)

INSERT INTO cities(lable, name) 
VALUES
('moscow', 'Москва'),
('novgorod', 'Новгород'),
('irkutsk', 'Иркутск'),
('omsk', 'Омск'),
('kazan', 'Казань');


SELECT 
	flights.id,
	from_city.name AS f,
	to_city.name AS t
FROM flights
JOIN cities AS fc ON flights.f = fc.lable
JOIN cities AS tc ON flights.t = tc.lable;

