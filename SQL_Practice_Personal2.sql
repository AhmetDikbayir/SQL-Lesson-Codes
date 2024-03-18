--add PRIMARY KEY CONSTRAINT
CREATE TABLE students(
id INTEGER PRIMARY KEY,
name VARCHAR(20),
grade REAL,
register_date DATE
);
--Alternative 
CREATE TABLE students2(
id INTEGER,
name VARCHAR(20),
grade REAL,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id)
);

SELECT* 
FROM students;

CREATE TABLE courses(
id INTEGER,
name VARCHAR(20),
lecturer VARCHAR(50),
credit INTEGER,
CONSTRAINT courses_pk PRIMARY KEY(id)
);

INSERT INTO courses VALUES (100, 'Math'),
(101, 'Physics'),
(102, 'Chemistry'),
(103, 'Biology'),
(104, 'Algebria');

--Updated students2 table
ALTER TABLE students2
ADD COLUMN course_id INTEGER,
ADD CONSTRAINT fk_course_id
	FOREIGN KEY(course_id)
	REFERENCES courses(id);


INSERT INTO students2 VALUES(1, 'Ali Han', 85, '2024-03-14');
INSERT INTO students2 VALUES(2, 'Ali Can', 85, '2024/03/14');

UPDATE students2
SET course_id = 100
WHERE id=1;

UPDATE students2
SET course_id = 101
WHERE id = 2;

SELECT *
FROM students2;

CREATE TABLE products(
id INTEGER,
name VARCHAR(20),
company VARCHAR(20),
CONSTRAINT product_pk PRIMARY KEY(id)
)

CREATE TABLE customers(
id INTEGER,
name VARCHAR(20),
product_id INTEGER,
CONSTRAINT cust_pk PRIMARY KEY(id),
CONSTRAINT cust_fk FOREIGN KEY(product_id) REFERENCES products(id)
);

SELECT *
FROM customers;

CREATE TABLE people(
id INTEGER PRIMARY KEY,
name VARCHAR(20),
age INTEGER CHECK (age>18)
);

INSERT INTO people VALUES(1, 'Ahmet', 28);

SELECT * FROM people