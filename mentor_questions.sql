CREATE TABLE musteri(
musteri_no SERIAL PRIMARY KEY,
isim VARCHAR(50) NOT NULL,
yas INTEGER CHECK(yas>18),
cinsiyet CHAR(1),
gelir REAL,
meslek VARCHAR(20),
sehir VARCHAR(20)
);

INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir) VALUES ('Ali', 35, 'E', 2500, 'MÜHENDİS', 'İSTANBUL');

INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir) VALUES ('BURAK', 25, 'E', 3500, 'MİMAR', 'İZMİR');
INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir) VALUES ('CEYHUN',  45, 'E', 2000, 'MÜHENDİS', 'ANKARA'),
('DEMET',   30, 'K', 3000, 'ÖĞRETMEN', 'ANKARA'),
('FERHAT',  40, 'E', 2500, 'MİMAR', 'İZMİR');
INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir) VALUES ('GALİP',   55, 'E', 4000, 'ÖĞRETMEN', 'İSTANBUL'),
('KÖKSAL',  25, 'E', 2000, 'AVUKAT', 'İZMİR'),
('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir) VALUES ('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL'),
('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA'),
('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA'),
('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL'),
('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL'),
('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR'),
('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR'),
('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR'),
('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');


SELECT * FROM musteri;

SELECT isim, meslek FROM musteri;

CREATE TABLE sehirler (
alan_kodu CHAR(5) PRIMARY KEY,
isim VARCHAR(20),
nufus INTEGER
);

SELECT * FROM sehirler;

CREATE TABLE tedarikciler3 (
tedarikci_id INTEGER  PRIMARY KEY,
tedarikci_ismi VARCHAR(50),
iletisim_isim VARCHAR(50) UNIQUE
);

INSERT INTO tedarikciler3 VALUES(1001, 'Hasan', 'Veli'),(1002, 'Ahmet', 'Ali');

SELECT * FROM tedarikciler3;
CREATE TABLE urunler(
tedarikci_id INTEGER,
urun_id INTEGER,
FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler3 (tedarikci_id)
);

INSERT INTO urunler VALUES (1002, 101),(1001, 104);

INSERT INTO urunler VALUES (1001, 47);

SELECT * FROM urunler;



