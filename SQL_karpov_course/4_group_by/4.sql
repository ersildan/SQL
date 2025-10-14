SELECT
    DATE_TRUNC('month', time) AS month, 
    action, 
    COUNT(user_id) orders_count
FROM user_actions
GROUP BY action, month
ORDER BY month, action;