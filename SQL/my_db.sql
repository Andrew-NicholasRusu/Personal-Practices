-- set-up

CREATE DATABASE mydb;

CREATE SCHEMA people;

--- 1. Create a table with constraints

CREATE TABLE people.person (
    id INT,
    name VARCHAR(20) NOT NULL,
    gender VARCHAR(7),
 	date_of_birth DATE NOT NULL,
	email VARCHAR(100)
);

-- 1.1 NOT NULL constraint

INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (1, 'john', 'Male', '1999-01-01', 'john@gmail.com');

-- This script will rise an error due to
-- the not null constraint applied to the
-- column name:
-- INSERT INTO people.person (
--    id, gender, date_of_birth, email)
--    VALUES (1, 'Male', '1999-01-01', 'john@gmail.com')


-- This script will rise an error due to
-- the not null constraint applied to the
-- column date_of_birth:
-- INSERT INTO people.person (
--    id, name, gender, email)
--    VALUES (1, 'john', 'Male', 'john@gmail.com')


INSERT INTO people.person (
    id, name, gender, date_of_birth)
VALUES (2, 'john', 'Male', '1999-01-01');

-- 1.2 UNIQUE

-- alter table to add a uniqie constraint on email column:

ALTER TABLE people.person ADD CONSTRAINT unique_email  UNIQUE (email);

-- Let's insert some data:

INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (3, 'sarah', 'Female', '1996-03-09', 'sarah@yahoo.com');


-- This script will rise an error due to
-- the unique constraint applied to the
-- column email:
-- INSERT INTO people.person (
--    id, name, gender, date_of_birth, email)
--    VALUES (4, 'sarah', 'Female', '1997-03-09', 'sarah@yahoo.com');


INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (4, 'sarah', 'Female', '1997-03-09', 'sarah2@yahoo.com');

-- 1.2 Primary Columns

-- alter table to add a primary key constraint:

ALTER TABLE people.person ADD CONSTRAINT pk_id  UNIQUE (id);

-- Let's insert some values: 

INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (5, 'layla', 'Female', '1970-01-10', 'layla@hotmail.com');


-- This script will rise an error due to
-- the primary key constraint applied to the
-- column id:
-- INSERT INTO people.person (
--    id, name, gender, date_of_birth, email)
--    VALUES (5, 'matt', 'Male', '1980-01-01', 'matt@hotmail.com');

INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (6, 'matt', 'Male', '1980-01-01', 'matt@hotmail.com');


-- 1.3 Check constraint

-- alter table to add a check constraint:

ALTER TABLE people.person ADD CONSTRAINT check_gender 
CHECK (gender = 'Female' OR gender = 'Male' OR gender = 'Other');


-- This script will rise an error due to
-- the check constraint applied to the
-- column gender:
-- INSERT INTO people.person (
--    id, name, gender, date_of_birth, email)
-- VALUES (7, 'david', 'Mate', '1990-01-01', 'david@google.com')


INSERT INTO people.person (
    id, name, gender, date_of_birth, email)
VALUES (7, 'david', 'Male', '1990-01-01', 'david@google.com');


-- This script will rise an error due to
-- the check constraint applied to the
-- column gender:
-- INSERT INTO people.person (
--    id, name, gender, date_of_birth, email)
-- VALUES (8, 'simon', 'male', '1990-01-01', 'simon @google.com')

--- 2. Import data

-- to inspect the sql database from your command line:

-- less /YOUR/PATH/TO/DATA/person_0.sql
-- vim  /YOUR/PATH/TO/DATA/person_0.sql
-- nvim /YOUR/PATH/TO/DATA/person_0.sql

-- 2.1 \i with psql

-- the following commands should be run inside psql not pgAdmin4
-- \c mydb
DROP TABLE people.person;
-- \i '/YOUR/PATH/TO/DATA/person_0.sql' 
-- \d people.person

-- 2.2 COPY FROM pgAdmin4

-- move the file to a directory that PostgreSQL can access
-- for example, if you are on mac, type in your command line:
-- cp /YOUR/PATH/TO/DATA/person_0.sql /tmp

-- NB ---
-- if you are on a Windows machine, you can load data
-- directly from your Desktop

COPY people.person(first_name, last_name, email, gender, dob) FROM 
'/PATH/TO/NEW/FOLDER/person_1.csv' DELIMITER ',' CSV HEADER;

-- 2.3 \copy with psql

-- the following commands should be run inside psql not pgAdmin4
-- \c mydb
-- \copy people.person(first_name, last_name, email, gender, dob) FROM '/PATH/TO/NEW/FOLDER/person_2.csv' DELIMITER ',' CSV HEADER;