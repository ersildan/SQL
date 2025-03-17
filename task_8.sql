UPDATE fine, 
    (
    SELECT name, number_plate, violation
    FROM fine
    GROUP BY name, number_plate, violation
    HAVING COUNT(*) >= 2
    ) AS query_in
    
SET fine.sum_fine = fine.sum_fine * 2
WHERE fine.date_payment IS NULL 
     AND (fine.number_plate = query_in.number_plate 
     AND fine.violation = query_in.violation);


SELECT*FROM fine;
