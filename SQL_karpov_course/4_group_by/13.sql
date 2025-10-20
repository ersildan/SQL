SELECT
    courier_id
FROM courier_actions
WHERE action = 'deliver_order' 
    AND date_part('month', time) = 9
    AND date_part('year', time) = 2022
GROUP BY courier_id
HAVING COUNT(order_id) = 1
ORDER BY courier_id;
