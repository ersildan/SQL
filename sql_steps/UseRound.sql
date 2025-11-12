SELECT title, author, amount, 
    ROUND(price*0.70, 2) AS new_price
FROM book;
