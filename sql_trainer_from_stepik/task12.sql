SELECT
    name_author
FROM author as a
INNER JOIN book as b ON b.author_id = a.author_id
INNER JOIN genre as g ON g.genre_id = b.genre_id
GROUP BY name_author
HAVING COUNT(DISTINCT b.genre_id) = 1;
