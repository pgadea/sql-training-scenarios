--Creating a Date Table using Recursive CTE
Use DBase
go

WITH TimeCTE ([Time]) AS
	(SELECT CAST('20150101 00:00:00' AS DATETIME)			
	UNION ALL
	SELECT DATEADD(DAY, 1, [Time])
	FROM TimeCTE
	WHERE [Time] < CAST('20201231 23:50:00' AS DATETIME)
	)
SELECT 

 [Time]
--,DATEPART(HOUR, Time) as Hour
,CONVERT(date, Time) as Date
--,DATEPART(MINUTE, Time) as Minutes
,DATEPART(WEEKDAY, Time) as WeekDay
,datename(month, Time) as MonthName
,DATEPART(MONTH, Time) as MonthNumber 
FROM TimeCTE 
OPTION(MAXRECURSION 0)

go

SELECT Cast(
   CAST(DATEPART(YYYY,getdate()) AS [CHAR](4))
       + RIGHT('0' + CAST(DATEPART(M,getdate()) AS [VARCHAR](2)),2)  
       + RIGHT('0' + CAST(DATEPART(D,getdate()) AS [VARCHAR](2)),2)
	   as numeric(10,0));

go

--Adding a DateKey Column

WITH TimeCTE ([Time]) AS
	(SELECT CAST('20150101 00:00:00' AS DATETIME)			
	UNION ALL
	SELECT DATEADD(DAY, 1, [Time])
	FROM TimeCTE
	WHERE [Time] < CAST('20201231 23:50:00' AS DATETIME)
	)
SELECT 
Cast(
 CAST(DATEPART(YYYY,[Time]) AS [CHAR](4))
       + RIGHT('0' + CAST(DATEPART(M,[Time]) AS [VARCHAR](2)),2)  
       + RIGHT('0' + CAST(DATEPART(D,[Time]) AS [VARCHAR](2)),2) 
 as numeric(10,0))   as DateKey
,CONVERT(date, Time) as Date
,DATEPART(YEAR, Time) as [Year]
,DATEPART(WEEKDAY, Time) as WeekDay
,datename(month, Time) as MonthName
,DATEPART(MONTH, Time) as MonthNumber 
FROM TimeCTE 
OPTION(MAXRECURSION 0)

--By www.ellarr.com     Vikas Munjal