CREATE TABLE personels(
	id SERIAL,
	name VARCHAR(20),
	age INTEGER,
	salary REAL,
	email VARCHAR(50)
);
DROP TABLE personels

INSERT INTO personels VALUES(1, 'Ali', 39, 12500, 'ali@gmail.com'),
(2, 'Derya', 28, 15000, 'derya@yahoo.com'),
(3, 'Sevim', 24,25000, 'sevim@hotmail.com'),
(4, 'Yusuf', 32,18000, 'yusuf@gmail.com'),
(5, 'Halil', 48,22000, 'halil@gmail.com'),
(6, 'Ece', 54, 21000, 'ece@gmail.com'),
(7, 'Can', 38, 19000, 'can@gmail.com'),
(8, 'Elif', 27, 14000, 'elif@gmail.com'),
(9, 'Ezgi', 35, 21000, 'ezgi@gmail.com');

SELECT * FROM personels;