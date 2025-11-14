SELECT
    AGE((SELECT MAX(time) :: date FROM courier_actions), MAX(birth_date) :: date) :: varchar AS min_age
FROM couriers
WHERE sex = 'male';
