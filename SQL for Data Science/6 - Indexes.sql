-- Indexes in SQL
/*
CREATE INDEX statement is used to create indexes in tables.
The indexes are used to retrieve data from the database more quickly than others.
The user cannot see the indexes, and they are just used to speed up queries/searches.
Note: Updating the table with indexes takes a lot of time than updating a table without indexes.
It is because indexes also need an update.
So, only create indexes on those columns that will be frequently searched against.
*/

-- creating table
CREATE TABLE person(
	id INTEGER NOT NULL,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	age INTEGER,
	CONSTRAINT pk_person PRIMARY KEY (id)
);

-- creating indexes
CREATE INDEX index_fname
ON person(fname);

-- creating another student
CREATE TABLE student(
	id INTEGER NOT NULL,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	age INTEGER
);

-- creating indexes
CREATE INDEX index_age
ON student(age);

-- creating index by combining two features
CREATE INDEX index_age_fname
ON student (age, fname);

-- dropping index
DROP INDEX index_age_fname; -- for postgresql

ALTER TABLE student
DROP INDEX index_age_fname; -- for MySQL




