SELECT 
    user_id
FROM user_actions
WHERE action = 'create_order'
GROUP BY user_id
HAVING MAX(time) < '2022-09-08'
ORDER BY user_id;
