--- 1. SET UP

-- Delete observations
DELETE FROM people.person WHERE id > 5; 
DELETE FROM people.location WHERE id > 10;
DELETE FROM people.car WHERE id > 3;
-- Add a new column to link tables
ALTER TABLE people.person ADD COLUMN car_id bigint;
ALTER TABLE people.location ADD COLUMN person_id bigint;

--- 2. FOREIGN KEY

-- Add a Foreign Key constraint
ALTER TABLE people.person ADD CONSTRAINT car_fk 
FOREIGN KEY (car_id) REFERENCES people.car(id);

ALTER TABLE people.location ADD CONSTRAINT person_fk  
FOREIGN KEY (person_id) REFERENCES people.person(id)
ON DELETE SET NULL;

-- Modify data in our person table
UPDATE people.person SET car_id = 3 WHERE id = 1;
UPDATE people.person SET car_id = 2 WHERE id = 2;
UPDATE people.person SET car_id = 1 WHERE id = 3; 
-- Try to see what happens if you insert a car that does not exist: UPDATE people.person SET car_id = 4 WHERE id = 3;
-- Try to see what happens if you delete a referenced car: DELETE FROM people.car WHERE id = 3;

-- Modify data in our location table
UPDATE people.location SET person_id = 4 WHERE id = 1;
UPDATE people.location SET person_id = 3 WHERE id = 2;
UPDATE people.location SET person_id = 2 WHERE id = 5;
-- Try to see what happens if you delete a referenced individual: DELETE FROM people.person WHERE id = 4;

# Joins

-- INNER JOIN

-- Joining two tables
SELECT FIRST_NAME, LAST_NAME, COUNTRY, CITY 
FROM PEOPLE.PERSON INNER JOIN PEOPLE.LOCATION 
ON PEOPLE.LOCATION.PERSON_ID = PEOPLE.PERSON.ID;

-- Let's use alias on tables to reduce the complexity
SELECT FIRST_NAME, LAST_NAME, COUNTRY, CITY
FROM PEOPLE.PERSON pp INNER JOIN PEOPLE.LOCATION pl 
ON pl.PERSON_ID = pp.id;

-- Joining three tables
SELECT FIRST_NAME, LAST_NAME, COUNTRY, CITY, CAR_MAKE, CAR_MODEL 
FROM PEOPLE.PERSON pp 
INNER JOIN PEOPLE.LOCATION pl ON pl.PERSON_ID = pp.id
INNER JOIN PEOPLE.CAR pc ON pc.id = pp.car_id;

# Left/Right and FULL OUTER Join

-- Left join
SELECT FIRST_NAME, LAST_NAME, CAR_MAKE 
FROM PEOPLE.PERSON pp LEFT JOIN PEOPLE.CAR pc ON pc.id = pp.car_id;

-- RIGHT join
SELECT FIRST_NAME, LAST_NAME, COUNTRY 
FROM PEOPLE.PERSON pp RIGHT JOIN PEOPLE.LOCATION pl 
ON pl.person_id = pp.id;

-- FULL (OUTER)
SELECT FIRST_NAME, LAST_NAME, COUNTRY 
FROM PEOPLE.PERSON pp FULL OUTER JOIN PEOPLE.LOCATION pl 
ON pl.person_id = pp.id;  

# CROSS Join

-- Create a new table
CREATE TABLE people.letters (
	let varchar(1));
-- Insert multiple values in the table
INSERT INTO people.letters (let)
VALUES ('a'),
		('b'),
		('c');
-- Create another  table
CREATE TABLE people.numbers (
	num int);
    
-- Insert multiple values in the table
INSERT INTO people.numbers (num)
VALUES (1),
		(2),
		(3);
        
-- CROSS Join Tables:
SELECT NUM, LET 
FROM PEOPLE.NUMBERS CROSS JOIN PEOPLE.LETTERS;
