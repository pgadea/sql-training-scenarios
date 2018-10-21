--Scenario2 on  Cummulative Total

use DBase
go



select * from [ProductsTable]
select * from [ProductCategoryTable]
select * from ProductQuantitySold




select c.ProductCategoryName,p.ProductName,sum(p.SellingPrice*s.Qty ) as Total
,sum(sum(p.SellingPrice*s.Qty )) over ( partition by c.ProductCategoryName order by sum(p.SellingPrice*s.Qty ) 
rows between unbounded preceding and current row) as RunningTotal
from [ProductCategoryTable] c
inner join 
[ProductsTable] p
on c.ProductCategoryID=p.ProductCategoryID
inner join ProductQuantitySold s
on p.ProductID=s.ProductID
group by c.ProductCategoryName,p.ProductName
order by c.ProductCategoryName,Total



--By www.ellarr.com     Vikas Munjal
