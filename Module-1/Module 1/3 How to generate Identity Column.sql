-- Creating the table which has IDENTITY Column

Use DBase
go


CREATE TABLE [DemoIdentityTable](
	[Id] [int] IDENTITY(1,1) Primary Key,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 )

GO


INSERT INTO  [DemoIdentityTable] ([Name], [Address]) VALUES ('Vikas', '123 MN1')
INSERT INTO  [DemoIdentityTable] ([Name], [Address]) VALUES ('Varun', '678 MN1')
INSERT INTO  [DemoIdentityTable] ([Name], [Address]) VALUES ('Vikram', '156 RM')
INSERT INTO  [DemoIdentityTable] ([Name], [Address]) VALUES ('Rahul', '436 KM')
INSERT INTO  [DemoIdentityTable] ([Name], [Address]) VALUES ('Sumit', '56 TM')


select * from  [DemoIdentityTable] 

--By www.ellarr.com     Vikas Munjal



