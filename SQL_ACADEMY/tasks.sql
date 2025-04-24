--Задача 1
--Вывести имена всех людей, которые есть в базе данных авиакомпаний
SELECT name
FROM Passenger;

--Задача 2
--Вывести названия всеx авиакомпаний
SELECT name
FROM Company;

--Задача 3
--Вывести все рейсы, совершенные из Москвы
SELECT * FROM Trip
WHERE town_from = 'Moscow';

--Задача 4
--Вывести имена людей, которые заканчиваются на "man"
SELECT name FROM Passenger WHERE name LIKE '%man';

--Задача 5
--Вывести количество рейсов, совершенных на TU-134
SELECT COUNT(plane) AS count
FROM Trip
WHERE plane = 'TU-134'

--Задача 6
-- Какие компании совершали перелеты на Boeing
SELECT DISTINCT Company.name
FROM Company
JOIN Trip ON Company.id = Trip.company
WHERE Trip.plane = 'Boeing';

--Задача 7
--Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
SELECT DISTINCT plane
FROM Trip
WHERE town_to = 'Moscow';

--Задача 8
--В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
SELECT town_to, TIME(time_in - time_out) AS flight_time
FROM Trip
WHERE town_from = 'Paris';

--Задача 9
--Какие компании организуют перелеты из Владивостока (Vladivostok)?
SELECT Company.name
FROM Company
	JOIN Trip ON Company.id = Trip.company
WHERE Trip.town_from = 'Vladivostok';

--Задача 10
--Вывести вылеты, совершенные с 10 ч. по 14 ч. 1 января 1900 г.
SELECT * FROM Trip
WHERE time_out BETWEEN '1900-01-01 10:00:00' AND '1900-01-01 14:00:00';
