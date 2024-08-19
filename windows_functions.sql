-- Windows Functions
-- Windows functions in SQL, also known as analytic functions, are used to perform calculations across a set of table rows that are related to the current row. 

-- Using Group By Function
/* 
Purpose: Aggregates data across multiple rows into a summary result based on one or more columns.
Usage: Typically used to generate summary reports where you want to collapse multiple rows into a single summary row for each group.
*/
SELECT gender, AVG(salary) AS avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- Using Windows Function
/* 
Purpose: Performs calculations across a set of table rows related to the current row within a query result set. These calculations are done while preserving the original rows in the result set.
Usage: Typically used to perform calculations that involve multiple rows but do not aggregate them into a single summary row.
*/
# AVG(): Calculates the average of a specified column for each row within a partition.
SELECT dem.first_name, dem.last_name, gender, salary, AVG(salary) OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

# SUM(): Calculates the sum of a specified column for each row within a partition.
SELECT 
	dem.first_name, 
    dem.last_name, 
    gender, 
    salary, 
    SUM(salary) OVER(partition by gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

# ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition of the result set.
# RANK(): Provides a rank for each row within a partition of the result set, with gaps in ranking values if there are ties.
# DENSE_RANK(): Similar to RANK(), but without gaps in ranking values.
SELECT 
	dem.employee_id,
	dem.first_name, 
    dem.last_name, 
    gender, 
    salary, 
    # ROW_NUMBER() OVER()
    ROW_NUMBER() OVER(partition by gender ORDER BY salary DESC) AS row_num,
    RANK() OVER(partition by gender ORDER BY salary DESC) AS rank_num,
    DENSE_RANK() OVER(partition by gender ORDER BY salary DESC) AS rank_num 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
