--Please execute the following command to perform the stored procedure exercises

USE [DBase]
GO

CREATE TABLE [dbo].[EmployeeDetails](
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Gender] [char](10) NULL,
	[Salary] [int] NULL,
	[City] [varchar](20) NULL
) 
GO


CREATE TABLE [dbo].[Products](
	[id] [int] NOT NULL primary key,
	[productname] [varchar](40) NOT NULL,
	[suppliercompany] [varchar](40) NOT NULL,
	[listprice] [int] NULL
)

INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (100, 'Mahesh', '1965-12-12', 'Male      ', 30000, 'Delhi')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (101, 'Suresh', '1963-11-14', 'Male      ', 34000, 'Delhi')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (102, 'Raju', '1969-12-21', 'Male      ', 23000, 'Shimla')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (103, 'Kalpana', '1961-12-01', 'Female    ', 50000, 'Noida')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (104, 'Neha', '1971-12-01', 'Female    ', 19000, 'Goa')
INSERT [dbo].[EmployeeDetails] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (105, 'SUNITA', '1958-12-01', 'Female    ', 50000, 'Delhi')
INSERT [dbo].[Products] ([id], [productname], [suppliercompany], [listprice]) VALUES (1, 'Keyboard', 'TVSGold', 3)
INSERT [dbo].[Products] ([id], [productname], [suppliercompany], [listprice]) VALUES (2, 'Monitor', 'LG', 5)
INSERT [dbo].[Products] ([id], [productname], [suppliercompany], [listprice]) VALUES (3, 'AC', 'LG', 400)
INSERT [dbo].[Products] ([id], [productname], [suppliercompany], [listprice]) VALUES (4, 'Bikes', 'Bajaj', 700)
INSERT [dbo].[Products] ([id], [productname], [suppliercompany], [listprice]) VALUES (5, 'Bulb', 'Bajaj', 2)
