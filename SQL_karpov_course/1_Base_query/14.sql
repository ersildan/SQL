SELECT 
    product_id,
    name, 
    price AS old_price,
    CASE 
    WHEN name != 'икра' AND price > 100 THEN price * 1.05
    ELSE price
    END AS new_price
FROM products
ORDER BY new_price DESC, product_id ASC;