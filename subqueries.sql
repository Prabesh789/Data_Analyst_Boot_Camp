-- Subqueries: query with in a query

/* If we want to know the employee that works in "Parks and Recreation" department. */

SELECT *
FROM employee_demographics
WHERE employee_id IN (
	# Everything inside here is sub-queries
    #  Here, IN clause expects the subquery to return a single column, as it is designed to compare the employee_id from the employee_demographics table against a list of values returned by the subquery.
	SELECT employee_id 	
    FROM employee_salary 
    WHERE dept_id = 1
);

-- subqueries in select statements

SELECT first_name, last_name, salary,
	(SELECT AVG(salary) 
    FROM employee_salary) AS avg_salary
FROM employee_salary;

-- subqueries in FROM statements
-- We want to see the average of Max age for male and female
SELECT AVG(max_age)
FROM (
	SELECT gender,
    AVG(age) as avg_age,
    MAX(age) as max_age,
    MIN(age) as min_age
    FROM employee_demographics
    GROUP BY gender
    ) AS agg_table
;

SELECT gender,
    AVG(age) as avg_age,
    MAX(age) as max_age,
    MIN(age) as min_age
    FROM employee_demographics
    GROUP BY gender
