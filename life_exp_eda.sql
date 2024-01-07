SELECT * FROM 
world_life_expectancy;

SELECT Country, Year, concat(Country, Year), COUNT(concat(Country, Year))
from world_life_expectancy
GROUP BY Country, Year, concat(Country, Year)
HAVING count(concat(Country, Year))>1;

SELECT *
FROM
(	SELECT Row_ID,
	concat(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY concat(Country, Year) ORDER BY concat(Country, Year)) AS Row_Num
	from world_life_expectancy) as row_table
    
WHERE Row_Num > 1
;

DELETE FROM world_life_expectancy
WHERE Row_ID IN
(
	SELECT Row_ID
	FROM
	(	SELECT Row_ID,
		concat(Country, Year),
		ROW_NUMBER() OVER(PARTITION BY concat(Country, Year) ORDER BY concat(Country, Year)) AS Row_Num
		from world_life_expectancy) as row_table
		
	WHERE Row_Num > 1
)
;

SELECT COUNT(*)
from world_life_expectancy;

SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> '';

SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing';

 UPDATE world_life_expectancy
 SET Status = 'Developing'
 WHERE Country IN (
				SELECT DISTINCT(Country)
                FROM world_life_expectancy
                WHERE Status = 'Developing'
                );

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed';

SELECT *
FROM world_life_expectancy
WHERE `Life expectancy` = '';

SELECT Country, Year,
`Life expectancy`
FROM world_life_expectancy;

SELECT t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
 AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
ON t1.Country = t3.Country
 AND t1.Year = t3.Year + 1
 WHERE t1.`Life expectancy` = '';
 
 UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
 AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
ON t1.Country = t3.Country
 AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = '';








