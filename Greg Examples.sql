SELECT * FROM Customers;
SELECT * FROM ORDERS;
SELECT * FROM OrderLines

--INSERT OrderLines
--	(Product, Quantity, Price, OrderId) VALUES
--	('Echo', 12, 100, 1),
--	('Dot', 6, 30, 1),
--	('Show', 3, 140, 1);

SELECT Orders.Id, Orders. Description, Customers.Name, OrderLines.Product, OrderLines.Quantity, OrderLines.Price,
	  (OrderLines.Quantity * OrderLines.Price) AS 'LineTotal',
	   OrderTotal = OrderLines.Quantity * OrderLines.Price
--sum up line total and update ordertotal with result
FROM Orders
JOIN Customers
	ON Orders.CustomerId = Customers.Id
JOIN OrderLines
	ON OrderLines.OrderId = Orders.Id



