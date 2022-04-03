use  gana


select *
from tblEmployee
select *
from tblDepartment


-- updateing a single tabled view

-- Create view vWEmployeesDataExceptSalary
-- as
-- Select Id, Name, Gender, DepartmentId
-- from tblEmployee


Select *
from vWEmployeesDataExceptSalary

-- -- updating the view that update the tabbles
-- Update vWEmployeesDataExceptSalary 
-- Set Name = 'Mikey' Where Id = 2


Select *
from vWEmployeesDataExceptSalary


Delete from vWEmployeesDataExceptSalary where Id = 2
Insert into vWEmployeesDataExceptSalary
values
    (2, 'Mikey', 'Male', 2)

-- udating the multiple tables  view --

-- Create view vwEmployeeDetailsByDepartment
-- as
--     Select Id, Name, Salary, Gender, DeptName
--     from tblEmployee
--         join tblDepartment
--         on tblEmployee.DepartmentId = tblDepartment.DeptId

Select *
from vwEmployeeDetailsByDepartment


-- Update vwEmployeeDetailsByDepartment 
-- set DeptName='IT' where Name = 'John'



-- Notice, that Ben's department is also changed to IT. 
-- To understand the reasons for incorrect UPDATE, select Data 
-- from tblDepartment and tblEmployee base tables. 


-- The UPDATE statement, updated DeptName from HR to IT in tblDepartment 
-- table, instead of upadting DepartmentId column in tblEmployee table. 
-- So, the conclusion - If a view is based on multiple tables, and 
-- if you update the view, it may not update the underlying base tables 
-- correctly. To correctly update a view, that is based on multiple table,
--  INSTEAD OF triggers are used.

















