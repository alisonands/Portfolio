-- Get total cases, fatalities, and recoveries for each date

SELECT date, total_cases, total_fatalities, total_recoveries
FROM covid;

-- Calculate the average number of tests conducted per day
SELECT AVG(change_tests) AS avg_tests_per_day
FROM covid;

-- Calculate the number of critical conditions, ordered by year
-- 2021 had highest number of critical cases
SELECT EXTRACT(YEAR FROM date) AS year, SUM(total_criticals) AS total_criticals
FROM covid
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY SUM(total_criticals) DESC;

-- Calculate the number of fatalities, ordered by year
-- 2022 had the highest number of fatalities
SELECT EXTRACT(YEAR FROM date) AS year, SUM(total_fatalities) AS total_fatalities
FROM covid
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY SUM(total_fatalities) DESC;

-- Calculate the total cases on a yearly basis
SELECT EXTRACT(YEAR FROM date) AS year,
       SUM(total_cases) as total_cases,
       SUM(total_fatalities) as total_fatalities,
       SUM(total_tests) as total_tests,
       SUM(total_vaccinations) as total_vaccinations
FROM covid
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY EXTRACT(YEAR FROM date);

-- Analyze the correlation between variables
SELECT 
    CORR(change_cases, change_vaccinations) AS cases_vaccinations_corr,
    CORR(change_fatalities, change_tests) AS fatalities_tests_corr
FROM covid;
