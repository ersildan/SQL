WITH t AS (
    SELECT 
        name_genre,
        SUM(bb.amount) AS Количество
    FROM genre
    INNER JOIN book b USING(genre_id)
    INNER JOIN buy_book  bb USING(book_id)
    GROUP BY name_genre
)

SELECT 
    name_genre, 
    Количество
FROM t
HAVING Количество = (SELECT MAX(Количество) FROM t);


-- WITH t AS (
--     SELECT 
--     name_genre,
--     SUM(bb.amount) AS summa
--     FROM genre
--     INNER JOIN book b USING(genre_id)
--     INNER JOIN buy_book  bb USING(book_id)
--     GROUP BY name_genre
-- )

-- SELECT 
--     name_genre,
--     SUM(bb.amount) AS Количество
-- FROM genre
-- INNER JOIN book b USING(genre_id)
-- INNER JOIN buy_book  bb USING(book_id)
-- GROUP BY name_genre
-- HAVING SUM(bb.amount) = (SELECT MAX(summa) FROM t);
