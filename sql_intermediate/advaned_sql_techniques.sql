use organizationDB;

-- window functions
select employee_id, salary, 
-- gives the same rank to duplicates but skips the next rank
-- leaderboards with tied ranks
rank() over (order by salary desc) as salary_rank, 
-- gives the same rank to duplicates but doesn't skips the next rank
-- grouping with continuos rankings
dense_rank() over (order by salary desc) as salary_dense_rank,  
-- gives a unique number to each even though they are duplicates
-- when we need strict ordering
row_number() over (order by salary desc) as saalry_row_number
from employees;

-- Pivoting
with pivoted_table as(select project_id, 
sum(CASE WHEN project_id = 2 OR project_id = 3 OR project_id is null THEN gender="Female" ELSE 0 END) as female,
sum(CASE WHEN project_id = 2 OR project_id = 3 OR project_id is null THEN gender="Male" ELSE 0 END) as male
from employees 
group by project_id)

select * from pivoted_table;

-- analytic functions
SELECT 
    employee_id, 
    first_name,
	last_name,
    salary,
    LAG(salary) OVER (ORDER BY salary) AS PreviousSalary,
    LEAD(salary) OVER (ORDER BY salary) AS NextSalary,
    FIRST_VALUE(salary) OVER (ORDER BY salary) AS LowestSalary,
    LAST_VALUE(salary) OVER (ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS HighestSalary
FROM employees;

-- subqueries
-- 1. scalar or single subquery
-- returns only one row and column
-- used with operators 
select employee_id, first_name, last_name, salary > ( select min(salary) from employees );

-- 2. multiple row subquery
-- multiple rows but one column
-- used with in, all, any etc

select * from employees where project_id in (select project_id from projects where project_location in ("UK","Banglore"));

-- 3. Correlated subquery
-- condition between the outer and inner query
-- returns the employees whch are having more than avg salary of the department
select * from employees e where salary > ( select avg(salary) from employees where department_id = e.department_id );

-- nested subquery
-- subquery inside a subquery
update departments set department_location = "Banglore" where department_id =2;
select * from employees where project_id = ( 
   select project_id from projects where project_location = (
      select department_location from departments where department_id = 2) );

-- partitioining and windowing
-- 

-- Temporal Tables
-- tracks historical data over time
CREATE TABLE shivani (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  position VARCHAR(100),
  salary INT,
  valid_from TIMESTAMP(6)  DEFAULT CURRENT_TIMESTAMP,
  valid_to TIMESTAMP(6) DEFAULT '9999-12-31 23:59:59',
  version INT AUTO_INCREMENT PRIMARY KEY
)
