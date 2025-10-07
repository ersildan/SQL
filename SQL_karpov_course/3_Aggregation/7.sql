SELECT
    MIN(time) AS first_delivery, 
    MAX(time) AS last_delivery
FROM courier_actions
WHERE action = 'deliver_order';
