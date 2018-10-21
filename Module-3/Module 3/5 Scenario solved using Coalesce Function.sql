--Scenario solved using Coalesce Function

USE [DBase]
GO



CREATE TABLE [CTC](
	[Id] [int] NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
	[Hourly_Payment] [int] NULL,
	[Salary] [int] NULL,
	[Commission] [int] NULL,
	[NOH] [int] NULL)

GO


INSERT [CTC] ([Id], [Name], [Hourly_Payment], [Salary], [Commission], [NOH]) VALUES (1, N'Gary', NULL, 5000, NULL, NULL)
INSERT [CTC] ([Id], [Name], [Hourly_Payment], [Salary], [Commission], [NOH]) VALUES (2, N'Adam', NULL, NULL, 2000, NULL)
INSERT [CTC] ([Id], [Name], [Hourly_Payment], [Salary], [Commission], [NOH]) VALUES (3, N'Alex', 200, NULL, NULL, 14)
INSERT [CTC] ([Id], [Name], [Hourly_Payment], [Salary], [Commission], [NOH]) VALUES (4, N'John', 230, NULL, NULL, 10)
INSERT [CTC] ([Id], [Name], [Hourly_Payment], [Salary], [Commission], [NOH]) VALUES (5, N'Mike', NULL, 4000, NULL, NULL)

GO

select * from [CTC]

go

select 
Id
,Name
,coalesce(
Hourly_Payment*NOH
,Salary
,Commission
) as CostToCompany
from [CTC]

--By www.ellarr.com     Vikas Munjal