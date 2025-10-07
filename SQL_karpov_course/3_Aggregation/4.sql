SELECT 
    COUNT(*) AS dates,
    COUNT(birth_date) AS dates_not_null
FROM users;
