--creating Database
create database task11
USE task11


CREATE TABLE students(
sid int,
sname varchar(20),
department varchar(20),
yearofcompletion int);

insert into students values (101,'Arjun','bcom',2024),
(102,'Arun','bscit',2023),
(103,'Dhana','bcom',2024),
(104,'Divya','bscit',2020),
(105,'Hemanth','bca',2023),
(106,'Hari','bca',2023),
(107,'Harshan','bscit',2024),
(108,'Harishmitha','bca',2023),
(109,'Karthik','bscit',2020),
(110,'Priya','bcom',2020),
(111,'Harita','bca',2023),
(112,'Ranita','bca',2023),
(113,'Selva','bcom',2024),
(114,'Siva','bscit',2020),
(115,'Sharon','bscit',2023),
(116,'Vikram','bca',2023),
(117,'Vasanth','bscit',2020),
(118,'Vignesh','bca',2024),
(119,'Srikanth','bscit',2020),
(120,'Yamini','bca',2024);
truncate table students
select * from students

/*1. Show the working of PIVOT and UNPIVOT by creating a table students
(sid,sname,department,yearofcompletion) with 20 records.
Note: Simplify the table to show the number of students 
in each department and categorize them based on yearofcompletion. */

--pivot
select department,yearofcompletion,sid from (
SELECT yearofcompletion,bca,bcom,bscit FROM     
(SELECT department,yearofcompletion,sid  FROM students ) AS Tab1    
PIVOT   
(count(sid) FOR department IN (bca,bcom,bscit)) AS Tab2    
)as p
--unpivot
UNPIVOT    
(    
sid FOR department IN (bca,bcom,bscit)
) AS UnpivotTable

select * from students

--2. Create a database for Library Management.
--Analyse the required columns, perform a normalization and
--link the tables using primary and foreign key (using on update set default)

create database Library_Management
use Library_Management

--CREATING PARENT TABLE(LIBRARY)
create table library_details(library_name varchar(60),
address varchar(50),
Customer_id  int default 1 foreign key references Customer_detail(Customer_id)on update set default,
 Book_id int default 104 foreign key references Book(Book_id)on update set default,
 take_home_date date,
 return_date date)

 drop table library_details

create table Customer_detail(Customer_id int primary key ,
Customer_name varchar(20)not null ,
Mobile_number bigint not null unique)

create table Book(Book_id int Primary key,
Book_name varchar(50)  not null ,
number_pages int not null,
Published_year int not null,
Author_name varchar(20))



insert into library_details values('The National Library of India','Calcutta',1,101,'2023-03-30','2023-04-05'),
('The National Library of India','Calcutta',2,102,'2023-03-30','2023-04-03'),
('The National Library of India','Calcutta',3,103,'2023-03-30','2023-04-07')

select * from library_details

insert into Customer_detail values(1,'Hari',9876543210),
(2,'Harshan',9876543120),
(3,'Vikram',9786543210)

select * from Customer_detail

insert into Book values(101,'ikigai',501,2016,'Hector Garcia'),
(102,'wings of fire',322,1999,'Abdul Kalam'),
(103,'Nineteen Eighty-Four',531,1949,'George Orwell'),
(104,'Harry Potter and the Sorcerer',701,1997,'Bloomsbury'),
(105,'The Name of the Wind',1001,2007,'Patrick Rothfuss')

  select * from Book


  select * from library_details
  select * from Customer_detail
  select * from Book


  --on update set default

   update Book set Book_ID=107
	  where book_ID=101

	    update Customer_detail set Customer_id=7
	  where Customer_id=3

 
