SELECT 
    order_id
FROM clients c 
JOIN orders o USING(client_id)
WHERE c.status = 'new'
ORDER BY order_id;
