SELECT 
    user_id,
    order_id,
    time
FROM 
    user_actions
WHERE
    action = 'create_order'
    AND DATE(time) >= '2022-09-06 00:00:00'
ORDER BY order_id ASC;