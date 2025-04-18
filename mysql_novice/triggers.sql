USE OrganizationDB;

Create Table if not exists employee_history(
    employee_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth VARCHAR(15),
    employee_address VARCHAR(50),
    gender VARCHAR(10),
    salary VARCHAR(20),
    department_id BigInt UNSIGNED,
    project_id BigInt UNSIGNED,
    updated_date Date
)

-- the below trigger triggers everytime when we update an employee details
DELIMITER //

CREATE TRIGGER employee_audit
-- after updating a row
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
    IF old.first_name <> new.first_name OR 
       old.last_name <> new.last_name OR 
       old.date_of_birth <> new.date_of_birth OR 
       old.employee_address <> new.employee_address OR
       old.gender <> new.gender OR
       old.salary <> new.salary OR
       old.department_id <> new.department_id OR
       old.project_id <> new.project_id THEN
        INSERT into employee_history values (new.employee_id, new.first_name, new.last_name, new.date_of_birth, new.employee_address, 
        new.gender, new.salary, new.department_id, new.project_id, now());
    END If;
END //

DELIMITER ;

update employees set salary=60000, project_id = 3 where employee_id = 7;

-- the below trigger triggers on adding an employee
DELIMITER //
CREATE TRIGGER employee_audit_on_insert
-- after inserting a row
AFTER Insert
ON employees
FOR EACH ROW
BEGIN
    INSERT into employee_history values (new.employee_id, new.first_name, new.last_name, new.date_of_birth, new.employee_address, 
    new.gender, new.salary, new.department_id, new.project_id, now());
END //

DELIMITER ;


insert into employees(first_name, last_name,date_of_birth, employee_address,gender,salary, department_id, project_id) 
values('test', 'employee', '1998-04-23','New york','Male',4000,2,3);

select * from employees;
select * from employee_history;