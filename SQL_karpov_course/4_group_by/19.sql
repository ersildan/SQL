SELECT 
    DATE_PART('isodow', time) :: integer AS weekday_number,
    TO_CHAR(time, 'Dy') AS weekday,
    COUNT(DISTINCT order_id) AS created_orders,
    AS canceled_orders,
    AS actual_orders,
    AS success_rate
FROM user_actions
GROUP BY weekday