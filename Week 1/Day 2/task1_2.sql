CREATE DATABASE day_two;
USE day_two;

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
Salary INT NOT NULL,
Department VARCHAR(50)
);

CREATE TABLE Departments(
-- Create a primary key constraint on the DepartmentID column in the Departments table.
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL
);
CREATE TABLE Projects(
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100) NOT NULL,
DepartmentID INT
);


INSERT INTO Employees VALUES(1, 'John', 'Doe', 'john.doe@company.com', 60000, 'Marketing'),
(2, 'Jane', 'Smith', 'jane.smith@company.com', 75000, 'Sales'),
(3, 'Michael', 'Johnson', 'michael.johnson@company.com', 85000, 'Marketing'),
(4, 'Emily', 'Williams', 'emily.williams@company.com', 72000, 'IT'),
(5, 'David', 'Brown', 'david.brown@company.com', 65000, 'Sales'),
(6, 'Sarah', 'Davis', 'sarah.davis@company.com', 90000, 'IT'),
(7, 'Robert', 'Miller', 'robert.miller@company.com', 70000, 'Finance'),
(8, 'Jessica', 'Wilson', 'jessica.wilson@company.com', 65000, 'Finance'),
(9, 'Daniel', 'Anderson', 'daniel.anderson@company.com', 72000, 'IT'),
(10, 'Ashley', 'Taylor', 'ashley.taylor@company.com', 58000, 'Sales'),
(11, 'William', 'Brown', 'william.brown@company.com', 78000, 'Marketing'),
(12, 'Sophia', 'Davis', 'sophia.davis@company.com', 60000, 'Marketing');

INSERT INTO Departments VALUES(1, 'Marketing'), (2, 'Sales'), (3, 'IT'), (4, 'Finance'), (5, 'HR');

INSERT INTO Projects VALUES(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3), 
(4, 'Project D', 4),
(5, 'Project E', 5);


SELECT * FROM Employees;

-- Q1 Create a constraint to ensure that the salary of an employee is greater than 0.
ALTER TABLE Employees ADD CHECK(Salary > 0);

INSERT INTO Employees VALUES(15, 'John', 'Doe', 'john.doe@company.com', 0, 'Marketing');

-- Q2 Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table.
ALTER TABLE Employees
ADD DepartmentID INT,
ADD CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Q3 Create a unique constraint on the Email column in the Employees table.
ALTER TABLE Employees
ADD UNIQUE (Email);

-- Q4 Create a primary key constraint on the DepartmentID column in the Departments table.
ALTER TABLE Departments
ADD CONSTRAINT pk_department PRIMARY KEY (DepartmentID);

-- Q5 Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table.
ALTER TABLE Projects
ADD CONSTRAINT fk_project FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Q6 Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.
INSERT INTO Employees VALUES(30, 'Sophia', 'Davis', 'sopha.davis@company.com', 60000, 'Marketing', 6);
-- RESPONSE Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`day_two`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`))

-- Q7 Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
INSERT INTO Employees VALUES(22, 'Jane', 'Smith', 'jane.smith@company.com', 75000, 'Sales', 3);
-- RESPONSE Error Code: 1062. Duplicate entry 'jane.smith@company.com' for key 'employees.Email'

-- Q8 Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.
INSERT INTO Employees VALUES(13, 'David', 'Doe', 'david.doe@company.com', 60000, 'Marketing', 1);
DELETE FROM Departments WHERE DepartmentID = 1;
-- RESPONSE Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`day_two`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`))

-- Q9 Update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation.
UPDATE Employees
SET DepartmentID = 7
WHERE EmployeeID=1;
-- RESPONSE Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`day_two`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`))
