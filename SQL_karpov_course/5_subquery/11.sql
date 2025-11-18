select 
    (select count(distinct order_id) from user_actions
     where action = 'create_order') - ( select count(distinct order_id) from courier_actions
                                        where action = 'deliver_order') as orders_count;

-- SELECT count(distinct order_id) as orders_count
-- FROM   user_actions
-- WHERE  order_id not in (SELECT order_id
--                         FROM   courier_actions
--                         WHERE  action = 'deliver_order')
