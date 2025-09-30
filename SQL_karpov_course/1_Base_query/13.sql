SELECT 
    product_id, 
    name, 
    price AS old_price, 
    price * 1.05 AS new_price
FROM products
ORDER BY new_price DESC, product_id ASC;