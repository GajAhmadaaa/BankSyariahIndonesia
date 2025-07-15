---SECTION 1
--1
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--2
SELECT * FROM HumanResources.Employee
WHERE HireDate > '2012-01-01';

--3
SELECT TOP(10) * FROM Production.Product
ORDER BY ListPrice DESC;

--4
SELECT Name 
FROM Production.Product
WHERE Name LIKE 'B%';


---SECTION 2
--5
SELECT CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS 'Full Name',
	S.OrderDate AS 'Order Date',
	S.TotalDue 
FROM Sales.SalesOrderHeader S
	INNER JOIN Person.Person P ON S.CustomerID = P.BusinessEntityID;

--6
SELECT P.Name AS 'Product Name',
	PS.Name AS 'Subcatergory'
FROM Production.Product P
	LEFT JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

--7
SELECT CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS 'Employee Name',
	H.JobTitle AS 'Title'
FROM HumanResources.Employee H
	INNER JOIN Person.Person P ON H.BusinessEntityID = P.BusinessEntityID;

--8
SELECT SOD.SalesOrderID, CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName) AS 'Salesperson Name'
FROM Sales.SalesOrderHeader SOD
    LEFT JOIN Sales.SalesPerson SP ON SOD.SalesPersonID = SP.BusinessEntityID
    LEFT JOIN Person.Person PP ON SP.BusinessEntityID = PP.BusinessEntityID;

---SECTION 3
--9
SELECT ProductLine, COUNT(*) AS ProductCount
FROM Production.Product
GROUP BY ProductLine;

--10
SELECT PS.Name AS SubcategoryName, AVG(P.ListPrice) AS AverageListPrice
FROM Production.Product P
    INNER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
GROUP BY PS.ProductSubcategoryID, PS.Name;

--11
SELECT E.Jobtitle, COUNT(*) AS 'Number of Employees'
FROM HumanResources.Employee E
GROUP BY E.JobTitle;

--12
SELECT YEAR(S.OrderDate) 'Sales Year', COUNT(*) AS 'Total Orders'
FROM Sales.SalesOrderHeader S
GROUP BY YEAR(S.OrderDate)
ORDER BY YEAR(S.OrderDate) ASC;

---SECTION 4
--13
SELECT CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName) AS 'Full Name',
	SUM(S.TotalDue) 'SUM of Total Due'
FROM Sales.SalesOrderHeader S
	INNER JOIN Person.Person P ON S.CustomerID = P.BusinessEntityID
GROUP BY P.BusinessEntityID, CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName);

--14
SELECT CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName) AS 'Salesperson Name',
	COUNT(*) AS 'Total Sales'
FROM Sales.SalesOrderHeader SOD
    LEFT JOIN Sales.SalesPerson SP ON SOD.SalesPersonID = SP.BusinessEntityID
    LEFT JOIN Person.Person PP ON SP.BusinessEntityID = PP.BusinessEntityID
GROUP BY PP.BusinessEntityID, CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName)
ORDER BY CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName) ASC;

--15
SELECT YEAR(S.OrderDate) 'Sales Year', AVG(S.TotalDue) AS 'Avg Total Due'
FROM Sales.SalesOrderHeader S
GROUP BY YEAR(S.OrderDate)
ORDER BY YEAR(S.OrderDate) DESC;

--16
SELECT top(5) p.Name AS 'Product Name', SUM(S.OrderQty) 'Total Order Quantity'
FROM Sales.SalesOrderDetail S
	INNER JOIN Production.Product P ON  S.ProductID = P.ProductID
GROUP BY S.ProductID, P.Name
ORDER BY SUM(S.OrderQty) DESC;

--17
SELECT PS.Name AS SubcategoryName, COUNT(P.ProductID) 'Count of Product Price > 500'
FROM Production.Product P
    INNER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
WHERE P.ListPrice > 500
GROUP BY PS.ProductSubcategoryID, PS.Name;

--18
SELECT TOP(1) CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName) AS 'Salesperson Name',
	COUNT(*) AS 'Total Sales'
FROM Sales.SalesOrderHeader SOD
    INNER JOIN Sales.SalesPerson SP ON SOD.SalesPersonID = SP.BusinessEntityID
    INNER JOIN Person.Person PP ON SP.BusinessEntityID = PP.BusinessEntityID
GROUP BY PP.BusinessEntityID, CONCAT(PP.FirstName,' ',PP.MiddleName,' ',PP.LastName)
ORDER BY COUNT(*) DESC;
