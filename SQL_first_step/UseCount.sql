SELECT author AS Автор, COUNT(author) AS Различных_книг, SUM(amount) AS Количество_экземпляров
FROM book
GROUP BY author;
