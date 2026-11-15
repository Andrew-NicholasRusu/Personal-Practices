-- Create and select a schema (MySQL syntax):
CREATE SCHEMA STUDY_STORE;
USE STUDY_STORE;

-- Create a parent table first so the foreign key has a referenced key.
CREATE TABLE SUPPLIER (
	SUPPLIER_ID INTEGER PRIMARY KEY,
    SUPPLIER_NAME VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE ITEM (
	ITEM_CODE VARCHAR(10) PRIMARY KEY,
    ITEM_NAME VARCHAR(40) NOT NULL,
    UNIT_PRICE NUMERIC(8, 2) NOT NULL CHECK (UNIT_PRICE >= 0),
    STOCK SMALLINT NOT NULL DEFAULT 0 CHECK (STOCK >= 0),
    SUPPLIER_ID INTEGER,
    -- Each non-NULL supplier ID must already exist in SUPPLIER.
    CONSTRAINT ITEM_SUPPLIER_FK 
		FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER(SUPPLIER_ID)
);

CREATE TABLE CUSTOMER (
	CUSTOMER_LNAME VARCHAR(10) NOT NULL,
    CUSTOMER_FNAME VARCHAR(30) NOT NULL,
    CUSTOMER_ID VARCHAR(50) NOT NULL,
    CUSTOMER_CODE VARCHAR(60) NOT NULL,
    CUSTOMER_BALANCE NUMERIC(6, 2) NOT NULL CHECK (CUSTOMER_BALANCE >= 0),
    CUSTOMER_AREACODE INTEGER)
);
    
-- Add a column after the table was created.
ALTER TABLE ITEM
ADD SALE_FLAG CHAR(1) DEFAULT 'N' NOT NULL;

-- Add example rows. Naming column makes the values easier to check.
INSERT INTO SUPPLIER (SUPPLIER_ID, SUPPLIER_NAME)
VALUES(301, 'North Star Supply');

INSERT INTO ITEM (ITEM_CODE, ITEM_NAME, UNIT_PRICE, STOCK, SUPPLIER_ID)
VALUES ('PEN-01', 'Blue pen', 1.25, 40, 301);

-- Increase the stock for one item.
UPDATE ITEM
SET STOCK = STOCK + 10
WHERE ITEM_CODE = 'PEN-01';

-- Create a separate table from selected query results.
-- The result includes only items costing more than one dollar.
CREATE TABLE PRICE_LIST AS
SELECT ITEM_CODE, ITEM_NAME, UNIT_PRICE
FROM ITEM
WHERE UNIT_PRICE > 1.00;

-- Retrieve the current item rows.
SELECT * FROM ITEM;

-- Start a transaction for data changes you may want to undo.
START TRANSACTION;

UPDATE ITEM
SET UNIT_PRICE = 1.50
WHERE ITEM_CODE = 'PEN-01';

-- Choose COMMIT to keep the update, or ROLLBACK to undo it.
-- COMMIT;
ROLLBACK;













