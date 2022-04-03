
--------------   PIVOT ------------------------------------

-- Pivot is a sql server operator that can be used to turn unique values from one
--  column, into multiple columns in the output, 
-- there by effectively rotating a table. 


use gana

-- Create Table tblProductSales1
-- (
--  SalesAgent nvarchar(50),
--  SalesCountry nvarchar(50),
--  SalesAmount int
-- )


-- Insert into tblProductSales1 values('Tom', 'UK', 200)
-- Insert into tblProductSales1 values('John', 'US', 180)
-- Insert into tblProductSales1 values('John', 'UK', 260)
-- Insert into tblProductSales1 values('David', 'India', 450)
-- Insert into tblProductSales1 values('Tom', 'India', 350)
-- Insert into tblProductSales1 values('David', 'US', 200)
-- Insert into tblProductSales1 values('Tom', 'US', 130)
-- Insert into tblProductSales1 values('John', 'India', 540)
-- Insert into tblProductSales1 values('John', 'UK', 120)
-- Insert into tblProductSales1 values('David', 'UK', 220)
-- Insert into tblProductSales1 values('John', 'UK', 420)
-- Insert into tblProductSales1 values('David', 'US', 320)
-- Insert into tblProductSales1 values('Tom', 'US', 340)
-- Insert into tblProductSales1 values('Tom', 'UK', 660)
-- Insert into tblProductSales1 values('John', 'India', 430)
-- Insert into tblProductSales1 values('David', 'India', 230)
-- Insert into tblProductSales1 values('David', 'India', 280)
-- Insert into tblProductSales1 values('Tom', 'UK', 480)
-- Insert into tblProductSales1 values('John', 'US', 360)
-- Insert into tblProductSales1 values('David', 'UK', 140)



-- Select * from tblProductSales1


-- -- A simple GROUP BY query can produce this output.
Select SalesCountry, SalesAgent, SUM(SalesAmount) as Total
from tblProductSales1
group by SalesCountry, SalesAgent
order by SalesCountry, SalesAgent




-- Query using PIVOT operator:

Select SalesAgent, India, US, UK
from tblProductSales1
Pivot
(
   Sum(SalesAmount) for SalesCountry in ([India],[US],[UK])
) as PivotTable


--- now suppose if we have more rows than we need in the table 

-- then create a derived table and then run the pivot query on that


Select SalesAgent, India, US, UK
from
(
   Select SalesAgent, SalesCountry, SalesAmount from tblProductsSale -- this is derived table
) as SourceTable
Pivot
(
 Sum(SalesAmount) for SalesCountry in (India, US, UK)
) as PivotTable