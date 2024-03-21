drop table ogrenciler;
create table ogrenciler(
ogr_no int PRIMARY key, 
ogr_isim VARCHAR(30),
sinif int,
ders_id int);

insert into ogrenciler values(12,'Enes Erdem', 10, 1);
insert into ogrenciler values(33,'Melek Maden', 9, 3);
insert into ogrenciler values(54,'Burcu Deniz', 10, 8);
insert into ogrenciler values(18,'Polat Yildirim', 11, 2);
insert into ogrenciler values(42,'Defne Gumus', 12, 1);
insert into ogrenciler values(23,'Serpil Ates', 11, 4);
insert into ogrenciler values(45,'Mehmet Gunes', 9, 7);
insert into ogrenciler values(32,'Demet Bulut', 12, 6);
insert into ogrenciler values(68,'Fikret Yavuz', 10, 9);


create table ogretmenler(
ogrt_id int PRIMARY key,
ogrt_isim VARCHAR(30),
ders_id int
);

insert into ogretmenler values(101,'Adem Alan',6);
insert into ogretmenler values(102,'Filiz Denge',2);
insert into ogretmenler values(103,'Gulsen Basar',3);
insert into ogretmenler values(104,'Osman Kok',4);
insert into ogretmenler values(105,'Mustafa Altin',8);
insert into ogretmenler values(106,'Mine Mutlu',1);
insert into ogretmenler values(107,'Hale Haktan',5);

create table dersler(
ders_id int PRIMARY key,
ders_isim VARCHAR(30),
ders_saati INT);


insert into dersler values(1, 'Matemateik', 8);
insert into dersler values(2, 'Fizik', 6);
insert into dersler values(3, 'Kimya', 6);
insert into dersler values(4, 'Biyoloji', 4);
insert into dersler values(5, 'Edebiyat', 4);
insert into dersler values(6, 'Cografya', 2);
insert into dersler values(7, 'Tarih', 2);

--SORU1: tum dersleri ve varsa bu dersleri
--alan ogrencilerın isimlerini listeleyiniz
--esas tablo nedir : dersler
--left join
--ders isimleri ve ogr isimleri
SELECT d.ders_isim, o.ogr_isim 
FROM dersler d
LEFT JOIN ogrenciler o ON d.ders_id = o.ders_id;


--SORU2: tum ogrencileri ve varsa bu ogrencilerin aldıkları dersleri listeleyiniz
--esas tablo nedir : ogrenciler
--left join
--ogr_isim,ders_isim
SELECT o.ogr_isim, d.ders_isim
FROM ogrenciler o
LEFT JOIN dersler d
ON o.ders_id = d.ders_id;

--SORU3: tum ogretmenleri ve varsa bu ogretmenlerin derslerini listeleyiniz
--esas tablo nedir : ogretmenler
--right join
--ogrt_isim ders_isim

SELECT o.ogrt_isim, d.ders_isim
FROM ogretmenler o
LEFT JOIN dersler d
ON o.ders_id = d.ders_id;


--SORU4: tum dersleri ve varsa bu derslerin ogretmenlerini listeleyiniz
--esas tablo nedir : dersler
--left join
--ders_isim,ogrt_isim

SELECT d.ders_isim, o.ogrt_isim
FROM dersler d
LEFT JOIN ogretmenler o
ON o.ders_id = d.ders_id;


--SORU5: tum ogretmenleri ve varsa  bu ogretmenlerin 
--verdiği dersi alan ogrencilerin isimlerini listeleyiniz
--esas tablomuz nedir : ogretmenler
--left join
--ogrt_isim ve ogr_isim

SELECT ogrt.ogrt_isim, ogr.ogr_isim
FROM ogretmenler ogrt
LEFT JOIN ogrenciler ogr
ON ogrt.ders_id = ogr.ders_id;
 

--SORU6: ogrenciler tablosundaki ogrencilerden sadece
--dersler tablosundaki derslerden herhangi birini 
--alan ogrenci isimlerini listeleyiniz
--esas tablo nedir : yoktur
--inner join
--ogr_isim

SELECT o.ogr_isim, d.ders_isim
FROM ogrenciler o
INNER JOIN dersler d
ON o.ders_id = d.ders_id;

--SORU7: tum dersleri ve tum ogrenci isimlerini listeleyiniz
--full join
--ders_isim ve ogr_isim

SELECT o.ogr_isim, d.ders_isim
FROM ogrenciler o
FULL JOIN dersler d
ON o.ders_id = d.ders_id;


create table memurlar2(
memur_id int PRIMARY key,
memur_isim VARCHAR(50),
memur_maas int
);

INSERT INTO memurlar2 VALUES(1,'çiğdem',100000);
INSERT INTO memurlar2 VALUES(2,'Duygu',150000);
INSERT INTO memurlar2 VALUES(3,'Aykut',110000);
INSERT INTO memurlar2 VALUES(4,'Sıla');
--sila hanima maas degeri atamasi yapalim
UPDATE memurlar2
SET memur_maas = 400000
WHERE memur_isim = 'Sıla';

--En dusuk veya en yuksek maas degerlerinin oldugu kayıtları listeleyin

SELECT *
FROM memurlar2
WHERE memur_maas = (SELECT MAX(memur_maas) 
					FROM memurlar2) 
					OR memur_maas = (SELECT MIN(memur_maas) 
									 FROM memurlar2);
--2.yol union
SELECT * FROM memurlar2 WHERE memur_maas=(SELECT MAX(memur_maas) FROM memurlar2)
UNION
SELECT * FROM memurlar2 WHERE memur_maas=(SELECT min(memur_maas) FROM memurlar2);

