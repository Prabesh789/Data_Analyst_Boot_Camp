-- WHERE and LIKE

# WHERE : filter the row level
SELECT *
FROM employee_demographics
WHERE first_name = 'Tom';

# LIKE
/* LIKE clause is used with wildcards for pattern matching in SQL.
Wildcards: Wildcards are special symbols used within the LIKE clause to represent one or more characters in a string. They allow for flexible pattern matching in queries.
Common Wildcards: % , _
% = Anything
_ = Exact match */

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__%'; # After Letter A two character but % allows any number of character 