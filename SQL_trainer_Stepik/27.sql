SELECT 
    bs.buy_id,
    DATEDIFF(bs.date_step_end, bs.date_step_beg) AS Количество_дней,
    CASE
        WHEN DATEDIFF(bs.date_step_end, bs.date_step_beg) > ci.days_delivery 
        THEN DATEDIFF(bs.date_step_end, bs.date_step_beg) - ci.days_delivery 
        ELSE 0
    END 
    AS Опоздание
FROM buy_step bs
INNER JOIN buy b USING(buy_id)
INNER JOIN client c USING(client_id)
INNER JOIN city ci USING(city_id)
INNER JOIN step s USING(step_id)
WHERE s.name_step = 'Транспортировка' 
AND DATEDIFF(bs.date_step_end, bs.date_step_beg) IS NOT NULL;
