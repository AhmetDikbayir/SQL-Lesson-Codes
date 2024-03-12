------------DAY 5 DT-------------

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum 
--ve min maaşını listeleyen bir Sorgu yaziniz.
SELECT marka_isim, calisan_sayisi, (SELECT MAX(maas) 
									FROM calisanlar3 
									WHERE isyeri = marka_isim) AS maksimum_maas,
									(SELECT MIN(maas) 
									 FROM calisanlar3 
									 WHERE isyeri = marka_isim) minimum_maas
FROM markalar;


--25-EXISTS Cond.
-- =,!=(<>),<,>,...,AND,OR,BETWEEN..AND..,IN...
--Bir SQL sorgusunda alt sorgunun sonucunun boş olup olmadığını kontrol etmek için kullanılır.
--Eğer alt sorgu sonucu boş değilse, koşul sağlanmış sayılır ve sorgunun geri kalanı işletilir.
--Alt sorgu en az bir satır döndürürse sonucu EXISTS doğrudur.
--Alt sorgunun satır döndürmemesi durumunda, sonuç EXISTS yanlıştır.

CREATE TABLE mart
(     
urun_id INT,      
musteri_isim VARCHAR(50),
urun_isim VARCHAR(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(     
urun_id INT ,
musteri_isim VARCHAR(50),
urun_isim VARCHAR(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

--Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT * FROM nisan WHERE EXISTS (SELECT * FROM mart WHERE urun_isim='Toyota');

--Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT *
FROM nisan
WHERE EXISTS (SELECT * FROM mart WHERE urun_isim = 'Volvo');

--Mart ayında satılan ürünün urun_id ve musteri_isim'lerini, 
--eğer Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız. 

SELECT urun_id, musteri_isim
FROM mart
WHERE EXISTS (SELECT * FROM nisan WHERE nisan.urun_isim = mart.urun_isim);

---Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız
SELECT urun_isim, musteri_isim
FROM nisan 
WHERE EXISTS (SELECT * FROM mart WHERE urun_isim = nisan.urun_isim)
 

--26-UPDATE tablo_adı SET sütunadı=yeni değer 
   --WHERE koşul -- koşulu sağlayan kayıtlar güncellenir

CREATE TABLE calisanlar4 (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES(345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES(678901234, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(789012345, 'Fatma Yasa', null, 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(901234567, 'Ali Han', null, 2500, 'Vakko');

SELECT * FROM calisanlar4;

--27-IS NULL condition  
--calisanlar4 tablosunda isim sütunu null olanları listeleyiniz.

SELECT * FROM calisanlar4
WHERE isim IS NULL

--calisanlar4 tablosunda isyeri sütunu null olmayanları listeleyiniz.
SELECT * FROM calisanlar4
WHERE isyeri IS NOT NULL


--calisanlar4 tablosunda isim sütunu null olanların isim değerini 
--'MISSING...' olarak güncelleyiniz..

UPDATE calisanlar4
SET isim='MISSING...'
WHERE isim IS NULL

--calisanlar4 tablosunda isyeri sütunu null olanların isyeri değerini 
--'MISSING...' olarak güncelleyiniz..

UPDATE calisanlar4
SET isyeri='MISSING...'
WHERE isyeri IS NULL



--28-ORDER BY:kayıtları belirli bir fielda göre azalan/artan şekilde sıralamamızı sağlar.
--VARSAYILAN olarak ASC(natural-artan-doğal) olarak sıralar
DROP TABLE person;

CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir'); 
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara'); 

SELECT * FROM person;