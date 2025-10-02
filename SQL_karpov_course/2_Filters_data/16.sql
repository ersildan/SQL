WITH product_list AS (
    SELECT UNNEST(ARRAY[
        'сахар', 'сухарики', 'сушки', 'семечки', 'масло льняное', 'виноград', 'масло оливковое', 
        'арбуз', 'батон', 'йогурт', 'сливки', 'гречка', 'овсянка', 'макароны', 'баранина', 'апельсины', 
        'бублики', 'хлеб', 'горох', 'сметана', 'рыба копченая', 'мука', 'шпроты', 'сосиски', 'свинина', 'рис', 
        'масло кунжутное', 'сгущенка', 'ананас', 'говядина', 'соль', 'рыба вяленая', 'масло подсолнечное', 'яблоки', 
        'груши', 'лепешка', 'молоко', 'курица', 'лаваш', 'вафли', 'мандарины'
    ]) AS product_name
)

SELECT product_id, 
    name, 
    price, 
    CASE
        WHEN name IN (SELECT product_name FROM product_list)
            THEN ROUND((price / 1.1) * 0.1, 2)
        ELSE ROUND((price / 1.2) * 0.2, 2)
    END AS tax,
    CASE
        WHEN name IN (SELECT product_name FROM product_list)
            THEN price - ROUND(price / 1.1 * 0.1, 2)
        ELSE price - ROUND((price / 1.2) * 0.2, 2)
    END AS price_before_tax
FROM products
ORDER BY price_before_tax DESC, product_id ASC;
