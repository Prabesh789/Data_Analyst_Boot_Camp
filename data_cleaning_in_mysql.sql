-- Data Cleaning
/* 
Data cleaning is the process of transforming raw data into a more usable format by correcting errors and addressing issues. 
This ensures that when we create visualizations or use the data in our products, it is accurate and reliable, free from significant 
problems that could affect its usefulness.

We are going to perform following tasks for cleaning the data:
1. Check and Remove duplicates if any exists
2. Standaradize the data (Issuse with spelings, spaces etc.)
3. Look on null and blank values
4. Remove the un-necessary column and rows
*/

USE world_layoffs;
SELECT *
FROM layoffs;

CREATE TABLE layoffs_stagging # We first create a dublicates of the original table's structure.
LIKE layoffs; 

INSERT INTO layoffs_stagging # Then imort all data from layoffs.
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_stagging;

# Identify duplicate rows within a partition
/*
This query add a new column, row_num, to the result set of the layoffs_stagging table.
This column contains sequential numbers starting at 1 for each group of rows that have the same values
for the company, industry, total_laid_off, percentage_laid_off, and date columns.
*/

SELECT *,
ROW_NUMBER() OVER (
	partition by 
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised
) AS row_num
FROM layoffs_stagging;

# Here, we create a CTE to identify the duplicate rows
WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER (
	partition by 
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised
) AS row_num
FROM layoffs_stagging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT * # Check if the duplicate are real
FROM layoffs_stagging 
WHERE company = 'Beyond Meat';

# Now process to remove the duplicate rows from table

-- Create stagging 2

CREATE TABLE layoffs_stagging2 (
`company` text,
`location` text,
`industry` text,
`total_laid_off` text,
`percentage_laid_off` text,
`date` text,
`stage` text,
`country` text,
`funds_raised` double,
`row_num` int
);

INSERT INTO layoffs_stagging2
	SELECT *,
	ROW_NUMBER() OVER (
	partition by 
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised
) AS row_num
FROM layoffs_stagging;

DELETE
FROM layoffs_stagging2
WHERE row_num > 1;

SELECT *
FROM layoffs_stagging2
WHERE row_num > 1;

-- Duplicates are removed

-- Standardizing the data

SELECT *
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET company = TRIM(company);
-- -----------------------------------------------------
SELECT *
FROM layoffs_stagging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';
-- -------------------------------------------------------
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_stagging2
ORDER BY 1;

UPDATE layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';
-- --------------------------------------------------------
UPDATE layoffs_stagging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y'); # converting into dae format

ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE;
-- ---------------------------------------------------------
-- Looking into the null and blank spaces

SELECT *
FROM layoffs_stagging2
WHERE industry IS NULL 
OR industry = '';

 -- Here we are trying to pupulate the missing industry data
SELECT * 
FROM layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- To make easy lets set the null value to blanks
UPDATE layoffs_stagging2
SET industry = NULL
WHERE industry = '';

-- populating the industry data
UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_stagging2
WHERE company = 'Appsmith';

-- -----------------------------------------------
-- Remove the not necessary columns and row

SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Now we can drop the row_num column
ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;

