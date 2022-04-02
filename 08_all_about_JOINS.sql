


-- joins are used to get the data from the one or more rrelated tables

-- inner,
-- outerleft ,right ,full
-- cross

-- select *
-- from tblperson

-- select *
-- from tblgender


--insert into tblgender values(3,'other')


-- INNER JOIN IT'S EXACTY LIKE --> INTERSECT --> gives mathing rows netween both the rows
--  exmaple

-- inner join eample
-- select *
-- from tblPerson _tbl
--     inner join tblGender _tg on  _tg.ID = _tbl.Gender


-- left join or left outer join 
-- all matching rows and non matching rows from left table

-- select *
-- from tblPerson _tbl
--     left join tblGender _tg on  _tg.ID = _tbl.Gender

-- select *
-- from tblPerson _tbl
--     right join tblGender _tg on  _tg.ID = _tbl.Gender

-- -- full outer join gives all the mathching rows and non matching rows of left and right

-- select *
-- from tblPerson _tbl
--     full outer join tblGender _tg on  _tg.ID = _tbl.Gender


-- CROSS JOIN -> GIVE CARTION PRODUCT

-- total number of rows produced --> no of rows in the right * no of rows in left

-- takes every row from right and associates it with each row of left

-- since it will produce cartision product it there is no point in having 'ON' condition

-- select *
-- from tblPerson _tbl
--     cross join tblGender _tg -- on  _tg.ID = _tbl.Gender


-- GENERAL FORMULAE
-- SELECT   COLLIST FROM lEFTTABLE
-- JOINTYPE  RIGHTTABLE
--ON          JOIN CONDIDITON



-- -----------------------------------------------------------------------

--  ADVANCED INTELLIGENT JOINS -- GETTING ONLY THE NON MATCHONG ROWS

-- ------------------------------------------------------------------------

-- INNER JOIN -> GIVES ONLY MATHING OF BOTHT THE ABLES --> WHT IF WE NEED ONLY THE NON MATCHING


-- how to get only non matching rows from left table

-- normal left join and filter with where clause

-- seems like check for foreign key of left as null
select *
from tblGender  _tbl
    left join tblPerson _tg on  _tbl.ID = _tg.Gender
where  _tg.ID IS Null



-- sae for right

-- get all non matching records from right table

-- seems like check for primary key of left as null

select *
from tblGender  _tbl
    right join tblPerson _tg on  _tbl.ID = _tg.Gender*=
where  _tg.ID IS Null


-- non matching from right and left tale (exclusive of inner join)


-- check in theforeign key and primary key for null values
select *
from tblGender  _tbl
    full outer join tblPerson _tg on  _tbl.ID = _tg.Gender
where  _tg.ID IS Null or _tbl.gender IS null

-- NOTE  --> use IS to compre the NULL in sql