CREATE OR ALTER Procedure AddOrderLine
	@Product varchar(80) = null,
	@Quantity int = 1,
	@Price decimal(7,2) = null,
	@OrderId int = null

AS

IF @Product is null 
BEGIN 
	Print 'Product is required';
	return -1;
END

IF @OrderId is null
BEGIN
	Print 'OrderId is required';
	return -2;
END

INSERT INTO OrderLines
	(Product, Quantity, Price, OrderId)
	VALUES
	(@Product, @Quantity, @Price, @OrderId)