SELECT
    bb.buy_id,
    c.name_client,
    SUM(bo.price * bb.amount) AS Стоимость
FROM buy_book bb
    JOIN buy b ON bb.buy_id = b.buy_id
    JOIN client c ON b.client_id = c.client_id
    JOIN book bo ON bo.book_id = bb.book_id
GROUP BY bb.buy_id, c.name_client
ORDER BY bb.buy_id;
