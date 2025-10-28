WITH cte_tab AS (
    SELECT 
    user_id,
    COUNT(action) FILTER (WHERE action = 'create_order') as c
    FROM user_actions
    GROUP BY user_id
    ORDER BY user_id
)

SELECT
    ROUND(AVG(c), 2) as orders_avg
FROM cte_tab;
