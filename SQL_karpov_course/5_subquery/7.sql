select order_id
from user_actions
where order_id NOT IN (
    select distinct order_id
    from user_actions
    where action = 'cancel_order')
order by order_id
limit 1000;
