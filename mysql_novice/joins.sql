USE OrganizationDB;

-- JOIN - used to combine rows from two or more tables, based on a related column between them.
-- if we mention join by default it works as inner join
SELECT employees.employee_id, projects.project_id, projects.project_name, employees.first_name, employees.last_name 
 FROM projects JOIN employees ON projects.project_id=employees.project_id;

-- LEFT JOIN - returns all records from the left table, and the matching records from the right table
SELECT employees.employee_id, projects.project_id, projects.project_name, employees.first_name, employees.last_name
FROM projects
LEFT JOIN employees
ON projects.project_id = employees.project_id;

-- RIGHT JOIN - returns all records from the right table , and the matching records from the left table
SELECT employees.employee_id, departments.department_id, departments.department_name, employees.first_name, employees.last_name
FROM departments
RIGHT JOIN employees
ON departments.department_id = employees.department_id;

-- SELF JOIN - the table is joined with itself
SELECT A.first_name AS CustomerName1, A.first_name AS CustomerName2, A.department_id
FROM employees A, employees B
WHERE A.employee_id <> B.employee_id
AND A.department_id = B.department_id;

-- GROUP BY - rows that have the same values into summary rows

SELECT COUNT(employee_id), project_id
FROM employees
GROUP BY project_id;