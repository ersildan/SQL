SELECT
    g.name_genre
FROM genre as g
LEFT JOIN book as b
    ON b.genre_id = g.genre_id
WHERE b.genre_id IS NULL;