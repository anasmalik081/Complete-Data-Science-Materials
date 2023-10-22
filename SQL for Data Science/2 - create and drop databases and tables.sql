-- command to create table inside a database
/*
CREATE TABLE statement is used to create a table
*/
CREATE TABLE customer_info(
	id INTEGER,
	first_name VARCHAR(10),
	last_name VARCHAR(10)
);

-- command to show tables
SHOW TABLES; -- for MYSQL
SELECT * FROM information_schema.tables; -- for PostgreSQL

-- command to insert values inside a table
/*
INSERT INTO statement is used to insert values inside a table
*/
INSERT INTO customer_info(id, first_name, last_name)
VALUES
	(1, 'Anas', 'Malik'),
	(2, 'Aarish', 'Malik');
	
-- command to data inside a table
/*
SELECT statement is used to display the data inside a table
*/
SELECT * FROM customer_info;

-- command to drop table inside a database
/*
DROP TABLE statement is used to drop the table
*/
DROP TABLE customer_info;

-- command to show tables
SHOW TABLES; -- for MYSQL
SELECT * FROM information_schema.tables; -- for PostgreSQL










