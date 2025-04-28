use organizationdb;

-- use select column_names instead of select *
select employee_id, first_name, last_name, salary from employees; -- recommended

-- use inner join instead of where
-- not recommended as where searches every row in the tables leads of performance inefficiency
select employees.employee_id, employee.first_name, employees.project_id, projects.project_name 
from employees, projects 
where employees.project_id = projects.project_id;

-- recommended
select employees.employee_id, employee.first_name, employees.project_id, projects.project_name 
from employees inner join projects 
on employees.project_id = projects.project_id;

-- use where instead of having
-- not recommended as avg functions iterates every row and performs the calculations (having used on aggregate functions)
select employee_id, salary
from employees
group by employee_id
having avg(salary) > 30000;

-- recommended
select employee_id, salary
from employees
where salary > 30000;

-- use limit for sampling query results
-- not recommended results all the rows in the table if the data is large it will take more time to returns the result
select * from employees;

-- recommended
select * from employees limit 5; -- fetches first 5 rows
select * from employees limit 3,5; -- skip first 3 rows fetches next 5 rows

