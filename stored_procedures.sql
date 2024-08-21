-- Stored Procedures
/* These are the ways to save sql code and reuse complex SQL queries. */


CREATE PROCEDURE large_salaries() # Here, we have created a large_salaries() procedure
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries(); 

-- -----------------
# Best Practices for creating procedures

DELIMITER $$
DROP procedure IF EXISTS large_salaries1;
CREATE PROCEDURE large_salaries1()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries1();

-- --------------------------------------------
-- Passing parameters in procedures
DROP procedure IF EXISTS large_salaries2;
DELIMITER $$
CREATE PROCEDURE large_salaries2(employee_id_param INT)
BEGIN
	SELECT first_name, last_name, salary
	FROM employee_salary 
	WHERE employee_id = employee_id_param;
END $$
DELIMITER ;

CALL large_salaries2(2);

SELECT *
FROM employee_salary;