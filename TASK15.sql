
USE task11

select * from students
--1. Auto-commit transactions
begin tran
update  students
set department='bcom' 
where sid=101
select @@trancount as no_of_transaction

--Auto-rollback transactions
begin tran
update  students
set yearofcompletion='bscit' 
where sid=102
select @@trancount as no_of_transaction

--2. Implicit transactions

SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    students 
SET 
  department='bba'
WHERE 
    sid = 117 

SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS number_of_transaction 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS number_of_transaction

SET IMPLICIT_TRANSACTIONS OFF

--3. Explicit transactions
  --  a. Only Commit - insert statement
  BEGIN TRAN
insert into students values(121,'vijay','bba',2023)
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions

 --  b. Only Rollback - update statement
 begin tran
 update students
 set department='bca'
 WHERE 
    sid = 117 
	select * from students where sid = 117 
	rollback tran 
	select * from students where sid = 117 

  -- c. Savepoint - commit update and insert statements, rollback delete statement
  begin tran
  insert into students values(122,'sanjay','bca',2023)
  update students
  set department='bca'
 WHERE 
    sid = 117 
  save tran temp_tran
  delete students where sid=116
  select * from students
   rollback tran temp_tran
   commit
    select * from students


