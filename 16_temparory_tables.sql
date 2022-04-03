-- What are Temporary tables?

-- Temporary tables, are very similar to the permanent tables. 
-- Permanent tables get created in the database you specify, and remain in the 
-- database permanently, until you delete (drop) them. On the other hand, temporary 
-- tables get created in the TempDB and are automatically deleted, when they are no 
-- longer used.



-- 2 types in sql server 
-- local temporary table
-- global temporary tables

-- TODO:  LOCAL TEMPORARY TABLES



-- How to Create a Local Temporary Table:
-- Creating a local Temporary table is very similar to creating a
-- permanent table, except that you prefix the table name with 1 pound (#) symbol.
-- In the example below, #PersonDetails is a local temporary table, with Id and Name 
-- columns.

-- Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Insert into #PersonDetails Values(1, 'Mike')
-- Insert into #PersonDetails Values(2, 'John')
-- Insert into #PersonDetails Values(3, 'Todd')


Select *
from #PersonDetails

--  How to check if the local temporary table is created
-- Temporary tables are created in the TEMPDB. Query the sysobjects system table in TEMPDB. The name of the table, is suffixed with lot of underscores and a random number. For this reason you have to use the LIKE operator in the query.

Select name
from tempdb..sysobjects
where name like '#PersonDetails%'


-- table name will be appended with inuque hash at he end



-- You can also check the existence of temporary tables using object 
-- explorer. In the object explorer, expand TEMPDB database folder, 
--  and then exapand TEMPORARY TABLES folder, and you should see the 
-- temporary table that we have created.



-- A local temporary table is available, only for the connection that 
-- has created the table. If you open another query window, and execute 
-- the following query you get an error stating 'Invalid object 
-- name #PersonDetails'. This proves that local temporary tables are 
-- available, only for the connection that has created them.




-- A local temporary table is automatically dropped,
-- / when the connection that has created the it, is closed. If the user
--  wants to explicitly drop the temporary table, he can do so using

-- DROP TABLE #PersonDetails


-- If the temporary table, is created inside the stored procedure, 
-- it get's dropped automatically upon the completion of stored procedure -- 
--  execution. The stored procedure below, creates #PersonDetails temporary 
-- table, populates it and then finally returns the data and destroys the 
-- temporary table immediately after the completion of the stored procedure 
--  execution.




-- Create Procedure spCreateLocalTempTable
-- as
-- Begin
-- Create Table #PersonDetailsv1(Id int, Name nvarchar(20))

-- Insert into #PersonDetails Values(1, 'Mike')
-- Insert into #PersonDetails Values(2, 'John')
-- Insert into #PersonDetails Values(3, 'Todd')

-- Select * from #PersonDetailsv1
-- End



-- It is also possible for different connections, to create a local 
-- temporary table with the same name. For example User1 and User2, 
-- both can create a local temporary table with the same name #PersonDetails.
--  Now, if you expand the Temporary Tables folder in the TEMPDB database,
--  you should see 2 tables with name #PersonDetails and some random number 
-- at the end of the name. To differentiate between, the User1 and User2 
-- local temp tables, sql server appends the random number at the end of
--  the temp table name. 



------------------------- GLOBAL TEMPORARY TABLES ----------------------------------


-- To create a Global Temporary Table, prefix the name of the table with 2 
-- pound (##) symbols. EmployeeDetails Table is the global temporary table,
--  as we have prefixed it with 2 ## symbols.



Create Table ##EmployeeDetails
(
    Id int,
    Name nvarchar(20)
)

-- Global temporary tables are visible to all the connections of the sql 
-- server, and are only destroyed when the last connection referencing 
-- the table is closed.

-- Multiple users, across multiple connections can have local temporary 
-- tables with the same name, but, a global temporary table name has to be 
-- unique, and if you inspect the name of the global temp table, in the 
-- object explorer, there will be no random numbers suffixed at the end
--  of the table name.



-- Difference Between Local and Global Temporary Tables: ----------------------

-- 1. Local Temp tables are prefixed with single pound (#) symbol,
--  where as gloabl temp tables are prefixed with 2 pound (##) symbols.

-- 2. SQL Server appends some random numbers at the end of the local 
-- temp table name, where this is not done for global temp table names.


-- 3. Local temporary tables are only visible to that session of the 
--SQL Server which has created it, where as Global temporary tables
-- are visible to all the SQL server sessions.


-- 4. Local temporary tables are automatically dropped, when the session 
-- that created the temporary tables is closed, where as Global temporary 
--tables are destroyed when the last connection that is referencing the 
-- global temp table is closed.




















































