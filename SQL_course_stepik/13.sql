SELECT
    date_id,
    income,
    ROUND(
        (income + 
         COALESCE(LAG(income) OVER (ORDER BY date_id), 0) + 
         COALESCE(LEAD(income) OVER (ORDER BY date_id), 0)) /
         (IF(FIRST_VALUE(income) OVER(ORDER BY date_id)
             OR LAST_VALUE(income) OVER(ORDER BY date_id), 2, 3)
         ))
    AS moving_average
FROM income;
