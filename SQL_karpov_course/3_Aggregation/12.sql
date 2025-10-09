SELECT 
    ROUND(AVG(price), 2)
    AS avg_price
FROM products
WHERE name LIKE 'чай %' OR name LIKE 'кофе %';
