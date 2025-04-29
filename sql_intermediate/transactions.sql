use organizationDB;

-- transaction is a single unit of statements. either whole statements pass or fail
-- if any one of the statements fail whole transaction will be failed.
DELIMITER //

create procedure transaction_salary(in cr_emp_id int, in db_emp_id int, in amount int)
begin
    declare rows1 int default 0;
    declare rows2 int default 0;

    start transaction;
        update employees set salary = salary - amount where employee_id = db_emp_id;
        set rows1 = row_count();
        update employees set salary = salary + amount where employee_id = cr_emp_id;
        set rows2 = row_count();
        
        if rows1=0 or rows2=0 then
		    rollback;
		    select 'Transaction rolled back beacuse employee_id not found' AS status;
		else 
            commit;
            select 'Transaction completed!' as status;
        end if;
       
END //

DELIMITER ;

call transaction_salary(3,4,1000);

DELIMITER //
-- transaction using savepoint
-- if you commit the transaction the savepoints will be automatically deleted
create procedure transaction_savepoint(in cr_emp_id int, in db_emp_id int, in amount int)
begin 
    
    start transaction;
        update employees set salary = salary - amount where employee_id = db_emp_id;
        savepoint savepoint_debit;
        update employees set salary = salary + amount where employee_id = cr_emp_id;
        rollback to savepoint savepoint_debit;
        commit;
end // 

DELIMITER ;
 
-- to call the procedure
call transaction_savepoint(3, 4, 1000);
select * from employees;

select * from employees limit 3,5; -- skip first 10 rows fetches next 5 rows
select * from employees limit 5;

