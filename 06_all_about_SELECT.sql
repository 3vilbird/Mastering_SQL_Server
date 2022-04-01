

--select * from dbo.tblPerson1 -- selecting all columns

-- getting distinct 


--select distinct(Name) from tblPerson1

-- where clause for selection 

-- where name <> 'gana' or you can use !=

-- IN specify in the list

-- BETWEEN  to specify in the range

--LIKE to specify the pattern

-- NOT not in the list


-- % zero or more characters

-- - specifies only one (exactaly)character

-- [] anything in the character []

-- [^] not in the box


--select * from tblPerson1 where name like '[MST]%' -- name starts with M or S or T

-- select * from tblPerson1 where name '_@_.com'

-- with conditions AND or OR clause

-- order by row_name DESC or ASC


-- select top 2 * from tblPerson1

-- select top 50 percent  * from tblPerson1



-- intervew question select oldest person

-- select top 1 from tblperson1 order by age desc
































