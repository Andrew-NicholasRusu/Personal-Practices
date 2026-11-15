--- BETWEEN
-- Count how many payments have an amount between 8 and 9
SELECT COUNT(*)
FROM PAYMENT
WHERE AMOUNT BETWEEN 8 AND 9;

-- Retrieve all payments made between February 1 and February 14, 2007
SELECT *
FROM PAYMENT
WHERE PAYMENT_DATE BETWEEN '2007-02-01' AND '2007-02-15';

--- IN
-- Retrieve customers whose first name is John, Jake, or Julie
SELECT *
FROM CUSTOMER 
WHERE FIRST_NAME IN ('John', 'Jake', 'Julie');

-- Count payments where the amount is NOT 0.99, 1.98, or 1.99
SELECT COUNT(*)
FROM PAYMENT
WHERE AMOUNT NOT IN (0.99, 1.98, 1.99);
-- NOTE: Numeric values are not enclosed in single quotes because the amount column has a numeric datatype

--- Aggregate Functions
-- Get the lowest replacement cost among all files
SELECT MIN(replacement_cost)
FROM film;

-- Get both the highest and lowest replacement cost values
SELECT MAX(replacement_cost), MIN(replacement_cost)
FROM FILM;

-- Get the average replacement cost, rounded to 2 decimal places
SELECT ROUND(AVG(replacement_cost), 2)
FROM FILM;

--- GROUP BY
-- Get the total amount paid by each customer, ordered from highest to lowest
SELECT CUSTOMER_ID, SUM(AMOUNT)
FROM PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY SUM(AMOUNT) DESC;

-- Get total amount paid by each customer, grouped by both staff and customer
SELECT STAFF_ID, CUSTOMER_ID, SUM(AMOUNT)
FROM payment
GROUP BY STAFF_ID, CUSTOMER_ID
ORDER BY STAFF-ID, CUSTOMER_ID;

-- Get the total payment amount per date, ordered from highest to lowest
SELECT DATE(PAYMENT_DATE), SUM(AMOUNT)
FROM PAYMENT
GROUP BY DATE(PAYMENT_DATE)
ORDER BY SUM(AMOUNT) DESC;

--- HAVING
-- Get the total amount paid by each customer who spent more than 100
SELECT CUSTOMER_ID, SUM(AMOUNT)
FROM PAYMENT
GROUP BY CUSTOMER-ID
HAVING SUM(AMOUNT) > 100;

-- Count customers per store, only where the count is greater than 300
SELECT STORE_ID, COUNT(*)
FROM CUSTOMER
GROUP BY STORE_ID
HAVING COUNT(*) > 300;

-- Get total amount paid by each customer handled by staff_id = 2, where the total is over 200
SELECT CUSTOMER_ID, SUM(AMOUNT)
FROM PAYMENT
WHERE STAFF_ID = 2
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 200;

# JOINS

--- INNER JOIN
-- Retrieve payment information along with the first name of each customer who made a payment.
SELECT PAYMENT_ID, PAYMENT.CUSTOMER_ID, FIRST_NAME
FROM PAYMENT INNER JOIN CUSTOMER
ON PAYMENT.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID;

-- Retrieve the email of customers who live in the district "California".
SELECT DISTRICT, EMAIL
FROM CUSTOMER INNER JOIN ADDRESS 
ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.DISTRICT = 'California';

-- Retrieve the titles of all films featuring the actor Nick Wahlberg.
SELECT TITLE, FIRST_NAME, LAST_NAME
FROM ACTOR 
INNER JOIN FILM_ACTOR
	ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
INNER JOIN FILM
	ON FILM.ILM_ID = FILM_ACTOR.FILM_ID
WHERE ACTOR.FIRST_NAME = 'Nick' AND ACTOR.LAST_NAME = 'Wahlberg';

--- FULL (OUTER) JOIN
-- Retrieve all customers and payments, including those without matching records in the other table.
SELECT *
FROM CUSTOMER FULL JOIN PAYMENT
ON CUSTOMER.CUSTOMER_ID = PAYMENT.CUSTOMER_ID
WHERE CUSTOMER.CUSTOMER_ID IS NULL -- Customers with no payments
	OR PAYMENT.PAYMENT_ID IS NULL; -- Payments with no customers
    
--- LEFT JOIN
-- Retrieve all films that are **not** present in the inventory.
SELECT FILM.FILM_ID, TITLE, INVENTORY_ID, STORE_ID
FROM FILM
LEFT JOIN INVENTORY ON INVENTORY.FILM_ID = FILM.FILM_ID
WHERE INVENTORY.FILM_ID IS NULL;






