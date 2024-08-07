select id
from (
    select id,temperature,recordDate,
    lag(temperature) over(order by recordDate ) as lapTemp,
    lag(recordDate) over (order by recordDate) as prevDate
    from weather
) as ggg
where lapTemp<temperature
and datediff(day,prevDate,recordDate)=1
