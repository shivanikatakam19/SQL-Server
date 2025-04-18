-- CTE(Common Table Expression)- like a temporary result set (a virtual table).
-- can use it inside a bigger query.(supported in mysql 8.0 and later)

WITH FemaleEmployees AS (
    SELECT employee_id, first_name, salary, gender
    FROM employees
    WHERE gender = "Female"
)

SELECT * FROM FemaleEmployees;

-- multiple CTEs 

WITH 
    FemaleEmployees AS (
        SELECT employee_id, first_name, salary, gender
        FROM employees
        WHERE gender = "Female"
	),
    HighSalaryFemaleEmployees AS (
        SELECT employee_id, first_name, salary, gender 
        FROM FemaleEmployees 
        WHERE salary > 25000
	)

SELECT * FROM HighSalaryFemaleEmployees;

-- the below recursive statement returns first 10 odd numbers
with recursive increment(serial_no, odd_number) as(
-- anchor statement
select 1, 1

-- used to eliminate the duplicate data
union all

-- recursive statement which executes until the condition is met
select serial_no+1, odd_number + 2 from increment where serial_no < 10 )

select * from increment;

