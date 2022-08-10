create database TASK;
------------------------------------------------------------------------------------------------------------------------------
create table tblemployee
(
EMPNO int NOT NULL primary key,
 ENAME nvarchar(30), 
 JOB nvarchar(30),
 MRG_Id float,
 HIRDATE DATETIME,
 SAL float,
 COMM int, 
DEPTNO int 
)
INSERT INTO tblemployee VALUES
  (7369, 'SMITH', 'CLERK', 7902, '17-DEC-1980', 800, NULL, 20),(7499, 'ALLEN', 'SALESMAN', 7698, '20-FEB-1981', 1600, 300, 30)
,(7521, 'WARD', 'SALESMAN', 7698, '22-FEB-1981', 1250, 500, 30),(7566, 'JONES', 'MANAGER', 7839, '2-APR-1981', 2975, NULL, 20)
,(7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-1981', 1250, 1400, 30),(7698, 'BLAKE', 'MANAGER', 7839, '1-MAY-1981', 2850, NULL, 30)
,(7782, 'CLARK', 'MANAGER', 7839, '9-JUN-1981', 2450, NULL, 10),(7788, 'SCOTT', 'ANALYST', 7566, '09-DEC-1982', 3000, NULL, 20)
,(7839, 'KING', 'PRESIDENT', NULL, '17-NOV-1981', 5000, NULL, 10),(7844, 'TURNER', 'SALESMAN', 7698, '8-SEP-1981', 1500, 0, 30)
,(7876, 'ADAMS', 'CLERK', 7788, '12-JAN-1983', 1100, NULL, 20),(7900, 'JAMES', 'CLERK', 7698, '3-DEC-1981', 950, NULL, 30)
,(7902, 'FORD', 'ANALYST', 7566, '3-DEC-1981', 3000, NULL, 20),(7934, 'MILLER', 'CLERK', 7782, '23-JAN-1982', 1300, NULL, 10)

SELECT * FROM tblemployee
-------------------------------------------------------------------------------------------------------------------------------
create table tbldepartment
(
DEPTNO int NOT NULL primary key,
DNAME nvarchar(50),
LOC nvarchar(50)
)

INSERT INTO tbldepartment VALUES
(10 , 'ACCOUNTING','NEWYORK'),(20,'RESEARCH','DALLAS') ,(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON')

SELECT * FROM tbldepartment
-------------------------------------------------------------------------------------------------------------------------------

--1. List all employees whose name begins with 'A'. 
SELECT * FROM tblemployee 
WHERE ENAME LIKE 'A%'
-------------------------------------------------------------------------------------------------------------------------------
--2. Select all those employees who don't have a manager. 
SELECT * FROM tblemployee WHERE MRG_Id IS NULL
-------------------------------------------------------------------------------------------------------------------------------
--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
SELECT ENAME, EMPNO, SAL FROM tblemployee WHERE  1200 < SAL  AND SAL > 1400
-------------------------------------------------------------------------------------------------------------------------------
--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
UPDATE tblemployee
SET SAL = SAL + SAL*.10 WHERE DEPTNO=20
SELECT ENAME,SAL from tblemployee where DEPTNO=20
-------------------------------------------------------------------------------------------------------------------------------
--5. Find the number of CLERKS employed. Give it a descriptive heading. 
SELECT COUNT(JOB) AS 'NO.OF CLERKS' FROM tblemployee WHERE JOB='CLERK'
-------------------------------------------------------------------------------------------------------------------------------
--6. Find the average salary for each job type and the number of people employed in each job. 
SELECT JOB,COUNT(*) AS 'NO.OF JOBS', AVG(SAL) AS 'AVERAGE SALARY'
FROM tblemployee GROUP BY JOB
-------------------------------------------------------------------------------------------------------------------------------
--7. List the employees with the lowest and highest salary. 
SELECT MAX(SAL) as 'MAXIMUM SALARY' ,MIN(SAL) AS 'MINIMUM SALARY'
FROM tblemployee 
-------------------------------------------------------------------------------------------------------------------------------
--8. List full details of departments that don't have any employees. 
SELECT * FROM tbldepartment WHERE DEPTNO NOT IN (SELECT DEPTNO FROM tblemployee)
-------------------------------------------------------------------------------------------------------------------------------
--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
SELECT ENAME,SAL FROM tblemployee WHERE JOB='ANALYST' AND SAL>1200 AND DEPTNO=20 ORDER BY ENAME
-------------------------------------------------------------------------------------------------------------------------------
--10. For each department, list its name and number together with the total salary paid to employees in that department. 
SELECT D1.ENAME,D2.DEPTNO,SUM(SAL) FROM tblemployee D1, tbldepartment D2 WHERE D2.DEPTNO=D1.DEPTNO GROUP BY D2.DEPTNO,D1.ENAME
-------------------------------------------------------------------------------------------------------------------------------
--11. Find out salary of both MILLER and SMITH.
SELECT ENAME,SAL FROM tblemployee WHERE ENAME IN('MILLER','SMITH')
-------------------------------------------------------------------------------------------------------------------------------
--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
SELECT ENAME FROM tblemployee WHERE ENAME LIKE 'A%' OR ENAME LIKE 'M%'
-------------------------------------------------------------------------------------------------------------------------------
--13. Compute yearly salary of SMITH. 
select ENAME,SAL*12 AS ANNUALSALARY FROM tblemployee WHERE ENAME='SMITH'
-------------------------------------------------------------------------------------------------------------------------------
--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
SELECT ENAME, SAL FROM tblemployee WHERE SAL NOT BETWEEN 1500 AND 2850




