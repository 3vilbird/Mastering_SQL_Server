-- In SQL server there are 3 types of triggers
-- 1. DML triggers 
-- 2. DDL triggers
-- 3. Logon trigger




--------------------------------- DML TRIGGERS -----------------------------------



-- In general, a trigger is a special kind of stored procedure that automatically 
-- executes when an event occurs in the database server.

-- DML stands for Data Manipulation Language. INSERT, UPDATE, and DELETE statements are 
-- DML statements. DML triggers are fired, when ever data is modified using INSERT, UPDATE, and DELETE events.

-- DML triggers can be again classified into 2 types.
-- 1. After triggers (Sometimes called as FOR triggers)
-- 2. Instead of triggers



-- After triggers, as the name says, fires after the triggering action. The INSERT, UPDATE, and DELETE statements,
--  causes an after trigger to fire after the respective statements complete execution.

-- On ther hand, as the name says, INSTEAD of triggers, fires instead of the triggering action. The INSERT, UPDATE, 
-- and DELETE statements, can cause an INSTEAD OF trigger to fire INSTEAD OF the respective statement execution.


use gana

-- SQL Script to create tblEmployeeAudit table:
-- CREATE TABLE tblEmployeeAudit
-- (
--  Id int identity(1,1) primary key,
--  AuditData nvarchar(1000)
-- )



-- Example for AFTER TRIGGER for INSERT event on tblEmployee table:

-- CREATE TRIGGER tr_tblEMployee_ForInsert
-- ON tblEmployee
-- FOR INSERT
-- AS
-- BEGIN
--  Declare @Id int
--  Select @Id = Id from inserted -- 

--  insert into tblEmployeeAudit 
--  values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
-- END



-- inserted



-- In the trigger, we are getting the id from inserted table. So, what is this inserted 
-- table? INSERTED table, is a special table used by DML triggers. When you add a new row into
--  tblEmployee table, a copy of the row will also be made into inserted table, which only a trigger
--   can access. You cannot access this table outside the context of the trigger. The structure of 
--   the inserted table will be identical to the structure of tblEmployee table.



--  Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)

select*
from tblEmployeeAudit

-- same for the delete trigger

-- CREATE TRIGGER tr_tblEMployee_ForDelete
-- ON tblEmployee
-- FOR DELETE
-- AS
-- BEGIN
--  Declare @Id int
--  Select @Id = Id from deleted

--  insert into tblEmployeeAudit 
--  values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
-- END


-- The only difference here is that, we are specifying, the triggering
--  event as DELETE and retrieving the deleted row ID from DELETED



-- AFTER UPDATE TRIGGERS



-- Triggers make use of 2 special tables, INSERTED and DELETED. The inserted table
--  contains the updated data and the deleted table contains the old data. The After 
-- trigger for UPDATE event, makes use of both inserted and deleted tables. 


-- Create AFTER UPDATE trigger script:

Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
    Select *
    from deleted
    Select *
    from inserted
End


Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 4


Alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
    -- Declare variables to hold old and updated data
    Declare @Id int
    Declare @OldName nvarchar(20), @NewName nvarchar(20)
    Declare @OldSalary int, @NewSalary int
    Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
    Declare @OldDeptId int, @NewDeptId int

    -- Variable to build the audit string
    Declare @AuditString nvarchar(1000)

    -- Load the updated records into temporary table
    Select *
    into #TempTable
    from inserted

    -- Loop thru the records in temp table
    While(Exists(Select Id
    from #TempTable))
      Begin
        --Initialize the audit string to empty string
        Set @AuditString = ''

        -- Select first row data from temp table
        Select Top 1
            @Id = Id, @NewName = Name,
            @NewGender = Gender, @NewSalary = Salary,
            @NewDeptId = DepartmentId
        from #TempTable

        -- Select the corresponding row from deleted table
        Select @OldName = Name, @OldGender = Gender,
            @OldSalary = Salary, @OldDeptId = DepartmentId
        from deleted
        where Id = @Id

        -- Build the audit string dynamically           
        Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
        if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName

        if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender

        if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))

        if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))

        insert into tblEmployeeAudit
        values(@AuditString)

        -- Delete the row from temp table, so we can move to the next row
        Delete from #TempTable where Id = @Id
    End
End





















