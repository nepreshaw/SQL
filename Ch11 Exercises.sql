CREATE TABLE Individuals
(
	IndividualID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT  NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(50) NOT NULL
)

CREATE TABLE Groups
(
	GroupID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	GroupName varchar(50) NOT NULL,
	Dues money NOT NULL DEFAULT(0) CHECK (Dues >= 0)

)

CREATE TABLE GroupMembership
(
	GroupID int References Groups(GroupID),
	IndividualID int references Individuals(IndividualID)
)

--Chapter 11 Question 3
-- Write the CREATE INDEX statements to create a clustered index on -- the GroupID column and a nonclustered index on -- the IndividualID column of the GroupMembership table.CREATE CLUSTERED INDEX IX_GroupMembership_GroupID ON GroupMembership(GroupID)CREATE INDEX IX_GroupMemberShip_IndividualID ON GroupMemberShip(IndividualID)
--Chapter 11 Question 4
--Write an ALTER TABLE statement that adds a new column,--DuesPaid, to the Individuals table. --Use the bit data type, disallow null values, --and assign a default Boolean value of False.
ALTER TABLE Individuals 
ADD DuesPaid bit NOT NULL DEFAULT(0)

--Chapter 11 Question 5
--Write an ALTER TABLE statement that adds two new check constraints--to the Invoices table of the AP database. --The first should allow--(1) PaymentDate to be null only if PaymentTotal is zero--and (2) PaymentDate to be not null only if PaymentTotal is --greater than zero. --The second constraint should prevent the sum of PaymentTotal --and CreditTotal from being greater than InvoiceTotal.ALTER TABLE InvoicesADD CHECK (PaymentDate IS NULL IF PaymentTotal = 0 AND		   PaymentDate IS NOT NULL If PaymentTotal > 0)CHECK (PaymentTotal + CreditTotal) <= InvoiceTotal) 
--Chapter 11 Question 6
--Delete the GroupMembership table from the Membership database. --Then, write a CREATE TABLE statement that recreates the table,--this time with a unique constraint that prevents an individual --from being a member in the same group twice.DROP Table GroupMembershipCREATE TABLE GroupMembership	(GroupID int