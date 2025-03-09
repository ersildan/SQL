SELECT town_to, TIME(time_in - time_out) AS flight_time
FROM Trip
WHERE town_from = 'Paris';
