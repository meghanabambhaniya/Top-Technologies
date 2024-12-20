use assignment;
-- Question 1
create table Worker(
worker_id int primary key ,
first_name varchar (50),
last_name varchar (50),
salary int ,
department varchar (50));

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT)  
VALUES  
  (1, 'Monika', 'Arora', 100000,  'HR'),
  (2, 'Niharika', 'Verma', 80000,'Admin'),
  (3, 'Vishal', 'Singhal', 300000, 'HR'),
  (4, 'Amitabh', 'Singh', 500000,  'Admin'),
  (5, 'Vivek', 'Bhati', 500000, 'Admin'),
  (6, 'Vipul', 'Diwan', 200000, 'Account'),
  (7, 'Satish', 'Kumar', 75000, 'Account'),
  (8, 'Geetika', 'Chauhan', 90000,  'Admin');

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * 
FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- 2.Write an SQL query to print details for Workers with the first names from the Worker table. 
SELECT * 
FROM Worker
WHERE FIRST_NAME IN ('Vipul', 'Satish');

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
SELECT * 
FROM Worker
WHERE FIRST_NAME LIKE '_____h';

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
SELECT * 
FROM Worker
WHERE SALARY BETWEEN 1 AND 1000000;  

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT FIRST_NAME, LAST_NAME, COUNT(*) 
FROM Worker
GROUP BY FIRST_NAME, LAST_NAME
HAVING COUNT(*) > 1;

-- 6. Write an SQL query to show the top 6 records of a table. 
SELECT * 
FROM Worker
LIMIT 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them. 
SELECT DEPARTMENT 
FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) < 5;

-- 8. Write an SQL query to show all departments along with the number of people in there. 
SELECT DEPARTMENT, COUNT(*) AS Employee_Count
FROM Worker
GROUP BY DEPARTMENT;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT
FROM Worker
WHERE (DEPARTMENT, SALARY) IN (
    SELECT DEPARTMENT, MAX(SALARY)
    FROM Worker
    GROUP BY DEPARTMENT
);

-- Question 2
use assignment;
-- Create the table
CREATE TABLE Students (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(50),
    Sex ENUM('Male', 'Female'),
    Percentage INT,
    Class INT,
    Sec CHAR(1),
    Stream VARCHAR(50),
    DOB DATE
);

-- Insert data into the table
INSERT INTO Students (StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB) VALUES
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agarwal', 'Female', 56, 12, 'A', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-15'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'A', 'Science', '2003-09-14'),
(1006, 'Jahanvi Puri', 'Female', 72, 11, 'B', 'Commerce', '2003-11-07'),
(1007, 'Sahil Saras', 'Male', 61, 11, 'A', 'Commerce', '2008-11-23'),
(1008, 'Akshra Agarwal', 'Female', 69, 11, 'C', 'Commerce', '2008-11-23'),
(1009, 'Stuti Mishra', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1010, 'Harsh Agarwal', 'Male', 49, 11, 'C', 'Science', '2008-11-23'),
(1011, 'Nikunj Agarwal', 'Male', 61, 12, 'A', 'Science', '2006-06-28'),
(1012, 'Akriti Saxena', 'Female', 72, 11, 'A', 'Science', '2008-11-23'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'A', 'Science', '2008-11-23');


-- 1 To display all the records form STUDENT table. SELECT * FROM student ;  
select * from Students;

-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ; 
 SELECT StdName, DOB 
 FROM Students;
 
-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. SELECT * FROM student WHERE percentage >= 80;  
SELECT * FROM Students 
WHERE Percentage >= 80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80 SELECT StdName, Stream, Percentage WHERE percentage > 80; 
 SELECT StdName, Stream, Percentage 
 FROM Students 
 WHERE Percentage > 80;
 
-- 5. To display all records of science students whose percentage is more than 75 form student table. SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75;
SELECT * FROM Students 
WHERE Stream = 'Science' AND Percentage > 75;