CREATE TABLE personels(
	id SERIAL,
	name VARCHAR(20),
	age INTEGER,
	salary REAL,
	email VARCHAR(50)
);

INSERT INTO personels VALUES(1, 'Ali', 39, 12500, 'ali@gmail.com'),
(2, 'Derya', 28, 15000, 'derya@gmail.com');
