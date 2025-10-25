SELECT
    client_id,
    location
FROM clients
WHERE location LIKE 'Моск%'
ORDER BY client_id;