--Chapter 7 Question 1
--Write SELECT INTO statements to create two test tables named VendorCopy and InvoiceCopy--that are complete copies of the Vendors and Invoices tables. --If VendorCopy and InvoiceCopy already exist, first code two DROP TABLE statements --to delete them.SELECT * INTO VendorsCopyFROM VendorsSELECT *INTO InvoiceCopyFROM Invoices--Chapter 7 Question 2--Write an INSERT statement that adds a row to the InvoiceCopy table --with the following values: --VendorID: 32 --InvoiceTotal: $434.58 --TermsID: 2 --InvoiceNumber: AX-014-027--PaymentTotal: $0.00 --InvoiceDueDate: 05/8/2020 --InvoiceDate: 4/21/2020--CreditTotal: $0.00--PaymentDate: nullINSERT InvoiceCopyVALUES (32, 434.58, 2, 'AX-0140027', 0.00, '2020-05-08', '2020-04-21', 0.00, NULL)--Chapter 7 Exercise 3
--Write an INSERT statement that adds a row to the VendorCopy table --for each non-California vendor in the Vendors table. 
--(This will result in duplicate vendors in the VendorCopy table.)

INSERT INTO VendorsCopy
SELECT *
FROM Vendors
WHERE VendorCity <> 'CA'

INSERT VendorCopy
SELECT VendorName, VendorAddress1, VendorAddress2,
       VendorCity, VendorState, VendorZipCode,
       VendorPhone, VendorContactLName, VendorContactFName,
       DefaultTermsID, DefaultAccountNo
FROM Vendors
WHERE VendorState <> 'CA'

--Chapter 7 Exercise 4
--Write an UPDATE statement that modifies the VendorCopy table. 
--Change the default account number to 403 for each vendor that has a default account 
--number of 400.

UPDATE VendorsCopy
SET DefaultAccountNo = 403
WHERE DefaultAccountNo = 400

--Chapter 7 Exercise 5
--Write an UPDATE statement that modifies the InvoiceCopy table. --Change the PaymentDate to today’s date and the PaymentTotal to --the balance due for each invoice with a balance due. --Set today’s date with a literal date string, or use the GETDATE() function.
UPDATE InvoiceCopy
SET PaymentDate = GETDATE(), 
	PaymentTotal = InvoiceTotal - CreditTotal - PaymentTotal
	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
	
--Chapter 7 Exercise 6
--Write an UPDATE statement that modifies the InvoiceCopy table. --Change TermsID to 2 for each invoice that’s from a vendor with a DefaultTermsID of 2.--Use a subquery.UPDATE InvoiceCopy
SET TermsID = 2
WHERE VendorID IN
    (SELECT VendorID
     FROM VendorsCopy
     WHERE DefaultTermsID = 2);

--Chapter 7 Exercise 7
--Solve exercise 6 using a join rather than a subquery. 

UPDATE InvoiceCopySET TermsID = 2FROM InvoiceCopy JOIN VendorsCopyON InvoiceCopy.VendorID = VendorsCopy.VendorID	WHERE DefaultTermsID = 2--Chapter 7 Exerise 8
--Write a DELETE statement that deletes all vendors in the state of Minnesota --from the VendorCopy table.DELETE VendorsCopyWHERE VendorState = 'MN'--Chapter 7 Exercise 9--Write a DELETE statement for the VendorCopy table. --Delete the vendors that are located in states from which no vendor has ever sent an invoice.--Hint: Use a subquery coded with “SELECT DISTINCT VendorState” introduced --with the NOT IN operator.DELETE VendorsCopyWHERE VendorState NOT IN(SELECT DISTINCT VendorState FROM VendorsCopy JOIN InvoiceCopyON VendorsCopy.VendorID = InvoiceCopy.VendorID)
