--creating Database
CREATE DATABASE TASK8
USE TASK8

--table creation
create table stud_details(
studentid int,
studentname varchar(20),
semester varchar(20),
securedmarks int,
totalmarks int
);

insert into stud_details values(1,'John','Sem 1',450,500),
(2,'hari','Sem 3',470,500),(3,'vasa','Sem 3',460,500),
(5,'viku','Sem 1',440,500),(4,'hema','Sem 1',430,500)

select * from stud_details

--1. Create User-define Scalar function to calculate percentage of all students after creating the following table.
create function percentage_func(@mark decimal(5,2),@tmark Decimal(5,2))
returns decimal(5,2)
as
begin
declare  @percentage decimal(5,2)

set @percentage = (@mark/@tmark)*100
return @percentage
end

select * , dbo.percentage_func(securedmarks,totalmarks)as percentage_of_students from stud_details

drop function dbo.percentage_func


--2. Create user-defined function to generate a table that contains result of Sem 3 students.
alter function fn_only_sem3 (@sem varchar(20))
returns table
as
return(select * from dbo.stud_details where  semester=@sem)

select * from fn_only_sem3('Sem 3')

--3. Write SQL stored procedure to retrieve all students details. (No parameters)
create procedure all_details
as 
begin
select * from stud_details
end
 exec all_details

 --4. Write SQL store procedure to display Sem 1 students details. (One parameter)
alter procedure sp_sem_1(@sem varchar(20))
as
begin
select * from stud_details where semester=@sem
end

exec sp_sem_1 @sem='Sem 1'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure sp_total_students(@total int output)
as
begin
select @total = count(studentid) from stud_details
end
declare @total_stud int
exec sp_total_students @total_stud output
print 'the total number of students : '+ cast(@total_stud as varchar(20))

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.

--creating sem 1 table
create table sem_1(studentid int,
studentname varchar(20),
semester varchar(20),
securedmarks int,
totalmarks int
);



select * from stud_details
select * from sem_1

update stud_details set semester='Sem 2' where studentname='John'

MERGE  sem_1 t 
    USING (select * from stud_details where semester='Sem 1' )as s
ON (s.studentid = t.studentid)
WHEN MATCHED
    THEN UPDATE SET 
        t.studentname = s.studentname,
        t.securedmarks = s.securedmarks
WHEN NOT MATCHED BY TARGET 
    THEN INSERT (studentid,studentname,semester,securedmarks,totalmarks)
         VALUES (s.studentid,s.studentname,s.semester,s.securedmarks,s.totalmarks)
WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;

	drop table sem_1