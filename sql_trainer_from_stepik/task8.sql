SELECT
    city.name_city,
    author.name_author,
    (DATE_ADD('2020-01-01', INTERVAL RAND() * 365 DAY)) as Дата
FROM city
CROSS JOIN author
ORDER BY city.name_city, Дата DESC;