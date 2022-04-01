


-- Example queries for getting the last generated identity value



-- Select SCOPE_IDENTITY() -- same session and same scope

-- Select @@IDENTITY -- same session but ayscope

-- Select IDENT_CURRENT('tblPerson1') -- returns the last identity value that is created for a specific table across any session and any scope.

-- create 2 tables and make trigger insertion and check for changes


-- TODO: demo

-- create table Test (
--     Id int identity(0,1) primary key,
--     Name VARCHAR(20)

--  )


-- create table Test1 (
--     Id int identity(0,1) primary key,
--     Name VARCHAR(20)

--  )


-- insert into Test values('test')

-- create trigger trforInsert on Test for INSERT
-- AS
-- BEGIN
-- insert into Test1 values('fromtrigger')
-- END


-- insert into test1 values('hello')

-- select * from Test

-- select * from test1

--  Select SCOPE_IDENTITY()  -- this gives same session same scope first colmns identity
--  Select @@IDENTITY -- same session any scope last identity