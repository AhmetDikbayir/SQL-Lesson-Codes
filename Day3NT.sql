--------- DAY'3 NT ---------------
---- PK ve FK uygulaması ------------

CREATE TABLE calisanlar(
id char(5) PRIMARY KEY,
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE adresler(
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(20),
FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
);

SELECT * FROM calisanlar;
SELECT * FROM adresler;

INSERT INTO calisanlar VALUES('10002', 'Donatello' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10003', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12'); 
INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'April', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('10002', 'Splinter' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'Fred' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Betty' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Taş Sok', '30.Cad.','Konya');

INSERT INTO adresler VALUES('10012','Taş Sok', '30.Cad.','Konya');


INSERT INTO adresler VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');


--13-tabloya CHECK constrainti ekleme
CREATE TABLE person(
id INTEGER,
name VARCHAR(20),	
salary REAL CHECK(salary>5000),
age INTEGER	CHECK(age>0)
);

INSERT INTO person VALUES(10,'Ali Can',2000,-9);--age>0
INSERT INTO person VALUES(10,'Ali Can',7000,9);

SELECT * FROM person;

SELECT * FROM doctors;
SELECT * FROM programmers;
SELECT * FROM students2;
