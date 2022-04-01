
-- deleting a parent table which was refered by any table

-- will get error we can't because some othr tables will be refering it





-- ALTER TABLE tblemployee ADD CONSTRAINT FK_OrderDetails_Orders
-- FOREIGN KEY(GenderID)
-- REFERENCES tblgender(ID)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE

-- 1. No Action:
--  This is the default behaviour. No Action specifies that if an attempt is
--   made to delete or update a row with a key referenced by foreign keys in existing rows 
--   in other tables, an error is raised and the DELETE or UPDATE is rolled back.


-- 2. Cascade: 
-- Specifies that if an attempt is made to delete or update a row with a key referenced by 
-- foreign keys in existing rows in other tables, all rows containing those foreign keys are also
--  deleted or updated.


-- 3. Set NULL: 
-- Specifies that if an attempt is made to delete or update a row with a key referenced by 
-- foreign keys in existing rows in other tables, all rows containing those foreign keys are 
-- set to NULL.  

-- 4. Set Default: Specifies that if an attempt is made to delete or update a row with a key 
-- referenced by foreign keys in existing rows in other tables,
-- all rows containing those foreign keys are set to default values.


--alter TABLE tblPerson add  Age INT


--select * from tblPerson
-- now in here what if we don't want to allow age to be inserted above 100

--


--The following check constraint, limits the age between ZERO and 150.

-- ALTER TABLE tblPerson
-- ADD CONSTRAINT CK_tblPerson_Age CHECK (Age > 0 AND Age < 150)


-- The general formula for adding check constraint in SQL Server:
-- ALTER TABLE { TABLE_NAME }
-- ADD CONSTRAINT { CONSTRAINT_NAME } CHECK ( BOOLEAN_EXPRESSION )


-- If the BOOLEAN_EXPRESSION returns true, then the CHECK constraint allows the value,
--  otherwise it doesn't. Since, AGE is a nullable column, it's possible to pass null 
--  for this column, when inserting a row. When you pass NULL for the AGE column, 
--  the boolean expression evaluates to UNKNOWN, and allows the value.


--insert into tblGender values(1,'male')

--select * from tblGender

--insert into tblPerson values(1,'gana',1,50)

select *
from tblPerson 
