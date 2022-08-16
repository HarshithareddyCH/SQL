--Query 1
Create table book
(
id int primary key,
title nvarchar(50),
author nvarchar(50),
isbn bigint unique,
published_date datetime
)

insert into book values(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17'),(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45')
,(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')


Select * from Book where author  like '%er'
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 2
Create Table reviews
(
id int,
book_id int references Book(id),
reviewer_name nvarchar(50),
content nvarchar(50),
rating int,
published_date datetime
)

insert into Reviews values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12')
,(3,2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

Select B1.title,B1.author,R1.reviewer_name from book B1, reviews R1 where B1.id=R1.book_id
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 3
Select reviewer_name,count(reviewer_name) as 'NO.OF REVIEWED BOOKS' from reviews  group by reviewer_name having count(reviewer_name)>1
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 4
Create table customer_details 
(
ID int ,
NAME nvarchar(50),
AGE int,
ADDRESS nvarchar(50),
SALARY float
)

insert into customer_details values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),(3,'Kaushik',23,'Kota',2000.00)
,(4,'Chaitali',25,'Mumbai',6500.00),(5,'Hardik',27,'Bhopal',8500.00),(6,'Komal',22,'MP',4500.00),(7,'Muffy',24,'Indore',10000.00)

select * from customer_details where ADDRESS like'%o%'
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 5
Create table orders_details
(
OID int , 
DATE datetime,
CUSTOMER_ID int ,
AMOUNT int
)

insert into orders_details values(102,'2009-10-08 00:00:00',3,3000),(100,'2009-10-08 00:00:00',3,1500),(101,'2009-11-20 00:00:00',2,1560)
,(103,'2008-05-20 00:00:00',4,2060)

select DATE ,count(CUSTOMER_ID) as 'NO.OF CUSTOMER' from orders_details group by DATE
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 6
Create table Employee_details
(
ID int ,
NAME nvarchar(50),
AGE int,
ADDRESS nvarchar(50),
SALARY float
)

insert into Employee_details values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),(3,'Kaushik',23,'Kota',2000.00)
,(4,'Chaitali',25,'Mumbai',6500.00),(5,'Hardik',27,'Bhopal',8500.00)
insert into Employee_details(ID,NAME,AGE,ADDRESS)values(6,'Komal',22,'MP'),(7,'Muffy',24,'Indore')

Select Lower(name) as 'NAME' from Employee_details where SALARY is null
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 7
Create table Student_details
(
Register_No int ,
NAME nvarchar(50),
AGE int,
Qualification nvarchar(50),
MobileNo Bigint,
Mail_id nvarchar(50),
Location nvarchar(50),
Gender varchar(2)
)

insert into Student_details values (2,'Sai',22,'B.E',995647879,'Sai@gmail.com','Chennai','M'),(3,'Kumar',20,'BSC',9564787679,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',994347879,'Selvi@gmail.com','Selam','F'),(5,'Nisha',25,'M.E',995623879,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',995641237,'SaiSaran@gmail.com','Madurai','F'),(7,'Tom',23,'BCA',995647865,'Tom@gmail.com','Pune','M')

Select Distinct(Gender),count(Gender) as 'GENDER' from Student_details group by Gender
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 8
Create table details_Course
(
C_id nvarchar(20) ,
C_Name nvarchar(50),
start_date datetime,
End_date datetime,
Fee int,
)
insert into details_Course values( 'DN003','DOTNET','2018-02-01 00:00:00','2018-02-28 00:00:00',15000),( 'DN004','DATAVISUALIZATION','2018-03-01 00:00:00','2018-04-28 00:00:00',15000),
( 'JA002','ADVANCEDJAVA','2018-01-02 00:00:00','2018-01-20 00:00:00',10000),( 'JC001','COREJAVA','2018-01-02 00:00:00','2018-01-12 00:00:00',3000)

Create table Course_Registration
(
RegisterNo int ,
Cid nvarchar(10),
Batch nvarchar(10)
)
insert into Course_Registration values(2,'DN003','FN'),(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

Select C1.C_Name, count(C2.RegisterNo) from details_Course C1, Course_Registration C2 where C1.C_id=C2.Cid group By C_Name Order By C_Name desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 9
Create Table Customerdetails 
(
Cutomer_id int, 
First_name varchar(30),
Last_name Varchar(30)
)
insert into Customerdetails values(1,'George','Washington'),(2,'John','Adams'),(3,'Thomas','Jefferson'),(4,'James','Madison')
,(5,'James','Monroe')

Create table orderdetails
(
order_id int ,
order_date date,
amount float,
customer_id int
)

insert into orderdetails values(1,'07/04/1776',234.56,1),(2,'03/14/1760',78.50,3),(3,'05/23/1784',124.00,2)
,(4,'09/03/1790',65.50,3)


Select C1.First_name,C1.Last_name,count(O1.customer_id) as 'No.Of orders'  from Customerdetails C1 ,orderdetails O1 where C1.Cutomer_id=O1.customer_id group by C1.First_name,C1.Last_name
having count(O1.customer_id)=2
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 10
Select REVERSE(Name) as 'Reverse Name' ,UPPER(Location) as 'Capitalize' from Student_details
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 11
create table ORDERTABLE(
	ordId int primary key,
	orderDate date,
	orderNumber int,
	customerId int,
	totalAmount float
)
create table PRODUCTTABLE(
	prodId int primary key,
	productName varchar(50),
	supplierId int,
	unitPrice float,
	package float,
	isDiscontinued bit
)
create table ORDERTABLEItem(
	id int primary key,
	orderId int references ORDERTABLE(ordId),
	productId int references PRODUCTTABLE(prodId),
	unitPrice float,
	quantity int
)
create view ORDERPRODUCTVIEW as select productName, quantity, orderNumber from PRODUCTTABLE PR join ORDERTABLEItem OO on PR.prodId = OO.productId join ORDERTABLE o on o.ordId = OO.orderId;
SELECT * from ORDERPRODUCTVIEW
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query 12
Select C_name from details_Course cd join Course_Registration cr on cd.C_id=cr.Cid join
Student_details sd on sd.Register_No=cr.RegisterNo where name='Nisha'

