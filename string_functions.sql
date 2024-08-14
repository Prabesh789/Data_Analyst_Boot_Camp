-- Srings Functions

-- count the length of string
SELECT 
	first_name, 
	length(first_name) AS fn_length
FROM 
	employee_demographics
# Order by length
ORDER BY 2; 

-- UPPER case & LOWER case
SELECT 
	first_name AS 'FN', 
	UPPER(first_name) AS upper_case, 
    LOWER(last_name) AS lower_Case
FROM 
	employee_demographics
ORDER BY 1;

-- TRIM: remove the lwading & trailing white spaces from string
SELECT TRIM('              Prabesh Rai ') AS trimed_value;
SELECT LTRIM('              Prabesh Rai ') AS left_trimed_value;
SELECT RTRIM('              Prabesh Rai ') AS right_trimed_value;

-- sub-string
SELECT 
	first_name, 
    LEFT(first_name, 4), # select 4 character from left 
	RIGHT(first_name, 4), # select 4 character from right
    SUBSTRING(first_name, 3, 3), # start at s position and select 2 chanracter
    birth_date,
    SUBSTRING(birth_date, 6, 2) AS birth_month # If we want to extract the month from the date of birth
FROM 
	employee_demographics;
    
-- Replace
SELECT 
	first_name, 
	REPLACE(first_name, 'a', 'z') # replace 'a' character from first_name with 'z'
FROM 
	employee_demographics;
    
-- Locate : identifies the position if character
SELECT LOCATE('e', 'Prabesh');

SELECT 
	first_name,
    LOCATE('An', first_name)
FROM employee_demographics;

-- CONCAT
SELECT 
	first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;