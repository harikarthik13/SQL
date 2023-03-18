--creating Database
create database Tdetails
use Tdetails 

--creating table 
 create table Worker(
 Worker_id int primary key,
 First_name varchar(25),
 Last_name varchar(20),
 Salary int,
 Joining_date DATETIME,
 Department varchar(20)
 )


INSERT INTO Worker 
(WORKER_ID,FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(001,'Monika', 'Arora', 100000, '2014-05-20 09:00:00', 'HR'), 
(002,'Niharika', 'Verma', 80000, '2014-05-21 09:00:00', 'Admin'), 
(003,'Vishal', 'Singhal', 300000, '2014-05-22 09:00:00', 'HR'), 
(004,'Amitabh', 'Singh', 500000, '2014-05-23 09:00:00', 'Admin'), 
(005,'Vivek', 'Bhati', 500000, '2014-05-25 09:00:00', 'Admin')
 INSERT INTO Worker 
(WORKER_ID,FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin');
select * from Worker

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as

select FIRST_NAME as WORKER_NAME from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 select FIRST_NAME,upper(FIRST_NAME) as UPPERCASE from Worker

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
   select distinct Department  as UNIQUEDEPT from worker 

 --Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

 select FIRST_NAME,Substring(FIRST_NAME,1,3) as substring_fn from worker

 --Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its
--length.
 select distinct Department,len(Department)  as unidept_len from worker 

 --Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single
--column COMPLETE_NAME. A space char should separate them.

select FIRST_NAME+' '+Last_name as FULLNAME from worker

--Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker
--table.
select * from worker as trainees2 where FIRST_NAME='Vipul' or FIRST_NAME='Satish'

--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker as dept_admin where Department='Admin'

--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker as fn_endswith_a where FIRST_NAME like '%a'

--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker as fn_contains_a where FIRST_NAME like '%a%'
