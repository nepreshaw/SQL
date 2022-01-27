--SELECT InvoiceNumber InvoiceDate, InvoiceTotal
--FROM Invoices
--WHERE InvoiceTotal >
--		(SELECT AVG(InvoiceTotal)
--		FROM Invoices)
--ORDER BY InvoiceTotal

--SELECT AVG(InvoiceTotal)
--FROM Invoices

--SELECT VendorID, VendorName, VendorState
--FROM Vendors
--WHERE VendorID NOT IN
--	  (SELECT DISTINCT VendorID
--	  FROM Invoices)




