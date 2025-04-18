-- Create the database
CREATE DATABASE if not exists OrganizationDB;

-- Switch to the new database
USE OrganizationDB;

-- Create the Departments table
CREATE TABLE IF NOT EXISTS departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(20),
    department_location VARCHAR(15)
);

-- Create the Projects Table
CREATE TABLE IF NOT EXISTS projects(
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(20),
    client_name VARCHAR(15),
    project_location VARCHAR(15)
);

-- Create the employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth VARCHAR(15),
    employee_address VARCHAR(50),
    gender VARCHAR(10),
    salary VARCHAR(20),
    department_id BigInt UNSIGNED,
    project_id BigInt UNSIGNED,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    orders int default 0
);

-- alter table column to update the data type
ALTER TABLE employees MODIFY salary bigint NOT NULL;

-- sets the default value for a column (adding multiple columns)
alter table employees add column branch varchar(15) default 'Hyderabad',add column serial_no int;

-- dropping the serial_no column
alter table employees drop column serial_no;

-- Insert data into departments
INSERT IGNORE INTO departments values (1,'Development', 'block 2'), (2,'HR', 'block 1');

-- Insert data into projects
INSERT IGNORE INTO projects values 
(1,'Face Recognition', 'Marq', 'USA'),
(2,'Internal', 'Bean', 'UK'),
(3,'External', 'Oswald', 'Banglore');

-- Insert data into employees
INSERT IGNORE INTO employees
(employee_id, first_name, last_name, date_of_birth, employee_address, gender, salary, department_id, project_id) values
(1,'joe', 'clark', '1997-04-12','New Jersey','Male',30000,1,2),
(2,'sean', 'wilson', '1999-09-28','Austin','Male',28000,1,2),
(3,'Amy', 'Mills', '2000-05-22','Chicago','Female',26000,1,2),
(4,'lily', 'ore', '1987-09-02','Los Angeles','Female',50000,1,3),
(5,'marcus', 'park', '1996-02-13','newyork','Male',32000,1,3),
(6,'zook', 'smith', '2001-02-28','Dallas','Male',18000,2,null),
(7,'peter', 'black', '1998-03-02','Newyork','Male',35600,2,null),
(8,'clara', 'smith', '1997-10-20','California','Female',24000,2, null);

-- insert data into employees by overriding the branch column default value
insert into employees(first_name, last_name, date_of_birth, employee_address, gender, salary, department_id, project_id,branch) values
('Christian', 'Lewis', '01-02-1996','Phoenix','Male',26000,2, 1,'Chennai');

-- insert data into customers
INSERT IGNORE INTO customers(customer_id,first_name,last_name) values 
(1,'clara', 'Marq'),
(2,'zook', 'Bean'),
(3,'amy', 'Oswald');

select * from customers;

-- UPDATE - used to update the existing values
UPDATE employees SET gender = "Male",salary=28900 WHERE employee_id = 3;

-- for executing an update statement we need to provide a where clause with a primary key or unique index
-- if we want to execute an update where clause without a primary key we need to execute below column to disable the safe update mode
SET SQL_SAFE_UPDATES = 0;

-- updating multiple records
UPDATE employees SET employee_address = "Oklahoma" WHERE employee_address = "newyork";

-- to enable the safe update mode
SET SQL_SAFE_UPDATES = 1;

-- SELECT Statement
-- used to select the rows with condition or no condition
select * from employees;

-- if we want to fetch the data with condition we can use WHERE statement
select * from employees where employee_id = 1;

-- DISTINCT - returns the different values - we can give multiple column names
SELECT DISTINCT employee_address,project_id FROM employees;

-- COUNT - returns the count of values
SELECT COUNT(project_id) FROM projects; -- returns 3 - total row count

SELECT COUNT(DISTINCT gender) FROM employees; -- returns distinct count of values of gender column

-- ORDER BY - used to sort the result in ascending or descending order
SELECT * FROM projects ORDER BY project_name; -- sort in alphabetical order in asc

-- groups the query results according the column we have given for group by keyword
SELECT count(employee_id),project_id from employees group by project_id order by project_id desc;

-- returns specific columns after sorting in desc order
SELECT employee_id, first_name,last_name,salary FROM employees ORDER BY salary DESC;

-- AND - used to filter records based on more than one condition 
-- displays a record if all conditions are true
SELECT * FROM employees WHERE salary > 25000 AND LOWER(employee_address) LIKE LOWER('N%');

-- OR - displays a record if any one of the conditions are true
SELECT * FROM employees WHERE salary > 25000 OR LOWER(employee_address) LIKE LOWER('N%');

-- NOT - used in combination with other operators to give the opposite result, also called the negative result.
SELECT * FROM employees WHERE NOT employee_address = 'Newyork';

-- returns the employees of the employee_id which are not btw 1 and 6
SELECT * FROM employees WHERE employee_id NOT BETWEEN 1 AND 6;

SELECT * FROM projects WHERE project_location NOT IN ('UK', 'USA');

-- IS NULL - returns the records where column values are null
SELECT * FROM employees WHERE project_id IS NULL;

-- IS NOT NULL - opposite to is null- returns the records where column values are not null
SELECT * FROM employees WHERE project_id IS NOT NULL;

-- DELETE - deletes existing records in a table.
DELETE FROM employees WHERE employee_id = 6;

alter table employees add column joining_date date after employee_id;

update employees set joining_date = now() where employee_id < 10;

-- Truncate - deletes the table data
Truncate table customers;

-- DROP - deletes the table completely
DROP TABLE customers;