-- Query 3: Create a view that shows the total revenue generated by each category

-- This is not working. I am unable to CAST the Money Datatype value 
CREATE OR ALTER VIEW CategoryRevenue AS
SELECT CategoryName, (
  SELECT SUM(CAST(p.UnitPrice * p.QuantityPerUnit as float))
  FROM Products p
  JOIN [Order Details] ON p.ProductID = [Order Details].ProductID
  WHERE p.CategoryID = Categories.CategoryID
) AS TotalRevenue
FROM Categories;

