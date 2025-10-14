SELECT 
    sex,
    DATE_PART('month', MAX( birth_date )) :: INTEGER AS max_month
FROM users
GROUP BY sex
ORDER BY sex;
