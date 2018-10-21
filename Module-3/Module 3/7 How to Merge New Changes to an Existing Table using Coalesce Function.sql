--Please Make Sure You have finished the previous Demo
--MERGE Command with COALESCE

use DBase
go

DELETE FROM dbo.EmployeeUpdate;
GO

INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (1, NULL,3);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (4, 'Jaya Gupta',NULL);
INSERT INTO dbo.EmployeeUpdate (EmployeeID,FullName,EmploymentStatus)
VALUES (6, 'Alex Cook',1);
select * from Employee
select * from EmployeeUpdate

MERGE INTO dbo.Employee AS e
USING dbo.EmployeeUpdate AS eu
ON e.EmployeeID = eu.EmployeeID
WHEN MATCHED THEN
    UPDATE SET e.FullName = COALESCE(eu.FullName,e.FullName),
               e.EmploymentStatus = COALESCE(eu.EmploymentStatus,e.EmploymentStatus)
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, FullName, EmploymentStatus)
        VALUES (eu.EmployeeID, eu.FullName, eu.EmploymentStatus);

SELECT * FROM dbo.Employee;


--By www.ellarr.com     Vikas Munjal
