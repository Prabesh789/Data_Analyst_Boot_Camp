-- Exploratory Data Analysis

SELECT *
FROM layoffs_stagging2;

 -- max total_laid_off and max percentage_laid_off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_stagging2;

SELECT *
FROM layoffs_stagging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- companies total_laid_off 
SELECT company, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;

-- date range of laid_off
SELECT MIN(date), MAX(date)
FROM layoffs_stagging2;

-- industries total_laid_off
SELECT industry, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY industry
ORDER BY 2 DESC;

-- countires total_laid_off
SELECT country, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC;

-- years total_laid_off
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

-- companies stages and their total_laid_off
SELECT stage, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
ORDER BY 1 DESC;

-- ----------------------------------------
-- total_laid_off sum per month & Rolling Total
SELECT 
	SUBSTRING(`date`, 1,7) AS `MONTH`, 
    SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY `MONTH`
ORDER BY 1;

WITH rolling_total AS
(
	SELECT 
		SUBSTRING(`date`, 1,7) AS `MONTH`, 
		SUM(total_laid_off) AS total_off
	FROM layoffs_stagging2
	GROUP BY `MONTH`
	ORDER BY 1
)
SELECT 
	`MONTH`,
    total_off,
    SUM(total_off)
    OVER(ORDER BY `MONTH`) AS rolling_total
FROM rolling_total;

-- ------------------------------------------
-- 
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH Company_year (company, years, total_laid_off) AS
(
	SELECT company, YEAR(`date`), SUM(total_laid_off)
	FROM layoffs_stagging2
	GROUP BY company, YEAR(`date`)
),
Company_year_rank AS
(
SELECT *, DENSE_RANK() OVER (partition by years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_year_rank
WHERE Ranking <= 5
;



