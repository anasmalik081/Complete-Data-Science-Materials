-- SQL joins
/*
SQL joins help us to retrieve data from to or more tables at one time. 
There are following types of joins in SQL :

1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL JOIN
5. NATURAL JOIN
6. CROSS JOIN
*/

-- displating data
SELECT * FROM student;
SELECT * FROM department;

-- inserting records
INSERT INTO student(id,first_name, last_name, age)
VALUES
	(5, 'Ramesh', 'Singh', 27);
	

-- INNER JOIN
/*
It helps us to retreive the common records from one or more tables based on common column
*/
SELECT 
	student.first_name,
	student.last_name,
	student.age,
	department.dept_name
FROM student
INNER JOIN department
ON student.id = department.stu_id;

-- LEFT JOIN
/*
It help us to retreive all records from LEFT table and common records from RIGHT tables.
For the records that not match with left column records, it simple puts Null in those values.
*/
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
LEFT JOIN department d
ON s.id = d.stu_id;


-- RIGHT JOIN
/*
It help us to retreive all records from RIGHT table and common records from LEFT tables.
For the records that not match with RIGHT column records, it simple puts Null in those values.
*/
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
RIGHT JOIN department d
ON s.id = d.stu_id;

-- FULL OUTER JOIN
/*
It basically do the union of two or more tables.
For the records that mismatch from both tables, it put null for those values.
*/
-- for PostgreSQL
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
FULL OUTER JOIN department d
ON s.id = d.stu_id;

-- for MySQL
((SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
LEFT JOIN department d
ON s.id = d.stu_id)
UNION
(SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
RIGHT JOIN department d
ON s.id = d.stu_id));

-- CROSS JOIN
/*
It gives all the possible combination of records from two or more tables.
In this join we need not to mention the common column name
*/
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
CROSS JOIN department d;

-- NATURAL JOIN
/*
It is also a type of join to retrieve records from two more tables.
Natural join can be inner join, left join, right join with default as inner join
*/
-- default inner join
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
NATURAL JOIN department d;

-- natural left join
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
NATURAL LEFT JOIN department d;

-- natural right join
SELECT
	s.first_name,
	s.last_name,
	s.age,
	d.dept_name
FROM student s
NATURAL RIGHT JOIN department d;





