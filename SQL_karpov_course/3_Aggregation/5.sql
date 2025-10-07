SELECT 
    COUNT(user_id) AS users,
    COUNT(DISTINCT user_id) AS unique_users
FROM user_actions;
