--Solution

USE [DBase]
GO

select * from Employees
GO


;WITH Managers AS 
( 
--initialization
 
SELECT EmployeeID, fullname, CAST('No Manager' as  varchar(100)) as [ManagerName], 1 as level
FROM Employees 
WHERE ReportsTo IS NULL 
UNION ALL 
--recursive execution 
SELECT e.employeeID,e.fullname,m.fullname, level+1
FROM Employees e INNER JOIN Managers m  
ON e.ReportsTo = m.employeeID 
) 
SELECT * FROM Managers 
