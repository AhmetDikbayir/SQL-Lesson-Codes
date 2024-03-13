CREATE TABLE consumers (
id INTEGER PRIMARY KEY,
name VARCHAR(20) NOT NULL,
lastName VARCHAR(20) NOT NULL,
product_id INTEGER,
address VARCHAR(50) NOT NULL,
FOREIGN KEY(product_id) REFERENCES products(product_id)
);


INSERT INTO consumers VALUES( 1, 'Ahmet', 'Han',101, 'Aydin'),
(2, 'Ali', 'Can', 102, 'Izmir');

SELECT * FROM consumers;

SELECT * 
FROM consumers 
WHERE product_id = (SELECT product_id 
					FROM products 
					WHERE product_id = 101)

SELECT supplementar 
FROM products 
WHERE product_id = (SELECT product_id 
					FROM consumers 
					WHERE name = 'Ahmet')

CREATE TABLE products(
product_id INTEGER PRIMARY KEY,
product_name VARCHAR(50),
supplementar VARCHAR(50)
);

INSERT INTO products VALUES(101, 'headphone', 'JBL'),
(102, 'Smartphone', 'Apple');

SELECT* FROM products;