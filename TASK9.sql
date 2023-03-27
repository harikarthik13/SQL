--creating Database
USE TASK8
select * from stud_details

--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
create procedure conditional_procedure(@stud_name varchar(20))
as 
begin 
select * from dbo.stud_details where studentname = @stud_name
end
exec conditional_procedure @stud_name='hari'

--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
alter procedure case_procedure
as
begin
select *,
case
when (securedmarks>=480 and securedmarks<=500 ) then 'very good'
when (securedmarks>=460 and securedmarks<480 ) then 'good'
when (securedmarks>=440 and securedmarks<460 ) then 'average'
else 'poor'
 end as Remarks
 from stud_details
 end

 exec case_procedure

 --3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

 --table variable 
 declare @tablevar table(
studentid int,
studentname varchar(20),
semester varchar(20),
securedmarks int,
totalmarks int
 );
 insert into @tablevar
 select studentid,studentname,semester,securedmarks,totalmarks from stud_details
 select * from @tablevar



 --temporary table(Local)
 CREATE TABLE #localtemptable
(
 roll_no int,
 stud_name varchar(25), 
 department varchar(25)
)
insert into #localtemptable values(1,'hari','bca')
select* from #localtemptable

--temporary table(global)
 CREATE TABLE ##globaltemptable
(
 roll_no int,
 stud_name varchar(25), 
 department varchar(25)
)
insert into ##globaltemptable values(1,'hari','bca')
select* from ##globaltemptable

--temporary stored procedures(local)
alter PROCEDURE #localtempstoredpro  
AS  
BEGIN  
PRINT 'Hey there i am local temporary stored procedure'  
END
exec #localtempstoredpro

--temporary stored procedures(global)
create PROCEDURE ##globaltempstoredpro  
AS  
BEGIN  
PRINT 'Hey there i am global temporary stored procedure'  
END
exec ##globaltempstoredpro




  