--www.ellarr.com    Vikas Munjal
--Select only duplicate records from a table
--Please make sure you have executed the previous demo


use DBase
go

select * from Employee

go


delete from Employee

go

DBCC checkident(Employee,reseed,0)
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

;with CTE_Duplicate as 
(
select Name,Salary , Designation   from Employee 
group by Name,Salary ,Designation
having count(*) >1
)
select e.EmpID,e.Name,e.Salary,e.Designation from CTE_Duplicate c inner join Employee e 
on c.Name=e.Name and c.Salary=e.Salary and c.Designation=e.Designation


--By www.ellarr.com     Vikas Munjal

