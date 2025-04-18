USE OrganizationDB;

-- view is a virtual table, we can do operation to this like a normal table
-- creates a view with the selected columns 
-- If we have any query that we want to execute very often we use views
CREATE VIEW BenchEmployees AS
SELECT *
FROM employees
WHERE project_id IS Null;

SELECT * FROM BenchEmployees;

-- to drop a view
DROP view BenchEmployees;

-- create index on employee address
-- used to simplify the search processes
-- we can include multiple columns for the index
-- in the below statement, we created an index on first name and last name of employees
CREATE INDEX name_index 
ON employees(first_name, last_name);

-- displays the indexes created on employees, if column has primary key while creating it's index is created by default
SHOW INDEXES from employees;

-- reduces the time to execute the query if the data is huge
select * from employees where first_name='joe';