########## Use the ch-7_saleco database ##########

### Question 1 (SELECT & Aliases)
-- Write a query to display `P_CODE`, `P_DESCRIPT`, and a computed column representing total inventory value (`P_QOH * P_PRICE`). 
-- Label the computed column `TOTAL_VALUE`. Only display products with inventory value greater than $500.00, sorted from highest total value to lowest.


### Question 2 (Date Arithmetic & Functions)
-- Write a query against `EMPLOYEE` to display `EMP_LNAME`, `EMP_FNAME`, `EMP_DOB`, and their birth month (`MONTH(EMP_DOB)`). 
-- Filter the output for employees born in the 11th month (November) after the year 1980.

### Question 3 (Special Operators & Sorting)
-- Retrieve all columns for products supplied by vendor codes `21225`, `21344`, or `24288`, whose product price is between `$15.00` and `$150.00`. 
-- Sort the output by `V_CODE` ascending and `P_PRICE` descending.

### Question 4 (LIKE & Pattern Matching)
-- Find all vendor details (`V_CODE`, `V_NAME`, `V_CONTACT`) from `VENDOR` where the contact person's name starts with 'Smith' or contains the string 'son' anywhere in the name.

### Question 5 (NULL Values & Outer Join)
-- Write a query using a `LEFT JOIN` between `VENDOR` and `PRODUCT` to display `V_CODE`, `V_NAME`, and `P_CODE`. 
-- Filter the results to display **only** vendors that currently do not supply any products.
SELECT VENDOR.V_CODE, V_NAME, P_CODE
FROM VENDOR LEFT JOIN PRODUCT ON VENDOR.V_CODE = PRODUCT.V_CODE
WHERE P_CODE IS NULL;

### Question 6 (Multi-Table JOIN ON)
-- Write a query connecting `CUSTOMER`, `INVOICE`, `LINE`, and `PRODUCT` using explicit `JOIN ... ON` syntax. 
-- Display `CUS_LNAME`, `INV_NUMBER`, `P_DESCRIPT`, `LINE_UNITS`, and `LINE_PRICE` for all line items purchased by customer code `10014`.
SELECT CUS_LNAME, LINE.INV_NUMBER, P_DESCRIPT, LINE_UNITS, LINE_PRICE
FROM CUSTOMER 
JOIN INVOICE ON CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
JOIN LINE ON INVOICE.INV_NUMBER = LINE.INV_NUMBER
JOIN PRODUCT ON LINE.P_CODE = PRODUCT.P_CODE
WHERE CUSTOMER.CUS_CODE = 10014;  

select * from customer;
select * from line;
select * from PRODUCT;

### Question 7 (Aggregation & GROUP BY)
-- Write a query to display `V_CODE`, the total number of products supplied by each vendor (`NUM_PRODUCTS`), the minimum product price (`MIN_PRICE`), 
-- and the average product price (`AVG_PRICE`) rounded to 2 decimal places. Only include products with price $5.00.
SELECT V_CODE, COUNT(P_CODE) AS NUM_PRODUCTS, MIN(P_PRICE) AS MIN_PRICE, ROUND(AVG(P_PRICE),2) AS AVG_PRICE
FROM PRODUCT 
WHERE PRODUCT.P_PRICE > 5.00
GROUP BY V_CODE;

SELECT *
FROM PRODUCT;

### Question 8 (HAVING Clause)
-- Modify Question 7 so that it only returns vendor groups that supply more than 2 products and have an average product price greater than $20.00.
SELECT V_CODE, COUNT(P_CODE) AS NUM_PRODUCTS, MIN(P_PRICE) AS MIN_PRICE, ROUND(AVG(P_PRICE),2) AS AVG_PRICE
FROM PRODUCT 
WHERE PRODUCT.P_PRICE > 5.00
GROUP BY V_CODE
HAVING COUNT(P_CODE) > 2 AND AVG(P_PRICE) > 20.00;

SELECT *
FROM PRODUCT;

### Question 9 (WHERE Subquery)
-- Write a query to display `P_CODE`, `P_DESCRIPT`, and `P_PRICE` for all products whose price is strictly greater than the 
-- overall average product price across all products in the database.
SELECT P_CODE, P_DESCRIPT, P_PRICE
FROM PRODUCT
WHERE P_PRICE > (SELECT AVG(P_PRICE) FROM PRODUCT);

### Question 10 (IN Subquery)
-- Find the distinct `CUS_CODE`, `CUS_LNAME`, and `CUS_FNAME` of customers who purchased products supplied by vendor code `21344` using an `IN` subquery.
SELECT DISTINCT CUS_CODE, CUS_LNAME, CUS_FNAME
FROM CUSTOMERS 
WHERE CUS_CODE IN (
	SELECT CUS_CODE 
    FROM INVOICE JOIN LINE USING (INV_NUMBER) JOIN PRODCUT USING (P_CODE) 
    WHERE V_CODE = 21344
);
### Question 11 (Inline / Attribute List Subquery)
-- Write a query to list `P_CODE`, `P_PRICE`, the overall average product price as `OVERALL_AVG`, 
-- and the difference between product price and average price labeled `PRICE_DIFF`.
SELECT P_CODE, P_PRICE,
		(SELECT AVG(P_PRICE) FROM PRODUCT) AS OVERALL_AVG,
        (P_PRICE - (SELECT AVG(P_PRICE) FROM PRODUCT)) AS PRICE_DIFF
FROM PRODUCT;

### Question 12 (DDL Table Creation)
-- Write DDL statements to:
-- 1. Create a database schema named `STORE_DB`.
-- 2. Create a table named `CATEGORY` with `CAT_ID` (INTEGER, Primary Key) and `CAT_NAME` (VARCHAR(30), NOT NULL, UNIQUE).
-- 3. Create a table named `ITEM` with `ITEM_ID` (VARCHAR(10), Primary Key), `ITEM_NAME` (VARCHAR(50), NOT NULL), `ITEM_PRICE` (DECIMAL(8,2), 
-- CHECK price >= 0), and `CAT_ID` (INTEGER, Foreign Key referencing `CATEGORY(CAT_ID)`).
DROP TABLE IF EXISTS STORE_DB;
CREATE SCHEMA STORE_DB;

CREATE TABLE CATEGORY (
CAT_ID INTEGER NOT NULL PRIMARY KEY,
CAT_NAME VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE ITEM (
ITEM_ID VARCHAR(10) NOT NULL PRIMARY KEY,
ITEM_NAME VARCHAR(50) NOT NULL,
ITEM_PRICE DECIMAL(8,2) CHECK(ITEM_PRICE >= 0),
CAT_ID INTEGER,
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID)
);


### Question 13 (DDL ALTER TABLE)
-- Write `ALTER TABLE` statements for the `ITEM` table created in Question 12 to:
-- 1. Add a new column `ITEM_STOCK` (INTEGER, default 0).
-- 2. Modify `ITEM_NAME` data type to `VARCHAR(80)`.
-- 3. Drop the column `ITEM_STOCK`.
ALTER TABLE ITEM 
ADD (ITEM_STOCK INTEGER(0));

ALTER TABLE ITEM
MODIFY ITEM_NAME VARCHAR(80);

ALTER TABLE ITEM
DROP COLUMN ITEM_STOCK;

### Question 14 (DML UPDATE &amp; Safety)
-- Write an `UPDATE` query to increase product prices by 10% for all products supplied by vendor code `21344` whose quantity on hand (`P_QOH`) is below `P_MIN`.
UPDATE PRODUCT
SET P_PRICE = P_PRICE * 1.10
WHERE V_CODE = 21344 AND P_QOG < P_MIN;

### Question 15 (DML INSERT with SELECT &amp; Transaction Control)
-- Write a complete SQL script that:
-- 1. Starts a transaction.
-- 2. Creates a table `BACKUP_PRODUCT` with `P_CODE` and `P_PRICE`.
-- 3. Inserts all rows from `PRODUCT` where `P_PRICE &gt; 100.00`.
-- 4. Deletes those corresponding rows from `PRODUCT`.
-- 5. Rollbacks the transaction to undo deletions.
START TRANSACTION;

CREATE TABLE BACKUP_PRODUCT AS 
SELECT P_CODE, P_PRICE
FROM PRODUCT
WHERE P_PRICE > 100.00;

DELETE FROM PRODUCT
WHERE P_PRICE > 100.00;

-- Undo changes
ROLLBACK;






























