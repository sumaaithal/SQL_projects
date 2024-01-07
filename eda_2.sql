SELECT *
FROM world_life_expectancy;

SELECT Country, MIN(`Life expectancy`),
MAX(`Life expectancy`),
round(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) as diff_life_exp
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY diff_life_exp DESC;

SELECT Year, round(avg(`Life expectancy`),2) as avg_life_exp
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;

SELECT Country, 
round(avg(`Life expectancy`),1) as avg_life_exp,
round(avg(GDP),1) AS avg_GDP
FROM world_life_expectancy
GROUP BY Country
HAVING avg_life_exp > 0
AND avg_GDP > 0
ORDER BY avg_GDP DESC;

SELECT 
SUM(CASE
	WHEN GDP >= 1500 THEN 1
    ELSE 0
END) AS high_gdp_count,

AVG(CASE
	WHEN GDP >= 1500 THEN `Life expectancy`
    ELSE NULL
END) AS high_gdp_life_exp,

SUM(CASE
	WHEN GDP <= 1500 THEN 1
    ELSE 0
END) AS low_gdp_count,

AVG(CASE
	WHEN GDP <= 1500 THEN `Life expectancy`
    ELSE NULL
END) AS low_gdp_life_exp
from world_life_expectancy;

SELECT Status,
COUNT(DISTINCT Country) num_countries,
round(avg(`Life expectancy`),2)  avg_life_exp
FROM world_life_expectancy
GROUP BY Status;

SELECT Country, 
round(avg(`Life expectancy`),1) as avg_life_exp,
round(avg(BMI),1) AS avg_BMI
FROM world_life_expectancy
GROUP BY Country
HAVING avg_life_exp > 0
AND avg_BMI > 0
ORDER BY avg_BMI ASC;

SELECT *
FROM world_life_expectancy;

SELECT Country,
Year, 
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS rolling_total
FROM world_life_expectancy
WHERE Country LIKE '%United%';