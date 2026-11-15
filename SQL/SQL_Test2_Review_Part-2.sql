-- Use the SaleCo Database

######## Aggregation and Grouping ########
-- Aggregate functions summarize data across multiple rows to produce a single value per group.
SELECT COUNT(P_CODE) AS TOTAL_PRODUCTS, -- Returns the number of non-null rows/values (`COUNT(*)` counts all rows).
		MIN(P_PRICE) AS MINPRICE, -- Returns the minimum attribute value in a group.
        MAX(P_PRICE) AS MAXPRICE, -- Returns the maximum attribute value in a group.
        SUM(P_QOH * P_PRICE) AS TOTAL_VAL, -- Calculates the sum of numeric values in a group.
        AVG(P_PRICE) AS AVGPRICE -- Calculates the arithmetic mean of numeric values in a group.
FROM PRODUCT;

# GROUP BY CLAUSE
SELECT V_CODE, COUNT(P_CODE) AS NUMPROD, AVG(P_PRICE) AS AVGPRICE
FROM PRODUCT
GROUP BY V_CODE; -- Groups query results by one or more columns so aggregate functions compute summary statistics per group.

# `HAVING` Clause vs. `WHERE` Clause
	# WHERE: Filters individual rows **before** grouping occurs.
	# HAVING**: Filters summarized groups **after** `GROUP BY` execution.
SELECT V_CODE, COUNT(P_CODE) AS NUMPRODS, AVG(P_PRICE) AS AVGPRICE
FROM PRODUCT
GROUP BY V_CODE
HAVING AVG(P_PRICE) < 10.00
ORDER BY V_CODE;

######## Subqueries ########
-- A subquery is a `SELECT` statement nested inside another SQL query. Inner queries execute first, providing input to the outer query.

# Subqueries in WHERE Clause:
-- Products priced aboce average price
SELECT P_CODE, P_PRICE
FROM PRODUCT
WHERE P_PRICE >= (SELECT AVG(P_PRICE) FROM PRODUCT); -- Evaluates subquery to a scalar value or list for row filtering.
# IN Subqueries:
SELECT DISTINCT CUS_CODE, CUS_LNAME, CUS_FNAME
FROM CUSTOMER JOIN INVOICE USING (CUS_CODE) JOIN LINE USING (INV_NUMBER)
WHERE P_CODE IN (SELECT P_CODE FROM PRODUCT WHERE P_DESCRIPT LIKE '%HAMMER%' OR P_DESCRIPT LIKE '%SAW%'); -- Filters attributes against a list returned by a subquery.
# HAVING Subqueries: 
SELECT P_CODE, SUM(LINE_UNITS) AS TOTALUNITS
FROM LINE 
GROUP BY P_CODE
HAVING SUM(LINE_UNITS) > (SELECT AVG(LINE_UNITS) FROM LINE);

-- FROM Subqueries (Derived Tables):
	-- Treats subquery output as a temporary table in the `FROM` clause.
-- Attribute List Subqueries (Inline Subqueries):
	-- Places a scalar subquery inside the `SELECT` column list.

SELECT P_CODE, P_PRICE, 
	(SELECT AVG(P_PRICE) FROM PRODUCT) AS AVGPRICE,
	P_PRICE - (SELECT AVG(P_PRICE) FROM PRODUCT) AS DIFF
FROM PRODUCT;

# EXISTS Subqueries:
SELECT * 
FROM VENDOR
WHERE EXISTS (SELECT * FROM PRODUCT WHERE P_QOH >= P_MIN);

######## SQL Functions ########
-- Date/Time Functions:
	-- `YEAR(date)`: Extracts the 4-digit year.
	-- `MONTH(date)`: Extracts the month number (1–12).
SELECT EMP_LNAME, EMP_FNAME, EMP_DOB, YEAR(EMP_DOB) AS BIRTH_YEAR
FROM EMPLOYEE
WHERE MONTH(EMP_DOB) = 11;

-- Numeric Functions:
	-- `ROUND(val, decimals)`: Rounds numeric values to specified decimal places.
SELECT P_CODE, P_PRICE, ROUND(P_PRICE, 1) AS PRICE1, ROUND(P_PRICE, 0) AS PRICE0
FROM PRODUCT;

-- String Functions:
	-- `LENGTH(str)`: Returns character count.
	-- `CONCAT(str1, str2)`: Concatenates text strings.
	-- `UPPER(str)`: Converts text to uppercase.
SELECT UPPER(CONCAT(CONCAT(EMP_LNAME, ', '), EMP_FNAME)) AS FULL_NAME,
		LENGTH(EMP_LNAME) AS NAME_LENGTH
FROM EMPLOYEE;









