SELECT 
    product_id,
    name,
    price,
    '25%' AS discount,
    price * 0.75 AS new_price
FROM products
WHERE 
    price > 60
    AND
    name LIKE '%чай %';
    