--Scenario1 Solution on Aggregate Window Function

use DBase
go

select * from ProductCategoryTable
select * from ProductsTable


select 
	c.ProductCategoryid
	,c.ProductCategoryName
	,p.ProductName
	,p.SellingPrice 
from 
	ProductCategoryTable c inner join ProductsTable p
	on c.ProductCategoryid=p.ProductCategoryid


select 
	c.ProductCategoryid
	,c.ProductCategoryName
	,p.ProductName
	,p.SellingPrice 
	,AVG(p.SellingPrice) OVER(PARTITION BY c.ProductCategoryid) AS AveragePriceByCategory
	,p.SellingPrice-AVG(p.SellingPrice) OVER(PARTITION BY c.ProductCategoryid) AS DifferenceAveragePriceByCategory
from 
	ProductCategoryTable c inner join ProductsTable p
	on c.ProductCategoryid=p.ProductCategoryid


--By www.ellarr.com     Vikas Munjal