SELECT
    product_id,
    name,
    price,
    ROUND((price / 1.2) * 0.2, 2) AS tax,
    ROUND(price / 1.2, 2) AS price_before_tax
FROM products
ORDER BY price_before_tax DESC, product_id ASC;