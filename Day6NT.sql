--------------DAY'6 NT---------------------
--29-GROUP BY clause:tablomuzdaki kayıtları belirli bir veya daha fazla sütuna göre gruplandırabiliriz.

CREATE TABLE manav
(
id int,	
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 1,'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 2,'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 3,'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 4,'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 1,'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 2,'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 3,'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 1,'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 3,'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 2,'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 2,'Ayse', 'Uzum', 2);

SELECT * FROM manav;
--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.

SELECT isim, SUM(urun_miktar)
FROM manav
GROUP BY isim

--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
--toplam ürün miktarına göre azalan olarak sıralayınız.

SELECT isim, SUM(urun_miktar) toplam_urun
FROM manav
GROUP BY isim
ORDER BY toplam_urun DESC;

--Her bir ismin aldığı her bir ürünün toplam miktarını isme göre sıralı görüntüleyiniz.

SELECT isim, urun_adi, SUM(urun_miktar)
FROM manav
GROUP BY isim, urun_adi
ORDER BY isim

--NOT:GROUP BY ile gruplama yapıldığında SELECTten sonra sadece gruplanan sütun 
--yada başka bir sütunun AGGREGATE fonk ile hesaplaması kullanılabilir
--!!!!!!!!!!!
SELECT isim, urun_miktar
FROM manav
GROUP BY isim
--!!!!!!!!!!!

--ürün ismine göre her bir ürünü alan toplam kişi sayısı gösteriniz.

SELECT urun_adi, COUNT(DISTINCT isim)
FROM manav
GROUP BY urun_adi

--Isme göre alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz

SELECT isim, SUM(urun_miktar) toplam_kg,COUNT(DISTINCT urun_adi) cesit_sayisi
FROM manav
GROUP BY isim

--Alinan ürün miktarina gore musteri sayisinı görüntüleyiniz.
--musteri sayisina göre artan sıralayınız.ÖDEV


--30-HAVING clause:GROUP BY komutundan sonra yapılan işlemle ilgili bir koşul ile
--sonuçları filtrelemek için AGGREGATE fonk ile birlikte kullanılır.

DROP TABLE personel;
CREATE TABLE personel  (
id int UNIQUE,
isim varchar(50),
sehir varchar(50), 
maas int,  
sirket varchar(20),
departman varchar(20)	
);

INSERT INTO personel VALUES(123, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda','IT'); 
INSERT INTO personel VALUES(234, 'Veli Sahin', 'Istanbul', 4500, 'Toyota','IT'); 
INSERT INTO personel VALUES(345, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda','Sales');
INSERT INTO personel VALUES(456, 'Mehmet Demir', 'Izmir', 6000, 'Ford','IT'); 
INSERT INTO personel VALUES(567, 'Murat Demir', 'Ankara', 7000, 'Tofas','IT');
INSERT INTO personel VALUES(678, 'Ali Sahin', 'Ankara', 4500, 'Ford','Sales');  
INSERT INTO personel VALUES(789, 'Hatice Sahin', 'Bursa', 4500, 'Honda','Accounting');
INSERT INTO personel VALUES(890, 'Hatice Can', 'Ankara', 3000, 'Tofas','Accounting');
INSERT INTO personel VALUES(912, 'Murat Han', 'Istanbul', 5500, 'Toyota','Sales'); 
INSERT INTO personel VALUES(913, 'Betül Yavuz', 'Bursa',3500, 'Ford','Marketing'); 


SELECT * FROM personel;

--Her bir şirketin MIN maas bilgisini, bu bilgi eğer 4000 den fazla ise görüntüleyiniz.

SELECT sirket, MIN(maas)
FROM personel
GROUP BY sirket
HAVING MIN(maas)>4000

--Maaşı 4000 den fazla olan çalışanlardan, her bir şirketin MIN maas bilgisini görüntüleyiniz.

SELECT sirket, MIN(maas)
FROM personel
WHERE maas>4000
GROUP BY sirket


--NOT:GROUP BY ile gruplama yaptıktan sonra raporu filtrelemek için HAVING aggregate fonk ile kullanılır,
--gruplamadan önce tablodaki satırları belirli bir sütuna göre filtrelemek için WHERE kullanılır

--Her bir sehirde alınan toplam gelir 10000 liradan fazla ise sehir ve toplam maasi gösteren sorgu yaziniz.
SELECT sehir, SUM(maas) toplam_gelir
FROM personel
GROUP BY sehir
HAVING SUM(maas)>10000;

--Eğer bir departmanda çalışan personel(id) sayısı 1’den çoksa departman ve personel sayısını veren sorgu yazınız

SELECT id, departman
FROM 







--31-UNION:iki farklı sorgunun sonucunu birleştirerek tek bir sütunda/raporda görüntülemeyi sağlar.
--        -tekrarlı olanları göstermez
--UNION ALL: UNION gibi kullanılır, tekrarlı olanları da gösterir


CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int	
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);


CREATE TABLE contact_info(
address_id int,
street varchar(30),
number int,	
city varchar(30),
FOREIGN KEY(address_id) REFERENCES developers(id)	
);

INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');


SELECT * FROM developers;
SELECT * FROM contact_info;
SELECT * FROM calisanlar4;


--32-INTERSECT:iki farklı sorgunun sonuçlarından ortak olanları(kesişimi)
--tekrarsız olarak gösterir.



--33-EXCEPT:bir sorgunun sonuçlarından diğer bir sorgunun sonuçlarından 
--farklı olanları gösterir.