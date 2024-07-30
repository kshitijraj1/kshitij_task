CREATE DATABASE school_management;
USE school_management;
CREATE TABLE students(
student_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(50),
phone_number VARCHAR(15),
date_of_birth VARCHAR(15)
);
CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
course_description TEXT,
credits INT
);
ALTER TABLE students ADD COLUMN grade VARCHAR(2);
ALTER TABLE students MODIFY phone_number VARCHAR(15);

INSERT INTO students VALUES(1, 'Raj', 'Kumar', 'abc@gmail.com', '6318392946', '2000-01-01', 'A'),
(2, 'Suman', 'Singh', 'suman23@gmail.com', '999999999', '1999-05-15', 'B'),
(3, 'Sumit', 'Raj', 'sumit24@gmail.com', '6238659274', '2001-01-01', 'C');

INSERT INTO courses VALUES(1, 'Mathematics', 'Introduction to Mathematics', 4),
(2, 'Science', 'Introduction to Science', 3),
(3, 'History', 'World History', 3),
(4, 'Art', 'Introduction to Art', 2),
(5, 'Physical Education', 'Physical Education and Health', 1);

SELECT first_name, last_name, email FROM students;
DROP TABLE students;
DROP DATABASE school_management;