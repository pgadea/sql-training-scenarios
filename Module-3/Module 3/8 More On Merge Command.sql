-- Step 1 - Please run the following script

USE DBase;
GO

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL 
  DROP TABLE dbo.Employee; 

  IF OBJECT_ID('dbo.EmployeeUpdate', 'U') IS NOT NULL 
  DROP TABLE dbo.EmployeeUpdate; 

-- Step 2 - Create a master table and populate some rows



CREATE TABLE dbo.Employee
( EmployeeID int ,
  FullName nvarchar(40),
  EmploymentStatus int
);
GO

INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (1, 'David Hamilton',1);
 INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (2, 'Nupur Argawal',1);
INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (3, 'Guido Pica',2);
INSERT INTO dbo.Employee  (EmployeeID, FullName, EmploymentStatus)
  VALUES (4, 'Kim Truelsen',1);
GO

-- Step 3 - Create a table of updates and populate some rows
--          Note that we are updating David Hamilton's employment
--          status and Kim Truelsen is now Kim Akers. Also, we
--          have a new employee

CREATE TABLE dbo.EmployeeUpdate
( EmployeeUpdateID int IDENTITY(1,1) ,
  EmployeeID int NOT NULL,
  FullName nvarchar(40) NULL,
  EmploymentStatus int NULL
);
GO

INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (1, 'Vikas Munjal',3);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (4, 'Jaya Gupta',1);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (4, 'Joy Sharma ',12);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (5, 'David Harris',1);
GO

go


select * from Employee
select * from EmployeeUpdate

-- Error : Because there are two EmployeeID which has value 4 in the EmployeeUpdate Table

MERGE INTO dbo.Employee AS e
USING dbo.EmployeeUpdate AS eu
ON e.EmployeeID = eu.EmployeeID
WHEN MATCHED THEN
    UPDATE SET e.FullName = eu.FullName,
               e.EmploymentStatus = eu.EmploymentStatus
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, FullName, EmploymentStatus)
        VALUES (eu.EmployeeID, eu.FullName, eu.EmploymentStatus)
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

Go


DELETE FROM DBO.EMPLOYEEUPDATE WHERE FULLNAME='JOY SHARMA '

go



SELECT * FROM EMPLOYEE
SELECT * FROM EMPLOYEEUPDATE

--WHEN NOT MATCHED BY SOURCE Option in MERGE command

MERGE INTO dbo.Employee AS e
USING dbo.EmployeeUpdate AS eu
ON e.EmployeeID = eu.EmployeeID
WHEN MATCHED THEN
    UPDATE SET e.FullName = eu.FullName,
               e.EmploymentStatus = eu.EmploymentStatus
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, FullName, EmploymentStatus)
        VALUES (eu.EmployeeID, eu.FullName, eu.EmploymentStatus)
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

go

SELECT * FROM EMPLOYEE

--By www.ellarr.com     Vikas Munjal

