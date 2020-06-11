-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT P.ProductName, C.CategoryName FROM Products as P
INNER JOIN Categories as C ON P.CategoryID = C.CategoryID;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    O.Id,
    S.CompanyName
FROM
    [Order] O
INNER JOIN
    Shipper S
ON
    O.ShipVia = S.Id
WHERE
    O.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
  P.ProductName,
  Od.Quantity
FROM
  [OrderDetail] as Od
INNER JOIN
  [Product] as P
ON
  Od.ProductId = P.Id
WHERE
  Od.OrderId = 10251
ORDER BY
  P.ProductName ASC;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
  O.Id,
  Cu.CompanyName,
  E.LastName
FROM
  [Order] as O
INNER JOIN
  [Customer] as Cu
ON
  O.CustomerId = Cu.Id
INNER JOIN
  [Employee] as E
ON
  O.EmployeeId = E.Id;