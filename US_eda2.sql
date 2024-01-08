SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT *
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0;


SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0;

SELECT u.State_Name, round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT u.State_Name, round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10;

SELECT u.Type, u.`Primary`, round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0
GROUP BY u.Type, u.`Primary`
ORDER BY 3 DESC
LIMIT 10;

SELECT u.Type,COUNT(Type), round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0
GROUP BY u.Type
HAVING COUNT(Type) > 100
ORDER BY 3 ASC
LIMIT 20;

SELECT *
from us_household_income
WHERE Type = "Community";

SELECT *
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0;

SELECT u.State_Name, City, round(AVG(Mean),1),round(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
WHERE us.mean <> 0
GROUP BY City, u.State_Name
ORDER BY  DESC;

