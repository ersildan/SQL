SELECT ROUND( AVG( ARRAY_LENGTH(product_ids, 1) ), 2 ) AS avg_order_size
FROM 
    orders
WHERE 
    DATE_PART('dow', creation_time) = 6 
    OR
    DATE_PART('dow', creation_time) = 0;

-- SELECT ROUND( AVG( ARRAY_LENGTH(product_ids, 1) ), 2 ) AS avg_order_size
-- FROM 
--     orders
-- WHERE 
--     DATE_PART('dow', creation_time) IN (6, 0);
