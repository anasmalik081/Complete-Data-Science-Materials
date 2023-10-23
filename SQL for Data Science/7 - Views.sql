-- VIEWS in SQL
/*
View is a virtual table based on the result set of an SQL query.
It help us to store SQL query rather than storing data, and we can call the query
whenever required.
*/
-- creating a table
CREATE TABLE student(
	id SERIAL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	age INTEGER,
	PRIMARY KEY (id)
);

-- inserting values
INSERT INTO student(first_name, last_name, age)
VALUES
	('Anas', 'Malik', 23),
	('Aarish', 'Malik', '17'),
	('Sameer', 'Saifi', 24);
	
-- creating another table
CREATE TABLE department(
	stu_id SERIAL,
	dept_name VARCHAR(25) NOT NULL,
	FOREIGN KEY (stu_id) REFERENCES student (id)
);

-- inserting values
INSERT INTO department
VALUES
	(1, 'Computer Science'),
	(2, 'Electronics'),
	(3, 'Mechanical');
	
-- displayig records
SELECT * FROM student;
SELECT * FROM department;
	

-- displaying records using join
SELECT
	first_name,
	last_name,
	age
FROM student
INNER JOIN department
ON student.id = department.stu_id;
	

-- creating view
CREATE VIEW stu_info AS (
	SELECT
		first_name,
		last_name,
		age
	FROM student
	INNER JOIN department
	ON student.id = department.stu_id
);
	
SELECT * FROM stu_info;
	
	
-- dropping view
DROP VIEW stu_info;
	
	
	






