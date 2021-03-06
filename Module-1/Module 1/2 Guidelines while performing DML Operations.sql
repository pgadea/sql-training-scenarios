--Creating a table used in the video demonstration
Use DBase
Go


CREATE TABLE [dbo].[EmployeeDetails](
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Gender] [char](10) NULL,
	[Salary] [int] NULL,
	[City] [varchar](20) NULL)

GO

INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (100, N'Mahesh', N'1965-12-12', N'Male      ', 30000, N'Delhi')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (101, N'Suresh', N'1963-11-14', N'Male      ', 34000, N'Delhi')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (102, N'Rajat', N'1969-12-21', N'Male      ', 23000, N'Shimla')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (103, N'Kalpana', N'1961-12-01', N'Female    ', 40000, N'Goa')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (104, N'Neha', N'1971-12-01', N'Female    ', 19000, N'Goa')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (105, N'SUNITA', N'1958-12-01', N'Female    ', 50000, N'Delhi')

GO

--Creating a backup table

CREATE TABLE [dbo].[EMPLOYEEDETAILS1](
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Gender] [char](10) NULL,
	[Salary] [int] NULL,
	[City] [varchar](20) NULL
)

GO


INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (100, N'Mahesh', N'1965-12-01', N'Male      ', 30000, N'Delhi')
INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (101, N'Suresh', N'1963-11-14', N'Male      ', 34000, N'Delhi')
INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (102, N'Rajat', N'1969-12-21', N'Male      ', 23000, N'Shimla')
INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (103, N'Kalpana', N'1961-12-01', N'Female    ', 40000, N'Goa')
INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (104, N'Neha', N'1971-12-01', N'Female    ', 19000, N'Goa')
INSERT [dbo].[EMPLOYEEDETAILS1] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (105, N'Sunitha', N'1958-12-01', N'Female    ', 50000, N'Delhi')





--Good  Practice while performing DML operations (insert, update, delete) in SQL Server

select *  from EMPLOYEEDETAILS1 

UPDATE [EMPLOYEEDETAILS] SET DOB='1965-12-12' WHERE EMP_NO=100

UPDATE [EMPLOYEEDETAILS] SET NAME='SUNITA' 


select *  from EMPLOYEEDETAILS

go
truncate table EmployeeDetails
go

insert into EmployeeDetails
select *  from EMPLOYEEDETAILS1 
go

select *  from EMPLOYEEDETAILS
go

--Good practice to perform the insert , update or delete operations inside a transaction and immediately rollback it to
--avoid any locking issues

begin tran
UPDATE [EMPLOYEEDETAILS] SET DOB='1965-12-12' WHERE EMP_NO=100
UPDATE [EMPLOYEEDETAILS] SET NAME='SUNITA' 
--where EMP_NO=105
select *  from EMPLOYEEDETAILS 
rollback

go


select *  from EMPLOYEEDETAILS 


--www.ellarr.com     Vikas Munjal



