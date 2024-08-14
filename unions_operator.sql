-- Unions
-- UNION operator is used to combine the result sets of two or more SELECT statements. 
-- UNION = UNION DISTINCT
-- UNION ALL = without removing duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;


/*
'OLD' AS Label:
This part of the query adds a constant value 'OLD' to each row in the result set. The string 'OLD' will appear as a value in the result set for every row that the query returns.
The AS Label part assigns a name (Label) to this constant value. In the result set, the column name for this constant value will be Label. 
*/

-- If I want to see the oldest person and the highly paid employee within the organization, I can use the multiple SELECT statements and UNION

SELECT first_name, last_name, 'OLD Male' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'OLD Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;