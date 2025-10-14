SELECT 
    sex, 
    COUNT(DISTINCT courier_id) AS couriers_count
FROM couriers
GROUP BY sex
ORDER BY 2;