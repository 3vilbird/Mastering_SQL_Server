-- steps of sp execution

-- check syntax,compile , creatre execution plan

-- exsecution plan --> best possible way to get the data based on the given condition


-- ADVANTAGES OF SP

-- 1. Execution plan retention and reusability - Stored Procedures are 
-- compiled and their execution plan is cached and used again, when the 
-- same SP is executed again. Although adhoc queries also create and reuse 
-- plan, the plan is reused only when the query is textual match and the 
-- datatypes are matching with the previous call. Any change in the 
-- datatype or you have an extra space in the query then, a new plan is 
-- created.




-- 2. Reduces network traffic - You only need to send, EXECUTE SP_Name 
-- statement, over the network, instead of the entire batch of adhoc SQL 
-- code. ( WHAT IF A query has 3k lines code need to pass that much dta on network but in sp no name and  args)




-- 4. Better Security - A database user can be granted access to an 
-- SP and prevent them from executing direct "select" statements against a
--  table.  This is fine grain access control which will help control what 
-- data a user has access to.



-- 5. Avoids SQL Injection attack - SP's prevent sql injection attack.


-- select *
-- from tblGender
-- where id=1 and id=3






