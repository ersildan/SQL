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

--Задача 11
--Выведите пассажиров с самым длинным ФИО. Пробелы, дефисы и точки считаются частью имени.
SELECT name FROM Passenger WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM Passenger);

--Задача 12
--Выведите идентификаторы всех рейсов и количество пассажиров на них.
--Обратите внимание, что на каких-то рейсах пассажиров может не быть.
--В этом случае выведите число "0".
SELECT
    t.id,
    COALESCE(COUNT(p.passenger), 0) as count
FROM Trip t
LEFT JOIN Pass_in_trip p ON t.id = p.trip
GROUP BY t.id;

--Задача 13
--Вывести имена людей, у которых есть полный тёзка среди пассажиров
SELECT name
FROM Passenger
GROUP BY name
HAVING count(*) > 1;

--Задача 14
--В какие города летал Bruce Willis
SELECT town_to
FROM trip t
JOIN Pass_in_trip p ON t.id = p.trip
JOIN Passenger pas ON p.passenger = pas.id
WHERE pas.name = 'Bruce Willis';

--Задача 15
--Выведите идентификатор пассажира Стив Мартин (Steve Martin) и дату и время его прилёта в Лондон (London)
SELECT
    pas.id,
    time_in
FROM trip t
JOIN Pass_in_trip p ON t.id = p.trip
JOIN Passenger pas ON p.passenger = pas.id
WHERE pas.name = 'Steve Martin'
AND t.town_to = 'London';

--Задача 16
--Вывести отсортированный по количеству перелетов (по убыванию)
--и имени (по возрастанию) список пассажиров, совершивших хотя бы 1 полет.
SELECT pas.name,
	count(*) AS count
FROM Trip t
	INNER JOIN Pass_in_trip p ON t.id = p.trip
	INNER JOIN Passenger pas ON pas.id = p.passenger
GROUP BY pas.name
HAVING count(*) >= 1
ORDER BY count DESC, name;

-- Задача 17
--Определить, сколько потратил в 2005 году каждый из членов семьи.
--В результирующей выборке не выводите тех членов семьи, которые ничего не потратили.
SELECT
    f.member_name,
    f.status,
    sum(p.unit_price * p.amount) AS costs
FROM FamilyMembers f
JOIN Payments p ON f.member_id = p.family_member
WHERE YEAR(p.date) = '2005'
GROUP BY f.member_name, f.status;

--Задача 18
-- Выведите имя самого старшего человека. Если таких несколько, то выведите их всех.
SELECT member_name
FROM FamilyMembers
WHERE birthday = (
                    SELECT MIN(birthday)
                    FROM FamilyMembers
                    );

--Задача 19
--Определить, кто из членов семьи покупал картошку (potato)
SELECT DISTINCT status
FROM FamilyMembers FM
JOIN Payments P ON FM.member_id = P.family_member
JOIN Goods G ON G.good_id = P.good
WHERE G.good_name = 'potato';

--Задача 20
--Сколько и кто из семьи потратил на развлечения (entertainment).
--Вывести статус в семье, имя, сумму
SELECT
    fm.status,
    fm.member_name,
    SUM(p.amount * p.unit_price) AS costs
FROM FamilyMembers fm
INNER JOIN Payments p ON fm.member_id = p.family_member
INNER JOIN Goods g ON p.good = g.good_id
INNER JOIN GoodTypes gt ON g.type = gt.good_type_id
WHERE gt.good_type_name = 'entertainment'
GROUP BY fm.status, fm.member_name;

--Задача 21
--Определить товары, которые покупали более 1 раза
SELECT
    g.good_name
FROM Goods g
INNER JOIN Payments p ON g.good_id = p.good
GROUP BY g.good_name
HAVING COUNT(p.amount) > 1;

--Задача 22
--Найти имена всех матерей (mother)
SELECT member_name
FROM FamilyMembers
WHERE status = 'mother';

--Задача 23
--Найдите самый дорогой деликатес (delicacies) и выведите его цену
SELECT
    g.good_name,
    MAX(p.unit_price) AS unit_price

FROM Goods g
JOIN Payments p ON g.good_id = p.good
JOIN GoodTypes gt ON gt.good_type_id = g.type
AND gt.good_type_name = 'delicacies'
GROUP BY g.good_name
lIMIT 1;

--Задача 24
--Определить кто и сколько потратил в июне 2005
SELECT
    f.member_name,
    SUM(p.unit_price * p.amount) AS costs
FROM FamilyMembers f
JOIN Payments p ON p.family_member = f.member_id
    AND date_format(p.date, '%Y-%m') = '2005-06'
JOIN Goods g ON g.good_id = p.good
GROUP BY f.member_name;

--Задача 25
--Определить, какие товары не покупались в 2005 году
SELECT
    g.good_name

FROM Goods g
LEFT JOIN Payments p ON g.good_id = p.good
AND date_format(p.date, '%Y') = '2005'
WHERE p.good IS NULL;

--Задача 26
-- Определить группы товаров, которые не приобретались в 2005 году
SELECT good_type_name
FROM GoodTypes
WHERE good_type_id not in (
		SELECT gt.good_type_id
		FROM GoodTypes gt
			JOIN Goods g ON g.type = gt.good_type_id
			JOIN Payments p ON p.good = g.good_id
			AND YEAR(p.date) = '2005'
		GROUP BY gt.good_type_id
	);

--Задача 27
--Узнайте, сколько было потрачено на каждую из групп товаров в 2005 году.
--Выведите название группы и потраченную на неё сумму. Если потраченная сумма равна нулю, т.е. товары из этой группы не покупались в 2005 году, то не выводите её.
SELECT
    gt.good_type_name,
    SUM(p.amount * p.unit_price) AS costs

FROM GoodTypes gt
JOIN Goods g ON g.type = gt.good_type_id
JOIN Payments p ON p.good = g.good_id
AND YEAR(p.date) = '2005'
GROUP BY gt.good_type_name;

--Задача 28
--Сколько рейсов совершили авиакомпании из Ростова (Rostov) в Москву (Moscow) ?
SELECT COUNT(town_to) as count
FROM Trip
WHERE town_from = 'Rostov' AND town_to = 'Moscow';

--Задача 29
--Выведите имена пассажиров улетевших в Москву (Moscow) на самолете TU-134.
--В ответе не должно быть дубликатов.
SELECT
    DISTINCT  name
FROM Passenger p

INNER JOIN Pass_in_trip pit ON p.id = pit.passenger
INNER JOIN Trip t ON pit.trip = t.id

WHERE t.plane = 'TU-134' AND t.town_to = 'Moscow';

--Задача 30
--Выведите нагруженность (число пассажиров) каждого рейса (trip).
--Результат вывести в отсортированном виде по убыванию нагруженности.
SELECT
    p.trip,
    COUNT(passenger) AS count

FROM Pass_in_trip p
LEFT JOIN Trip t ON p.trip = t.id
GROUP BY p.trip
ORDER BY count DESC;

--Задача 31
--Вывести всех членов семьи с фамилией Quincey.
SELECT * FROM FamilyMembers
WHERE member_name LIKE '%Quincey%';

--Задача 32
--Вывести средний возраст людей (в годах), хранящихся в базе данных.
--Результат округлите до целого в меньшую сторону.
SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday, NOW()))) AS age
FROM FamilyMembers;

--Задача 33
--Найдите среднюю цену икры на основе данных, хранящихся в таблице Payments.
--В базе данных хранятся данные о покупках красной (red caviar) и черной икры (black caviar).
--В ответе должна быть одна строка со средней ценой всей купленной когда-либо икры.
SELECT
     AVG(p.unit_price) AS cost
FROM Payments p
INNER JOIN Goods g ON p.good = g.good_id
WHERE g.good_name IN ('red caviar', 'black caviar');

--Задача 34
--Сколько всего 10-ых классов
SELECT
    COUNT(name) AS count
FROM Class
WHERE name LIKE '10%';

--Задача 35
--Сколько различных кабинетов школы использовались 2 сентября 2019 года для проведения занятий?
SELECT
    COUNT(DISTINCT  classroom) AS count
FROM Schedule
WHERE DATE_FORMAT(date, '%Y-%m-%d') = '2019-09-02';

--Задача 36
--Выведите информацию об обучающихся живущих на улице Пушкина (ul. Pushkina)?
SELECT * FROM Student
WHERE address LIKE 'ul. Pushkina%';

--Задача 37
--Сколько лет самому молодому обучающемуся ?
SELECT
    MIN(TIMESTAMPDIFF(YEAR, birthday, NOW())) as year
FROM Student;

--Задача 38
--Сколько Анн (Anna) учится в школе ?
SELECT
    COUNT(first_name) AS count
FROM Student
WHERE first_name = 'Anna'

--Задача 39
--Сколько обучающихся в 10 B классе ?
SELECT
    COUNT(sic.student) as count
FROM Class c
INNER JOIN Student_in_class sic ON c.id = sic.class
WHERE c.name = '10 B';

--Задача 40
--Выведите название предметов, которые преподает Ромашкин П.П. (Romashkin P.P.).
--Обратите внимание, что в базе данных есть несколько учителей с такой фамилией.
SELECT
    name as subjects
FROM Subject sub
INNER JOIN Schedule sch ON sub.id = sch.subject
INNER JOIN Teacher t ON sch.teacher = t.id
WHERE CONCAT(
            t.last_name,
            LEFT(t.first_name, 1),
            LEFT(t.middle_name, 1)
            ) = 'RomashkinPP';
--Задача 41
--Выясните, во сколько по расписанию начинается четвёртое занятие.
SELECT
    start_pair
FROM Schedule s
INNER JOIN Timepair t ON s.number_pair = t.id
WHERE number_pair = 4
LIMIT 1;

--Задача 42
--Сколько времени обучающийся будет находиться в школе, учась со 2-го по 4-ый уч. предмет?
SELECT
     TIME(end_pair - (
                    SELECT
                        start_pair
                    FROM Timepair
                    WHERE id = 2
)) AS time
FROM Timepair
WHERE id = 4;

--Задача 43
--Выведите фамилии преподавателей, которые ведут физическую культуру (Physical Culture).
--Отсортируйте преподавателей по фамилии в алфавитном порядке.
SELECT
    last_name
FROM Teacher t
INNER JOIN Schedule s ON t.id = s.teacher
INNER JOIN Subject sub ON s.subject = sub.id

WHERE sub.name = 'Physical Culture'
ORDER BY last_name;

--Задача 44
--Найдите максимальный возраст (количество лет) среди обучающихся 10 классов на сегодняшний день.
--Для получения текущих даты и времени используйте функцию NOW().
SELECT
    MAX(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS max_year
FROM Student s
INNER JOIN Student_in_class sic ON s.id = sic.student
INNER JOIN Class c ON sic.class = c.id
WHERE name LIKE '10%';

--Задача 45
--Какие кабинеты чаще всего использовались для проведения занятий?
--Выведите те, которые использовались максимальное количество раз.
SELECT
    classroom
FROM Schedule
GROUP BY classroom
HAVING COUNT(classroom) =(
                          SELECT COUNT(classroom)
                          FROM Schedule
                          GROUP BY classroom
                          ORDER BY COUNT(classroom) DESC
                          LIMIT 1
                          );

--Задача 46
--В каких классах введет занятия преподаватель "Krauze" ?
SELECT
    DISTINCT c.name
FROM Class c
INNER JOIN Schedule sc ON c.id = sc.class
INNER JOIN Teacher t ON sc.teacher = t.id
WHERE t.last_name = 'Krauze';

--Задача 47
--Сколько занятий провел Krauze 30 августа 2019 г.?
SELECT
    count(*) AS count
FROM Schedule sc
INNER JOIN Teacher t ON sc.teacher = t.id
WHERE t.last_name = 'Krauze' AND sc.date = '2019.08.30';

--Задача 48
--Выведите заполненность классов в порядке убывания
SELECT
    c.name,
    COUNT(*) AS count
FROM Class c
INNER JOIN Student_in_class sic ON c.id = sic.class
GROUP BY c.name
ORDER BY COUNT(*) DESC;

--Задача 49
--Какой процент обучающихся учится в "10 A" классе?
--Выведите ответ в диапазоне от 0 до 100 с округлением до четырёх знаков после запятой, например, 96.0201.
SELECT
    ROUND((COUNT(*)/ (
                SELECT COUNT(*)
                FROM Class c
                INNER JOIN Student_in_class sic ON c.id = sic.class
                ))*100, 4) as percent
FROM Class c
INNER JOIN Student_in_class sic ON c.id = sic.class
WHERE c.name LIKE '10 A'
GROUP BY name;

--Задача 50
--Какой процент обучающихся родился в 2000 году? Результат округлить до целого в меньшую сторону.
SELECT
    FLOOR((COUNT(*)/(SELECT COUNT(*) FROM Student WHERE id IS NOT NULL))*100) AS percent
FROM Student
WHERE YEAR(birthday) = '2000' AND id IS NOT NULL

--Задача 51
--Добавьте товар с именем "Cheese" и типом "food" в список товаров (Goods).
--В качестве первичного ключа (good_id) укажите количество записей в таблице + 1.
INSERT INTO Goods
VALUES ((SELECT MAX(g.good_id) FROM Goods g	) + 1,
		"Cheese",
		2);

--Задача 52
--Добавьте в список типов товаров (GoodTypes) новый тип "auto".
--В качестве первичного ключа (good_type_id) укажите количество записей в таблице + 1.
INSERT INTO GoodTypes VALUES ((SELECT MAX(temp.good_type_id)+ 1 FROM GoodTypes temp), "auto")

--Задача 53
--Измените имя "Andie Quincey" на новое "Andie Anthony".
UPDATE FamilyMembers SET member_name = "Andie Anthony" WHERE member_name = "Andie Quincey";

--Задача 54
--Удалить всех членов семьи с фамилией "Quincey".
DELETE FamilyMembers
FROM FamilyMembers
WHERE member_name LIKE "%Quincey";

--Задача 55
--Удалить компании, совершившие наименьшее количество рейсов.
WITH temp AS (
	SELECT name,
		COUNT(company) AS cnt
	FROM Company c
		INNER JOIN Trip t ON t.company = c.id
	GROUP BY name,
		company
) DELETE Company
FROM Company
WHERE name IN (
		SELECT name
		FROM temp
		WHERE cnt = (
				SELECT MIN(cnt)
				FROM temp
			)
	);

--Задача 56
--Удалить все перелеты, совершенные из Москвы (Moscow).
DELETE Trip
FROM Trip
WHERE town_from = 'Moscow';

--Задача 57
--Перенести расписание всех занятий на 30 мин. вперед.
UPDATE Timepair SET
start_pair = start_pair + INTERVAL 30 MINUTE,
end_pair = end_pair + INTERVAL 30 MINUTE;

--Задача 58
--