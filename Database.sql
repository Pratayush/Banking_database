-- Table to store customer information
CREATE DATABASE banking_system;
USE banking_system;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Table to store account types
CREATE TABLE AccountTypes (
    AccountTypeID INT PRIMARY KEY,
    TypeName VARCHAR(50)
);

-- Table to store accounts
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountTypeID INT,
    Balance DECIMAL(15, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AccountTypeID) REFERENCES AccountTypes(AccountTypeID)
);

-- Table to store transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(15, 2),
    TransactionDate DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (1, 'John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St');

INSERT INTO AccountTypes (AccountTypeID, TypeName)
VALUES (1, 'Savings');

INSERT INTO Accounts (AccountID, CustomerID, AccountTypeID, Balance)
VALUES (1, 1, 1, 1000.00);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 1, 'Deposit', 500.00, NOW());

SELECT * FROM Customers;

SELECT * FROM AccountTypes;

SELECT * FROM Accounts WHERE CustomerID = 1;

SELECT * FROM Transactions WHERE AccountID = 1;


UPDATE Customers
SET Email = 'newemail@example.com'
WHERE CustomerID = 1;


UPDATE Accounts
SET Balance = Balance - 100.00
WHERE AccountID = 1;

DELETE FROM Customers WHERE CustomerID = 1;
DELETE FROM Accounts WHERE CustomerID = 1;

DELETE FROM Transactions WHERE TransactionID = 1;


