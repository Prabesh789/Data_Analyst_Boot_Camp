SELECT *
FROM  employee_demographics;

/* GROUP BY clause:
Grouping Rows: The GROUP BY clause combines rows that have the same values in the specified columns into a single group.
Applying Aggregates: Once the rows are grouped, aggregate functions (max, min etc.) can be applied to each group to summarize or compute values for that group. 
Common Aggregate functions are COUNT(), SUM(), AVG(), MIN(), and MAX()
*/
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;