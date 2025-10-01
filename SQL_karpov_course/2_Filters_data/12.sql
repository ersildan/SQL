SELECT
    order_id,
    time
FROM 
    courier_actions
WHERE courier_id = 100
AND action = 'deliver_order'
ORDER BY time DESC
LIMIT 10;