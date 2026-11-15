# Use the saleco database:

-- Q1 (Section 1). List P_CODE, P_DESCRIPT, and the inventory value (P_QOH * P_PRICE) as TOTALVALUE, sorted from highest to lowest value.
SELECT P_CODE, P_DESCRIPT, (P_QOH * P_PRICE) AS TOTALVALUE
FROM PRODUCT
ORDER BY TOTALVALUE DESC;

-- Q2 (Section 1). Show P_CODE, P_INDATE, and a column REVIEWDATE that is 60 days after P_INDATE. Then write a second query that lists each vendor code in PRODUCT only once.
SELECT P_CODE, P_INDATE, DATE_ADD(P_INDATE, INTERVAL 60 DAY) AS REVIEWDATE
FROM PRODUCT;

SELECT DISTINCT V_CODE
FROM PRODUCT;

-- Q3 (Sections 2 and 3). List all products with a price over $50 that are either from vendor 21344 or have a quantity on hand at or below the minimum (P_MIN).
SELECT *
FROM PRODUCT 
WHERE P_PRICE > 50.00 AND (V_CODE = 21344 OR P_QOH <= P_MIN);

-- Q4 (Section 4). Write queries to (a) list products priced between $10 and $50, (b) list products whose vendor is 21344, 24288, or 25595, 
-- (c) list vendors whose V_CONTACT begins with “S” and has exactly 5 characters, and (d) list products with no vendor.
SELECT *
FROM PRODUCT 
WHERE P_PRICE BETWEEN 10 AND 50;

SELECT *
FROM PRODUCT 
WHERE V_CODE IN (21344, 24288, 25595);

SELECT *
FROM VENDOR
WHERE V_CONTACT LIKE 'S____';

SELECT *
FROM PRODUCT 
WHERE V_CODE IS NULL;

-- Q5 (Section 5). Display P_DESCRIPT, P_PRICE, and V_NAME for all products by joining PRODUCT and VENDOR. 
-- Write it three ways: NATURAL JOIN, JOIN ... USING, and JOIN ... ON with table aliases.
SELECT P_DESCRIPT, P_PRICE, V_NAME
FROM PRODUCT NATURAL JOIN VENDOR;

SELECT P_DESCRIPT, P_PRICE, V_NAME
FROM PRODUCT JOIN VENDOR USING (V_CODE);

SELECT P_DESCRIPT, P_PRICE, V_NAME
FROM PRODUCT P JOIN VENDOR V ON P.V_CODE = V.V_CODE;

-- Q6 (Section 5). List every vendor (V_CODE, V_NAME) that has no products. Use an outer join.
SELECT VENDOR.V_CODE, V_NAME
FROM VENDOR LEFT JOIN PRODUCT ON VENDOR.V_CODE = PRODUCT.V_CODE
WHERE P_CODE IS NULL;

-- Q7 (Section 6). For each vendor code in PRODUCT, show the number of products and the average price, but only for vendors with at least 2 products. Sort by average price descending.
SELECT V_CODE, COUNT(P_CODE) AS NUMPROD, AVG(P_PRICE) AS AVGPRICE
FROM PRODUCT
GROUP BY V_CODE
HAVING COUNT(P_CODE) > 2
ORDER BY AVGPRICE DESC;

-- Q8 (Section 6). In one query, show the total, average, lowest, and highest CUS_BALANCE in CUSTOMER, plus the number of customers.
SELECT SUM(CUS_BALANCE) AS TOTAL, 
		AVG(CUS_BALANCE) AS AVERAGE, 
        MIN(CUS_BALANCE) AS LOWEST, 
        MAX(CUS_BALANCE) AS HIGHEST, 
        COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMER;

-- Q9 (Section 7). List products whose price is above the average price of all products.
SELECT P_CODE, P_DESCRIPT, P_PRICE
FROM PRODUCT
WHERE P_PRICE > (SELECT AVG(P_PRICE) FROM PRODUCT);

-- Q10 (Section 7). Show P_CODE, P_PRICE, and a column DIFF showing how far each price is from the overall average price (use an attribute list subquery). 
-- Then write a query that selects from (SELECT V_CODE, AVG(P_PRICE) AS AVGP FROM PRODUCT GROUP BY V_CODE) and returns only vendors whose average price is over 20.
SELECT P_CODE, P_PRICE, P_PRICE - (SELECT AVG(P_PRICE) FROM PRODUCT) AS DIFF
FROM PRODUCT;

SELECT V_CODE, AVGP
FROM (SELECT V_CODE, AVG(P_PRICE) AS AVGP FROM PRODUCT GROUP BY V_CODE) AS T
WHERE AVGP > 20;

-- Q11 (Section 7). Show each P_CODE and total LINE_UNITS sold, only for products whose total units sold exceed the average LINE_UNITS of all LINE rows. 
-- Then list customers who bought any product whose description contains “SAW”, using an IN subquery.
SELECT P_CODE, SUM(LINE_UNITS) AS TOTALUNITS
FROM LINE
GROUP BY P_CODE
HAVING SUM(LINE_UNITS) > (SELECT AVG(LINE_UNITS) FROM LINE);

SELECT DISTINCT CUS_CODE, CUS_LNAME, CUS_FNAME
FROM CUSTOMER JOIN INVOICE USING (CUS_CODE)
				JOIN LINE USING (INV_NUMBER)
WHERE P_CODE IN (SELECT P_CODE FROM PRODUCT WHERE P_DESCRIPT LIKE '%SAW%');

-- Q12 (Section 8). From EMPLOYEE, list the last name in uppercase, the length of the last name, and the birth year for employees born in November. 
-- Also show P_PRICE rounded to 1 decimal for all products.
SELECT UPPER(EMP_LNAME) AS LNAME, LENGTH(EMP_LNAME) AS NAMESIZE, YEAR(EMP_DOB) AS BRITHYEAR
FROM EMPLOYEE
WHERE MONTH(EMP_DOB) = 11;

SELECT P_CODE, ROUND(P_PRICE, 1) AS PRICE1 FROM PRODUCT;

-- Q13 (Section 9). (a) Create schema SIMPLECO. (b) Create table CUSTOMER2 with: C_ID integer primary key, C_NAME varchar(30) not null, C_EMAIL varchar(40) unique, C_STATUS char(1) 
-- defaulting to 'A', C_BALANCE numeric(8,2) with a check that it is >= 0. (c) Delete the table.
CREATE SCHEMA SIMPLECO;

CREATE TABLE CUSTOMER2 (
	C_ID INTEGER,
    C_NAME VARCHAR(30) NOT NULL,
    C_EMAIL VARCHAR(40) UNIQUE,
    C_STATUS CHAR(1) DEFAULT 'A',
    C_BALANCE NUMERIC(8,2) CHECK (C_BALANCE >= 0),
    PRIMARY KEY (C_ID)
);

DROP TABLE CUSTOMER2;

-- Q14 (Section 9). (a) Create table EXPENSIVE_PRODUCT from PRODUCT rows with a price over 100. (b) Add a column P_NOTES VARCHAR(50). (c) Change P_PRICE to NUMERIC(10,2). 
-- (d) Add a primary key on P_CODE. (e) Add a check that P_PRICE >= 0. (f) Drop P_NOTES. (g) Add a foreign key on V_CODE referencing VENDOR.

CREATE TABLE EXPENSIVE_PRODUCT AS
	SELECT * FROM PRODUCT WHERE P_PRICE > 100;

ALTER TABLE EXPENSIVE_PRODUCT ADD (P_NOTES VARCHAR(50));
ALTER TABLE EXPENSIVE_PRODCUT MODIFY P_PRICE NUMERIC(10, 2);
ALTER TABLE EXPENSIVE_PRODUCT ADD PRIMARY KEY (P_CODE);
ALTER TABLE EXPENSIVE_PRODUCT ADD CHECK (P_PRICE >= 0);
ALTER TABLE EXPENSIVE_PRODUCT DROP COLUMN P_NOTES;
ALTER TABLE EXPENSIVE_PRODUCT ADD FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE);

-- Q15 (Section 10). (a) Insert a row into PRODUCT. (b) Copy all products with P_QOH = 0 into a table OUT_OF_STOCK (same structure) using INSERT ... SELECT. 
-- (c) Raise the price of all products from vendor 21344 by 10%. (d) Make these changes permanent. (e) Delete product '13-Q2/P2', then undo that deletion.

INSERT INTO PRODUCT
VALUES ('11QER/31', 'POWER PAINTER', '2021-11-03', 8, 5, 109.99, 0.00, 21225);

CREATE TABLE OUT_OF_STOCK AS SELECT * 
	FROM PRODUCT 
    WHERE 1 = 0; -- empty copy
INSERT INTO OUT_OF_STOCK
	SELECT * 
    FROM PRODUCT 
    WHERE P_QOH = 0;
    
UPDATE PRODUCT SET P_PRICE = P_PRICE * 1.10 WHERE V_CODE = 21344;

COMMIT;

DELETE FROM PRODUCT WHERE P_CODE = '13-Q2/P2';
ROLLBACK;






