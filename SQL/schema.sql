CREATE DATABASE chat;
USE chat;


DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms
(
id_room int NOT NULL AUTO_INCREMENT,
roomname text NOT NULL,
PRIMARY KEY (id_room)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
id_user int NOT NULL AUTO_INCREMENT,
username text NOT NULL,
PRIMARY KEY (id_user)
);

DROP TABLE IF EXISTS Messages;
CREATE TABLE Messages
(
id_message int NOT NULL AUTO_INCREMENT,
id_user int NOT NULL,
id_room int NOT NULL,
text text NOT NULL,
createdAt date NOT NULL,
PRIMARY KEY (id_message)
);

ALTER TABLE `Messages` ADD FOREIGN KEY (id_user) REFERENCES `Users` (`id_user`);
ALTER TABLE `Messages` ADD FOREIGN KEY (id_room) REFERENCES `Rooms` (`id_room`);
