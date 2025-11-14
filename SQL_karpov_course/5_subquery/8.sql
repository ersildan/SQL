with temp as (
    select 
        user_id,
        count(order_id) as orders_count
    from user_actions
    where action = 'create_order'
    group by user_id
)

select
    user_id, 
    orders_count,
    round(avg(orders_count) over (), 2) as orders_avg,
    orders_count - round(avg(orders_count) over(), 2) as orders_diff
from temp
order by user_id
limit 1000;
