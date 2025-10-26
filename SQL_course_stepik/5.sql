SELECT
    product_id,
    quantity,
    color
FROM products
WHERE quantity < 5 AND color = 'черный' 
    OR quantity < 10 AND color = 'белый'
ORDER BY product_id;
