SELECT
    name_author,
    SUM(b.amount) AS Количество
FROM author as a
LEFT JOIN book as b
    ON a.author_id = b.author_id
GROUP BY name_author
HAVING SUM(b.amount) < 10 OR Количество IS NULL
ORDER BY Количество;