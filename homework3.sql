--Вывести ко-во поставщиков не из UK и не из China
SELECT 
	COUNT(*) 
FROM [Suppliers]
WHERE Country NOT IN ('UK', 'China')


--Вывести среднюю/MAX/MIN стоимости и ко-во 
--товаров из категорий 3 и 5
SELECT 
	COUNT(*) AS 'COUNT',
	AVG(Price) AS AVG_PRICE,
    MAX(Price) AS MAX_PRICE,
    MIN(Price) AS MIN_PRICE
FROM [Products]
WHERE CategoryID IN (3, 5)


--Вывести общую сумму проданных товаров
SELECT SUM(OD.Quantity * P.Price)
FROM OrderDetails AS OD
LEFT JOIN Products AS P
	ON OD.ProductID = P.ProductID


--Вывести данные о заказах 
--(номер_заказа, имя_клиента, страна_клиента, 
--фамилия_менеджера, название_компании_перевозчика)
SELECT 
o.OrderID, c.CustomerName, c.Country, e.LastName, s.ShipperName
FROM Orders AS o
LEFT JOIN Customers AS c ON c.CustomerID = o.CustomerID
LEFT JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
LEFT JOIN Shippers AS s ON s.ShipperID = o.ShipperID


--Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(p.Price * od.Quantity)
FROM Orders AS o
LEFT JOIN OrderDetails AS od ON o.OrderID = od.OrderID
	LEFT JOIN Products AS p ON od.ProductID = p.ProductID
LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany'