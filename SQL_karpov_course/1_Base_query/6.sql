SELECT 
    name,
    LENGTH(name) AS name_length,
    price
FROM products
ORDER BY name_length DESC
LIMIT 1;