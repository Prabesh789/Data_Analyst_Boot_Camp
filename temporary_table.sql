
-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
(first_anme VARCHAR(50), last_name VARCHAR(50), favorite_movie VARCHAR(100));

INSERT INTO temp_table
VALUES('Prabesh', 'Rai', 'Titanic');

SELECT *
FROM temp_table; 

-- ------------------------------------------------------

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;

/*
The temporary table is automatically dropped when the session ends or when the table is explicitly dropped using 
DROP TEMPORARY TABLE temp_table
*/