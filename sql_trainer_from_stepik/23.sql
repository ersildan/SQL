SELECT 
    a.name_author,
    b.title,
    COUNT(bb.buy_book_id) AS Количество
FROM book AS b
LEFT JOIN author AS a ON a.author_id = b.author_id
LEFT JOIN buy_book AS bb ON b.book_id = bb.book_id
GROUP BY a.name_author, b.title
ORDER BY a.name_author, b.title;
