-- 3. Primary Key Constraint
/*
It makes the record uniquely identify
*/
-- adding primary key constraint using combination of two columns
CREATE TABLE person(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER,
	CONSTRAINT pk_person PRIMARY KEY (id, last_name)
);

-- adding primary key constraint while creating table
CREATE TABLE person(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER,
	PRIMARY KEY (id)
);

-- creating a table
CREATE TABLE person(
	id INTEGER NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER
);

-- adding the primary key constraint
ALTER TABLE person
ADD PRIMARY KEY (id);

ALTER TABLE person
ADD CONSTRAINT pk_person PRIMARY KEY (id, age);

-- dropping primary key
ALTER TABLE person
DROP CONSTRAINT pk_person;

-- 4. Foreign Key Constraint
/*
This constraint is used to refer a primary key into another table
*/
-- creating one table with primary key
CREATE TABLE person(
	id INTEGER NOT NULL,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	age INTEGER,
	salary INTEGER,
	PRIMARY KEY (id)
);

-- create another table with foreign key
CREATE TABLE department(
	id INTEGER NOT NULL,
	dept_id INTEGER NOT NULL,
	dept_name VARCHAR(25) NOT NULL,
	PRIMARY KEY (dept_id),
	CONSTRAINT fk_p_dept FOREIGN KEY (id) REFERENCES person(id)
);

-- adding forein key
ALTER TABLE department
ADD FOREIGN KEY (id) REFERENCES person(id);

-- 5. Check Constraint
/*
It is used to put condition so that the particular column accept values according 
to the condition
*/
CREATE TABLE person(
	id INTEGER NOT NULL,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	age INTEGER,
	salary INTEGER,
	PRIMARY KEY (id),
	CHECK (salary < 50000)
);

-- 6. Default Constraint
/*
It is used to put a default value so that if value is not given while inserting data
then default value will be considered
*/
CREATE TABLE person(
	id INTEGER NOT NULL,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	city VARCHAR(25) DEFAULT 'Banglore'
);











