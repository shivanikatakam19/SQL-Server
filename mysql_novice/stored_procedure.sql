USE OrganizationDB;

-- creating a store procedure with no parameters

DELIMITER // 

CREATE PROCEDURE GetProjectsOrderByDesc()

BEGIN
    Select * 
    from projects 
    order by project_name 
    desc;
END //

DELIMITER ;

call GetProjectsOrderByDesc()

-- creating a store procedure with input parameter
-- the below store procedure add a project into the projects table

DELIMITER // 

CREATE PROCEDURE AddProject(
    IN project_name varchar(20), 
    IN client_name varchar(20), 
    IN project_location varchar(20)
)

BEGIN
    Insert into projects(project_name, client_name, project_location) 
    values (project_name, client_name, project_location);
END //

DELIMITER ;

call AddProject("Cognine","Shivani","Hyderabad");

select * from projects;

-- creating a store procedure with input and output parameters
-- the below store procedure gets the employees that works in the given specific project

DELIMITER //

CREATE PROCEDURE GetNumberOfEmployeesInProject (
    OUT employee_numbers INT,
    IN project_id VARCHAR(10)
)

BEGIN
    SELECT count(*) INTO employee_numbers
    FROM employees
    WHERE employees.project_id = project_id;
END //

DELIMITER ;

call GetNumberOfEmployeesInProject(@employee_numbers,2);

select @employee_numbers as employee_number;

-- to Delete the store procedure

DROP PROCEDURE GetNumberOfEmployeesInProject;
