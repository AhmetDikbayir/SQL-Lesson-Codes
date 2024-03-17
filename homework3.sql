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

-- 1) Tablo bilgilerini listeleyiniz.
SELECT *
FROM personels;

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
SELECT name, age, salary
FROM personels;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
SELECT *
FROM personels
WHERE id = 8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
SELECT name, age, email
FROM personels
WHERE id = 5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE age>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE salary != 21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.


-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.


-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.


-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.





