SELECT 
    name_author,
    title,
    price
FROM book as b
INNER JOIN author as a USING(author_id)
WHERE price < 600;