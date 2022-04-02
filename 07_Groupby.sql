-- https://www.sqlservertutorial.net/advanced-sql-server/


-- GROUP BY clause is used to get the summary data based on one or more groups. 

-- will be used in conjuction with aggreggate functions.

-- total salary from city

-- select city,SUM(salary) as totalsalary
-- from tblemp
-- group by city


-- with multiple colummns , select by City annd Gender

-- select City,Gender ,SUM(salary) as totalsalary
-- from tblemp
-- group by City,Gender
-- order by city


-- with count

-- select City,Gender ,SUM(salary) as totalsalary, Count(ID) as  [Total Employes]
-- from tblemp
-- group by City,Gender
-- order by city

-- FILTERING THE GROUPS 



-- select City,Gender ,SUM(salary) as totalsalary, Count(ID) as  [Total Employes]
-- from tblemp
-- WHERE gender='male' -- filter clause
-- group by City,Gender
-- order by city


-- SECOND KIND WITH HAVING CLAUSE
-- select City,Gender ,SUM(salary) as totalsalary, Count(ID) as  [Total Employes]
-- from tblemp
-- group by City,Gender
-- order by city
-- having Gender ='male'


-- QUERY EXECUTION WITH  WHERE AND HAVNG CLAUSE

-- in where clause only those rows are selected which satisfies the condition

-- then firther will be processed --> performance is better


-- in having clause --> all recordes are fetched first and then filter is applied
-- to slect only the required rows




-- DIFF BETWEEN WHERE AND HAVING

--  WHERE clause can be used with - Select, Insert, and Update statements, 
--  where as HAVING clause can only be used with the Select statement.

--WHERE filters rows before aggregation (GROUPING), 
--where as, HAVING filters groups, after the aggregations are performed.

--Aggregate functions cannot be used in the WHERE clause, unless it is in a 
--sub query contained in a HAVING clause, whereas, aggregate functions can 
--be used in Having clause. EX --> SELECT * FROM TBLEMP WHERE SUM(salary) > 100




