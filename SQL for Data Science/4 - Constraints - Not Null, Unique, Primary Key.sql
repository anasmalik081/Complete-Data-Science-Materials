/*
SQL CONSTRAINTS :

These are used to specify any rules for the records in a table.
Constraints can be used to limit the type of data that can go into a table.
It ensures the accuracy and reliability of records in the table, and
if there is any violation between the constraints and record action,
the action is aborted. Constraints can be columns level, and table-level constraints
apply to the whole table.

1. Not Null
2. Unique
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

-- Not Null constraint
/*
This constraint abort the action if the value provided is null.
It ensures that the particular columns doesn't contain any Null value.
*/
-- creating a table
CREATE TABLE student(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER
);

-- adding contraint to column
-- for MySQL
ALTER TABlE student
MODIFY age INTEGER NOT NULL;

-- for PostgreSQL
ALTER TABLE student
ALTER COLUMN age SET NOT NULL;


-- Unique Constriant
/*
This constraint help us to insert unique record inside a coumn.
It ensures that a column doesnt contain duplicate values
*/
-- creating a table
CREATE TABLE person(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER NOT NULL,
	UNIQUE (id)
);

-- inserting values
INSERT INTO person(id, first_name, last_name, age)
VALUES
	(1, 'Anas', 'Malik', 23),
	(2, 'Aarish', 'Malik', 18);
	
/*
INSERT INTO person(id, first_name, last_name, age)
VALUES
	(1, 'Krish', 'Pandat', 13);
	
Will not be accepted as id 1 is already there in records
*/

SELECT * FROM person;

-- adding unique constraint to columns
ALTER TABLE person
ADD UNIQUE(first_name);

ALTER TABLE person
ADD CONSTRAINT uc_person UNIQUE (age, first_name);

-- drop a unique constraint
ALTER TABLE person
DROP CONSTRAINT uc_person;


-- Primary Key Constraint
/*
This constraint make a column as primary key in a table.
It ensures that the particular column values should be unique as well as not null
*/
-- creating table
CREATE TABLE person1(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER,
	CONSTRAINT pk_person PRIMARY KEY (id, last_name)
);

-- dropping primary key constraint
ALTER TABLE person1
DROP CONSTRAINT pk_person;

-- adding primary key constraint
ALTER TABLE person1
ADD PRIMARY KEY (id);











