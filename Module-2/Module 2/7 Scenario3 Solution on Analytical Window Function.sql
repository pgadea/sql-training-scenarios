-- Scenario3 Solution on Analytical Window Function

use DBase
go


select *  from ProductStockByYear


--Query1
SELECT ProductCategoryName
	,ProductName
	,StockYear
	,EndStock 
	,LAG(EndStock, 1,0) OVER (
		  PARTITION BY ProductCategoryName,ProductName 
		  ORDER BY StockYear) AS PreviousYearStock
  FROM ProductStockByYear


--Query2
SELECT ProductCategoryName
	,ProductName
	,StockYear
	,EndStock 
	,EndStock-FIRST_VALUE(EndStock) OVER (
		  PARTITION BY ProductCategoryName,ProductName 
		  ORDER BY StockYear) AS StockDiff
  FROM ProductStockByYear


--By www.ellarr.com     Vikas Munjal