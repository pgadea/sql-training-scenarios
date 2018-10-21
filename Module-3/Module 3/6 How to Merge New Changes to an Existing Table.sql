-- MERGE Command  

-- Step 1 - Please run the following script

USE DBase;
GO

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL 
  DROP TABLE dbo.Employee; 
  go

  IF OBJECT_ID('dbo.EmployeeUpdate', 'U') IS NOT NULL 
  DROP TABLE dbo.EmployeeUpdate; 
  go

-- Step 2 - Create a master table and populate some rows

CREATE TABLE dbo.Employee
( EmployeeID int PRIMARY KEY,
  FullName nvarchar(40),
  EmploymentStatus int
);
GO

INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (1, 'Vikas Munjal',1);
INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (2, 'Rahul Agarwal',1);
INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (3, 'Naveen Arora',2);
INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (4, 'Jaya Gupta',1);
GO

-- Step 3 - Create a table of updates and populate some rows
--          Note that we are updating David Hamilton's employment
--          status and Kim Truelsen is now Kim Akers. Also, we
--          have a new employee

CREATE TABLE dbo.EmployeeUpdate
( EmployeeUpdateID int IDENTITY(1,1) PRIMARY KEY,
  EmployeeID int NOT NULL,
  FullName nvarchar(40) NULL,
  EmploymentStatus int NULL
);
GO

INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (1, 'Vikas Munjal',2);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (4, 'Jaya Sharma',1);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (5, 'David Smith',1);
go

select * from Employee
select * from EmployeeUpdate
GO

-- Step 4 - Perform the merge and note the use of the OUTPUT clause

MERGE INTO dbo.Employee AS e
USING dbo.EmployeeUpdate AS eu
ON e.EmployeeID = eu.EmployeeID
WHEN MATCHED THEN
    UPDATE SET e.FullName = eu.FullName,
               e.EmploymentStatus = eu.EmploymentStatus
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, FullName, EmploymentStatus)
        VALUES (eu.EmployeeID, eu.FullName, eu.EmploymentStatus);

GO

-- Step 5 - Query the target table

SELECT * FROM dbo.Employee;
GO


--By www.ellarr.com     Vikas Munjal


