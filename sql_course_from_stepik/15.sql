WITH t AS (
    SELECT 
        date_id,
        product,
        COUNT(product) as Количество
    FROM log_sales
    GROUP BY date_id, product
    ORDER BY date_id
), t2 AS (
    select DISTINCT
        date_id,
        MAX(Количество) OVER (PARTITION BY date_id) as max_dig
    from t
    group by date_id, product
)

SELECT 
    t.date_id,
    t.product
FROM t
JOIN t2 USING(date_id)
WHERE Количество = max_dig;
