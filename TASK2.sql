--creating Database
create database mydata
use mydata

--creating schema
create schema database1

--table creation 

--1. Create a table with primary key, unique key, check and default constraints.

 create table database1.employee(
 empid int primary key,
 empname varchar(20) unique not null,
 age int  check(age>18),
 empdesignation varchar(20) default 'developer'
 )

 select * from database1.employee
 select * from database1.emp
 select * from itachi.emp

 insert into database1.employee values (01,'hari',20,'designer')
  insert into database1.employee (empid,empname, age)values (02,'vasa',20)

  --2. Rename a table, database & schema.
  alter database mydata modify name =mydata1

  exec sp_rename 'database1.employee','emp'

  --renaming schema
  create schema itachi

  alter schema itachi transfer database1.emp

  --3. Create a table with the following fields:
  --a. id as identity column, name, salary, increment, computed column as Revised salary(sal+inc)
 --b. Retrieve all the records whose salary is >20000 and move them into a new table using (SELECT INTO)

 create table empdetails(
 id int identity(1,1),
 name varchar(20),
 salary money,
 increment money)

 select *from empdetails
 insert into empdetails(name,salary,increment) values ('hari',30000,5000),('vasa',25000,5000),('vik',18000,5000)

 alter table empdetails add revised_salary as (salary+increment)
  
  select * into empdetails1 from empdetails where salary>20000

   select *from empdetails1