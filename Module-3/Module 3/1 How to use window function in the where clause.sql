--How to use Window Function in where condition in SQL Server

use DBase
go

SELECT 
 SalesGroup,
 Country,
 AnnualSales,
 SUM(AnnualSales) OVER(PARTITION BY SalesGroup) AS TotalSales
FROM RegionalSales
where SUM(AnnualSales) OVER(PARTITION BY SalesGroup)>100000 -- Error

GO
--SOLUTION USING COMMON TABLE EXPRESSION

With cte as
(
SELECT 
 SalesGroup,
 Country,
 AnnualSales,
 SUM(AnnualSales) OVER(PARTITION BY SalesGroup) AS TotalSales
FROM RegionalSales
)
SELECT * FROM cte WHERE TotalSales>100000


--SOLUTION USING DERIVED TABLES

SELECT * FROM 
 (
   SELECT 
   SalesGroup,
   Country,
   AnnualSales,
   SUM(AnnualSales) OVER(PARTITION BY SalesGroup) AS TotalSales
   FROM RegionalSales
 ) AS T
WHERE T.TotalSales>100000



--By www.ellarr.com     Vikas Munjal

