--creating Database
CREATE DATABASE TASK7
USE TASK7

--a. Create a table with 25 records for various departments using the following details:
--studentid(pk), studentname, department, score.

create table Student_details (student_id int primary key identity(1,1),
student_name varchar(20),
departmant varchar(20),
score int);
insert into Student_details values('Hari','BCA',500),('Hemanth','Bsc-It',460)
insert into Student_details values('Harshan','Bsc-It',490),('Sharon','Bsc-It',480),('Karthi','Bsc-Ct',495),('Siva Barath','BCA',450),('Vasanth','BCA',490),('Vikram','BCA',478),('Rinita','Bsc-ct',460)
insert into Student_details values('Harita','Bsc-It',480),('Yamini','Bsc-Ct',478),('Harishmitha','BCA',496),('Srikanth','BCA',454),('Priyadharshan','Bsc-Ct',465),('Selva','BCA',492),('Dhanaprakash','Bsc-it',479),('Arun','BCA',461),('venkit','BCA',478),('Vignesh','BCA',455)
insert into Student_details values('DivyaPrakash','Bsc-It',498),('Raina','Bsc-It',480),('Dhoni','BCA',500),('Virat','BCA',550),('sachin','BCA',465),(' aswin','BCA',490)

select * from Student_details
truncate table Student_details

--creating non clustered index
create index dept on Student_details(departmant)

--Create a filtered index for department='BCA'

create index bca_dept on Student_details(departmant) where departmant='BCA'

--Create a view for students in BCA department.
CREATE VIEW bca_stud_view
as select student_name from Student_details where departmant='BCA'

select * from bca_stud_view
DROP VIEW bca_stud_view

-- Apply Rank() for all the students based on score.
SELECT student_name, score ,rank() over (order by score desc)as Ranking from Student_details

--Apply Dense_Rank() for students in each department based on score.
select student_name,departmant,score, dense_rank() over(partition by departmant order by score desc) as dept_rank from Student_details


--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).
--creating manager table
create table manager(
manager_id int primary key,
manager_name varchar(20));

insert into manager values(1,'hari')
insert into manager values(2,'vasa'),(3,'viku')

select * from manager
DROP table manager

--creating employee table
create table employee(
eid int primary key,
ename varchar(20),
mid int foreign key references manager(manager_id),
department varchar(20));

drop table employee

insert into employee1 values(101,'sharon',1,'java developer'),
 (102,'karthi',2,'php developer'),
(103,'hema',3,'dot net developer'),
(104,'siva',2,'tester'),
(105,'karthi',1,'python developer')

truncate table employee
select * from employee
drop table employee
--1. Create a complex view by retrieving the records from Manager and Employee table.

create view manager_employee
as
select m.manager_id,m.manager_name,e.eid,e.ename,e.department from manager as m
full join 
employee as e
on m.manager_id = e.mid

select * from manager_employee

--Show the working of 'on delete cascade on update set default' for the above tables


create table employee1(
eid int primary key,
ename varchar(20),
mid int default 1 foreign key(mid) references manager(manager_id)on delete cascade on update set default,
department varchar(20));

select * from manager
select * from employee1

delete from manager where manager_id =2

update manager set manager_id=4 where manager_id=3