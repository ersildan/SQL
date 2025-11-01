DELETE FROM author
USING author
    INNER JOIN book USING(author_id)
    INNER JOIN genre USING(genre_id)
    WHERE genre.name_genre = 'Поэзия';
