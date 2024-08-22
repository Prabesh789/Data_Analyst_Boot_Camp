-- Triggers and Events
/* Triggers are the block of code that executes automatically when a event takes place on specific tables */

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

/*
Here, we are creating a procedures to trigger the block of code in employee_dempgraphics table, when a certain row is inserted into the employee_salary table. 
*/

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$

DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'John', 'Snow', 'Actor', 100000, null);

-- EVENTS
/*
Events are scheduled tasks that are managed by the MySQL Event Scheduler. 
*/
# We are creating an event that delete the employee who are 60 + of age from employye_demographics table

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
DELETE 
FROM employee_demographics
WHERE age >= 60;
END $$
DELIMITER ;

# If any error occours on event: Check it
SHOW VARIABLES LIKE 'event%';



