SELECT *
from us_household_income;

SELECT *
FROM us_household_income_statistics;

SELECT COUNT(id)
FROM us_household_income;

SELECT COUNT(id)
FROM us_household_income_statistics;

ALTER TABLE us_household_income_statistics
RENAME COLUMN `ï»¿id` TO `id`;


SELECT id,COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;


DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM
(	SELECT id,
	row_id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) as row_num
	FROM us_household_income
	ORDER BY row_id
) as row_table
WHERE row_num > 1
);



SELECT id,COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1;

SELECT State_Name,
COUNT(State_Name)
FROM us_household_income
GROUP BY State_Name;

SELECT DISTINCT State_Name
FROM us_household_income
ORDER BY 1;

UPDATE us_household_income
SET State_Name = "Georgia"
WHERE State_Name = "georia";

UPDATE us_household_income
SET State_Name = "Alabama"
WHERE State_Name = "alabama";

SELECT State_ab,
COUNT(State_ab)
FROM us_household_income
GROUP BY State_ab;

SELECT DISTINCT State_ab
FROM us_household_income
ORDER BY 1;

SELECT *
from us_household_income
WHERE Place = "";

SELECT *
from us_household_income
WHERE County = "Autauga County"
ORDER BY 1;

UPDATE us_household_income
SET Place = "Autaugaville"
WHERE County = "Autauga County"
AND City = "Vinemont";

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type;

UPDATE us_household_income
SET Type = "Borough"
WHERE Type = "Boroughs";

SELECT ALand, AWater
FROM us_household_income
WHERE -- (AWater = 0 or AWater = '' OR AWater is NULL)
 (ALand = 0 or ALand = '' OR ALand is NULL);