SELECT (SELECT count(*)
        FROM   courier_actions
        WHERE  action = 'accept_order') - (SELECT count(*)
                                   FROM   user_actions
                                   WHERE  action = 'create_order') as orders_count;
                                   