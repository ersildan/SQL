SELECT
    user_id,
    COUNT(action) AS created_orders
FROM user_actions
WHERE action = 'create_order' AND time BETWEEN '2022-08-01' AND '2022-09-01'
GROUP BY user_id
ORDER BY created_orders DESC, user_id
LIMIT 5;