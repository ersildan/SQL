SELECT 
    user_id,
    birth_date
FROM users
WHERE birth_date IS NOT NULL
AND sex = 'male'
ORDER BY birth_date DESC
LIMIT 50;