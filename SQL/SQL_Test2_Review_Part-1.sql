-- Use the SaleCo Database

########  SELECT Queries ######## 
SELECT *
FROM PRODUCT;
SELECT P_CODE, P_DESCRIPT, P_PRICE, P_QOH
FROM PRODUCT; 
# Column Aliases (AS)
SELECT P_CODE, P_DESCRIPT AS DESCRIPTION, P_PRICE AS 'UNIT PRICE', P_QOH AS QTY 
FROM PRODUCT;
SELECT P_CODE, P_DESCRIPT, P_PRICE, P_QOH, (P_QOH * P_PRICE) AS Total_Value 
FROM PRODUCT; -- Computed example

########  Date Arithmetic ######## 

-- Calculate expiration date 90 days after product inventory date
SELECT P_CODE, P_INDATE, DATE_ADD(P_INDATE, INTERVAL 90 DAY) AS Expired_Date
FROM PRODUCT; 
-- Identify records older than 90 days from today
SELECT P_CODE, P_INDATE, DATE_SUB(NOW(), INTERVAL 90 DAY) AS CUTOFF 
FROM PRODUCT; 
# Listing Unique Values (DISTINCT)
SELECT DISTINCT V_CODE
FROM PRODUCT;
# Ordering Results
-- Sort products from highest to lowest price, limiting to top 5
SELECT P_CODE, P_DESCRIPT, P_QOH, P_PRICE
FROM PRODUCT
ORDER BY P_PRICE DESC
LIMIT 5;

########  Logical Operators ######## 
-- Logical operators combine multiple conditional expressions in a `WHERE` or `HAVING` clause.

# AND
SELECT *
FROM PRODUCT
WHERE P_PRICE >= 50.00 AND P_PRICE <= 100.00; -- Returns `TRUE` only if **all** combined conditions are `TRUE`.

# OR
SELECT * 
FROM PRODUCT
WHERE V_CODE = 21344 OR V_CODE = 24288; -- Returns `TRUE` if **at least one** condition is `TRUE`.

# NOT
SELECT *
FROM PRODUCT
WHERE NOT (P_PRICE > 100.00); -- Negates a logical condition.

######## Special Operators ######## 
-- Special operators simplify pattern matching, range checking, list membership, and null handling.

# BETWEEN ... AND ...
SELECT *
FROM PRODUCT
WHERE P_PRICE BETWEEN 50.00 AND 100.00; -- Checks whether a value falls within an inclusive range.
# IN (...)
SELECT *
FROM PRODUCT
WHERE V_CODE IN (21344, 24288, 21225); -- Checks whether an attribute matches any value in a discrete list.
# LIKE Pattern Matching:
-- Find vendor contacts starting with 'SMITH'
SELECT V_NAME, V_CONTACT 
FROM VENDOR
WHERE V_CONTACT LIKE 'SMITH%'; -- `%` matches zero or more characters.
-- Find vendor contacts matching 'Johns\_n' (e.g., Johnson, Johnsen)
SELECT *
FROM VENDOR
WHERE V_CONTACT LIKE 'Johns_n'; -- `_` matches exactly one character.
# IS NULL and IS NOT NULL
SELECT P_CODE, P_DESCRIPT, V_CODE 
FROM PRODUCT
WHERE V_CODE IS NULL; -- Tests for missing/null values (nulls cannot be tested using `=`).

######## SQL JOINs ########
-- Joins combine data across multiple tables based on common attributes.

# NATURAL JOIN
SELECT CUS_CODE, CUS_LNAME, INV_NUMBER, INV_DATE
FROM CUSTOMER NATURAL JOIN INVOICE; -- Automatically joins tables on attributes sharing identical names and compatible data types.
-- Eliminates duplicate join columns in output.

# JOIN ... USING (column)
SELECT P_CODE, P_DESCRIPT, V_CODE, V_NAME
FROM PRODUCT JOIN VENDOR USING (V_CODE); -- Explicitly specifies the common column name present in both tables.

# JOIN ... ON (condition)
SELECT INVOICE.INV_NUMBER, PRODUCT.P_CODE, P_DESCRIPT, LINE_UNITS, LINE_PRICE
FROM INVOICE
JOIN LINE ON (INVOICE.INV_NUMBER = LINE.INV_NUMBER)
JOIN PRODUCT ON (LINE.P_CODE = PRODUCT.P_CODE); -- Explicitly defines the join condition using relational operators.

# Table Aliases:
SELECT P.P_DESCRIPT, P.P_PRICE, V.V_NAME
FROM PRODUCT AS P JOIN VENDOR AS V ON P.V_CODE = V.V_CODE;

# OUTER JOINS
-- Outer joins return matched rows plus unmatched rows from one or both tables.

# LEFT JOIN
SELECT VENDOR.V_CODE, V_NAME, P_CODE
FROM VENDOR LEFT JOIN PRODUCT ON VENDOR.V_CODE = PRODUCT.V_CODE; -- Returns all rows from the left table and matching rows from the right table (unmatched right values display as `NULL`)

# RIGHT JOIN
-- Find vendors without associated products
SELECT VENDOR.V_CODE, V_NAME, P_CODE
FROM PRODUCT RIGHT JOIN VENDOR ON PRODUCT.V_CODE = VENDOR.V_CODE
WHERE P_CODE IS NULL; -- Returns all rows from the right table and matching rows from the left table.

# Self / Recursive Joins
SELECT E.EMP_NUM, E.EMP_LNAME AS EMPLOYEE, M.EMP_LNAME AS MANAGER
FROM EMPLOYEE E JOIN EMPLOYEE M ON E.EMP_MGR = M.EMP_NUM; 
-- Joins a table to itself using table aliases. Useful for hierarchical relationships (e.g., employee to manager).





