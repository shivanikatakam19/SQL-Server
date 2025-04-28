-- the below statements locks the table until the statement is executed
-- no other transactions are allowed on this table until then.
-- is used to manually lock a table for safe updates
lock tables employee write;
    update employees set salary = 30000 where employee_id = 1;
unlock tables;

-- we can set isolation levels based on our need
-- 1. read uncommitted - where transaction read uncommitted changes made by other transactions.
-- 2. read committed - ensure only committed changes are visible to other transaction.
-- 3. repeatable read - repeated read produce same results within a transaction.
-- 4. serializable - strictest mode. prevent other transaction from writing or reading until the transaction is complete.

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM employees WHERE department_id = 1;
COMMIT;

-- using start transaction the row which we are doing transaction is locked.
-- MySQL recommends start transaction instead of locking the tables for efficiency.
-- dirty read - a transaction read an uncommitted data of other transaction. 
-- dirty reads are only allowed in "SET TRANSACTION ISOLATION READ UNCOMMITTED"

START TRANSACTION;
UPDATE employees SET salary = salary - 100 WHERE employee_id = 1;
-- wait for 10 seconds
do sleep(10);
rollback;
-- salary is now 29900, but not committed

-- if parallelly i have made other transaction
select salary from employees where employee_id = 1;
-- it gives the previous salary as the default level will be repeatable read and it does not allow any dirty reads. 

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- the result of the below transaction will be 29900 as it will not wait for the above transaction to complete
-- it will read the uncommitted changes
select salary from employees where employee_id=1; 

-- Lost update
-- transaction 1
set transaction isolation level repeatable read;
start transaction;
-- query-1
select salary from employees where employee_id = 1;

do sleep(10);

-- query-2
select salary from employees where employee_id = 1;
do sleep(1);
commit;

-- transaction 2
update employees set salary=20000 where employee_id=1;

-- the output of query-1 and query-2 will be 30000 and 20000 if I execute the transaction-2 between query-1 and query-2.
-- the above is called phantom read.
-- if you want to avoid this use level serializable as it will block tranaction 2 until transaction 1 is completed.
set transaction isolation level serializable;
-- if you include the above line you cannot update the values until a transaction is completed