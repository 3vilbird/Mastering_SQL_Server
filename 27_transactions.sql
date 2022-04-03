

-- What is a Transaction?
-- A transaction is a group of commands that change the data stored in a database.
--  A transaction, is treated as a single unit. A transaction ensures that, either all of the commands 
--  succeed, or none of them. If one of the commands in the transaction fails, all of the commands fail, 
--  and any data that was modified in the database is rolled back. In this way, transactions maintain the 
--  integrity of data in a database.



-- Transaction processing follows these steps:
-- 1. Begin a transaction.
-- 2. Process database commands.
-- 3. Check for errors. 
--    If errors occurred, 
--        rollback the transaction, 
--    else, 
--        commit the transaction



use gana

-- Create Table tblMailingAddress
-- (
--    AddressId int NOT NULL primary key,
--    EmployeeNumber int,
--    HouseNumber nvarchar(50),
--    StreetAddress nvarchar(50),
--    City nvarchar(10),
--    PostalCode nvarchar(50)
-- )



-- Insert into tblMailingAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW') 


-- Create Table tblPhysicalAddress
-- (
--  AddressId int NOT NULL primary key,
--  EmployeeNumber int,
--  HouseNumber nvarchar(50),
--  StreetAddress nvarchar(50),
--  City nvarchar(10),
--  PostalCode nvarchar(50)
-- )

-- Insert into tblPhysicalAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW')



-- Create Procedure spUpdateAddress
-- as
-- Begin
--  Begin Try
--   Begin Transaction
--    Update tblMailingAddress set City = 'LONDON' 
--    where AddressId = 1 and EmployeeNumber = 101
   
--    Update tblPhysicalAddress set City = 'LONDON' 
--    where AddressId = 1 and EmployeeNumber = 101
--   Commit Transaction
--  End Try
--  Begin Catch
--   Rollback Transaction
--  End Catch
-- End



-- Alter Procedure spUpdateAddress
-- as
-- Begin
--  Begin Try
--   Begin Transaction
--    Update tblMailingAddress set City = 'LONDON12' 
--    where AddressId = 1 and EmployeeNumber = 101
   
--    Update tblPhysicalAddress set City = 'LONDON LONDON' 
--    where AddressId = 1 and EmployeeNumber = 101
--   Commit Transaction
--  End Try
--  Begin Catch
--   Rollback Transaction
--  End Catch
-- End