-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT users.id, 
	COUNT(messages.from_user_id) AS m_max
FROM messages
JOIN users ON messages.from_user_id = users.id
JOIN friendship ON friendship.friend_id = messages.from_user_id
WHERE messages.to_user_id = 45
GROUP BY users.id
ORDER BY m_max desc
LIMIT 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT 
	COUNT(*) AS total_likes_to_person,
	p.user_id,
	p.birthday
FROM media_likes AS lks
JOIN profiles AS p ON p.user_id
GROUP BY p.user_id
ORDER BY p.birthday DESC
LIMIT 10;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT profiles.gender, COUNT(profiles.gender) AS total
FROM media_likes
INNER JOIN profiles on profiles.user_id = media_likes.user_id
GROUP BY gender
ORDER BY total DESC;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT users.id,
	CONCAT(users.first_name, ' ', users.last_name) AS user,
	COUNT(messages.id) +
	COUNT(media_likes.id) +
	COUNT(post_likes.id) AS last_activity
FROM users
LEFT JOIN messages ON users.id = messages.from_user_id
LEFT JOIN media_likes ON users.id = media_likes.user_id
LEFT JOIN post_likes ON users.id = post_likes.user_id
GROUP BY users.id
ORDER BY last_activity
LIMIT 10;

