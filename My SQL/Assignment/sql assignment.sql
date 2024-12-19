CREATE DATABASE assignment;
use assignment;

CREATE TABLE Company(
company_id int AUTO_INCREMENT PRIMARY KEY,
company_name varchar(50),
city varchar (50),
state varchar (50),
zip varchar (50));

INSERT INTO Company (company_name, City, State, zip)
VALUES ('Urban Outfitters, Inc', 'Amreli', 'Gujarat', 'India');



-- Statement to create the Contact table
DROP TABLE Contact;
CREATE TABLE Contact(
contact_id int AUTO_INCREMENT PRIMARY KEY,
comapany_id int ,
first_name varchar (50),
last_name varchar (50),
street varchar (50),
city varchar (50),
zip varchar (20),
email varchar (50),
phone varchar (12));

-- Statement to create the Employee table
drop table Employee;
CREATE TABLE Employee(
employee_id int AUTO_INCREMENT PRIMARY KEY,
first_name varchar (50),
last_name varchar (50),
salary decimal(10,2),
hire_date date,
job_title varchar (50),
email varchar (50),
phone varchar (12));

insert into employee
values 
(1,'Lesley','Bland',73000.5,'2024-12-4','IT','lesley20@gmail.com','231 432 6509'),
(2,'Meghana','Bambhaniya',78000,'2025-1-10','DA','Meghana12@gmail.com','432 654 8765');
select * from employee;

-- Statement to create the ContactEmployee table  
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the 
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).  
drop table ContactEmployee;
CREATE TABLE ContactEmployee (
    ContactEmployee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Contact_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    wmployee_name varchar (50),
    contact_date date ,
    Description varchar(50),
    FOREIGN KEY (Contact_ID) REFERENCES Contact(Contact_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

 -- In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800.
 UPDATE Employee
SET Phone = '215 555 8800'
WHERE Employee_ID = 123; 

-- In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” . 
UPDATE Company
SET company_name = 'Urban Outfitters'
WHERE Company_ID = 1; 

-- In ContactEmployee table, the statement that removes Dianne Connor’s contact 
-- event with Jack Lee (one statement). 
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove. 

-- Create a temporary table to store the IDs to delete
CREATE TEMPORARY TABLE TempContactEmployeeIDs AS
SELECT ContactEmployee_ID
FROM ContactEmployee
WHERE Contact_ID = (SELECT Contact_ID FROM Contact WHERE first_name = 'Dianne Connor')
  AND Employee_ID = (SELECT Employee_ID FROM Employee WHERE first_name = 'Jack Lee');

DELETE FROM ContactEmployee
WHERE ContactEmployee_ID IN (SELECT ContactEmployee_ID FROM TempContactEmployeeIDs);

DROP TEMPORARY TABLE TempContactEmployeeIDs;


-- Write the SQL SELECT query that displays the names of the employees that 
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
-- MySQL Workbench. Copy the results below as well. 
SELECT e.first_name
FROM Employee e
JOIN ContactEmployee ce ON e.Employee_ID = ce.Employee_ID
JOIN Contact c ON ce.Contact_id = c.Contact_id
JOIN Company co ON c.Company_id = co.Company_id
WHERE co.Company_name = 'Toll Brothers';






