


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


