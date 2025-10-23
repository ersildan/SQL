SELECT
    CASE
    WHEN TO_CHAR(creation_time, 'Dy') IN ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN 'weekdays'
    ELSE 'weekend'
    END AS week_part,
    ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size
FROM orders
GROUP BY  week_part
ORDER BY avg_order_size;
