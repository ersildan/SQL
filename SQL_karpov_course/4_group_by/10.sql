SELECT array_length(product_ids, 1) as order_size,
       count(order_id) as orders_count
FROM   orders
WHERE  creation_time >= '2022-08-29'
   and creation_time < '2022-09-05'
GROUP BY order_size
ORDER BY order_size;


-- SELECT array_length(product_ids, 1) as order_size,
--        count(order_id) as orders_count
-- FROM   orders
-- WHERE  creation_time between '2022-08-29'
--    and '2022-09-05'
-- GROUP BY order_size
-- ORDER BY order_size;