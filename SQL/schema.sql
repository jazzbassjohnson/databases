CREATE DATABASE chat;
USE chat;


DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms
(
id_room int(10) NOT NULL AUTO_INCREMENT,
roomname varchar(100) NOT NULL,
PRIMARY KEY (id_room)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
id_user int(10) NOT NULL AUTO_INCREMENT,
username varchar(100) NOT NULL,
PRIMARY KEY (id_user)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages
(
id_message int(10) NOT NULL AUTO_INCREMENT,
id_user int(10) NOT NULL,
id_room int(10) NOT NULL,
text varchar(100) NOT NULL,
createdAt int(10) NOT NULL,
PRIMARY KEY (id_message)
);

ALTER TABLE `messages` ADD FOREIGN KEY (id_user) REFERENCES `users` (`id_user`);
ALTER TABLE `messages` ADD FOREIGN KEY (id_room) REFERENCES `rooms` (`id_room`);
