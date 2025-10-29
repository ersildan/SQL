SELECT
    COUNT(DISTINCT user_id) AS users_count
FROM 
    user_actions
WHERE 
    action = 'create_order' 
    AND 
    time > (select MAX(time) from user_actions) - INTERVAL '1 week';
