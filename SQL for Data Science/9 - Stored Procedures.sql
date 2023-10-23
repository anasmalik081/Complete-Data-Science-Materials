-- Stored procedure
/*
A stored procedure is a prepared SQL code/query that we can save,
so that the code/query can be used over and over again
*/
-- creating stored procedure
CREATE OR REPLACE PROCEDURE get_stu_info ()
LANGUAGE SQL
AS $$
SELECT * FROM student;
$$;

CALL get_stu_info();

-- creating procedure with parameters
CREATE OR REPLACE PROCEDURE get_stu_info (age INTEGER)
LANGUAGE SQL
AS $$
SELECT * FROM student
WHERE student.age = age;
$$;

CALL get_stu_info(27);

-- creating a table
CREATE TABLE stu_info(
	roll_no INTEGER NOT NULL,
	address VARCHAR(25)
);

-- CREATING PROCEDURE TO INSERT DATA
CREATE OR REPLACE PROCEDURE insert_data (a INTEGER, b VARCHAR)
LANGUAGE SQL
BEGIN ATOMIC
	INSERT INTO stu_info(roll_no, address)
	VALUES
		(a, b);
END;

CALL insert_data(121, '123 Main Street');

SELECT * FROM stu_info;









