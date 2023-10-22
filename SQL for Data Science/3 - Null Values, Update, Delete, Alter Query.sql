-- creating a table
CREATE TABLE customer_info(
	id SERIAL,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	salary INTEGER,
	PRIMARY KEY (id)
);

/*
for MYSQL - AUTO_INCREMENT is supported
for PostgreSQL - SERIAL is supported
*/

-- display data inside the table
SELECT * FROM customer_info;

-- inserting values inside the table
INSERT INTO customer_info(first_name, last_name, salary)
VALUES
	('John', 'Daniel', 50000),
	('Krish', 'Naik', 60000),
	('Darius', 'Bengali', 70000),
	('Chandan', 'Kumar', 40000),
	('Ankit', 'Sharma', NULL);

-- display data inside the table
SELECT * FROM customer_info;

-- retrieving the record where salary is null
SELECT * FROM customer_info
WHERE salary IS NULL;

-- retrieving records where salary is not null
SELECT * FROM customer_info
WHERE salary IS NOT NULL;

-- command to replace null values
/*
UPDATE statement is used to update the records inside a table
*/
UPDATE customer_info
SET salary = 50000
WHERE salary IS NULL;

SELECT * FROM customer_info;

-- command to delete records inside a table
/*
DELETE statement is used to delete records from a table
*/
DELETE FROM customer_info
WHERE id = 5;

SELECT * FROM customer_info;

-- command to alter the table
/*
ALTER TABLE statement is used to alter or to make changes inside a table
*/
-- 1. Add Column in existing table
ALTER TABLE customer_info
ADD email VARCHAR(25);

ALTER TABLE customer_info
ADD dob DATE;

SELECT * FROM customer_info;

-- Updating the email values
UPDATE customer_info
SET email = first_name || '.' || last_name || '@gmail.com';

SELECT * FROM customer_info;

-- 2. Modify column
/*
for MySQL
ALTER TABLE customer_info
MODIFY dob YEAR;
*/
-- for Postgresql
ALTER TABLE customer_info
ALTER COLUMN dob TYPE VARCHAR(25);

SELECT * FROM customer_info;


-- command to display the schema
-- DESC customer_info; for MySQL
-- for PostgreSQL
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' -- or your schema name
  AND table_name = 'customer_info';

-- 3. Drop column
ALTER TABLE customer_info
DROP COLUMN dob;

SELECT * FROM customer_info;




