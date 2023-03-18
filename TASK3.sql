--creating Database
create database empdetails
use empdetails

--creating department table
create table department(
deptid int primary key,
deptname varchar(20))

insert into department values(100,'DEVELOPER')
insert into department values(101,'UI/UX')
select * from department

--CREATING ADDRESS TABLE 
create table address(
addressid int identity(1,1)primary key,
city varchar(20),
state varchar(20),
pincode int)
 
 select * from address
 drop table address

 insert into address(city,state,pincode) values('Mannford','Oklahoma(OK)',74044)
insert into address (city,state,pincode)  values('Sidney','Ohio(OH)',45365)


--CREATING EMPLOYEE TABLE

create table Employee(
 id int identity(1,1),
 name varchar(20) not null,
 designation varchar(20) not null,
 deptid int foreign key references department(deptid),
 mobile1 bigint unique,
 mobile2 bigint unique,
 streetaddress varchar(20) not null,
 addressid int foreign key references address(addressid)
 )


 insert into Employee (name,designation,deptid,mobile1,mobile2,streetaddress,addressid) values ('JOHN','DEVELOPER',100,9865741236,6325478962,'234 Hinton Rd',1)
  insert into Employee (name,designation,deptid,mobile1,streetaddress,addressid) values ('JAMIE','DESIGNER',101,7893245698,'214 Doorley Rd',2)
   insert into Employee (name,designation,deptid,mobile1,mobile2,streetaddress,addressid) values ('JACK','DEVELOPER',100,5647896523,9856741236,'236 Hinton Rd',1)

   drop table Employee
   select * from Employee