SELECT Company.name
FROM Company
JOIN Trip ON Company.id = Trip.company
WHERE Trip.town_from = 'Vladivostok';
