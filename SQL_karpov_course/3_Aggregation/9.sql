SELECT 
    COUNT(array_length(product_ids, 1)) AS orders
FROM orders
WHERE array_length(product_ids, 1) >= 9
ORDER BY orders;

-- SELECT count(order_id) as orders
-- FROM   orders
-- WHERE  array_length(product_ids, 1) >= 9
