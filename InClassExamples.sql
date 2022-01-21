--SELECT VendorName AS 'Name', VendorState
--FROM Vendors
--WHERE VendorState = 'DC'

--SELECT VendorName, VendorState 
--FROM Vendors
--WHERE VendorState = 'DC'
--ORDER BY VendorID DESC

--SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS 'TotalCredits'
--FROM Invoices
--WHERE InvoiceID = 17

--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
--FROM Invoices
--WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-03-31'
--ORDER BY InvoiceDate

--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
--FROM Invoices
--WHERE InvoiceDate >= '2020-01-01' AND InvoiceDate <= '2020-03-31'
--ORDER BY InvoiceDate

--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
--FROM Invoices
--WHERE InvoiceTotal > 50000

----SELECT InvoiceNumber,
----	InvoiceTotal - PaymentTotal - CreditTotal
----	AS BalanceDue
----	FROM Invoices

--SELECT VendorContactFName + ' ' + VendorContactLName AS 'DisplayName'
--	FROM Vendors

--	SELECT InvoiceNumber, InvoiceDate, GETDATE() AS 'CurrentDate'
--	FROM Invoices

--SELECT VendorCity, VendorState, 
--	VendorCity + ', ' + VendorState AS CityState
--	FROM Vendors

--SELECT InvoiceID,
--	InvoiceID + 7 * 3 AS OrderOfPrecedence,
--	(InvoiceID + 7) * 3 AS AddFirst
--	FROM Invoices
--	Order BY InvoiceID;

--SELECT VendorContactFName, VendorContactLName,
--	LEFT(VendorContactFName, 1) +
--	LEFT(VendorContactLName, 1) AS Initials
--FROM Vendors

--SELECT * FROM Invoices
--WHERE Not (InvoiceTotal >= 5000 OR NOT InvoiceDate <= '2020-02-01')

--SELECT * FROM Invoices
--WHERE InvoiceTotal >= 5000

--SELECT * FROM Invoices
--WHERE Not InvoiceDate <= '2020-02-01'

--SELECT * FROM Invoices
--WHERE (InvoiceDate > '01/01/2020' OR InvoiceTotal > 500) AND InvoiceTotal - PaymentTotal - CreditTotal > 0

--SELECT * FROM Invoices
--WHERE TermsID IN (1, 3, 4, 2)

--SELECT * FROM Vendors
--WHERE VendorID IN
--	(SELECT VendorID
--	FROM Invoices
--	WHERE InvoiceDate = '2019-12-01')

--SELECT * FROM Vendors
--WHERE VendorCity LIKE '%x%'

--SELECT * FROM Vendors
--WHERE VendorZipCode LIKE '[1-7]%'

--SELECT * FROM Vendors
--WHERE VendorAddress2 IS NOT NULL

--SELECT VendorState, VendorCity, VendorName,
--	VendorCity + ', ' + VendorState + ' ' + VendorZipCode
--	AS Address
--FROM Vendors
--ORDER BY VendorState, VendorCity, VendorName

--SELECT *
	
--FROM Invoices

--WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) 
--		AND PaymentDate = NULL)
--		Or ((InvoiceTotal - PaymentTotal - CreditTotal > 0 )
--		AND PaymentDate <> NULL)


--UPDATE Invoices
--SET CreditTotal = 99.10
--WHERE InvoiceID = '963253264'

--SELECT * FROM Invoices
--WHERE InvoiceNumber = '963253264'

--INSERT INTO Invoices (VendorID, InvoiceNumber, InvoiceDate, InvoiceTotal, TermsID, InvoiceDueDate)
--VALUES (12, '3289175', '2/18/2020', 165, 3, '3/18/2020')

--SELECT * FROM Invoices
--WHERE InvoiceNumber = '3289175'

--SELECT * FROM Invoices
--WHERE InvoiceNumber = 'HW-3289175'

--DELETE FROM Invoices
--WHERE InvoiceNumber = 'HW-3289175'

--SELECT InvoiceNumber, VendorName
--FROM Vendors JOIN Invoices
--	ON Vendors.VendorID = Invoices.VendorID

--SELECT InvoiceNumber, VendorName
--FROM Vendors INNER JOIN Invoices
--	ON Vendors.VendorID = Invoices.VendorID

--SELECT InvoiceNumber, InvoiceLineItemAmount, InvoiceLineItemDescription
--FROM Invoices JOIN InvoiceLineItems AS LineItems
--	ON Invoices.InvoiceID = LineItems.InvoiceID
--	WHERE AccountNo = 540
--	ORDER BY InvoiceDate

--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
--FROM Invoices JOIN InvoiceLineItems AS LineItems
--	ON(Invoices.InvoiceID = LineItems.InvoiceID) 
--	AND (Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount)
--ORDER BY InvoiceNumber

--SELECT Vendors1.VendorName, Vendors1.VendorCity,
--	Vendors1.VendorState
--FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2
--	ON (Vendors1.VendorCity = Vendors2.VendorCity) AND
--		(Vendors1.VendorState = Vendors2.VendorState) AND
--		(Vendors1.VendorID <> Vendors2.VendorID)
--ORDER BY Vendors1.VendorState, Vendors1.VendorCity

--SELECT VendorName, InvoiceNumber, InvoiceDate,
--	InvoiceLineItemAmount AS LineItemAmount,
--	AccountDescription

--FROM Vendors
--	JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
--	Join InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
--	JOIN GLAcconts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo

--SELECT VendorName, InvoiceNumber, InvoiceTotal
--FROM Vendors LEFT JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
--Order BY VendorName

--SELECT VendorName, InvoiceNumber, InvoiceTotal
--FROM Vendors RIGHT JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
--Order BY VendorName

--SELECT DeptName, Departments.DeptNo, LastName
--FROM Departments LEFT JOIN Employees
--	ON Departments.DeptNo = Employees.DeptNo

--SELECT DeptName, Employees.DeptNo, LastName
--FROM Departments RIGHT JOIN Employees		
--	ON Departments.DeptNo = Employees.DeptNo

--SELECT DeptName, Departments.DeptNo, Employees.DeptNo
--	FROM Departments FULL JOIN Employees

--SELECT DeptName, LastName, ProjectNo
--	FROM Departments LEFT JOIN Employees
--		ON Departments.DeptNo = Employees.DeptNo
--	LEFT JOIN Projects
--		ON Employees.EmployeeID = Projects.EmployeeID
--	ORDER BY DeptName, LastName, ProjectNo















