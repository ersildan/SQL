SELECT 
    birth_date,
    courier_id,
    sex
FROM couriers
WHERE birth_date IS NULL
ORDER BY courier_id ASC;
