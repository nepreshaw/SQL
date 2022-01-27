--Chapter 6 Question 1--Write a SELECT statement that returns the same result set as this SELECT--statement. Substitute a subquery in a WHERE clause for the inner join. --SELECT DISTINCT VendorName FROM Vendors JOIN Invoices--ON Vendors.VendorID = Invoices.VendorID ORDER BY VendorName;SELECT DISTINCT VendorName FROM Vendors JOIN InvoicesON Vendors.VendorID = Invoices.VendorID ORDER BY VendorName;SELECT VendorNameFROM VendorsWHERE VendorID  IN (SELECT VendorID FROM Invoices)ORDER BY VendorName--Chapter 6 Question 2--Write a SELECT statement that answers this question: --Which invoices have a PaymentTotal that’s greater than the average --PaymentTotal for all paid invoices? Return the InvoiceNumber and --InvoiceTotal for each invoice.SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE PaymentTotal >
     (SELECT AVG(PaymentTotal)
      FROM Invoices
      WHERE PaymentTotal <> 0)

--Chapter 6 Question 3
SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE  PaymentTotal > ALL
     (SELECT TOP 50 PERCENT PaymentTotal
      FROM Invoices
      WHERE PaymentTotal <> 0ORDER BY PaymentTotal)--Chapter 6 Question 4--Write a SELECT statement that returns two columns from the GLAccounts table:--AccountNo and AccountDescription. --The result set should have one row for each account number that has never been used. --Use a correlated subquery introduced with the NOT EXISTS operator.--Sort the final result set by AccountNo.SELECT AccountNo, AccountDescriptionFROM GLAccounts WHERE NOT EXISTS	  (SELECT *	  FROM InvoiceLineItems 	  WHERE InvoiceLineItems.AccountNo = GLAccounts.AccountNo)ORDER BY AccountNo--Chapter 6 Question 5
--Write a SELECT statement that returns four columns: --VendorName, InvoiceID, InvoiceSequence, and InvoiceLineItemAmount --for each invoice that has more than one line item in the InvoiceLineItems table.--Hint: Use a subquery that tests for InvoiceSequence > 1.
SELECT VendorName, Invoices.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
FROM Vendors JOIN Invoices 
  ON Vendors.VendorID = Invoices.VendorID
JOIN InvoiceLineItems
  ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
WHERE Invoices.InvoiceID IN
      (SELECT InvoiceID
       FROM InvoiceLineItems
       WHERE InvoiceSequence > 1)
ORDER BY VendorName, Invoices.InvoiceID, InvoiceSequence;

--Chapter 6 Question 6
--Write a SELECT statement that returns a single value that represents the sum of--the largest unpaid invoices submitted by each vendor. --Use a derived table that returns MAX(InvoiceTotal) grouped by VendorID, --filtering for invoices with a balance due.
SELECT SUM(InvoiceMax) AS SumOfMaximums
FROM (SELECT VendorID, MAX(InvoiceTotal) AS InvoiceMax
      FROM Invoices
      WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
      GROUP BY VendorID) AS MaxInvoice;


