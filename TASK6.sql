--creating Database
CREATE DATABASE TASK6
USE TASK6

--creating salesman table
CREATE TABLE SALESMAN (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(10),
    commission DECIMAL(4,2)
 
);
INSERT INTO SALESMAN VALUES( 5001 , 'James Hoog' , 'New York' , 0.15), (5002 , 'Nail Knite ', 'Paris', 0.13),
  ( 5005 , 'Pit Alex '  , 'London'   , 0.11),(5006 , 'Mc Lyon '   ,'Paris '   , 0.14),
       (  5007 , 'Paul Adam ' ,' Rome'     , 0.13),
        ( 5003 ,' Lauson Hen' , 'San Jose ', 0.12)

		update salesman set city='Paris' where salesman_id =5006

SELECT * FROM SALESMAN
truncate table SALESMAN
drop table SALESMAN

--creating customer table
create table customer(
customer_id int primary key,
cust_name varchar(20),
city varchar(20),
grade int,
salesman_id int foreign key references SALESMAN(salesman_id)
);

INSERT INTO customer VALUES(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007)
INSERT INTO customer(customer_id,cust_name,city,salesman_id) VALUES(3001,'Brad Guzan','London',5005)

SELECT * FROM customer
drop table customer

--creating orders table
create  table Orders 
(ord_no int,
purch_amt numeric(8,3),
ord_date date,
customer_id int foreign key references customer (customer_id),
salesman_id int foreign key references SALESMAN (salesman_id)
);

insert into orders values (70001     ,  150.5    ,   '2012-10-05 ', 3005      ,   5002),
(70009    ,   270.65     , '2012-09-10 ' ,3001        , 5005),
(70002    ,   65.26      , '2012-10-05 ' ,3002        , 5001),
(70004    ,   110.5     , ' 2012-08-17' , 3009       ,  5003),
(70007    ,   948.5     , ' 2012-09-10' , 3005       ,  5002),
(70005    ,   2400.6    , ' 2012-07-27 ' ,3007        , 5001),
(70008    ,   5760      ,  '2012-09-10'  ,3002       ,  5001),
(70010   ,    1983.43   , ' 2012-10-10 ' ,3004        , 5006),
(70003   ,    2480.4    ,  '2012-10-10 ' ,3009       ,  5003),
(70012   ,    250.45   ,  ' 2012-06-27 ' ,3008        , 5002),
(70011   ,    75.29    ,  ' 2012-08-17 ', 3003       ,  5007),
(70013   ,    3045.6   ,  ' 2012-04-25' , 3002         ,5001)

select  * from SALESMAN;
select * from Customer;
select * from Orders

--From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

select sm.name as SalesMan,cus.cust_name as customer, cus.city as same_city
from Salesman  as sm 
inner join Customer as cus
on sm.city=cus.city


--From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

select  cus.Cust_name as Customer_name,sm.city,sm.name as Salesman,
sm.commission from Salesman as sm inner join customer as cus
on sm.salesman_id=cus.salesman_id
where sm.commission > 0.12;


--From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
select sm.salesman_id,sm.commission,cus.grade,cus.cust_name,o.ord_date,o.purch_amt from SALESMAN AS sm
full join
Customer as cus
on sm.salesman_id=cus.salesman_id
full join
orders as o
on cus.customer_id=o.customer_id

--From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

select o.ord_no,o.purch_amt,cust_name,cus.city from customer as cus
inner join Orders as o
on cus.customer_id=o.customer_id
where purch_amt between 500 and 2000

--From the above tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
select cust_name,cus.city,cus.grade,sm.name,sm.city from salesman as sm
inner join customer as cus
on cus.salesman_id=sm.salesman_id
order by customer_id
