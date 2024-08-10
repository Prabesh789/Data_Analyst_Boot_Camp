# Where Clause
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = "Leslie" AND age = 44) OR age > 50;

# Like Statement
# % = Anything
# _ = Specific characters
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "a___%";
