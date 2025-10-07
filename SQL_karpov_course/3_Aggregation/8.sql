SELECT 
    SUM(DISTINCT price) AS order_price
FROM products
WHERE name IN ('сухарики', 'чипсы', 'энергетический напиток');
