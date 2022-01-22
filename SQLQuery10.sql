--Chapter 3 Exercise 1

SELECT VendorContactFName, VendorContactLName, VendorName

FROM Vendors

ORDER BY VendorContactLName, VendorContactFName

-- Chapter 3 Exercise 2
SELECT  
	InvoiceNumber AS 'Number',
	InvoiceTotal AS 'Total',
	PaymentTotal + CreditTotal AS 'Credits',
	InvoiceTotal - (PaymentTotal + CreditTotal) AS 'Balance'
	   
FROM Invoices

ORDER BY 'Balance' DESC



--Chapter 3 Exercise 3

SELECT VendorContactLName + ', ' + VendorContactFName AS FullName

FROM Vendors

ORDER BY VendorContactLName, VendorContactFName

--Chapter 3 Exercise 4

SELECT InvoiceTotal,
	   InvoiceTotal * .10 AS '10%',
	   InvoiceTotal * 1.10 AS 'Plus 10%'


FROM Invoices

WHERE InvoiceTotal > 1000
ORDER BY InvoiceTotal DESC

-- Chapter 3 Exercise 5
SELECT  
	InvoiceNumber AS 'Number',
	InvoiceTotal AS 'Total',
	PaymentTotal + CreditTotal AS 'Credits',
	InvoiceTotal - (PaymentTotal + CreditTotal) AS 'Balance'
	   

FROM Invoices

WHERE InvoiceTotal >= 500 OR InvoiceTotal <= 10000

-- Chapter 3 Exercise 6

SELECT VendorContactLName + ', ' + VendorContactFName AS FullName

FROM Vendors

WHERE VendorContactLName LIKE '[A-C, E]%' 

ORDER BY VendorContactLName, VendorContactFName

--Chapter 3 Exercise 7

SELECT *
	
FROM Invoices

WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) 
		AND PaymentDate = NULL)
		Or ((InvoiceTotal - PaymentTotal - CreditTotal > 0 )
		AND PaymentDate <> NULL)
		
	

