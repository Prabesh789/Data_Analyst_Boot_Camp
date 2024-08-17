-- Case Statements

SELECT
	first_name,
    last_name,
    age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 30 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'Too Old'
END AS age_state
FROM employee_demographics;

/* Scenario
We are given a company memo of their bonus and pay increase for end of the year. We need to follow it and determine people's end of the salary or the salary and if they got a bonus, how much was it?
*/
-- Pay Increase and Bonus
-- < 50,000 = 5% raise
-- > 50,000 = 7% raise
-- Finance Dept = 10% bonus

SELECT 
	first_name,
    last_name,
    salary,
CASE 
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS bonus
FROM employee_salary;

