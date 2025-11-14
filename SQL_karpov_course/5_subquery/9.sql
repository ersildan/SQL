with avg_price as (
    select 
        round(avg(price), 2) as price_avg
    from products
)

select 
    product_id, name, price, 
    case
    when price - (select price_avg from avg_price) > 50 then round(price * 0.85, 2)
    when price - (select price_avg from avg_price) < - 50 then round(price * 0.90, 2)
    else price
    end
    as new_price
from products
order by price desc, product_id ASC;
