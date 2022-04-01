
--CREATE DATABASE gana

use gana
Go
-- create table tblGender (ID int not null primary key,
-- gender varchar(50) not null

-- )

-- to identify the column uniquely
-- one table will have only one primary key


--select * from tblGender

-- CREATING 

-- create TABLE tblPerson
-- (ID int not null primary key ,
-- Name nvarchar(50) not null,
-- Gender int not null
--  )

--select * from tblPerson
 -- adding foreign key

-- The general formula is here

-- Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
-- FOREIGN KEY (ForiegnKeyColumn) references PrimaryKeyTable (PrimaryKeyColumn)

-- ALTER TABLE tblPerson
-- add CONSTRAINT tblPerson_GenderId_FK
-- FOREIGN KEY (Gender) references tblGender(ID)

-- PROVIDES THE DATA INTEGRITY ---------------------

-- ADDING DEFAULT CONTRAINTS ----for nullable colmns  -----------------------

 -- for example some records can take null values
 -- but what if you want some default values needs to be inserted
 -- if any value is not supplied
 -- there comes the default constraints

-- Altering an existing column to add a default constraint:
--query
-- ALTER TABLE { TABLE_NAME }
-- ADD CONSTRAINT { CONSTRAINT_NAME }
-- DEFAULT { DEFAULT_VALUE } FOR { EXISTING_COLUMN_NAME }


-- Adding a new column, with default value, to an existing table:
--query
-- ALTER TABLE { TABLE_NAME } 
-- ADD { COLUMN_NAME } { DATA_TYPE } { NULL | NOT NULL } 
-- CONSTRAINT { CONSTRAINT_NAME } DEFAULT { DEFAULT_VALUE }


-- ALTER TABLE tblPerson
-- ADD CONSTRAINT DF_tblPerson_GenderId
-- DEFAULT 1 FOR GenderId

-- FINALLY TO DROP CONSTRAINT 

-- ALTER TABLE { TABLE_NAME } 
-- DROP CONSTRAINT { CONSTRAINT_NAME }































