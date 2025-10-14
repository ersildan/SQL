SELECT 
    DATE_PART('year', AGE(birth_date)) :: INTEGER AS age,
    COUNT(user_id) AS users_count
FROM users
GROUP BY age
ORDER BY age;
