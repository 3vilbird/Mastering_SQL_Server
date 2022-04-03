use gana

-- --  Script to create INSTEAD OF DELETE trigger:

-- Create Trigger tr_vWEmployeeDetails_InsteadOfDelete
-- on vWEmployeeDetails
-- instead of delete
-- as
-- Begin
--  Delete tblEmployee 
--  from tblEmployee
--  join deleted
--  on tblEmployee.Id = deleted.Id

--  --Subquery
--  --Delete from tblEmployee 
--  --where Id in (Select Id from deleted)
-- End



-- -- You can also use sub-queries to do the same.
--  In most cases JOINs are faster than SUB-QUERIEs. However, 
--  in cases, where you only need a subset of records from a table 
--  that you are 
-- joining with, sub-queries can be faster.


-- Delete from vWEmployeeDetails where Id = 1

select *
from vWEmployeeDetails 




-- Trigger 	            INSERTED or DELETED?

-- Instead of Insert 	DELETED table is always empty and the INSERTED table contains the newly inserted data.
-- Instead of Delete 	INSERTED table is always empty and the DELETED table contains the rows deleted
-- Instead of Update 	DELETED table contains OLD data (before update), and inserted table contains NEW data(Updated data) 