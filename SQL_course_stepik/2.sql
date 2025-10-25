SELECT 
    product_id
FROM products
GROUP BY product_id
HAVING COUNT(product_id) > 1;
