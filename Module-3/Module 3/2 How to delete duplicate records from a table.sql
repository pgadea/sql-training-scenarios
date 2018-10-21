use DBase
go


CREATE TABLE dbo.Employee
( 
EmpID int IDENTITY(1,1) NOT NULL, 
Name varchar(55) NULL, 
Salary decimal(10, 2) NULL, 
Designation varchar(20) NULL
 ) 
 go

 insert into Employee (Name,Salary,Designation) values ('Rahul',6000,'TL')
  insert into Employee (Name,Salary,Designation) values ('Aslam',3500,'SE')
   insert into Employee (Name,Salary,Designation) values ('Rohit',5000,'SSE')
    insert into Employee (Name,Salary,Designation) values ('Aslam',3500,'SE')
	 insert into Employee (Name,Salary,Designation) values ('Rahul',6000,'TL')
	  insert into Employee (Name,Salary,Designation) values ('Sagar',3500,'SE')
	   insert into Employee (Name,Salary,Designation) values ('Rajesh',4000,'SE')

	   go

	   select * from Employee
	   go

WITH TempEmp (EmpID,Name,Salary,Designation,duplicateRecCount)
AS
(
SELECT EmpID,Name,Salary,Designation,ROW_NUMBER() OVER(PARTITION by Name, Salary,Designation ORDER BY EmpID) 
AS duplicateRecCount
FROM dbo.Employee
)
select * from TempEmp

go

WITH TempEmp (EmpID,Name,Salary,Designation,duplicateRecCount)
AS
(
SELECT EmpID,Name,Salary,Designation,ROW_NUMBER() OVER(PARTITION by Name, Salary,Designation ORDER BY EmpID) 
AS duplicateRecCount
FROM dbo.Employee
)
DELETE FROM TempEmp
WHERE duplicateRecCount > 1 

go

select * from Employee


--By www.ellarr.com     Vikas Munjal



