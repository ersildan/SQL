SELECT author, title, price
FROM book
WHERE price < ALL(
    SELECT max(price)
    FROM book
    GROUP BY author);
