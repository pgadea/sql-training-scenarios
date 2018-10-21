USE DBase;
GO

select *  FROM SalesOrderValues;


---------------------------------------------------------------------
--Question 1
-- Write a SELECT statement to retrieve the orderid, orderdate, and val columns as well as a calculated column named rowno 
--from the table SalesOrderValues. Use the ROW_NUMBER function to return rowno. Order the row numbers by the orderdate column.


---------------------------------------------------------------------
SELECT 
	orderid, 
	orderdate,
	val,
	ROW_NUMBER() OVER (ORDER BY orderdate) AS rowno
FROM SalesOrderValues;


---------------------------------------------------------------------

--Question 2
-- Copy the previous T-SQL statement and modify it by including an additional column named rankno. 
--To create rankno, use the RANK function, with the rank order based on the orderdate column.


---------------------------------------------------------------------
SELECT 
	orderid, 
	orderdate,
	val,
	ROW_NUMBER() OVER (ORDER BY orderdate) AS rowno,
	RANK() OVER (ORDER BY orderdate) AS rankno
FROM SalesOrderValues;


---------------------------------------------------------------------

--Question 3
-- Write a SELECT statement to retrieve the orderid, orderdate, custid, and val columns as well as a calculated column named orderrankno 
--from the SalesOrderValues table. The orderrankno column should display the rank per each customer independently, based on val ordering 
--in descending order. 

---------------------------------------------------------------------
SELECT 
	orderid, 
	orderdate,
	custid,
	val,
	RANK() OVER (PARTITION BY custid ORDER BY val DESC) AS orderrankno
FROM SalesOrderValues;


---------------------------------------------------------------------

--Question 4 
-- Write a SELECT statement to retrieve the custid and val columns from the SalesOrderValues table. Add two calculated columns: 
--  orderyear as a year of the orderdate column 
--  orderrankno as a rank number, partitioned by the customer and order year, and ordered by the order value in descending order. 

---------------------------------------------------------------------

SELECT 
	custid,
	val,
	YEAR(orderdate) as orderyear,
	RANK() OVER (PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno
FROM SalesOrderValues;

---------------------------------------------------------------------

--Question 5 
-- Copy the previous query and modify it to filter only orders with the first two ranks based on the orderrankno column.
--

---------------------------------------------------------------------

SELECT
	s.custid,
	s.orderyear,
	s.orderrankno,
	s.val
FROM
(
	SELECT 
		custid,
		val,
		YEAR(orderdate) as orderyear,
		RANK() OVER (PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno
	FROM SalesOrderValues
) AS s
WHERE s.orderrankno <= 2;


--Question 6
--Write a SELECT statement to return the orderid, orderdate, and val columns for the current row and the val column from the previous row 
--as prevval. Add a calculated column named diffprev to show the difference between the current val and previous val.

SELECT 
	orderid, 
	orderdate,
	val,
	LAG(val) OVER (ORDER BY orderdate, orderid) AS prevval,
	val - LAG(val) OVER (ORDER BY orderdate, orderid) AS diffprev
FROM SalesOrderValues;


--Question 7
-- Write a SELECT statement to retrieve the custid, orderid, orderdate, and val columns from the SalesOrderValues table. 
-- Add a calculated column named percoftotalcust that contains a percentage value of each order sales amount compared to 
-- the total sales amount for that customer. 


---------------------------------------------------------------------
SELECT 
	custid,
	orderid,
	orderdate,
	val,
	100 * val / SUM(val) OVER (PARTITION BY custid) AS percoftotalcust
FROM SalesOrderValues
ORDER BY custid, percoftotalcust DESC;