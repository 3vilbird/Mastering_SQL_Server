


-- 1. You cannot pass parameters to a view. Table Valued functions are an excellent replacement 
-- for parameterized views.


-- We will use tblEmployee table for our examples. SQL Script to create tblEmployee table:
-- CREATE TABLE tblEmployee
-- (
--  Id int Primary Key,
--  Name nvarchar(30),
--  Salary int,
--  Gender nvarchar(10),
--  DepartmentId int
-- )

-- Insert data into tblEmployee table
-- Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
-- Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)

-- Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
-- Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
-- Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
-- Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)




-- -- Error : Cannot pass Parameters to Views
-- Create View vWEmployeeDetails
-- @Gender nvarchar(20)
-- as
-- Select Id, Name, Gender, DepartmentId
-- from  tblEmployee
-- where Gender = @Gender


-- Table Valued functions can be used as a replacement for parameterized views.
-- Create function fnEmployeeDetails(@Gender nvarchar(20))
-- Returns Table
-- as
-- Return 
-- (Select Id, Name, Gender, DepartmentId
-- from tblEmployee where Gender = @Gender)

-- Calling the function
-- Select * from dbo.fnEmployeeDetails('Male')




-- 2. Rules and Defaults cannot be associated with views.

-- 3. The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified.


-- 4. Views cannot be based on temporary tables.


-- Error: Cannot create a view on Temp Tables