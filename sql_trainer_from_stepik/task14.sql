SELECT
    title AS Название,
    author AS Автор,
    s.amount + b.amount AS Количество
FROM supply as s
INNER JOIN book as b USING(title)
WHERE s.price = b.price;