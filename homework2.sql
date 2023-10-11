--Вывести название и стоимость в USD одного самого 
--дорогого проданного товара (не используя агрегацию)
SELECT 
	p.ProductName,
	p.Price * 1.05 AS 'стоимость в USD'
FROM OrderDetails AS oD
	LEFT JOIN Products AS p
		ON oD.ProductID = p.ProductID
ORDER BY p.Price DESC
LIMIT 1

--Вывести два самых дорогих товара из категории 
--Beverages из USA
SELECT DISTINCT
	p.ProductName
FROM Products AS p
	LEFT JOIN Categories AS c
    	ON p.CategoryID = c.CategoryID
    LEFT JOIN Suppliers AS s
    	ON p.SupplierID = s.SupplierID
WHERE 
	c.CategoryName = 'Beverages' 
	AND
	s.Country = 'USA'
ORDER BY
	p.Price DESC
LIMIT 2

--Удалить товары с ценой менее 50 EUR
DELETE FROM Products
WHERE
	Price < 50

--Вывести список стран, которые поставляют 
--морепродукты
SELECT DISTINCT
    s.Country
FROM Products AS p
	LEFT JOIN Suppliers AS s  
		ON p.SupplierID = s.SupplierID
	LEFT JOIN Categories AS c  
		ON p.CategoryID = c.CategoryID
WHERE
	c.CategoryName = 'Seafood'

--Очистить поле ContactName у всех клиентов 
--не из China
UPDATE Customers
SET
    ContactName=''
WHERE
	Country<>'China'
