SELECT
    AVG(c) as orders_avg
FROM (
    SELECT 
    user_id,
    COUNT(action) FILTER (WHERE action = 'create_order') as c
    FROM user_actions
    GROUP BY user_id
    ORDER BY user_id
) as t;
