USE OrganizationDB;

-- Mathematical Function
DELIMITER //

CREATE FUNCTION GetAnnualSalary(salary INT)
RETURNS INT

-- returns the same output for the same input values
deterministic 

BEGIN
    RETURN salary * 12;
END //

DELIMITER ;

SELECT employee_id, first_name, last_name,salary, GetAnnualSalary(salary) 
as annual_salary
from employees;

-- Date and Time Function
DELIMITER //

CREATE FUNCTION CalculateAge(date_of_birth DATE)
RETURNS INT

-- returns the same output for the same input values
deterministic 

BEGIN
    -- timestampdiff functions takes a unit and two expressions to return the time difference in the specified unit(day, month, year, second, hour etc)
    RETURN timestampdiff(year, date_of_birth, curdate());
END //

DELIMITER ;

SELECT employee_id, first_name, last_name, CalculateAge(date_of_birth) 
as age 
from employees;

-- string manipulation function
DELIMITER //

CREATE FUNCTION GetFullName(first_name VARCHAR(20), last_name VARCHAR(20))
returns VARCHAR(40)

deterministic

BEGIN
    -- concat is used to concatinate two or more strings
    RETURN concat(first_name, ' ', last_name);
END //

DELIMITER ;

Select first_name, last_name, GetFullName(first_name, last_name) as full_name from employees;

-- Aggregate Functions
-- the below are the predefined aggregate functions in sql
select 
    count(*) as employee_number, 
    max(salary) as max_salary, 
    min(salary) as min_salary, avg(salary) as avg_salary
from employees;