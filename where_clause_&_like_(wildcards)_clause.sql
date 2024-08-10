SELECT *
FROM  employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender;
