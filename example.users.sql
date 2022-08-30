DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR (20) COMMENT 'Никнейм'
) COMMENT 'Пользователи';
INSERT INTO users VALUES
	(DEFAULT, 'Vikipiki'),
	(DEFAULT, 'DunderPufflin'),
	(DEFAULT, 'MicHAelScoTT');