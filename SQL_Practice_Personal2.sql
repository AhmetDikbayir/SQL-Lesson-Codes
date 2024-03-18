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

ALTER TABLE students2
ADD COLUMN course_id INTEGER,
ADD CONSTRAINT fk_course_id
	FOREIGN KEY(course_id)
	REFERENCES courses(id);

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



