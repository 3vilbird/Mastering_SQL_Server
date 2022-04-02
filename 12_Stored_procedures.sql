

-- STORED PROCEDURES

-- A stored procedure is group of T-SQL (Transact SQL) statements. If you have a situation, 
--where you write the same query over and over again, you can save that specific query as a stored procedure 
--and call it just by it's name.


SELECT *
FROM tblPerson

select *
from tblGender


--insert into tblPerson (ID,Name,Gender,Age) values(2,'test',2,18 )

-- creating the procedure

-- CREATE PROCEDURE spgetdata
-- as
-- begin
-- select * from tblPerson1
-- end


-- executing the procedue

-- exec spgetdata


-- sp_  not recomended to use in SP resoan being
-- system procedurs hs those sp_ to avoid the ambuiguity


-- to view the sp -- sp_helptext [spname]

sp_helptext
spgetdata

-- altering the sp AND ADDING THE ENCRYPTION

-- ALTER PROCEDURE spgetdata
-- WITH
--     ENCRYPTION -- TODO: to encrypt the sp
-- as
-- begin
--     select *
--     from tblPerson1
-- end



-- sp with input params

-- CREATE PROCEDURE spwithParams
-- @Age int,
-- @Gender int 
-- as
-- begin
-- select Name,Gender,Age from tblPerson where Gender=@Gender and Age=@Age
-- end



-- execution 

spwithParams 50,1
 
 or 
spwithParams @Gender=1,@Age=50


-- to encrypt use  WITH ENCRYPTION 


-- TO DELETE THE SP


-- DROP PROC SP_NAME OR DROP PROCEDURE PROC_NAME


-- procedure with output param


-- sp_help spwithParams -- gives info about the sp 

--sp_depends spwithParams -- gives the list of dependent lke tables


-- sp with output prams

-- CREATE PROCEDURE spwithOutParams
-- @cnt int OUTPUT
-- as
-- begin
--  select @cnt=Count(ID)  from tblPerson 

-- end

-- -- execution  -- here the @count is initialized to null
-- declare @count INT
-- exec spwithOutParams @count out
-- print @count


-- You can pass parameters in any order, when you use the parameter names.

-- Return  values in sp


-- What are stored procedure status variables?
-- Whenever, you execute a stored procedure, it returns an integer 
-- status variable. Usually, zero indicates success, and non-zero 
-- indicates failure

-- -- example
-- Re-written stored procedure using return variables
-- Create Procedure spGetTotalCountOfEmployees2
-- as
-- Begin
--  return (Select COUNT(ID) from Employees)
-- End

-- Executing spGetTotalCountOfEmployees2 returns 3.
-- Declare @TotalEmployees int
-- Execute @TotalEmployees = spGetTotalCountOfEmployees2
-- Select @TotalEmployees

-- USING RETURN WE CAN RETURN ONLY THE INTEGRES BUT NTO OTHER DATA TYPES

-- WE CAN RETIRN ONLY ONE VALUE



-- DIFFERENCE BETWEEN RETURN AND OUT PARAMETER


--  RETURN -> RETURNS ONLY INT,ONLY ONE VALUE,USED TO CONVEY SUCCESS OR FAIL


-- OUT PUT --> ANY DATA TYPE,MORE THAN ONE VALUE,USED TO RETURM THE VALUES LIKE NAME,ID ETC













