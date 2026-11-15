--- EXTRACT
-- Extract the payment date and shows only the month when the payment happened.
SELECT EXTRACT(MONTH FROM PAYMENT_DATE) AS PAY_MONTH
FROM PAYMENT;

-- Retrive how many payments ocurred on a Monday.
SELECT COUNT(*)
FROM PAYMENT
WHERE EXTRACT(DOW FROM PAYMENT_DATE_ = 1;

--- TO_CHAR
-- Convert payment_date to a string formatted as MM/dd/YYYY.
SELECT TO_CHAR(PAYMENT_DATE, 'MM/dd/YYYY')
FROM PAYMENT;

-- Retrieve the names of the months in which payments occurred.
SELECT DISTINCT(TO_CHAR(PAYMENT_DATE, 'Month'))
FROM PAYMENT;

--- MATHEMATICAL OPERATORS
-- Calculate what percentage the rental rate is of the replacement cost for each film.
SELECT TITLE, ROUND(RENTAL_RATE / REPLACEMENT_COST, 2) * 100 AS PERCENT_COST
FROM FILM;

-- Calculate 10% of the replacement cost for each film to represent a deposit amount.
SELECT TITLE, 0.1 * REPLACEMENT_COST AS DEPOSIT
FROM FILM;

--- STRING FUNCTIONS
--