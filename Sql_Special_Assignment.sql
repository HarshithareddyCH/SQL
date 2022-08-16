--Clients table
Create table Clients
(
Client_ID int Primary Key,
Cname nVARCHAR(40) Not Null,
Address nVARCHAR(30),
Email nVARCHAR(30) Unique,
Phone bigint,
Business nVARCHAR(20) Not Null
)
-------------------------------------------------------------------------------------------------------------------------------------------------
--Departments table
Create table Departments
(
Deptno int Primary Key,
Dname nVARCHAR(15) Not Null,
Loc nVARCHAR(20)
)
-------------------------------------------------------------------------------------------------------------------------------------------------
--Employees table 
Create table Employees(
Empno int Primary Key,
Ename nVARCHAR(20) Not Null,
Job nVARCHAR(15),
Salary int,
Deptno int references Departments(Deptno),
CHECK(Salary > 0))
-------------------------------------------------------------------------------------------------------------------------------------------------
--Projects table
Create Table Projects(
Project_ID int Primary Key,
Descr nVARCHAR(30) Not Null ,
Start_Date DATE ,
Planned_End_Date DATE ,
Actual_End_date DATE ,
Check(Actual_End_date>Planned_End_Date),
Budget int, 
check(Budget>0),
Client_ID int references Clients(Client_id))
-------------------------------------------------------------------------------------------------------------------------------------------------
--EmpProjectTasks 
Create Table EmpProjectTasks(
Project_ID int references Projects(Project_ID),
Empno Int  references Employees(Empno),
Start_Date DATE,
End_Date DATE,
Task nVARCHAR(25) Not Null,
Status nVARCHAR(15)
Primary Key(Project_ID,Empno)
)
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for clients table
insert into Clients values(1001, 'ACME Utilities', 'Noida', 'contact@acmeutil.com' ,9567880032,'Manufacturing'),(1002, 'Trackon Consultants', 'Mumbai', 'consult@trackon.com', 8734210090, 'Consultant'),
(1003, 'MoneySaver Distributors', 'Kolkata', 'save@moneysaver.com', 7799886655, 'Reseller'),(1004, 'Lawful Corp', 'Chennai', 'justice@lawful.com', 9210342219, 'Professional')
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for Departments table
insert into Departments values(10 ,'Design' ,'Pune'),(20 ,'Development' ,'Pune'),(30 ,'Testing' ,'Mumbai'),(40 ,'Document' ,'Mumbai')
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for Employees table
insert into Employees values (7001 ,'Sandeep' ,'Analyst', 25000 ,10),(7002 ,'Rajesh' ,'Designer', 30000 ,10),(7003 ,'Madhav' ,'Developer' ,40000 ,20),
(7004 ,'Manoj' ,'Developer' ,40000 ,20),(7005 ,'Abhay', 'Designer' ,35000 ,10),(7006 ,'Uma' ,'Tester', 30000 ,30),(7007 ,'Gita' ,'Tech. Write' ,30000 ,40),
(7008 ,'Priya' ,'Tester' ,35000 ,30),(7009 ,'Nutan','Developer' ,45000 ,20),(7010, 'Smita', 'Analyst', 20000 ,10),(7011 ,'Anand' ,'Project Mgr' ,65000 ,10)
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for Projects table
insert into Projects values(401 ,'Inventory' ,'01-Apr-11' ,'01-Oct-11' ,'31-Oct-11' ,150000, 1001)
insert into Projects(Project_ID, Descr ,Start_Date ,Planned_End_Date ,Budget ,Client_ID) 
values(402 ,'Accounting' ,'01-Aug-11' ,'01-Jan-12' ,500000 ,1002),
(403, 'Payroll', '01-Oct-11' ,'31-Dec-11' ,75000, 1003),
(404 ,'Contact Mgmt' ,'01-Nov-11' ,'31-Dec-11', 50000 ,1004)
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for EmpProjectTasks table
Insert into EmpProjectTasks 
values(401 ,7001 ,'01-Apr-11' ,'20-Apr-11' ,'System Analysis' ,'Completed'),(401, 7002, '21-Apr-11', '30-May-11', 'System Design', 'Completed'),
(401, 7003 ,'01-Jun-11' ,'15-Jul-11' ,'Coding', 'Completed'),(401, 7004 ,'18-Jul-11', '01-Sep-11', 'Coding', 'Completed'),
(401, 7006, '03-Sep-11', '15-Sep-11' ,'Testing' ,'Completed'),(401 ,7009 ,'18-Sep-11' ,'05-Oct-11' ,'Code Change' ,'Completed'),
(401, 7008, '06-Oct-11' ,'16-Oct-11' ,'Testing','Completed'),(401 ,7007 ,'06-Oct-11' ,'22-Oct-11' ,'Documentation' ,'Completed'),
(401, 7011, '22-Oct-11' ,'31-Oct-11', 'Sign off', 'Completed'),(402, 7010, '01-Aug-11' ,'20-Aug-11' ,'System Analysis' ,'Completed'),
(402 ,7002, '22-Aug-11', '30-Sep-11','System Design' ,'Completed')
-------------------------------------------------------------------------------------------------------------------------------------------------
--inserting values for EmpProjectTasks table
Insert into EmpProjectTasks(Project_ID, Empno, Start_Date, Task, Status) 
values(402, 7004, '01-Oct-11' ,'Coding', 'In Progress')
-------------------------------------------------------------------------------------------------------------------------------------------------