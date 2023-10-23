-- ********************************* -- INTERVIEW QUESTIONS FOR SQL -- *************************************************
-- Requirement for these questions :
-- Creating a table Employee
CREATE TABLE employee(
	emp_id SERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	salary INTEGER,
	joining_date TIMESTAMP,
	dept_name VARCHAR(25)
);

-- Inserting values inside employee
INSERT INTO employee
VALUES
	(0001, 'Krish', 'Naik', 50000, '2014-12-11 09:00:00', 'Development'),	
	(0002, 'Sudhanshu', 'Kumar', 60000, '2014-12-11 09:00:00', 'Development'),
	(0003, 'Sanket', 'Kumar', 70000, '2014-12-12 09:00:00', 'HR'),
	(0004, 'Darius', 'Bengali', 70000, '2014-12-13 09:00:00', 'HR'),
	(0005, 'Satish', 'Bhansal', 30000, '2015-10-21 09:00:00', 'Accountant'),
	(0006, 'Shaktiman', 'Hero', 50000, '2015-10-15 09:00:00', 'Accountant');

SELECT * FROM employee;
	
-- Creating another table bonus
CREATE TABLE bonus(
	emp_ref_id INTEGER,
	bonus_amt INTEGER,
	bonus_date TIMESTAMP,
	FOREIGN KEY (emp_ref_id) REFERENCES employee (emp_id)
	ON DELETE CASCADE
);
	
-- Inserting values into bonus
INSERT INTO bonus
VALUES
	(0001, 5000, '2016-03-14'),
	(0002, 5000, '2016-03-13'),
	(0003, 5000, '2017-03-15'),
	(0001, 5000, '2018-03-17'),
	(0004, 3500, '2016-03-19'),
	(0005, 7000, '2016-03-20'),
	(0001, 8000, '2020-03-21'),
	(0002, 8500, '2020-03-21');
	
SELECT * FROM bonus;

-- Creating another table designation
CREATE TABLE designation(
	emp_ref_id INTEGER,
	designation VARCHAR(25),
	designation_date TIMESTAMP,
	FOREIGN KEY (emp_ref_id) REFERENCES employee (emp_id)
	ON DELETE CASCADE
);

-- Inserting values inside designation
INSERT INTO designation
VALUES
	(0001, 'Manager', '2016-02-05'),
	(0002, 'Executive', '2016-06-11'),
	(0003, 'Executive', '2016-06-11');
	
SELECT * FROM designation;
	
-- ********************************** -- EASY QUESRIES -- **************************************
-- Q1. Write an SQL query to retrieve all details where first name from employee table starts with k

-- QUERY 1 :
SELECT * FROM employee
WHERE first_name ILIKE 'k%';

-- QUERY 2 :
SELECT * FROM employee
WHERE LEFT(first_name, 1) IN ('K', 'k');

-- Q2. Write an SQL query to retrieve all details where first name from employee table endswith h

-- QUERY 1 :
SELECT * FROM employee
WHERE first_name ILIKE '%h';

--QUERY 2 :
SELECT * FROM employee
WHERE RIGHT(first_name, 1) IN ('H', 'h');


-- Q3. Write an SQL query to retrieve all details of employees whose salary between 10000 to 35000

-- QUERY 1 :
SELECT * FROM employee
WHERE salary BETWEEN 10000 AND 35000;

-- QUERY 2 :
SELECT * FROM employee
WHERE salary >= 10000
AND salary <= 35000;

-- QUERY 3 :
SELECT * FROM employee
WHERE emp_id IN (
	SELECT emp_id FROM employee
	WHERE salary BETWEEN 10000 AND 35000
);

-- Q4. Write an SQL query to retrive details of employees who have joined on a date dec-2014

--QUERY 1 :
SELECT * FROM employee
WHERE EXTRACT(YEAR FROM joining_date)='2014'
AND EXTRACT(MONTH FROM joining_date)='12';

-- QUERY 2 :
SELECT * FROM employee
WHERE emp_id IN (
	SELECT emp_id FROM employee
	WHERE EXTRACT(YEAR FROM joining_date)='2014'
	AND EXTRACT(MONTH FROM joining_date)='12'
);

-- Q5. Write an SQL query to fecth number of employees in every department

-- QUERY 1 :
SELECT
	dept_name,
	COUNT(emp_id) AS number_of_employees
FROM employee
GROUP BY dept_name;

-- QUERY 2 :
SELECT
	DISTINCT dept_name,
	COUNT(emp_id) OVER(PARTITION BY dept_name) AS number_of_employees
FROM employee;

-- ***************************** -- INTERMEDIATE QUERIES -- *******************************************
-- Q6. Write an SQL query to fetch details of employees who are also executives

-- QUERY 1 :
SELECT
	e.first_name,
	e.last_name,
	e.salary,
	e.dept_name,
	d.designation
FROM employee e
INNER JOIN designation d
ON e.emp_id = d.emp_ref_id
WHERE d.designation = 'Executive';

-- QUERY 2 :
SELECT
	first_name,
	last_name,
	dept_name
FROM employee
WHERE emp_id IN (
	SELECT emp_ref_id FROM designation
	WHERE designation = 'Executive'
);

-- Q7. Write an SQL query to clone a new table from another table

-- QUERY 1 : WITH DATA
CREATE TABLE clone_employee_with_data AS
TABLE employee;

SELECT * FROM clone_employee;

-- QUERY 2 : WITHOUT DATA
CREATE TABLE clone_employee_without_data AS
TABLE employee
WITH NO DATA;

SELECT * FROM clone_employee_without_data;

-- Q8. Write an SQL query to show top n salary of employees
-- let n = 3

SELECT * FROM employee
ORDER BY salary DESC
LIMIT 3;

-- *********************************** -- INCREASING COMPLEXITY -- ********************************************
-- Q9. Write an SQL query to determine 3rd highest salary

-- QUERY 1 :
SELECT * FROM (
	SELECT * FROM employee
	ORDER BY salary DESC
	LIMIT 3
) T
ORDER BY T.salary DESC
LIMIT 1;

-- QUERY 2 :
SELECT
	first_name,
	last_name,
	dept_name
FROM (
	SELECT
		*,
		RANK() OVER(ORDER BY salary DESC) AS ranked_sal
	FROM employee
) AS T
WHERE T.ranked_sal = 3;

-- QUERY 3: Only for MySQL
/*
SELECT * FROM employee
ORDER BY salary DESC
LIMIT n-1, 1;
*/







	
	
	
	