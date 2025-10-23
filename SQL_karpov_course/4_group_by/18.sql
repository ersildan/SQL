SELECT
    user_id,
    ROUND((COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order')) / 
    COUNT(DISTINCT order_id) :: DECIMAL, 2) AS cancel_rate,
    COUNT(DISTINCT order_id) AS orders_count
FROM user_actions
GROUP BY user_id
HAVING 
    COUNT(DISTINCT order_id) > 3 
    AND 
    ROUND((COUNT(DISTINCT order_id)  FILTER (WHERE action = 'cancel_order')) /
    COUNT(DISTINCT order_id) :: DECIMAL, 2) >= 0.5
ORDER BY user_id;