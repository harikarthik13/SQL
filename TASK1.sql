--creating Database
create database mydatabase
use mydatabase

--table creation
--DDL--CREATE
create table Hari1(
Employee_id int,
Employee_name varchar(25),
Employee_designation varchar(25)
)
--DQL--SELECT
select*from Hari1

--DML--INSERT
insert into Hari1 values(01,'hari','designer'),(02,'sharon','develepor'),(03,'vasanth','developer'),(01,'divakar','tester')

--SQL TASK -1

--CREATE TABLE
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATE,
DEPARTMENT CHAR(25)
);

--DQL--SELECT
select * from Trainees

--insert values

insert into Trainees values(01,'harikarthik','A',70000,'2023-01-23','Fullstack')
insert into Trainees values(02,'Sharondavid','D',80000,'2023-01-23','Fullstack'),(03,'Vasanth','Y',60000,'2023-01-23','pentester'),(04,'vikram','R.V',50000,'2023-01-23','Fullstack'),(05,'Karthick','K',70000,'2023-01-23','Fullstack')
insert into Trainees values(06,'hemanth','S',50000,'2023-01-23','designer'),(07,'siva','S',30000,'2023-01-23','Tester'),(08,'harshan','R',60000,'2023-01-23','designer')
insert into Trainees values(09,'Arjun','V',40000,'2023-01-23','designer'),(10,'selva','S',70000,'2023-01-23','Backend'),(11,'darshan','M',25000,'2023-01-23','developer')
insert into Trainees values(12,'Srikanth','B',25000,'2023-01-23','Tester'),(13,'harita','L',70000,'2023-01-23','Backend'),(14,'darshan','M',550000,'2023-01-23','developer')
insert into Trainees values(15,'Harishmita','V',40000,'2023-01-23','developer'),(16,'yamini','S',50000,'2023-01-23','Backend'),(17,'ranita','L',70000,'2023-01-23','developer')
insert into Trainees values(18,'dhana','V',55000,'2023-01-23','designer'),(19,'Vignesh','K',50000,'2023-01-23','Backend'),(20,'dhivyaprakash','N',40000,'2023-01-23','Tester')

--DDL-TRUNCATE & DELETE
truncate table Trainees
drop table Trainees

--Retrieve all SALARY BETWEEN 20000 TO 50000
select * from Trainees where SALARY between 20000 and 50000

--Retrieve all FIRST_NAME STARTING WITH J-T and should differentiate between Uppercase and lowercase.
select * from Trainees where FIRST_NAME like '[J-T]%' COLLATE SQL_Latin1_General_CP1_CS_AS 

--Retrieve all FIRST_NAME ending with i
select * from Trainees where FIRST_NAME like '%i'

 -- Retrieve all salary without duplications
select distinct SALARY  from Trainees 

--Retrieve all records whose department is Developer and Designer
select * from Trainees where DEPARTMENT like 'developer' or DEPARTMENT like 'designer'
select * from Trainees where DEPARTMENT IN ('designer','developer')

--Retrieve all Trainee_ID less than 5
select * from Trainees where Trainee_ID <=5

--Limit the records by retrieving the 6 to 15 records
select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only

--Retrieve the top 5 records with Ties
select top 5 with ties  * from  Trainees order by SALARY

--Retrieve the records in descending order based on department column.
select  * from Trainees order by DEPARTMENT desc

--Retrieve the records in descending order based on department column.
select * from Trainees where LAST_NAME like '__a%'