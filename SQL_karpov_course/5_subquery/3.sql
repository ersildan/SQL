SELECT 
    product_id,
    name,
    price
FROM products
WHERE price != (select MIN(price) from products)
ORDER BY product_id DESC;
