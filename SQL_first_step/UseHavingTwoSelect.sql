SELECT title, author, amount,
    (SELECT MAX(amount) FROM book) - amount AS Заказ 
FROM book
HAVING Заказ != 0;
