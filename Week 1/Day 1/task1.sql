CREATE DATABASE dayone;

USE dayone;

CREATE TABLE students(
s_id INT PRIMARY KEY,
s_name VARCHAR(50),
s_age TINYINT
);

INSERT INTO students VALUES(1, "Ram", 21);
INSERT INTO students VALUES(2, "Shamam", 21); 
SELECT * FROM students;