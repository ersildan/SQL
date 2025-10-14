SELECT 
    sex, 
    DATE_PART('years', MAX(AGE(current_date, birth_date))) :: INTEGER AS max_age
FROM users
GROUP BY sex
ORDER BY max_age;
