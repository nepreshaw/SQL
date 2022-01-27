--Chapter 5 Question 1
--Write a SELECT statement that returns two columns from the Invoices table:--VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. --Group the result set by VendorID.SELECT VendorID,	   SUM(PaymentTotal) AS PaymentSumFROM InvoicesGROUP BY VendorID--Chapter 5 Question 2--Write a SELECT statement that returns two columns: VendorName and PaymentSum, --where PaymentSum is the sum of the PaymentTotal column. --Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most.--Hint: Use the TOP clause and join Vendors to Invoices.SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSumFROM Vendors JOIN Invoices ON Vendors.VendorID  = Invoices.VendorIDGROUP BY VendorNameORDER BY PaymentSum DESC--Chapter 5 Question 3
--Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. --InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. --Group the result set by vendor. --Sort the result set so the vendor with the highest number of invoices appears first.
SELECT VendorName, Count(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC

--Chapter 5 Question 4
--Write a SELECT statement that returns three columns: AccountDescription, LineItemCount, and LineItemSum. --LineItemCount is the number of entries in the InvoiceLineItems table that have that AccountNo. --LineItemSum is the sum of the InvoiceLineItemAmount column for that AccountNo. --Filter the result set to include only those rows with LineItemCount greater than 1. --Group the result set by account description, and sort it by descending LineItemCount. --Hint: Join the GLAccounts table to the InvoiceLineItems table.
SELECT AccountDescription, COUNT (*) AS LineItemCount , SUM (InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts JOIN InvoiceLineItems
ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC

--Chapter 5 Question 5
--Modify the solution to exercise 4 to filter for invoices dated from October 1, 2019 to December 31, 2019. --Hint: Join to the Invoices table to code a search condition based on InvoiceDate.SELECT AccountDescription, COUNT (*) AS LineItemCount , SUM (InvoiceLineItemAmount) AS LineItemSum 
FROM GLAccounts 
	JOIN InvoiceLineItems
	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
    JOIN Invoices
	ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
WHERE InvoiceDate BETWEEN '2019-10-01' AND '2019-12-31' 
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC--Chapter 5 Question 6
--Write a SELECT statement that answers the following question: 
--What is the total amount invoiced for each AccountNo? 
--Use the ROLLUP operator to include a row that gives the grand total. 
--Hint: Use the InvoiceLineItemAmount column

SELECT AccountNo, InvoiceLineItemAmount, SUM(InvoiceLineItemAmount) AS Amount
FROM InvoiceLineItems
GROUP BY ROLLUP(AccountNo, InvoiceLineItemAmount)

--Chapter 5 Question 7
-- Write a SELECT statement that returns four columns: -- VendorName, AccountDescription, LineItemCount, and LineItemSum. -- LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column. -- For each vendor and account, return the number and sum of line items, sorted first by vendor then account description. -- Hint: Use a four‐table join.
SELECT VendorName, AccountDescription, Count(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSumFROM Vendors
	JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
    JOIN InvoiceLineItems
	ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID	JOIN GLAccounts	ON InvoiceLineItems.AccountNo = GLAccounts.AccountNoGROUP BY VendorName, AccountDescriptionORDER BY VendorName, AccountDescription--Chapter 5 Question 8--Write a SELECT statement that answers this question: --Which vendors are being paid from more than one account? --Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices. --Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo.SELECT  VendorName, COUNT(DISTINCT InvoiceLineItems.AccountNo) AS TotalNumOfAccounts
FROM Vendors
	JOIN InvoiceLineItems 
	ON Vendors.VendorID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts
	ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
GROUP BY VendorName
HAVING COUNT(DISTINCT InvoiceLineItems.AccountNo) > 1
ORDER BY TotalNumOfAccounts DESC 

--Chapter 5 Question 9

SELECT Vendors.VendorID, InvoiceDate, InvoiceTotal, VendorName, 
SUM(InvoiceTotal) OVER (PARTITION BY VendorName) AS VendorTotal, 
COUNT(Vendors.VendorID) OVER (PARTITION BY VendorName) AS VendorCount, 
AVG(InvoiceTotal) OVER (PARTITION BY VendorName) AS VendorAvg
FROM Vendors 
	JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName





