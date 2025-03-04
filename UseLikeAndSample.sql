SELECT title, author FROM book
WHERE (author LIKE "%_.С." OR author LIKE "%С._.") AND title LIKE "_% %"
ORDER BY title ASC;
