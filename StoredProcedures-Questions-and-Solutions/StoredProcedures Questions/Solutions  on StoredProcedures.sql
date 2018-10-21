
use [dbase]
go


-- Exercise 1
create procedure usp_productsinsert
 @id as int
,@productname as varchar(40)
,@suppliercompany as varchar(40)
,@listprice as int
as
insert into products (id,productname,suppliercompany,listprice) values 
(@id,@productname,@suppliercompany,@listprice)

go


exec usp_productsinsert
 @id =6
,@productname = 'Battery'
,@suppliercompany = 'Everready'
,@listprice = '2'
go

--Exercise 2

create procedure usp_productsdisplaybysupplier
@suppliercompany as varchar(40)
as
select id,productname,suppliercompany,listprice
from products
where suppliercompany = @suppliercompany
go

exec usp_productsdisplaybysupplier
@suppliercompany='bajaj'

-- Exercise 3


create procedure usp_productsdisplaybysortedlistprice
@numrows as bigint = 9223372036854775807 --maximum value for bigint is 9223372036854775807
as
select  top (@numrows) id,productname,suppliercompany,listprice
from products
order by listprice desc;
go


exec usp_productsdisplaybysortedlistprice @numrows = 2
exec usp_productsdisplaybysortedlistprice

-- Exercise 4

create proc usp_getemployeedob
@emp_no as int
,@dob as char(10) output
as
select @dob=dob
from employeedetails
where emp_no=@emp_no
go


declare  @dateofbirth char(10)
exec usp_getemployeedob @emp_no=104 , @dob=@dateofbirth output
select @dateofbirth


-- Exercise 5

if object_id('usp_productsinsert','p') is not null
	drop proc usp_productsinsert
go

if object_id('usp_productsdisplaybysupplier','p') is not null
	drop proc usp_productsdisplaybysupplier
go


if object_id('usp_productsdisplaybysortedlistprice','p') is not null
	drop proc usp_productsdisplaybysortedlistprice;
go

if object_id('usp_getemployeedob','p') is not null 
drop procedure usp_getemployeedob





