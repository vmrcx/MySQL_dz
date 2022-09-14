-- Подсчитайте средний возраст пользователей в таблице users.

INSERT INTO users (name, birthday_at) 
VALUES 
('Елена', '1979-04-19'),
('Кирилл', '2001-08-15'),
('Анастасия', '2001-12-26'),
('Дарья', '2000-04-15'),
('Виктория', '2012-04-17'),
('Алексей', '1977-11-01'),
('Максим', '1998-12-13'),
('Дмитрий', '2000-02-02'),
('Ася', '1994-09-13'),
('Юрий', '1997-05-15');

select * from users;

SELECT AVG(floor((to_days(now()) - to_days(birthday_at)) / 365.25)) AS age 
FROM users;

-- Подсчитайте произведение чисел в столбце таблицы

SELECT * FROM storehouses_products;

SELECT ROUND(EXP(SUM(LN(id)))) FROM storehouses_products;