CREATE DATABASE Sales;
GO 

USE Sales;
GO

CREATE TABLE Item 
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	SKU INT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	QuantityOnHand INT NOT NULL,
	BackOrdered BIT NOT NULL
);

INSERT INTO Item	
	(SKU, Name, Price, QuantityOnHand, BackOrdered)
VALUES
	(1001, 'USB Keyboard', 25.00, 20, 0),
	(1002, 'Wireless Mouse', 35.50, 15, 0),
	(1003, 'LED Monitor', 189.99, 5, 1),
	(1004, 'USB-C Cable', 12.50, 40, 0);