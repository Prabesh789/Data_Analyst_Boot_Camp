-- Having vs Where

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%' # Row level filter
GROUP BY occupation
HAVING AVG(salary) > 75000; # Aggregate function level filter