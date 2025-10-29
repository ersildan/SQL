SELECT DISTINCT
    id,
    DATEDIFF(LAST_VALUE(action_date) OVER (PARTITION BY id ORDER BY id),
             FIRST_VALUE(action_date) OVER (PARTITION BY id ORDER BY id)) AS duration
FROM logs;


SELECT id, DATEDIFF(MAX(action_date), MIN(action_date)) AS duration
FROM logs
GROUP BY id;
