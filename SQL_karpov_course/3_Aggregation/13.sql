SELECT 
    AGE(MAX(birth_date), MIN(birth_date)) :: VARCHAR
    AS age_diff
FROM users;
