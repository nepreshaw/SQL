--Chapter 4 Exercise 1
--1. Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.

SELECT *
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID


--Chapter 4 Exercise 2
--Write a SELECT statement that returns four columns: 
--VendorName (Vendors)
--InvoiceNumber (Invoices)
--InvoiceDate (Invoices)
--Balance (InvoiceTotal minus the sum of PaymentTotal and CreditTotal)
--The result set should have one row for each invoice with a non-zero balance. 
--Sort the result set by VendorName in ascending order.

SELECT VendorName, InvoiceNumber, InvoiceDate, 
	   InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0

ORDER BY VendorName


--Chapter 4 Exercise 3
--3. Write a SELECT statement that returns three columns: 
--VendorName(Vendors) 
--DefaultAccountNo(Vendors) 
--AccountDescription (GLAccounts) table
--The result set should have one row for each vendor, 
--with the account number and account description for that vendor’s default account number. 
--Sort the result set by AccountDescription, then by VendorName.

SELECT VendorName, DefaultAccountNo, AccountDescription
FROM Vendors JOIN GLAccounts
ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
ORDER BY AccountDescription, VendorName 

--Chapter 4 Exercise 5
--Write a SELECT statement that returns five columns from three tables, all using column aliases: 
--Vendor -VendorName column
--Date -InvoiceDate column
--Number - InvoiceNumber column
--# -InvoiceSequence column
--LineItem -InvoiceLineItemAmount column
--Assign the following correlation names to the tables: 
--v -Vendors 
--i -Invoices
--li -InvoiceLineItems table 
--Sort the final result set by Vendor, Date, Number, and #.

SELECT
	  VendorName AS Vendor,
	  InvoiceDate AS Date,
	  InvoiceNumber AS Number,
	  InvoiceSequence AS [#],
	  InvoiceLineItemAmount AS LineItem

FROM Vendors AS v 
	 JOIN Invoices AS i ON v.VendorID = i.VendorID
	 JOIN InvoiceLineItems AS li ON i.InvoiceID = li.InvoiceID

ORDER BY Vendor, Date, Number, [#]
	 
	 
--Chapter 4 Exercise 6
--Write a SELECT statement that returns three columns: 
--VendorID -Vendors
--VendorName -Vendors
--Name -A concatenation of VendorContactFName and VendorContactLName, with a space in between
--The result set should have one row for each vendor whose contact has the same first name as another vendor’s contact. 
--Sort the final result set by Name. Hint: Use a self-join.

SELECT DISTINCT Vendors1.VendorID, Vendors1.VendorName, Vendors1.VendorContactFName + ' ' + Vendors1.VendorContactLName AS 'Name'
FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2
ON (Vendors1.VendorID <> Vendors2.VendorID) 
AND (Vendors1.VendorContactFName = Vendors2.VendorContactFName)
ORDER BY Name


--Chapter 4 Exercise 7
--Write a SELECT statement that returns two columns from the GLAccounts table: AccountNo and AccountDescription. --The result set should have one row for each account number that has never been used. --Sort the final result set by AccountNo.--Hint: Use an outer join to the InvoiceLineItems table.SELECT GLAccounts.AccountNo, AccountDescriptionFROM GLAccounts LEFT JOIN InvoiceLineItems	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo	WHERE InvoiceLineItems.AccountNo IS NULLORDER BY GLAccounts.AccountNo
--Chapter 4 Exercise 8
--Use the UNION operator to generate a result set consisting of two columns from the Vendors table: --VendorName and VendorState.--If the vendor is in California, the VendorState value should be “CA”; --otherwise, the VendorState value should be “Outside CA.” Sort the final result set by VendorNameSELECT 'CA' AS VendorState, VendorNameFROM VendorsWHERE VendorState = 'CA'UNIONSELECT 'Outside CA' AS VendorState, VendorNameFROM VendorsWHERE VendorState <> 'CA'ORDER BY VendorName