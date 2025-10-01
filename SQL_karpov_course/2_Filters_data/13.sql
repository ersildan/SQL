SELECT 
    order_id
FROM user_actions
WHERE action = 'create_order'
AND time BETWEEN '2022-07-31' AND '2022-09-01'
ORDER BY order_id ASC;


-- SELECT order_id
-- FROM   user_actions
-- WHERE  action = 'create_order'
--    and date_part('month', time) = 8
--    and date_part('year', time) = 2022
-- ORDER BY order_id