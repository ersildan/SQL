SELECT 
    b.title,
    g.name_genre,
    b.price 
FROM book as b
INNER JOIN genre as g 
    ON g.genre_id = b.genre_id
WHERE amount > 8
ORDER BY price DESC;
