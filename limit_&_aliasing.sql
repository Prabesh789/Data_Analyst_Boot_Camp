-- Limit & Aliasing

/* If I want to see who are the 3 oldest employee from the table */
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 3; # This is used for pagination, skip first 2, and retuen 3 number of rows.
# LIMIT 3; This means return the top 3 number of rows.

-- Aliasing 
/*  This refers to assigning a temporary name to a table or column within a query */
SELECT 
	gender, 
	AVG(age) AS avg_age
FROM 
	employee_demographics
GROUP BY 
	gender
HAVING avg_age > 40;