
-- used to combine the result set of two or more select queries

    select *
    from tblPerson
UNION
    -- this will give distctinct with sorted data -- this is slow compared to union all because has to remove duplicates and has to sort so 
    select *
    from tblPerson1



    select *
    from tblPerson
UNION    ALL
    -- will give all the data including th eduplicates

    select *
    from tblPerson1



    select ID, Name, 
    from tblPerson
UNION    ALL
    -- will give all the data including th eduplicates

    select pesronId, Name
    from tblPerson1



-- UNION TO WORK the number , datatype and the order of the selec statement should eb the same

-- as lon as the data type amd the number of the columns are same in two tables 
-- sql server teies to combine the  result;

-- even if the data type is different it tries to implicitly convert if it 
-- works then it gives the result but if it fails it gives an error



--  DIFFERENCE BETWEEN JOIN AND UNION 


-- UNION COMBINES ROWS OF TWO OR MORE TABLES --> horizontal

-- WHERE as jon combines columns from 2 or more tables -- > vertical


















