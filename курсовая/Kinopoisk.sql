-- Работа представляет собой создание базы данных Кинопоиска. База данных состоит из 13 таблиц, 
-- отвечающих основным запросам сервиса - хранение данных о пользователях, информацию об их подписках и лайках, фильмах и сериалах, актерском и режиссерском составе, рейтинге. 
-- По задумке, данная структура позволяет хранить основную информацию сервиса.

-- База данных состоит из 12 таблиц, а именно:
-- 1. таблицы, хранящие данные о контенте: movies, series
-- 2. таблицы, хранящие данные пользователей: users, profiles
-- 3. таблицы, хранящие данные об активности пользователей: likes, subscription, payments
-- 4. и иные таблицы: genres, years, countries, actors, directors

DROP DATABASE IF EXISTS kinopoisk;
CREATE DATABASE kinopoisk;
USE kinopoisk;

-- Таблица пользователей

CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  first_name VARCHAR(100) COMMENT "Имя",
  last_name VARCHAR(100) COMMENT "Фамилия",
  email VARCHAR(100) COMMENT "Почта",
  phone VARCHAR(100) COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователь";

-- Таблица профилей

CREATE TABLE profiles (
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя", 
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  photo_id INT UNSIGNED COMMENT "Ссылка на основную фотографию пользователя",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT "Профиль";

-- Таблица фильмов 

CREATE TABLE movies (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(100) COMMENT "Название фильма",
  movie_description VARCHAR(255) COMMENT "Описание",
  production_year INT UNSIGNED NOT NULL COMMENT "Год создания",
  country VARCHAR(100) COMMENT "Город",
  director VARCHAR(100) COMMENT "Режиссер",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время загрузки на сервис",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки" 
) COMMENT "Фильм";

-- Таблица сериалов
 
CREATE TABLE series (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(100) COMMENT "Название сериала",
  series_description VARCHAR(255) COMMENT "Описание",
  production_year INT UNSIGNED NOT NULL COMMENT "Год создания",
  country VARCHAR(100) COMMENT "Город",
  director VARCHAR(100) COMMENT "Режиссер",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время загрузки на сервис",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки" 
) COMMENT "Фильм";

-- Таблица жанров

CREATE TABLE genres (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильм",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  genre VARCHAR(100) COMMENT "Название жанра",
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
) COMMENT "Жанры"; 

-- Таблица годы

CREATE TABLE years (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильм",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  years YEAR COMMENT "Указание года",
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
) COMMENT "Годы";

-- Таблица стран

CREATE TABLE countries (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильм",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  name VARCHAR(255) COMMENT "Название страны", 
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
) COMMENT "Страны";

-- Таблица актеры

CREATE TABLE actors (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  first_name VARCHAR(100) COMMENT "Имя",
  last_name VARCHAR(100) COMMENT "Фамилия",
  career VARCHAR(100) COMMENT "Деятельность",
  birthday_at DATE COMMENT "Дата рождения",
  country_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка страну", 
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильм",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id),  
  FOREIGN KEY (country_id) REFERENCES countries(id)
) COMMENT "Участники";

-- Таблица режиссеры

CREATE TABLE directors (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  first_name VARCHAR(100) COMMENT "Имя",
  last_name VARCHAR(100) COMMENT "Фамилия",
  career VARCHAR(100) COMMENT "Деятельность",
  birthday_at DATE COMMENT "Дата рождения",
  country_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка страну",
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильмы",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id),
  FOREIGN KEY (country_id) REFERENCES countries(id)
) COMMENT "Режиссер";

-- Таблица оценок

CREATE TABLE likes (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
  like_type INT DEFAULT '0',
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  movie_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на фильм",
  series_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на сериал",
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
) COMMENT "Оценки";

-- Таблица подписок

CREATE TABLE subscription (
  subscription_id SERIAL PRIMARY KEY COMMENT "Индентификатор подписки",
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  status ENUM('active', 'inactive') NOT NULL COMMENT "Статус подписки",
  FOREIGN KEY (user_id) REFERENCES users(id)
  ) COMMENT "Подписка";
  
  -- Таблица оплаты
  
CREATE TABLE payments (
  payment_id SERIAL PRIMARY KEY COMMENT "Индентификатор оплаты",
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  status TINYINT DEFAULT '0',
  FOREIGN KEY (user_id) REFERENCES users(id)
  ) COMMENT "Оплата";