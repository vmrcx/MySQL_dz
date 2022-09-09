-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT from_user_id, COUNT(from_user_id) AS total
FROM messages
WHERE to_user_id = 6
GROUP BY from_user_id
ORDER BY total  
LIMIT 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select media_likes_number, user_id
from media_likes
WHERE user_id IN ( 
SELECT user_id FROM profiles WHERE (YEAR(birthday)) > 2012)
GROUP BY user_id
LIMIT 10;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT profiles.gender, COUNT(profiles.gender) AS total
FROM media_likes
INNER JOIN profiles on profiles.user_id = media_likes.user_id
GROUP BY gender
ORDER BY total DESC

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT id, updated_at
FROM users
ORDER BY updated_at 
LIMIT 10;
