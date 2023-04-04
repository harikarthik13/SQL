
USE task11

select * from students

alter trigger dml_trigger
on students
for insert,update,delete
as
begin
if DATEPART(DW,GETDATE())= 1 or  DATEPART(DW,GETDATE())=7
begin
print 'Restricted'
rollback transaction
end
end
 insert into students values(123,'varma','bba',2023)

 --2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.


ALTER trigger UN_delete
on students
for delete 
as 
begin 
if datepart(hh,getdate()) between 11 and 15
BEGIN
print 'restricted timezone'
rollback transaction
END
end

delete from students where sid=123



--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.
alter trigger COMMAND_TRIGGER
on database
for create_table,alter_table,drop_table,rename
as 
begin
print 'command if CREATE, ALTER, DROP, RENAME operation is performed'
rollback tran
end
  
create table stud(id int)
alter table students drop column yearofcompletion
drop table stud
EXEC sp_rename 'students',' students_det' 













  