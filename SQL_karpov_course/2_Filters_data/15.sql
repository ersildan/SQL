SELECT 
    user_id, 
    order_id, 
    action, 
    time
FROM user_actions
WHERE
    action = 'cancel_order'
    AND DATE_PART('dow', DATE(time)) = 3
    AND DATE_PART('month', DATE(time)) = 8
    AND DATE_PART('year', DATE(time)) = 2022
    AND time :: time BETWEEN '12:00:00'::time AND '15:59:59'::time 
ORDER BY order_id DESC;
