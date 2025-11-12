SELECT 
    bs.buy_id,
    s.name_step
FROM buy_step bs
INNER JOIN step s USING(step_id)
WHERE bs.date_step_beg IS NOT NULL AND bs.date_step_end IS NULL
ORDER BY buy_id ASC;
