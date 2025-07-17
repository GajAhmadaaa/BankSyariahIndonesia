--CASE1
CREATE VIEW vw_ActiveProductCatalog
AS
SELECT Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM Production.Product
WHERE SellEndDate IS NULL;
GO

--CASE2
CREATE VIEW vw_EmployeeDirectory
AS
SELECT CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS Name, PE.EmailAddress FROM HumanResources.Employee HE
	INNER JOIN Person.Person P ON HE.BusinessEntityID = P.BusinessEntityID
	INNER JOIN Person.EmailAddress PE ON HE.BusinessEntityID = PE.BusinessEntityID
WHERE HE.CurrentFlag = 1;
GO

--CASE3
CREATE VIEW vw_SalesOrderSummary
AS
SELECT SOH.SalesOrderID, SOH.OrderDate,
	CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS Name,
	SUM(SOH.TotalDue) AS TotalDue
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.Customer SC ON SOH.CustomerID = SC.CustomerID
	INNER JOIN Person.Person P ON SC.CustomerID = P.BusinessEntityID;
GO

--CASE4
CREATE VIEW vw_ProductPricingByCategory
AS
SELECT P.Name AS ProductName, PS.Name AS Subcategory, P.ListPrice FROM Production.Product P
	INNER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
WHERE P.ListPrice > 0;
GO

--CASE5
CREATE VIEW vw_FrequentCustomers
AS
SELECT CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS Name, COUNT(SOH.SalesOrderID) AS SalesCount
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.Customer C ON SOH.CustomerID = C.CustomerID
	INNER JOIN Person.Person P ON C.PersonID = P.BusinessEntityID
GROUP BY CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName)
HAVING COUNT(SOH.SalesOrderID) > 3;
GO

--CASE6
CREATE VIEW vw_SalespersonPerformance
AS
SELECT TOP(1) CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS Name,
	SUM(SOH.TotalDue) AS TotalSalesAmount,
	COUNT(SOH.SalesOrderID) AS NumberOrder
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesPerson SP ON SOH.SalesPersonID = SP.BusinessEntityID
	INNER JOIN Person.Person P ON SP.BusinessEntityID = P.BusinessEntityID;
GO
