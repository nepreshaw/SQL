CREATE DATABASE New_AP

--Common column attributes
--Null Or NOT NULL
--Primary Key or Unique
--Identity
--Default default_value
--SPARSE

CREATE TABLE Vendors1 (VendorID INT, VendorName VARCHAR (50))

--CLustered index
CREATE TABLE Invoices1 (InvoiceID INT PRIMARY KEY IDENTITY,
						VendorID INT NOT NULL,
						InvoiceDate DATE NULL,
						InvoiceTotal MONEY NULL DEFAULT 0)

--Nonclustered index
CREATE INDEX IX_VendorID ON Invoices1 (VendorID)

CREATE TABLE InvoiceLineItems_Temp 
					    (InvoiceID INT NOT NULL,
						InvoiceSequence SMALLINT NOT NULL,
						InvoiceLineItemAmount MONEY NOT NULL,
						PRIMARY KEY (InvoiceID, InvoiceSequence))

--Constraints
CREATE TABLE Vendors2
(
	VendorCode CHAR(6) NOT NULL PRIMARY KEY,
	VendorName VARCHAR(50) NOT NULL,
	CHECK ((VendorCode LIKE '[A-Z][A-Z][0-9][0-9][0-9][0-9]') AND (LEFT(VendorCode,2) = LEFT(VendorName,2)))

--Foreign key constraints
--creates table and since the primary key is used the clustered index is created for on the vendorid
CREATE TABLE Vendors9
(
	VendorID INT NOT NULL PRIMARY KEY,
	VendorName VARCHAR(50) NOT NULL
)

--creating a table using the VendorID as foreign key to the Vendors9 table(primary key)
CREATE TABLE Invoices9
(
InvoiceID INT NOT NULL PRIMARY KEY,
VendorID INT NOT NULL REFERENCES Vendors9 (VendorID),
InvoiceTotal MONEY NULL
)

--insert some data
INSERT INTO Vendors9 (VendorID, VendorName) VALUES (99, 'Test Vendor')
SELECT *
FROM Vendors9

--Drop all
DROP DATABASE New_AP
DROP TABLE Invoices1
DROP TABLE Vendors1
DROP TABLE InvoiceLineItems_Temp

--add a new column
ALTER TABLE Vendors1
ADD LastTranDate DATE NULL

SELECT *
FROM Vendors1


