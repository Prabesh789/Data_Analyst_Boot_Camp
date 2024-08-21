-- Common Table Expression (CTE)
/*
A Common Table Expression (CTE) in MySQL is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
CTEs are defined using the WITH keyword and can be thought of as a more readable and reusable alternative to subqueries.
*/

WITH CTE_Example0 AS # Here, CTE_Example is a temporary table
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, count(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example0;

-- -----------------------------------------------------------------
WITH CTE_Example0 (Gender, Avg_sal, Max_sal, Min_sal, Count_sal) AS # Temp column name are defined, It will override the alises in query
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, count(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example0;

-- ------------------------------------------------------------------------
WITH CTE_Example1 AS
(
SELECT dem.employee_id, dem.gender, dem.birth_date
FROM employee_demographics dem
WHERE dem.birth_date > "1985-01-01"
),
CTE_Example2 AS
(
SELECT sal.employee_id, sal.salary
FROM employee_salary sal
)
SELECT *
FROM CTE_Example1
JOIN CTE_Example2
	ON CTE_Example1.employee_id = CTE_Example2.employee_id;