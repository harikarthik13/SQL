--creating Database
create database tdatabase
use tdatabase

--creating table
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

drop table Trainees

INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-04-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-04-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-05-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-05-20', 'Admin');

select * from Trainees
truncate table Trainees

--Write an SQL query to get the count of employees in each department.
SELECT DEPARTMENT,  COUNT(TRAINEE_ID) as 'No of Employees' FROM Trainees  GROUP BY DEPARTMENT;

--Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select JOINING_DATE, dateadd(day,5, JOINING_DATE )as induction_program_day from Trainees

--Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
SELECT JOINING_DATE,
CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
'July','August','September','October','November','December') AS JOINING_MONTH
FROM Trainees;

--Write an SQL query to perform the total and subtotal of salary in each department.
SELECT coalesce (DEPARTMENT, 'All Departments') AS DEPARTMENT,
  sum(SALARY) as sum_of_salary
  FROM Trainees
  GROUP BY ROLLUP (DEPARTMENT);

--Write an SQL query to retrieve first 3 records randomly.
select top 3 * from Trainees order by newid()


--Show the working of composite key with any example.

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL ,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
constraint composite_key primary key(FIRST_NAME,LAST_NAME)
);
select * from Trainees

--Show the working of IIF and CASE for the above table.
SELECT IIF(DEPARTMENT='HR', 'HEAD_OF_ALL', 'NEED_A_PROMOTION') as Result FROM Trainees

SELECT TRAINEE_ID,FIRST_NAME,LAST_NAME,SALARY,
CASE
    WHEN salary >= 100000 THEN 'Senior Employee'
   ELSE 'Junior Employee'
   END AS 'Employee Details'
   FROM Trainees;


--Show the working of Sequence.
CREATE SEQUENCE hey_sequence
AS INT
START WITH 1 
INCREMENT BY 1 

SELECT * FROM sys.sequences WHERE name = 'hey_sequence';

SELECT NEXT VALUE FOR hey_sequence;

--Show the working of creation of Synonym for a table in DB1 from DB2.
 CREATE SYNONYM db2
     FOR Tdetails.dbo.Worker;

	 select * from db2

--Show the working of IDENTITY_INSERT.
 create table empdetails(
 id int identity(1,1),
 name varchar(20),
 salary money,
 increment money)

  select *from empdetails
 insert into empdetails(name,salary,increment) values ('hari',30000,5000),('vasa',25000,5000),('vik',18000,5000)

 set identity_insert empdetails on;
 insert into empdetails(id,name,salary,increment) values(50,'sharon',20000,3000) 
  set identity_insert empdetails off;
   insert into empdetails(name,salary,increment) values('karthick',10000,2000) 