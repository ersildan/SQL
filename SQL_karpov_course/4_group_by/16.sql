SELECT 
    case 
    when EXTRACT(YEAR FROM  AGE(current_date, birth_date)) between 18 and 24 then '18-24'
    when EXTRACT(YEAR FROM AGE(current_date, birth_date)) between 25 and 29 then '25-29'
    when EXTRACT(YEAR FROM  AGE(current_date, birth_date)) between 30 and 35 then '30-35'
    else '36+'
    end as group_age,
    count(*) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY group_age
ORDER BY group_age;
