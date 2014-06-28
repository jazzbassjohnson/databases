CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS `rooms`
CREATE TABLE `rooms`
(
  `room_id` INT AUTO_INCREMENT PRIMARY KEY,
  `room_name` varchar(20)
);


/* Create other tables and define schemas for them here! */
DROP TABLE IF EXISTS 'users'
CREATE TABLE `users`
(
  `user_id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_name` varChar(10),
  `user_password` varChar(10),
);

/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/

DROP TABLE IF EXISTS `messages`
CREATE TABLE messages
(
  `message_id` INT AUTO_INCREMENT PRIMARY KEY,
  `message_text` varChar(50),
  `user_id` INT,
  `room_id` INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);









-- INSERT INTO supportContacts
-- (roomName)
-- VALUES
-- ('Gar&Cel');
