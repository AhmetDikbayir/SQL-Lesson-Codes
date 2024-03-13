CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisim VARCHAR(50), 
meslek CHAR(9), 
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', 20000 ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', 18000); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', 17008); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', 15000); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', 13008); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', 12000); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', 10000); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', 14000);

--Soru-10: meslekler tablosunu isime göre sıralayınız
SELECT * FROM meslekler ORDER BY isim, soyisim;

--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız

SELECT * FROM meslekler ORDER BY maas DESC;

--Soru-12: meslekler tablosunda ismi Ali olanların maaşıni büyükten küçüğe doğru sıralayınız
SELECT * FROM meslekler WHERE isim = 'Ali' ORDER BY maas DESC;

--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz
SELECT * FROM meslekler WHERE id>5 ORDER BY id LIMIT 2;

--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz
SELECT * FROM meslekler ORDER BY maas DESC LIMIT 3;

-----------------------------------------
CREATE TABLE sirketler(
sirket_id INT PRIMARY KEY,
sirket_ismi VARCHAR(50),
memur_sayisi INT
);

INSERT INTO sirketler(sirket_id,sirket_ismi,memur_sayisi)
VALUES(100,'Nokia',1000),
(101,'Iphone',900),
(102,'Samsung',1200),
(103,'xiaomi',1500);

DROP TABLE sirketler
--soru 1 :Samsungun memurlar sayisini en yüksek memurlar sayisi değerine esitleyin
UPDATE sirketler
SET memur_sayisi = (SELECT MAX(memur_sayisi) 
					FROM sirketler)
WHERE sirket_ismi = 'Samsung'

--soru 2 :nokia sirketinin memurlar sayisi değerini en düşük memurlar sayisi değerinin 1.5 katına esitleyin
UPDATE sirketler
SET memur_sayisi = (SELECT MIN(memur_Sayisi) FROM sirketler)*1.5
WHERE sirket_ismi = 'Nokia'


--soru 3 :Iphonenin memurlar sayisini nokia ve xiaomi
--sirketlerinin memurlar sayisinin toplamına esıtleyın
UPDATE sirketler
SET memur_sayisi=(SELECT SUM(memur_sayisi) FROM sirketler WHERE sirket_ismi IN('Nokia','xiaomi') )
WHERE sirket_ismi='Iphone';


--soru 4 :Ortalama memurlar sayisi değerinden düşük olan memurlarin memur_sayisi değerlerini 400 artırın.
UPDATE sirketler
SET memur_sayisi = memur_sayisi+400
WHERE memur_sayisi < (SELECT AVG(memur_sayisi)
					  FROM sirketler)


--------------------------------
CREATE TABLE memurlar (
    memurlar_id Int PRIMARY Key,
    ad VARCHAR(100),
    sehir VARCHAR(50),
    sirket_ismi VARCHAR(100),
    calisma_performanslari VARCHAR(255)
);
INSERT INTO memurlar (memurlar_id,ad, sehir, sirket_ismi, calisma_performanslari)
VALUES
    (100,'Ali Yılmaz', 'Ankara', 'Samsung', 'Ortalama 67'),
    (101,'Ayşe Demir', 'İstanbul', 'Iphone', 'Ortalama 72'),
    (102,'Mehmet Kaya', 'İzmir', 'xiaomi', 'Ortalama 55'),
    (103,'Ahmet Kısacık', 'Bursa' ,'Nokia', 'Ortalama 98'),
    (104,'Ahmet Kadir'  ,'Ankara',  'Nokia' ,'Ortalama 92.5'),
    (105,'Fatma Güzel'  ,'Giresun', 'Samsung'   ,'Ortalama 92.5'),
    (106,'Furkan Yılmaz', 'İzmir', 'xiaomi', 'Ortalama 99');

SELECT * FROM memurlar

-- SORU5: memurlar sayisi 2200’den cok olan sirketlerin ve
--bu sirkette calisanlarin isimlerini ve calisma performanslarini listeleyin.
SELECT ad, calisma_performanslari 
FROM memurlar
WHERE sirket_ismi IN (SELECT sirket_ismi FROM sirketler WHERE memur_Sayisi>1800);

-- SORU6: Ankara'da memurlari olan sirketlerin
--sirket id'lerini ve memurlar sayilarini listeleyiniz


--Soru 7: eger giresunda bir tane bile memur varsa tum sirketleri yazdirin







