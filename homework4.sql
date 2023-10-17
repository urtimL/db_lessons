--Найти мин/стоимость товаров для каждой категории
SELECT 
	c.CategoryName,
	min(p.Price) AS min_price
FROM Products AS p
LEFT JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID
ORDER BY min_price DESC

--Вывести названия категорий, в которых более 10 товаров
SELECT c.CategoryName
FROM Products AS p
LEFT JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(*) > 10

-- Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone=''
WHERE Country='USA'

--Вывести имена и фамилии (и ко-во заказов) менеджеров,
--у которых ко-во заказов менее 15
SELECT 
	e.FirstName, 
    e.LastName, 
    count(*) AS Order_quantity
FROM Orders AS o
LEFT JOIN Employees AS e
	ON o.EmployeeID	= e.EmployeeID
GROUP BY o.EmployeeID
HAVING Order_quantity < 15