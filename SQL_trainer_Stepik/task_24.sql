SELECT 
    buy.buy_id, 
    book.title,
    book.price,
    buy_book.amount
FROM client
    INNER JOIN buy ON buy.client_id = client.client_id
    INNER JOIN buy_book ON buy.buy_id = buy_book.buy_id
    INNER JOIN book ON buy_book.book_id = book.book_id
    
WHERE client.name_client = 'Баранов Павел'
ORDER BY buy_id, title ASC;
