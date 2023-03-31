--creating Database
create database task14
USE task14
--CREATING TABLE
Create  table Hobbies
(HobbyID INT primary key, 
HobbyName varchar(25) unique )


--1. insert records into the table using a stored procedure.
CREATE PROCEDURE InsertHobby
  @HobbyID INT,
  @HobbyName VARCHAR(50)
AS
BEGIN
  INSERT INTO Hobbies (HobbyID, HobbyName)
  VALUES (@HobbyID, @HobbyName);
END;
 
EXEC InsertHobby 1, 'Drawing';
EXEC InsertHobby 2, 'Playing sports';
EXEC InsertHobby 3, 'watching Anime';

select * from Hobbies

--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.

alter procedure duplicate_errors
 @HobbyID INT,
  @HobbyName VARCHAR(50)
  as
  begin try
    INSERT INTO Hobbies (HobbyID, HobbyName)
  VALUES (@HobbyID, @HobbyName);
  end try
begin catch
print ERROR_NUMBER()
print ERROR_MESSAGE()
print ERROR_SEVERITY()
print ERROR_STATE()
print 'oops!! sorry cannot insert duplicate values'
end catch
  exec duplicate_errors 1,'watching anime'
   exec duplicate_errors 5,'football'
   exec duplicate_errors 7,'listening music'
  
  select * from Hobbies

  --3. Store the error details in an errorbackup table.

  --creating backup table
  Create  table backup_error_details
       (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)

alter procedure backup_errors
 @HobbyID INT,
  @HobbyName VARCHAR(50)
  as
  begin try
    INSERT INTO Hobbies (HobbyID, HobbyName)
  VALUES (@HobbyID, @HobbyName);
  end try
begin catch
insert into backup_error_details values
 
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
end catch

exec backup_errors  9,'sleeping'
exec backup_errors  5,'football'
exec backup_errors 7,'listening music'

  select * from Hobbies
    select * from backup_error_details 


	--
--b. Create a procedure to accept 2 numbers, if the numbers are equal then 
--calculate the product else use RAISERROR to show the working of exception handling.

  create procedure product(@x int,@y int)
  as
  begin
  declare @product int
  set @product=0
  if(@x=@y)
  begin
  set @product=@x*@y
  print 'the product of two number is :'+convert(varchar(30),@product)
  end
  else
  begin
  raiserror('oops!! the given numbers are not equal',16,1)
  end
  end
  exec product 1,1
    exec product 1,2


	--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
   -- Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.

   Create  table Friends(id int identity(1,1),
   name varchar(25) unique)

   create procedure throw_error(@id int ,@name varchar(25))
   as 
   begin
  if (@name like '[A,D,H,K,P,R,S,T,V,Y]%')
   begin 
  insert into  friends values(@name)
  end 
  else 
  begin 
  throw 510011,'OOPS! invalid name',3;
  end
  end

  exec throw_error 1,'arjun'
  exec throw_error 2,'ballu'
  select * from friends