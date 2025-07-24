SELECT title, name_author, name_genre, price, amount
FROM author AS a
INNER JOIN book AS b ON a.author_id = b.author_id
INNER JOIN genre AS g ON g.genre_id = b.genre_id

WHERE g.genre_id IN (
                        SELECT t1.genre_id
                        FROM
                            (
                                SELECT genre_id, SUM(amount) AS sum_amount
                                 FROM book
                                 GROUP BY genre_id) t1

                                 INNER JOIN
                             (
                                 SELECT genre_id, SUM(amount) AS sum_amount
                                 FROM book
                                 GROUP BY genre_id
                                 ORDER BY sum_amount DESC
                                 LIMIT 1) t2

                                 ON t1.sum_amount = t2.sum_amount
)
ORDER BY title;