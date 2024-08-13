SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN / JOIN : return only the rows that have matching values in both tables.
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
# INNER JOIN & JOIN are functionally the same.
INNER JOIN employee_salary 	AS sal
	ON dem.employee_id = sal.employee_id;
    
-- OUTER JOIN
-- LEFT JOIN (LEFT OUTER JOIN) : returns all rows from the left table (the first table in the join: employee_demographics), and the matched rows from the right table. 
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary 	AS sal
	ON dem.employee_id = sal.employee_id;
    
-- RIGHT JOIN (RIGHT OUTER JOIN) : returns all rows from the left table (the first table in the join: employee_salary), and the matched rows from the right table. 
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary 	AS sal
	ON dem.employee_id = sal.employee_id;
    
-- SELF JOIN
-- Table is joined with itself.
SELECT 
	emp1.employee_id AS emp_santa,
    emp1.first_name AS first_name_santa,
    emp2.last_name AS last_name_santa,
    emp2.employee_id AS emp,
    emp1.first_name AS first_name_emp,
    emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
 ON emp1.employee_id + 1 = emp2.employee_id;

-- Joining multiple tables together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary 	AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id;