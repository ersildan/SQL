SELECT
    array_length(product_ids, 1) AS order_size,
    COUNT(array_length(product_ids, 1)) AS orders_count
FROM orders
WHERE TO_CHAR(creation_time, 'Dy') NOT IN ('Sat', 'Sun')
GROUP BY order_size
HAVING COUNT(array_length(product_ids, 1)) > 2000
ORDER BY order_size;
