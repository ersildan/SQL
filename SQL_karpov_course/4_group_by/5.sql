SELECT 
    sex, 
    MAX(DATE_PART('month', birth_date)) :: INTEGER AS max_month
FROM users
GROUP BY sex
ORDER BY sex;
