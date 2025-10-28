WITH t AS (
    SELECT AVG(price)
    FROM products
)

SELECT 
    product_id,
    name,
    price
FROM products
WHERE price - (select * from t) > 20
ORDER BY product_id DESC;

