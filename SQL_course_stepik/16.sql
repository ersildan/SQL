SELECT
    CASE
        WHEN rn <= 3 THEN product
        ELSE 'другие'
    END AS product,
    SUM(quantity) AS quantity
FROM
    (SELECT
        product,
        quantity,
        ROW_NUMBER() OVER (ORDER BY quantity DESC) AS rn
    FROM 
        (SELECT
            product,
            SUM(quantity) AS quantity
        FROM sales
        GROUP BY product) as t
    ) AS t2
GROUP BY 
    CASE 
        WHEN rn <= 3 THEN product
        ELSE 'другие'
    END;