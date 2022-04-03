
-- we came across the updation or insertion of data in the view

-- under multiple tables

-- there  we saw the problem that it doesn't behave as expected

-- to ver come that we go for insted of trigger

-- it states that making direct operation in the view while insserting the data the insted of insert 

-- trigger will be fired.

-- Script to create the view:
use gana

-- select * from tblEmployee
-- select * from tblDepartment


-- Create view vWEmployeeDetails
-- as
-- Select Id, Name, Gender, DeptName
-- from tblEmployee 
-- join tblDepartment
-- on tblEmployee.DepartmentId = tblDepartment.DeptId


select *
from vWEmployeeDetails




-- Script to create INSTEAD OF INSERT trigger:

-- Create trigger tr_vWEmployeeDetails_InsteadOfInsert
-- on vWEmployeeDetails
-- Instead Of Insert
-- as
-- Begin
--     Declare @DeptId int

--     --Check if there is a valid DepartmentId
--     --for the given DepartmentName
--     Select @DeptId = DeptId
--     from tblDepartment
--         join inserted
--         on inserted.DeptName = tblDepartment.DeptName

--     --If DepartmentId is null throw an error
--     --and stop processing
--     if(@DeptId is null)
--  Begin
--         Raiserror('Invalid Department Name. Statement terminated', 16, 1)
--         return
--     End

--     --Finally insert into tblEmployee table
--     Insert into tblEmployee
--         (Id, Name, Gender, DepartmentId)
--     Select Id, Name, Gender, @DeptId
--     from inserted
-- End



-- Insert into vWEmployeeDetails values(8, 'Valarie', 'Female', 'IT')


select *
from tblDepartment

--update tbldepartment set Deptname='HR' where deptid=3



-----------------------  insted of update ----------------------------------




select *
from vWEmployeeDetails



-- Script to create INSTEAD OF UPDATE trigger:

-- Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
-- on vWEmployeeDetails
-- instead of update
-- as
-- Begin
--     -- if EmployeeId is updated
--     if(Update(Id)) -- Update function gives is the giben col is updated or not
--  Begin
--         Raiserror('Id cannot be changed', 16, 1)
--         Return
--     End

--     -- If DeptName is updated
--     if(Update(DeptName)) 
--  Begin
--         Declare @DeptId int

--         Select @DeptId = DeptId
--         from tblDepartment
--             join inserted
--             on inserted.DeptName = tblDepartment.DeptName

--         if(@DeptId is NULL )
--   Begin
--             Raiserror('Invalid Department Name', 16, 1)
--             Return
--         End

--         Update tblEmployee set DepartmentId = @DeptId
--   from inserted
--             join tblEmployee
--             on tblEmployee.Id = inserted.id
--     End

--     -- If gender is updated
--     if(Update(Gender))
--  Begin
--         Update tblEmployee set Gender = inserted.Gender
--   from inserted
--             join tblEmployee
--             on tblEmployee.Id = inserted.id
--     End

--     -- If Name is updated
--     if(Update(Name))
--  Begin
--         Update tblEmployee set Name = inserted.Name
--   from inserted
--             join tblEmployee
--             on tblEmployee.Id = inserted.id
--     End
-- End





-- Update vWEmployeeDetails 
-- set DeptName = 'IT'
-- where Id =8


-- Update vWEmployeeDetails 
-- set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
-- where Id = 1




















