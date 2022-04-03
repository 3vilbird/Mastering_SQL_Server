-- innner query or query inside a query



-- Write a query to retrieve products that are not at all sold?
-- This can be very easily achieved using subquery as shown below. Select [Id], [Name], [Description]
-- from tblProducts
-- where Id not in (Select Distinct ProductId from tblProductSales)


-- Most of the times subqueries can be very easily replaced with joins. The above query is rewritten using joins and produces the same results. Select tblProducts.[Id], [Name], [Description]
-- from tblProducts
-- left join tblProductSales
-- on tblProducts.Id = tblProductSales.ProductId
-- where tblProductSales.ProductId IS NULL


-- Select [Name],
-- (Select SUM(QuantitySold) from tblProductSales where ProductId = tblProducts.Id) as TotalQuantity
-- from tblProducts
-- order by Name

-- Query with an equivalent join that produces the same result.
-- Select [Name], SUM(QuantitySold) as TotalQuantity
-- from tblProducts
-- left join tblProductSales
-- on tblProducts.Id = tblProductSales.ProductId
-- group by [Name]
-- order by Name


-- According to MSDN, subqueries can be nested upto 32 levels.

-- Subqueries are always encolsed in paranthesis and are also called as inner queries, and the query containing the subquery is called as outer query.

-- The columns from a table that is present only inside a subquery, cannot be used in the SELECT list of the outer query.