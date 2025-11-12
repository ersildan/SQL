SELECT
    date_id,
    income,
    SUM(income) OVER 
        (ORDER BY date_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_sum
FROM income;

SELECT date_id, income,
	SUM(income) OVER (ORDER BY date_id) AS cum_sum
FROM income;
