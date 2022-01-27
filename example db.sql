USE sales;

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name varchar(30) NOT NULL,
	Sales decimal NOT NULL default 0,
);

CREATE TABLE Orders
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Description varchar(80),
	OrderTotal decimal NOT NULL,
	CustomerId INT NOT NULL FOREIGN KEY references Customers(Id)
);

INSERT INTO Customers (Name, Sales)
	VALUES('MAX Technical Training', 1000);

SELECT * 
FROM Orders

INSERT INTO Orders (Description, OrderTotal, CustomerId)
	VALUES('My first order', 200, 1);

SELECT Orders.Id, Description, OrderTotal, Name
FROM CUSTOMERS JOIN ORDERS
ON Customers.Id = Orders.Id




