SELECT id
FROM (
    SELECT 
        id, 
        temperature, 
        recordDate,
        LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date
    FROM weather
) AS TempWithLag
WHERE 
    temperature > previous_temp
    AND DATEDIFF(day, previous_date, recordDate) = 1;
