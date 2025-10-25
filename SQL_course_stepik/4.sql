SELECT
    client_id,
    location
FROM clients
WHERE location NOT IN ('Воронеж', 'Тула') 
OR location IS NULL;
