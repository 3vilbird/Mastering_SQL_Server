
-- if we set a column as identity no need to supply the values for it
-- sql server will automatically calculates it

-- seed and incriment

-- seed --> from which number the identity should start

-- increment --> from how much count it should be incremented

-- identity insert
--  here Identity(1,1) first argument stands for starting of identity
--  second argumnet is for how much incrment needs to be done 

-- Create Table tblPerson1
-- (
--     PersonId int Identity(1,1) Primary Key,
--     Name nvarchar(20)
-- )

-- select *
-- from tblPerson1

--insert into tblPerson1 values('gana')

--  INSERTING EXPLICIT VALUE INTO THE IDENTITY INSERT --

-- WHAT IF I WANT TO INSERT IDENTITY COLUMN THEN TURN ON
-- IDENTITY INSERT ON

-- SET Identity_Insert tblPerson1 ON

-- insert into tblPerson1
--     (PersonId,Name )
-- values(10, 'gana')

-- SET Identity_Insert tblPerson OFF


-- select *
-- from tblPerson1


-- USE CASE LETS SAY IF WE DEDLETED ALL THE RECORDS HERE IN NE TBL
-- AND WE WANT TO RESET THE VALUE TO '0'


--DELETE from tblPerson1

--SET Identity_Insert tblPerson1 OFF

-- TO TODO: --> follow the following

-- DBCC --> database consinsity check commands

--DBCC CHECKIDENT('tblPerson1',RESEED,0); 

-- insert into tblPerson1
-- values('gana')

-- select *
-- from tblPerson1
