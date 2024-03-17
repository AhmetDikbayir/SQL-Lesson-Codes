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
SELECT *
FROM personels
WHERE name  ILIKE 'a%';
--alternative query
SELECT *
FROM personels
WHERE name ~* '^a';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE name ILIKE '%n';
--alternative query
SELECT *
FROM personels
WHERE name ~* 'n$';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE email LIKE '%gmail%';
--alternative query
SELECT *
FROM personels
WHERE email ~* 'gmail';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE email NOT LIKE '%gmail%';
--alternative query
SELECT *
FROM personels
WHERE email !~* 'gmail';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE id IN (3,5,7,9);

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE age NOT IN (39, 48, 54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE age BETWEEN 30 AND 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE age NOT BETWEEN 30 AND 40;

-- 15) emaili olmayan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE email '';

--Added new data for testing age criteria and email criteria

INSERT INTO personels(id, name, age, email) VALUES (12, 'Deniz', 45, '');
INSERT INTO personels(id, name, age, email) VALUES (13, 'Ege', 40, '');

-- 16) emaili olan personel bilgilerini listeleyiniz.
SELECT *
FROM personels
WHERE email  ='';

-- 17) personel bilgilerini yaşa göre sıralayınız.
SELECT *
FROM personels
ORDER BY age;

-- 18) personel bilgilerini maaşa göre sıralayınız.
SELECT *
FROM personels
ORDER BY salary;

-- 19) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
SELECT age
FROM personels
ORDER BY age DESC;

-- 20) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
SELECT salary
FROM personels
ORDER BY salary DESC;

-- 21) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
SELECT *
FROM personels
ORDER BY salary DESC
LIMIT 3;