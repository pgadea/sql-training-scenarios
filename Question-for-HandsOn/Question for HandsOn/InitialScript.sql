USE [DBase]
GO

IF OBJECT_ID('[dbo].[Employees]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Employees] 
GO

CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] NULL,
	[fullname] [varchar](100) NULL,
	[reportsto] [int] NULL
) 


INSERT INTO [dbo].[Employees]
           ([EmployeeId]
           ,[fullname])
           values(1,'ashish')
           

INSERT INTO [dbo].[Employees]
           ([EmployeeId]
           ,[fullname]
           ,[reportsto])
     VALUES
          (2,'naveen',1),(3,'ritesh',2),(4,'vikas',2),(5,'sanjay',1),(6,'rajesh',5)
GO

select * from Employees
GO