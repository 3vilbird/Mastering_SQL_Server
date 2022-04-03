


-- In SQL Server there are 3 types of User Defined functions
-- 1. Scalar functions
-- 2. Inline table-valued functions
-- 3. Multistatement table-valued functions



-- Scalar functions may or may not have parameters, but always return a single (scalar) value. The returned value can be of any data type, except text,
--  ntext, image, cursor, and timestamp.


-- To create a function, we use the following syntax:
-- CREATE FUNCTION Function_Name(@Parameter1 DataType, @Parameter2 DataType,..@Parametern Datatype)
-- RETURNS Return_Datatype
-- AS
-- BEGIN
--     Function Body
--     Return Return_Datatype
-- END


-- CREATE FUNCTION AgeCalculator(@DOB Date)  
-- RETURNS INT  
-- AS  
-- BEGIN  
--  DECLARE @Age INT  
--  SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END  
--  RETURN @Age  
-- END


Select dbo.Age(dbo.AgeCalculator('10/08/1982'))


--  CREATE FUNCTION Age(@DOB Date)  
-- RETURNS INT  
-- AS  
-- BEGIN  
--  DECLARE @Age INT  
--  SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END  
--  RETURN @Age  
-- END



Select dbo.Age(dbo.Age('10/08/1982'))

Select dbo.Age( dbo.Age('10/08/1982'))



-- A stored procedure also can accept DateOfBirth and return Age, but you cannot use stored procedures in a select or where clause. This is just one difference between a function and a stored procedure. There are several other differences, which we will talk about in a later session.

-- To alter a function we use ALTER FUNCTION FuncationName statement and to delete it, we use DROP FUNCTION FuncationName.

-- INLINE TABLE VALUED FUNCTIONS


--  a scalar function, returns a single value. on the other hand, an 
--  Inline Table Valued function, 
-- return a table. 


-- CREATE FUNCTION Function_Name(@Param1 DataType, @Param2 DataType..., @ParamN DataType)
-- RETURNS TABLE
-- AS
-- RETURN (Select_Statement)



CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select Id, Name, DateOfBirth, Gender, DepartmentId
from tblEmployees
where Gender = @Gender)



-- 1. We specify TABLE as the return type, instead of any scalar data type

-- 2. The function body is not enclosed between BEGIN and END block. Inline 
--    table valued function body, cannot have BEGIN and END block.

-- . The structure of the table that gets returned, is determined by the SELECT statement with in the function.


-- Calling the user defined function
-- Select * from fn_EmployeesByGender('Male')

-- Where can we use Inline Table Valued functions
-- 1. Inline Table Valued functions can be used to achieve the functionality of parameterized views. We will talk about views, in a later session.
-- 2. The table returned by the table valued function, can also be used in joins with other tables.



Select Name, Gender, DepartmentName
from fn_EmployeesByGender('Male') E
    Join tblDepartment D on D.Id = E.DepartmentId




-- multi values table function


-- Multi-statement Table Valued function(MSTVF):
Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (Id int,
    Name nvarchar(20),
    DOB Date)
as
Begin
    Insert into @Table
    Select Id, Name, Cast(DateOfBirth as Date)
    From tblEmployees

    Return
End


-- dofference between table vlaued and multi statement tbale valued funxtion
-- https://csharp-video-tutorials.blogspot.com/2012/09/multi-statement-table-valued-functions.html















