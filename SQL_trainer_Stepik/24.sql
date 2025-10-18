SELECT
    ci.name_city,
    COUNT(b.client_id) AS Количество
FROM city AS ci
INNER JOIN client AS cl ON cl.city_id = ci.city_id
INNER JOIN buy AS b ON cl.client_id = b.client_id
GROUP BY ci.name_city
ORDER BY Количество DESC, ci.name_city ASC;
