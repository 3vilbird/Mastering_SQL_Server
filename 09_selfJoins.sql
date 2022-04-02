-- joining a table with itself

-- not a differnt type of join joining table with itself that's all


--- inner self

-- outer self( left ,right,full)

-- cross



-- select * from tblPerson
-- select * from tblGender


-- create table  tblEmployee ( empId int identity(1,1) primary key,

-- Name NVARCHAR(50),
-- managerId int

--   )

select *
from tblEmployee

--insert into tblEmployee (Name,managerId) values ('devid',3),('john',1),('warner',1),('lol',null)


-- self join

select E.Name as Employee , M.managerId as Manager

from tblEmployee E

    left join tblEmployee M on E.managerId = M.empId








-- how ot replace the null values

select ISNULL(null,'no manager') as manager
-- COAL ESC -E
select COALESCE(null,'no manager') as manager

-- CASE expresion WHEN '' ELSE '' END


select E.Name as Employee , ISNULL(M.managerId,0) as Manager

from tblEmployee E

    left join tblEmployee M on E.managerId = M.empId


    select E.Name as Employee ,CASE WHEN M.managerId IS NULL  THEN 'NO MANAGER' ELSE  M.managerId   as Manager

from tblEmployee E

    left join tblEmployee M on E.managerId = M.empId




-- self innner join



select E.Name as Employee , M.managerId as Manager

from tblEmployee E

    inner join tblEmployee M on E.managerId = M.empId


-- self cross join 5*5 = 25 rows

select E.Name as Employee , M.managerId as Manager

from tblEmployee E

cross join tblEmployee M

