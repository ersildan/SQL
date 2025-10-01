SELECT
    product_id,
    name
FROM 
    products
WHERE name LIKE 'с%' AND name LIKE '% %' = FALSE
ORDER BY product_id ASC;