SELECT
    name_genre,
    title,
    name_author
FROM genre as g
INNER JOIN book as b
    ON g.genre_id = b.genre_id
INNER JOIN author as a
    ON a.author_id = b.author_id
WHERE name_genre = 'Роман'
ORDER BY title;